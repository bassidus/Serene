-------------------------------------------------------------------------------
--  Tooltip Content -- choose what tooltips show: class, level and faction
--  colors, player titles, guild rank, the unit's target, the health bar,
--  item level and spell/item IDs. Unit logic follows EllesmereUIBlizzardSkin's tooltip
--  post-processor; every value read from a unit is checked for secrecy
--  (12.1 engine) before it is used. Lines are only added or recolored, and
--  re-runs (tooltip refreshes) update in place instead of adding twice.
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

    if ns.Enabled("tooltipClassColors") then
        local _, class = UnitClass(unit)
        local c = Clean(class) and RAID_CLASS_COLORS[class]
        if c then nameLine:SetTextColor(c.r, c.g, c.b) end
    end

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
    local doLevel = ns.Enabled("tooltipLevelColor")
    local doClass = ns.Enabled("tooltipClassColors") and UnitIsPlayer(unit)
    local doFaction = ns.Enabled("tooltipFactionColor")
    if not (doLevel or doClass or doFaction) then return end

    local lr, lg, lb
    if doLevel then lr, lg, lb = LevelColor(unit) end

    local className, classColor
    if doClass then
        local name, file = UnitClass(unit)
        if Clean(name) and Clean(file) and name then
            className, classColor = name, RAID_CLASS_COLORS[file]
        end
    end

    local factionName, factionColor
    if doFaction then
        local group, localized = UnitFactionGroup(unit)
        if Clean(group) and Clean(localized) then
            factionName, factionColor = localized, FACTION_COLORS[group]
        end
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

local function OnUnit(tt)
    if tt ~= GameTooltip or tt:IsForbidden() then return end
    local _, unit = tt:GetUnit()
    if not Clean(unit) or not unit then
        unit = UnitExists("mouseover") and "mouseover" or nil
    end
    if not unit then return end

    if UnitIsPlayer(unit) then PlayerLines(tt, unit) end
    ColorBodyLines(tt, unit)
    if ns.Enabled("tooltipTarget") and TargetLine(tt, unit) then
        tt:Show()  -- resize for the added row
    end
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
--  Health bar -- hidden with alpha only (never Hide/Show on the bar), re-
--  asserted each time Blizzard shows it.
-------------------------------------------------------------------------------
local function ApplyHealthBar()
    if GameTooltipStatusBar then
        GameTooltipStatusBar:SetAlpha(ns.Enabled("tooltipHealthBar") and 1 or 0)
    end
end

if GameTooltipStatusBar then
    hooksecurefunc(GameTooltipStatusBar, "Show", function(bar)
        if not ns.Enabled("tooltipHealthBar") then bar:SetAlpha(0) end
    end)
end

-------------------------------------------------------------------------------
local function Content(key, label, tooltip, default, apply)
    ns.RegisterFeature({
        key = key, label = label, tooltip = tooltip, default = default,
        section = "Tooltip", apply = apply,
    })
end

Content("tooltipClassColors", "Class Colors", "Colors player names and their class by class.", true)
Content("tooltipLevelColor", "Level Color", "Colors \"Level N\" by difficulty compared to your level: gray (trivial), green, yellow (even), orange, red.", true)
Content("tooltipFactionColor", "Faction Color", "Colors the Alliance line blue and the Horde line red.", true)
Content("tooltipTitles", "Player Titles", "Shows player titles in the name line. Off shows the plain name.", true)
Content("tooltipGuildRank", "Guild Rank", "Adds the player's guild rank after the guild name.", true)
Content("tooltipTarget", "Target", "Adds a line with who the unit is targeting.", true)
Content("tooltipHealthBar", "Health Bar", "Shows the health bar under unit tooltips.", true, ApplyHealthBar)
Content("tooltipItemLevel", "Item Level", "Shows item level on equippable items.", true)
Content("tooltipIDs", "Spell and Item IDs", "Adds the spell ID or item ID to tooltips.", false)
