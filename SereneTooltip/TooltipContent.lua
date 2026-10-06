-------------------------------------------------------------------------------
--  Tooltip Content -- class, level, faction and guild colors, titles, guild rank,
--  target, AFK/DND, item level, IDs and the health bar. Every value read from
--  a unit goes through ns.Clean (secret values). Lines are added, recolored
--  or hidden, and tooltip refreshes update them in place instead of adding
--  twice.
-------------------------------------------------------------------------------
local _, ns = ...

local Clean = ns.Clean

-- A line's font string (<name>TextLeft<i> / <name>TextRight<i>) and its text.
local function LineText(tt, side, i)
    local name = tt:GetName()  -- nil for an unnamed tooltip
    local fs = name and _G[name .. "Text" .. side .. i]
    return fs, fs and Clean(fs:GetText())
end

-- Finds a left-side line equal to (or, with pattern = true, matching) text.
local function FindLine(tt, text, pattern)
    for i = 1, tt:NumLines() do
        local _, txt = LineText(tt, "Left", i)
        if txt then
            if pattern then
                if txt:find(text) then return i end
            elseif txt == text then
                return i
            end
        end
    end
end

local function ColorCode(r, g, b)
    return "|cff" .. ns.RGBToHex(r, g, b)
end

-------------------------------------------------------------------------------
--  Units
-------------------------------------------------------------------------------
-- "Targeting <name>", the name in its class or reaction color.
local TARGET_PREFIX = "Targeting "
local TARGET_PATTERN = "^" .. TARGET_PREFIX

local function TargetLine(tt, unit)
    local tu = unit .. "target"
    local tName, r, g, b
    if UnitExists(tu) then
        if UnitIsUnit(tu, "player") then
            tName, r, g, b = ">>> YOU <<<", 1, 0.3, 0.3
        else
            local n = Clean(UnitName(tu))
            if n then
                tName, r, g, b = n, 0.9, 0.9, 0.9
                local c
                if UnitIsPlayer(tu) then
                    local _, class = UnitClass(tu)
                    c = RAID_CLASS_COLORS[Clean(class)]
                else
                    c = FACTION_BAR_COLORS[Clean(UnitReaction(tu, "player"))]
                end
                if c then r, g, b = c.r, c.g, c.b end
            end
        end
    end
    if not tName then tName, r, g, b = "-", 0.6, 0.6, 0.6 end
    local text = TARGET_PREFIX .. ColorCode(r, g, b) .. tName .. "|r"
    local i = FindLine(tt, TARGET_PATTERN, true)
    if i then
        -- Refresh pass: update the existing row; a new name can be wider.
        local fs, cur = LineText(tt, "Left", i)
        if cur == text then return false end
        fs:SetText(text)
        return true
    end
    if tName == "-" then return false end
    tt:AddLine(text, 1, 0.82, 0)
    return true
end

local function PlayerLines(tt, unit)
    local nameLine = LineText(tt, "Left", 1)

    if not ns.Get("tooltipTitles") then
        -- Rewrite line 1 only when a title is genuinely present. Forever is one
        -- mega realm, so the plain name never needs a realm suffix.
        local name, titled, cur = Clean(UnitName(unit)), Clean(UnitPVPName(unit)), Clean(nameLine:GetText())
        if name and titled and cur and titled ~= name and cur ~= name then
            nameLine:SetText(name)
        end
    end

    local _, class = UnitClass(unit)
    local c = RAID_CLASS_COLORS[Clean(class)]
    if c then nameLine:SetTextColor(c.r, c.g, c.b) end

    -- The guild line becomes "Initiate of Die Laughing" (rank in white, guild
    -- in green), or just the green guild name without tooltipGuildRank, or is
    -- hidden without tooltipGuild. Returns true when the line changed width.
    -- Rewritten text no longer matches, so refresh passes leave it alone.
    local guild, rank = GetGuildInfo(unit)
    guild, rank = Clean(guild), Clean(rank)
    if guild then
        for i = 2, tt:NumLines() do
            local fs, txt = LineText(tt, "Left", i)
            if txt == guild or txt == "<" .. guild .. ">" then
                if not ns.Get("tooltipGuild") then
                    fs:SetText("")
                    fs:Hide()
                    return true
                end
                if ns.Get("tooltipGuildRank") and rank then
                    fs:SetText(rank .. " of |cff40ff40" .. guild .. "|r")
                    fs:SetTextColor(1, 1, 1)
                    return true
                end
                fs:SetText(guild)
                fs:SetTextColor(0.25, 1, 0.25)
                return false
            end
        end
    end
end

-- " <AFK>" or " <DND>" after the name. Refresh passes keep line 1, so the
-- tag is only swapped when the player's state no longer matches it.
local AFK_TAG = " |cffff9900<AFK>|r"
local DND_TAG = " |cffff4040<DND>|r"
local TAGS = { AFK_TAG, DND_TAG }

local function StatusTag(tt, unit)
    local fs, cur = LineText(tt, "Left", 1)
    if not cur then return false end
    local want
    if ns.Get("tooltipAFK") and Clean(UnitIsAFK(unit)) then want = AFK_TAG
    elseif ns.Get("tooltipDND") and Clean(UnitIsDND(unit)) then want = DND_TAG end
    local base = cur
    for _, tag in ipairs(TAGS) do
        if cur:sub(-#tag) == tag then
            if tag == want then return false end
            base = cur:sub(1, -#tag - 1)
        end
    end
    if base == cur and not want then return false end
    fs:SetText(base .. (want or ""))
    return true
end

-- "Level 6", "Level ??" at the start of the level line (localized via LEVEL).
local LEVEL_PATTERN = "^(" .. LEVEL .. " [%d%?]+)"
local FACTION_COLORS = {
    Alliance = { 0.29, 0.56, 1 },
    Horde    = { 1, 0.27, 0.27 },
}

-- Difficulty color of the unit's level relative to yours (gray/green/yellow/
-- orange/red); level ?? (skull, too high to see) is red.
local function LevelColor(unit)
    local level = Clean(UnitLevel(unit))
    if not level then return end
    if level <= 0 then return 1, 0.1, 0.1 end
    local c = GetCreatureDifficultyColor(level)
    return c.r, c.g, c.b
end

-- A player's "14 Undead Paladin" (level and class colored) for the merged
-- level line, or nil when a value is secret or missing.
local function CompactLevelText(unit, className, classColor, lr, lg, lb)
    local level, race = Clean(UnitLevel(unit)), Clean(UnitRace(unit))
    if not (level and race) then return end
    local text = level > 0 and tostring(level) or "??"
    if lr then text = ColorCode(lr, lg, lb) .. text .. "|r" end
    text = text .. " " .. race .. " "
    if classColor then
        return text .. ColorCode(classColor.r, classColor.g, classColor.b) .. className .. "|r"
    end
    return text .. className
end

-- A player's level line becomes "14 Undead Paladin" and the class line below
-- it (Forever's layout) is hidden; NPCs keep "Level N" colored by difficulty.
-- The Alliance/Horde line is colored by faction, or hidden without
-- tooltipFaction. Rewritten text no longer matches, so refresh passes leave
-- it alone.
local function ColorBodyLines(tt, unit)
    local lr, lg, lb = LevelColor(unit)

    local className, classColor
    if UnitIsPlayer(unit) then
        local name, file = UnitClass(unit)
        name, file = Clean(name), Clean(file)
        if name and file then className, classColor = name, RAID_CLASS_COLORS[file] end
    end
    local showFaction = ns.Get("tooltipFaction")
    local hid, merged = false, false

    local factionName, factionColor
    local group, localized = UnitFactionGroup(unit)
    group, localized = Clean(group), Clean(localized)
    if group and localized then factionName, factionColor = localized, FACTION_COLORS[group] end

    for i = 2, tt:NumLines() do
        local fs, txt = LineText(tt, "Left", i)
        if txt then
            local isLevel = txt:find(LEVEL_PATTERN)
            local compactText = isLevel and className
                and CompactLevelText(unit, className, classColor, lr, lg, lb)
            if factionName and not showFaction and txt == factionName then
                fs:SetText("")
                fs:Hide()
                hid = true
            elseif factionColor and txt == factionName then
                fs:SetTextColor(factionColor[1], factionColor[2], factionColor[3])
            elseif compactText then
                fs:SetText(compactText)
                merged = true
            elseif merged and txt == className then
                fs:SetText("")
                fs:Hide()
                hid = true
            elseif classColor and txt == className then
                fs:SetTextColor(classColor.r, classColor.g, classColor.b)
            elseif isLevel and lr then
                fs:SetText((txt:gsub(LEVEL_PATTERN, ColorCode(lr, lg, lb) .. "%1|r", 1)))
            end
        end
    end
    return hid
end

-------------------------------------------------------------------------------
--  Player item level -- yours from GetAverageItemLevel; anyone else is
--  inspected once when hovered (out of combat, never while the Inspect
--  window is open) and the result is kept per GUID for a while. Until then the
--  row shows -, so the tooltip doesn't change size when INSPECT_READY fills
--  it in.
-------------------------------------------------------------------------------
local ILVL_LABEL = "Item Level:"
local ILVL_CACHE_TIME = 600  -- seconds a player's item level is reused
local INSPECT_GAP = 1.5      -- seconds between our inspect requests
local INSPECT_TIMEOUT = 5    -- an unanswered request (out of range) is dropped

local ilvlCache = {}         -- guid -> { ilvl =, time = }
local pending                -- { guid =, unit =, time = } of our open request
local lastInspect, retryQueued = 0, false

-- How far above or below your own equipped item level, the way a level
-- is colored against yours: red 10+ above, orange 5+, yellow within 4,
-- green 5+ below, gray 10+ below.
local function ItemLevelColor(ilvl)
    local _, mine = GetAverageItemLevel()
    local diff, c = floor(ilvl) - floor(mine), QuestDifficultyColors
    if diff >= 10 then c = c.impossible
    elseif diff >= 5 then c = c.verydifficult
    elseif diff > -5 then c = c.difficult
    elseif diff > -10 then c = c.standard
    else c = c.trivial end
    return c.r, c.g, c.b
end

-- ilvl nil shows "-" while the inspect is pending.
local function ItemLevelLine(tt, ilvl)
    local text = ilvl and tostring(floor(ilvl)) or "-"
    local r, g, b = 1, 1, 1
    if ilvl then r, g, b = ItemLevelColor(ilvl) end
    local i = FindLine(tt, ILVL_LABEL)
    if i then
        local right = LineText(tt, "Right", i)
        right:SetText(text)
        right:SetTextColor(r, g, b)
        return false
    end
    tt:AddDoubleLine(ILVL_LABEL, text, 1, 0.82, 0, r, g, b)
    return true
end

-- The GUID and unit token of the unit GameTooltip shows, or nil.
local function TooltipUnitGUID()
    if GameTooltip:IsForbidden() or not GameTooltip:IsShown() then return end
    local _, unit = GameTooltip:GetUnit()
    unit = Clean(unit) or (UnitExists("mouseover") and "mouseover" or nil)
    if not unit then return end
    local guid = Clean(UnitGUID(unit))
    if guid then return guid, unit end
end

local function CachedItemLevel(guid)
    local entry = ilvlCache[guid]
    if entry and GetTime() - entry.time < ILVL_CACHE_TIME then return entry.ilvl end
end

local function InFlight(guid)
    return pending and pending.guid == guid and GetTime() - pending.time < INSPECT_TIMEOUT
end

local function RequestInspect(unit, guid)
    if InCombatLockdown() or (InspectFrame and InspectFrame:IsShown()) or not CanInspect(unit) then return end
    local wait = lastInspect + INSPECT_GAP - GetTime()
    if wait > 0 then
        -- Ask again once the gap has passed, for whoever is hovered then.
        if not retryQueued then
            retryQueued = true
            C_Timer.After(wait, function()
                retryQueued = false
                local g, u = TooltipUnitGUID()
                if g and ns.Get("tooltipPlayerItemLevel") and UnitIsPlayer(u)
                    and not UnitIsUnit(u, "player") and not CachedItemLevel(g) and not InFlight(g) then
                    RequestInspect(u, g)
                end
            end)
        end
        return
    end
    lastInspect = GetTime()
    pending = { guid = guid, unit = unit, time = lastInspect }
    NotifyInspect(unit)
end

-- Returns true when a row was added.
local function PlayerItemLevel(tt, unit)
    if UnitIsUnit(unit, "player") then
        local _, equipped = GetAverageItemLevel()
        return equipped > 0 and ItemLevelLine(tt, equipped)
    end
    local guid = Clean(UnitGUID(unit))
    if not guid then return false end
    local ilvl = CachedItemLevel(guid)
    if not ilvl and not InFlight(guid) then RequestInspect(unit, guid) end
    return ItemLevelLine(tt, ilvl)
end

local inspectEvents = CreateFrame("Frame")
inspectEvents:RegisterEvent("INSPECT_READY")
inspectEvents:SetScript("OnEvent", function(_, _, guid)
    if not pending or Clean(guid) ~= pending.guid then return end
    local unit = pending.unit
    pending = nil
    if Clean(UnitGUID(unit)) ~= guid then return end  -- the token points elsewhere now
    local ilvl = C_PaperDollInfo.GetInspectItemLevel(unit)
    -- Leave Blizzard's inspect alone if its window took over meanwhile.
    if not (InspectFrame and InspectFrame:IsShown()) then ClearInspectPlayer() end
    if not ilvl or ilvl <= 0 then return end
    local now = GetTime()
    for g, entry in pairs(ilvlCache) do
        if now - entry.time >= ILVL_CACHE_TIME then ilvlCache[g] = nil end
    end
    ilvlCache[guid] = { ilvl = ilvl, time = now }
    if ns.Get("tooltipPlayerItemLevel") and TooltipUnitGUID() == guid then
        ItemLevelLine(GameTooltip, ilvl)
        GameTooltip:Show()  -- the value can be wider than the - it replaces
    end
end)

local function OnUnit(tt)
    if tt ~= GameTooltip or tt:IsForbidden() then return end
    local _, unit = tt:GetUnit()
    unit = Clean(unit) or (UnitExists("mouseover") and "mouseover" or nil)
    if not unit then return end

    local added = false
    if UnitIsPlayer(unit) then
        added = PlayerLines(tt, unit)
        if StatusTag(tt, unit) then added = true end
        if ns.Get("tooltipPlayerItemLevel") and PlayerItemLevel(tt, unit) then added = true end
    end
    if ColorBodyLines(tt, unit) then added = true end  -- a hidden line resizes too
    if ns.Get("tooltipTarget") and TargetLine(tt, unit) then added = true end
    if added then tt:Show() end  -- resize for the added or hidden rows
end

-------------------------------------------------------------------------------
--  Items and spells
-------------------------------------------------------------------------------
local ITEM_LEVEL_PATTERN = "^" .. ITEM_LEVEL:gsub("%%d", "%%d+")
local NO_ILVL_SLOTS = { [""] = true, INVTYPE_BAG = true, INVTYPE_NON_EQUIP_IGNORE = true,
                        INVTYPE_BODY = true, INVTYPE_TABARD = true }

local function AddID(tt, label, id)
    id = Clean(id)
    if not id or FindLine(tt, label) then return false end
    tt:AddDoubleLine(label, tostring(id), 1, 0.82, 0, 1, 1, 1)
    return true
end

local function OnItem(tt, data)
    if tt:IsForbidden() then return end
    local added = false

    if ns.Get("tooltipItemLevel") and tt.GetItem then
        local _, link = tt:GetItem()
        link = Clean(link)
        if link then
            local equipLoc = select(9, C_Item.GetItemInfo(link))
            if equipLoc and not NO_ILVL_SLOTS[equipLoc] and not FindLine(tt, ITEM_LEVEL_PATTERN, true) then
                local ilvl = C_Item.GetDetailedItemLevelInfo(link)
                if ilvl and ilvl > 0 then
                    tt:AddLine(ITEM_LEVEL:format(ilvl), 1, 0.82, 0)
                    added = true
                end
            end
        end
    end

    if ns.Get("tooltipIDs") then
        added = AddID(tt, "Item ID", data.id) or added
    end

    if added then tt:Show() end
end

local function OnSpell(tt, data)
    if tt:IsForbidden() or not ns.Get("tooltipIDs") then return end
    if AddID(tt, "Spell ID", data.id) then tt:Show() end
end

local T = Enum.TooltipDataType
TooltipDataProcessor.AddTooltipPostCall(T.Unit, OnUnit)
TooltipDataProcessor.AddTooltipPostCall(T.Item, OnItem)
TooltipDataProcessor.AddTooltipPostCall(T.Spell, OnSpell)
TooltipDataProcessor.AddTooltipPostCall(T.UnitAura, OnSpell)
TooltipDataProcessor.AddTooltipPostCall(T.PetAction, OnSpell)

-- The health bar under unit tooltips is hidden with alpha only (never
-- Hide/Show on the bar), re-asserted each time Blizzard shows it.
hooksecurefunc(GameTooltipStatusBar, "Show", function(bar)
    if not ns.Get("tooltipHealthBar") then bar:SetAlpha(0) end
end)

-------------------------------------------------------------------------------
-- In pairs, the second beside the first. Show DND pairs with Show border
-- from TooltipBorder.lua.
for _, def in ipairs({
    { key = "tooltipTitles",          label = "Show title",
      tooltip = "What tooltips show and how they look" },
    { key = "tooltipFaction",         label = "Show faction", beside = true },
    { key = "tooltipGuild",           label = "Show guild" },
    { key = "tooltipGuildRank",       label = "Show guild rank", beside = true, requires = "tooltipGuild" },
    { key = "tooltipItemLevel",       label = "Show item level" },
    { key = "tooltipPlayerItemLevel", label = "Show player item level", beside = true },
    { key = "tooltipTarget",          label = "Show target" },
    { key = "tooltipHealthBar",       label = "Show health bar", beside = true,
      apply = function() GameTooltipStatusBar:SetAlpha(ns.Get("tooltipHealthBar") and 1 or 0) end },
    { key = "tooltipAFK",             label = "Show AFK" },
    { key = "tooltipIDs",             label = "Show spell & item IDs", default = false, beside = true },
    { key = "tooltipDND",             label = "Show DND" },
}) do
    def.section, def.category = "Tooltip", "Settings"
    ns.RegisterFeature(def)
end
