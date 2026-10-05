-------------------------------------------------------------------------------
--  Tooltip Content -- class, level and faction colors, titles, guild rank,
--  target, item level and IDs. Every value read from a unit is
--  checked for secrecy before use. Lines are only added or recolored, and
--  tooltip refreshes update them in place instead of adding twice.
-------------------------------------------------------------------------------
local _, ns = ...

local issecret = issecretvalue
local function Clean(v)
    return v ~= nil and not (issecret and issecret(v))
end

-- Tooltip -> its global name, looked up once (line font strings are
-- <name>TextLeft<i> / <name>TextRight<i>).
local names = setmetatable({}, { __mode = "k" })
local function TipName(tt)
    local name = names[tt]
    if name == nil then
        local ok, n = pcall(tt.GetName, tt)
        name = ok and n or false
        names[tt] = name
    end
    return name
end

local function LineText(tt, side, i)
    local name = TipName(tt)
    local fs = name and _G[name .. "Text" .. side .. i]
    return fs, fs and fs:GetText()
end

-- Finds a left-side line equal to (or, with pattern = true, matching) text.
local function FindLine(tt, text, pattern)
    for i = 1, tt:NumLines() do
        local _, txt = LineText(tt, "Left", i)
        if Clean(txt) then
            if pattern then
                if txt:find(text) then return i end
            elseif txt == text then
                return i
            end
        end
    end
end

-------------------------------------------------------------------------------
--  Units
-------------------------------------------------------------------------------
local TARGET_LABEL = "Target:"

local function TargetLine(tt, unit)
    local tu = unit .. "target"
    local tName, r, g, b
    if UnitExists(tu) then
        if UnitIsUnit(tu, "player") then
            tName, r, g, b = "You", 1, 0.3, 0.3
        else
            local n = UnitName(tu)
            if Clean(n) then
                tName, r, g, b = n, 0.9, 0.9, 0.9
                if UnitIsPlayer(tu) then
                    local _, class = UnitClass(tu)
                    local c = Clean(class) and RAID_CLASS_COLORS[class]
                    if c then r, g, b = c.r, c.g, c.b end
                else
                    local reaction = UnitReaction(tu, "player")
                    local c = Clean(reaction) and FACTION_BAR_COLORS[reaction]
                    if c then r, g, b = c.r, c.g, c.b end
                end
            end
        end
    end
    local i = FindLine(tt, TARGET_LABEL)
    if i then
        -- Refresh pass: update the existing row.
        local right = LineText(tt, "Right", i)
        if right then
            if tName then
                right:SetText(tName)
                right:SetTextColor(r, g, b)
            else
                right:SetText("-")
                right:SetTextColor(0.6, 0.6, 0.6)
            end
        end
        return false
    end
    if tName then
        tt:AddDoubleLine(TARGET_LABEL, tName, 1, 0.82, 0, r, g, b)
        return true
    end
    return false
end

local function PlayerLines(tt, unit)
    local nameLine = LineText(tt, "Left", 1)
    if not nameLine then return end

    if not ns.Enabled("tooltipTitles") then
        -- Rewrite line 1 only when a title is genuinely present. Forever is one
        -- mega realm, so the plain name never needs a realm suffix.
        local name = UnitName(unit)
        local titled = UnitPVPName and UnitPVPName(unit)
        local cur = nameLine:GetText()
        if Clean(name) and Clean(titled) and Clean(cur) and titled ~= name and cur ~= name then
            nameLine:SetText(name)
        end
    end

    local _, class = UnitClass(unit)
    local c = Clean(class) and RAID_CLASS_COLORS[class]
    if c then nameLine:SetTextColor(c.r, c.g, c.b) end

    if ns.Enabled("tooltipGuildRank") then
        local guild, rank = GetGuildInfo(unit)
        if Clean(guild) and Clean(rank) and guild and rank then
            local suffix = " [" .. rank .. "]"
            for i = 2, tt:NumLines() do
                local fs, txt = LineText(tt, "Left", i)
                if Clean(txt) and txt:find(guild, 1, true) then
                    if txt:sub(-#suffix) ~= suffix then fs:SetText(txt .. suffix) end
                    break
                end
            end
        end
    end
end

-- "Level 6", "Level ??" at the start of the level line (localized via LEVEL).
local LEVEL_PATTERN = "^(" .. (LEVEL or "Level") .. " [%d%?]+)"
local FACTION_COLORS = {
    Alliance = { 0.29, 0.56, 1 },
    Horde    = { 1, 0.27, 0.27 },
}

local function ColorCode(r, g, b)
    return format("|cff%02x%02x%02x", r * 255, g * 255, b * 255)
end

-- Difficulty color of the unit's level relative to yours (gray/green/yellow/
-- orange/red); level ?? (skull, too high to see) is red.
local function LevelColor(unit)
    local level = UnitLevel(unit)
    if not Clean(level) or not level then return end
    if level <= 0 then return 1, 0.1, 0.1 end
    local GetColor = GetCreatureDifficultyColor or GetQuestDifficultyColor
    local c = GetColor and GetColor(level)
    if c then return c.r, c.g, c.b end
end

-- Colors the body lines: "Level N" by difficulty, the class by class color
-- (its own line on Forever, inside the level line on retail layouts) and the
-- Alliance/Horde line by faction. Already-colored text no longer matches, so
-- refresh passes leave it alone.
local function ColorBodyLines(tt, unit)
    local lr, lg, lb = LevelColor(unit)

    local className, classColor
    if UnitIsPlayer(unit) then
        local name, file = UnitClass(unit)
        if Clean(name) and Clean(file) and name then
            className, classColor = name, RAID_CLASS_COLORS[file]
        end
    end

    local factionName, factionColor
    local group, localized = UnitFactionGroup(unit)
    if Clean(group) and Clean(localized) then
        factionName, factionColor = localized, FACTION_COLORS[group]
    end

    for i = 2, tt:NumLines() do
        local fs, txt = LineText(tt, "Left", i)
        if fs and Clean(txt) and txt then
            if factionColor and txt == factionName then
                fs:SetTextColor(factionColor[1], factionColor[2], factionColor[3])
            elseif classColor and txt == className then
                fs:SetTextColor(classColor.r, classColor.g, classColor.b)
            elseif txt:find(LEVEL_PATTERN) then
                local new = txt
                if lr then
                    new = new:gsub(LEVEL_PATTERN, ColorCode(lr, lg, lb) .. "%1|r", 1)
                end
                if classColor then
                    local s, e = new:find(className, 1, true)
                    if s then
                        new = new:sub(1, s - 1) .. ColorCode(classColor.r, classColor.g, classColor.b)
                            .. className .. "|r" .. new:sub(e + 1)
                    end
                end
                if new ~= txt then fs:SetText(new) end
            end
        end
    end
end

-------------------------------------------------------------------------------
--  Player item level -- yours from GetAverageItemLevel; anyone else is
--  inspected once when hovered (out of combat, never while the Inspect
--  window is open) and the result is kept per GUID for a while. The row is
--  added when INSPECT_READY arrives if the tooltip still shows that player.
-------------------------------------------------------------------------------
local ILVL_LABEL = "Item Level:"
local ILVL_CACHE_TIME = 600  -- seconds a player's item level is reused
local INSPECT_GAP = 1.5      -- seconds between our inspect requests
local INSPECT_TIMEOUT = 5    -- an unanswered request (out of range) is dropped

local ilvlCache = {}         -- guid -> { ilvl =, time = }
local pending                -- { guid =, unit =, time = } of our open request
local lastInspect, retryQueued = 0, false

local function ItemLevelLine(tt, ilvl)
    local text = tostring(floor(ilvl))
    local i = FindLine(tt, ILVL_LABEL)
    if i then
        local right = LineText(tt, "Right", i)
        if right then right:SetText(text) end
        return false
    end
    tt:AddDoubleLine(ILVL_LABEL, text, 1, 0.82, 0, 1, 1, 1)
    return true
end

-- The GUID and unit token of the unit GameTooltip shows, or nil.
local function TooltipUnitGUID()
    if GameTooltip:IsForbidden() or not GameTooltip:IsShown() then return end
    local _, unit = GameTooltip:GetUnit()
    if not Clean(unit) or not unit then
        unit = UnitExists("mouseover") and "mouseover" or nil
    end
    if not unit then return end
    local guid = UnitGUID(unit)
    if Clean(guid) and guid then return guid, unit end
end

local function CachedItemLevel(guid)
    local entry = ilvlCache[guid]
    if entry and GetTime() - entry.time < ILVL_CACHE_TIME then return entry.ilvl end
end

local function InFlight(guid)
    return pending and pending.guid == guid and GetTime() - pending.time < INSPECT_TIMEOUT
end

local function RequestInspect(unit, guid)
    if InCombatLockdown() or (InspectFrame and InspectFrame:IsShown()) then return end
    if not (NotifyInspect and C_PaperDollInfo and C_PaperDollInfo.GetInspectItemLevel) then return end
    if not CanInspect(unit) then return end
    local wait = lastInspect + INSPECT_GAP - GetTime()
    if wait > 0 then
        -- Ask again once the gap has passed, for whoever is hovered then.
        if not retryQueued then
            retryQueued = true
            C_Timer.After(wait, function()
                retryQueued = false
                local g, u = TooltipUnitGUID()
                if g and ns.Enabled("tooltipPlayerItemLevel") and UnitIsPlayer(u)
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
        local _, equipped
        if GetAverageItemLevel then _, equipped = GetAverageItemLevel() end
        return equipped and equipped > 0 and ItemLevelLine(tt, equipped) or false
    end
    local guid = UnitGUID(unit)
    if not Clean(guid) or not guid then return false end
    local ilvl = CachedItemLevel(guid)
    if ilvl then return ItemLevelLine(tt, ilvl) end
    if not InFlight(guid) then RequestInspect(unit, guid) end
    return false
end

local inspectEvents = CreateFrame("Frame")
inspectEvents:RegisterEvent("INSPECT_READY")
inspectEvents:SetScript("OnEvent", function(_, _, guid)
    if not pending or not Clean(guid) or guid ~= pending.guid then return end
    local unit = pending.unit
    pending = nil
    local now = UnitGUID(unit)
    if not Clean(now) or now ~= guid then return end  -- the token points elsewhere now
    local ilvl = C_PaperDollInfo.GetInspectItemLevel(unit)
    -- Leave Blizzard's inspect alone if its window took over meanwhile.
    if not (InspectFrame and InspectFrame:IsShown()) then ClearInspectPlayer() end
    if not ilvl or ilvl <= 0 then return end
    ilvlCache[guid] = { ilvl = ilvl, time = GetTime() }
    if ns.Enabled("tooltipPlayerItemLevel") and TooltipUnitGUID() == guid
        and ItemLevelLine(GameTooltip, ilvl) then
        GameTooltip:Show()
    end
end)

local function OnUnit(tt)
    if tt ~= GameTooltip or tt:IsForbidden() then return end
    local _, unit = tt:GetUnit()
    if not Clean(unit) or not unit then
        unit = UnitExists("mouseover") and "mouseover" or nil
    end
    if not unit then return end

    local added = false
    if UnitIsPlayer(unit) then
        PlayerLines(tt, unit)
        if ns.Enabled("tooltipPlayerItemLevel") then added = PlayerItemLevel(tt, unit) end
    end
    ColorBodyLines(tt, unit)
    if ns.Enabled("tooltipTarget") and TargetLine(tt, unit) then added = true end
    if added then tt:Show() end  -- resize for the added rows
end

-------------------------------------------------------------------------------
--  Items and spells
-------------------------------------------------------------------------------
local ITEM_LEVEL_FORMAT = ITEM_LEVEL or "Item Level %d"
local ITEM_LEVEL_PATTERN = "^" .. ITEM_LEVEL_FORMAT:gsub("%%d", "%%d+")
local NO_ILVL_SLOTS = { [""] = true, INVTYPE_BAG = true, INVTYPE_NON_EQUIP_IGNORE = true,
                        INVTYPE_BODY = true, INVTYPE_TABARD = true }

local function AddID(tt, label, id)
    if not Clean(id) or not id or FindLine(tt, label) then return false end
    tt:AddDoubleLine(label, tostring(id), 1, 0.82, 0, 1, 1, 1)
    return true
end

local function OnItem(tt, data)
    if tt:IsForbidden() then return end
    local added = false

    if ns.Enabled("tooltipItemLevel") and tt.GetItem then
        local _, link = tt:GetItem()
        if Clean(link) and link then
            local equipLoc = select(9, C_Item.GetItemInfo(link))
            if equipLoc and not NO_ILVL_SLOTS[equipLoc] and not FindLine(tt, ITEM_LEVEL_PATTERN, true) then
                local ilvl = C_Item.GetDetailedItemLevelInfo(link)
                if ilvl and ilvl > 0 then
                    tt:AddLine(ITEM_LEVEL_FORMAT:format(ilvl), 1, 0.82, 0)
                    added = true
                end
            end
        end
    end

    if ns.Enabled("tooltipIDs") and data then
        added = AddID(tt, "Item ID", data.id) or added
    end

    if added then tt:Show() end
end

local function OnSpell(tt, data)
    if tt:IsForbidden() or not ns.Enabled("tooltipIDs") or not data then return end
    if AddID(tt, "Spell ID", data.id) then tt:Show() end
end

if TooltipDataProcessor and TooltipDataProcessor.AddTooltipPostCall and Enum.TooltipDataType then
    local T = Enum.TooltipDataType
    TooltipDataProcessor.AddTooltipPostCall(T.Unit, OnUnit)
    TooltipDataProcessor.AddTooltipPostCall(T.Item, OnItem)
    TooltipDataProcessor.AddTooltipPostCall(T.Spell, OnSpell)
    if T.UnitAura then TooltipDataProcessor.AddTooltipPostCall(T.UnitAura, OnSpell) end
    if T.PetAction then TooltipDataProcessor.AddTooltipPostCall(T.PetAction, OnSpell) end
end

-------------------------------------------------------------------------------
-- beside: to the right of the setting before it.
local function Content(category, key, label, default, apply, tooltip, beside)
    ns.RegisterFeature({
        key = key, label = label, tooltip = tooltip, default = default,
        section = "Tooltip", category = category, apply = apply, beside = beside,
    })
end

Content("Information", "tooltipTitles", "Show player titles", true, nil,
    "Off shows players by name only, without titles like \"Private\".")
Content("Information", "tooltipGuildRank", "Show guild rank", true, nil,
    "Adds the player's rank after their guild's name.", true)
Content("Information", "tooltipTarget", "Show what the unit targets", true, nil,
    "Adds a line with who the unit is targeting.")
Content("Information", "tooltipPlayerItemLevel", "Show players' item level", true, nil,
    "Adds a player's average item level. Other players are inspected when you hover them, out of combat.", true)
Content("Information", "tooltipItemLevel", "Show item level on items", true)
Content("Information", "tooltipIDs", "Show spell and item IDs", false, nil, nil, true)
