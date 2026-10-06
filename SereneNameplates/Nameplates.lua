-------------------------------------------------------------------------------
--  Nameplates -- flat enemy plates for attackable units; friendly plates stay
--  Blizzard's. Cast bar, debuffs and quest marks plug in through
--  NP.RegisterModule.
--
--  Blizzard's UnitFrame stays on the nameplate at alpha 0 (moving it breaks
--  click targeting between stacked plates) and its aura list is parked off
--  screen, since those icons take the mouse even when invisible. Pooled
--  UnitFrames get both back when Blizzard reuses them for a friendly unit.
--
--  Health, levels and threat can be secret values. They are handed to
--  setters (SetValue, SetFormattedText) as they are and never compared
--  unless issecretvalue says they are plain.
-------------------------------------------------------------------------------
local _, ns = ...

local NP = { plates = {}, modules = {} }
ns.NP = NP

local BAR = "Interface\\Buttons\\WHITE8X8"

local COLORS = {
    hostile   = { 0.80, 0.137, 0.137 },
    neutral   = { 0.81, 0.72, 0.19 },
    friendly  = { 0.29, 0.69, 0.30 },
    tapped    = { 0.50, 0.50, 0.50 },
}

-- The color setting for each threat level: LOW = someone else has it,
-- MEDIUM = above the one who has it or tanking insecurely, HIGH = yours.
local THREAT_KEYS = {
    dps  = { LOW = "nameplateThreatDpsLow", MEDIUM = "nameplateThreatDpsMedium", HIGH = "nameplateThreatDpsHigh" },
    tank = { LOW = "nameplateThreatTankLow", MEDIUM = "nameplateThreatTankMedium", HIGH = "nameplateThreatTankHigh",
             OFFTANK = "nameplateThreatTankOfftank" },
}
local threatRGB = {}  -- hex -> { r, g, b }, so a health update parses no strings
local THREAT_LEVEL = { [0] = "LOW", [1] = "MEDIUM", [2] = "MEDIUM", [3] = "HIGH" }

local Clean = ns.Clean

-- Font for every plate text: the chosen typeface and outline at the plate's
-- size (+delta).
function NP.SetFont(fs, delta)
    local flags, shadow = ns.FontFlags(ns.Get("nameplateOutline"))
    ns.SetFont(fs, ns.Get("nameplateFont"), ns.Get("nameplateFontSize") + (delta or 0), flags)
    ns.SetShadow(fs, shadow)
end

-- Modules: { create(plate), attach(plate, unit), detach(plate), layout(plate) },
-- every hook optional.
function NP.RegisterModule(m)
    NP.modules[#NP.modules + 1] = m
end

local function RunModules(hook, plate, ...)
    for _, m in ipairs(NP.modules) do
        if m[hook] then m[hook](plate, ...) end
    end
end

-- fn() runs whenever plates are switched on or off (and at login), so a
-- module can stop listening to events while Serene draws no plates.
local refreshHooks = {}
function NP.OnRefresh(fn)
    refreshHooks[#refreshHooks + 1] = fn
end
local function RunRefreshHooks()
    for _, fn in ipairs(refreshHooks) do fn() end
end

-------------------------------------------------------------------------------
--  Blizzard's plate
-------------------------------------------------------------------------------
local parked = CreateFrame("Frame")
parked:Hide()
local held = setmetatable({}, { __mode = "k" })         -- UnitFrame -> true while hidden by us
local auraParents = setmetatable({}, { __mode = "k" })  -- UnitFrame -> AurasFrame's own parent
local alphaHooked = setmetatable({}, { __mode = "k" })

local function HideBlizzard(nameplate)
    local uf = nameplate and nameplate.UnitFrame
    if not uf or uf:IsForbidden() then return end
    held[uf] = true
    uf:SetAlpha(0)
    local auras = uf.AurasFrame
    if auras and auras:GetParent() ~= parked then
        auraParents[uf] = auras:GetParent()
        auras:SetParent(parked)
    end
    -- Blizzard fades its frame in and out (range, occlusion); keep it at 0.
    if not alphaHooked[uf] then
        alphaHooked[uf] = true
        local busy = false
        hooksecurefunc(uf, "SetAlpha", function(self)
            if busy or not held[self] then return end
            busy = true
            self:SetAlpha(0)
            busy = false
        end)
    end
end

local function RestoreBlizzard(uf)
    if not uf or not held[uf] or uf:IsForbidden() then return end
    held[uf] = nil
    uf:SetAlpha(1)
    local auras = uf.AurasFrame
    if auras and auraParents[uf] and auras:GetParent() == parked then
        auras:SetParent(auraParents[uf])
    end
    auraParents[uf] = nil
end

-------------------------------------------------------------------------------
--  Plate frame
-------------------------------------------------------------------------------
local pool = {}

local function Border(parent)
    local f = CreateFrame("Frame", nil, parent)
    f:SetPoint("TOPLEFT", -1, 1)
    f:SetPoint("BOTTOMRIGHT", 1, -1)
    f:SetFrameLevel(parent:GetFrameLevel() + 2)
    f.edges = {}
    for i = 1, 4 do
        local t = f:CreateTexture(nil, "OVERLAY")
        t:SetColorTexture(0, 0, 0, 1)
        f.edges[i] = t
    end
    local e = f.edges
    e[1]:SetPoint("TOPLEFT"); e[1]:SetPoint("TOPRIGHT"); e[1]:SetHeight(1)
    e[2]:SetPoint("BOTTOMLEFT"); e[2]:SetPoint("BOTTOMRIGHT"); e[2]:SetHeight(1)
    e[3]:SetPoint("TOPLEFT"); e[3]:SetPoint("BOTTOMLEFT"); e[3]:SetWidth(1)
    e[4]:SetPoint("TOPRIGHT"); e[4]:SetPoint("BOTTOMRIGHT"); e[4]:SetWidth(1)
    function f:SetColor(r, g, b)
        for _, t in ipairs(self.edges) do t:SetColorTexture(r, g, b, 1) end
    end
    return f
end
NP.Border = Border

-- Rows other modules hang under the health bar, top to bottom. A module puts
-- its row on the plate (plate.manaBar, plate.comboRow) and calls
-- NP.StackBelow; the cast bar goes under the last one and its icon grows to
-- stay square.
local BELOW = { "manaBar", "comboRow" }
local GAP = 3  -- the rows' borders sit outside them; 3 leaves a 1px gap

local function Below(frame, above)
    frame:ClearAllPoints()
    frame:SetPoint("TOPLEFT", above, "BOTTOMLEFT", 0, -GAP)
    frame:SetPoint("TOPRIGHT", above, "BOTTOMRIGHT", 0, -GAP)
end

function NP.StackBelow(plate)
    local above, height = plate.health, ns.Get("nameplateHeight")
    for _, key in ipairs(BELOW) do
        local row = plate[key]
        if row then
            Below(row, above)
            above, height = row, height + GAP + row:GetHeight()
        end
    end
    local cast = plate.cast
    Below(cast, above)
    cast.iconFrame:SetWidth(height + GAP + cast:GetHeight())
end

local OnPlateEvent

local function Layout(plate)
    plate:SetSize(ns.Get("nameplateWidth"), ns.Get("nameplateHeight"))
    NP.SetFont(plate.name)
    NP.SetFont(plate.healthText, -1)
    local icon = ns.Get("nameplateHeight") + 6
    plate.raidIcon:SetSize(icon, icon)
    RunModules("layout", plate)
    NP.StackBelow(plate)
end

local function CreatePlate()
    local plate = CreateFrame("Frame", nil, UIParent)
    plate:Hide()

    local health = CreateFrame("StatusBar", nil, plate)
    health:SetAllPoints()
    health:SetStatusBarTexture(BAR)
    health:SetMinMaxValues(0, 1)
    local bg = health:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    bg:SetColorTexture(0.05, 0.05, 0.05, 0.85)
    plate.health = health
    plate.border = Border(health)

    plate.hover = health:CreateTexture(nil, "ARTWORK", nil, 7)
    plate.hover:SetAllPoints(health:GetStatusBarTexture())
    plate.hover:SetColorTexture(1, 1, 1, 0.18)
    plate.hover:Hide()

    -- Texts ride a frame above the border.
    local overlay = CreateFrame("Frame", nil, plate)
    overlay:SetAllPoints(health)
    overlay:SetFrameLevel(health:GetFrameLevel() + 4)
    plate.overlay = overlay

    plate.name = overlay:CreateFontString(nil, "OVERLAY")
    plate.name:SetPoint("BOTTOMLEFT", health, "TOPLEFT", 0, 3)
    plate.name:SetPoint("BOTTOMRIGHT", health, "TOPRIGHT", 0, 3)
    plate.name:SetJustifyH("LEFT")
    plate.name:SetWordWrap(false)

    plate.healthText = overlay:CreateFontString(nil, "OVERLAY")
    plate.healthText:SetPoint("RIGHT", health, "RIGHT", -3, 0)
    plate.healthText:SetJustifyH("RIGHT")

    plate.raidIcon = overlay:CreateTexture(nil, "OVERLAY")
    plate.raidIcon:SetPoint("LEFT", health, "RIGHT", 4, 0)
    plate.raidIcon:SetTexture("Interface\\TargetingFrame\\UI-RaidTargetingIcons")
    plate.raidIcon:Hide()

    plate:SetScript("OnEvent", OnPlateEvent)
    RunModules("create", plate)
    Layout(plate)
    return plate
end

-------------------------------------------------------------------------------
--  Updates
-------------------------------------------------------------------------------
local function UpdateHealth(plate, valueOnly)
    local unit = plate.unit
    if not valueOnly then plate.health:SetMinMaxValues(0, UnitHealthMax(unit)) end
    plate.health:SetValue(UnitHealth(unit))
    if not ns.Enabled("nameplateHealthText") then
        plate.healthText:SetText("")
    elseif UnitIsDeadOrGhost(unit) then
        plate.healthText:SetText("0%")
    else
        plate.healthText:SetFormattedText("%d%%", UnitHealthPercent(unit, true, CurveConstants.ScaleTo100))
    end
end

-- Auto role: Defensive Stance, Bear or Dire Bear Form, or Righteous Fury.
local TANK_AURAS = { 20468, 20469, 20470, 25780 }
local BEAR_FORMS = { [5] = true, [8] = true }

local function DetectTank()
    local _, class = UnitClass("player")
    local form = GetShapeshiftFormID()
    if class == "WARRIOR" then return form == 18 end
    if class == "DRUID" then return BEAR_FORMS[form] or false end
    for _, id in ipairs(TANK_AURAS) do
        if C_UnitAuras.GetPlayerAuraBySpellID(id) then return true end
    end
    return false
end

local autoTank = false

-- Re-reads the auto role; true when it changed.
local function UpdateRole()
    local tank = DetectTank()
    if tank == autoTank then return false end
    autoTank = tank
    return true
end

local function IsTank()
    local mode = ns.Get("nameplateThreat")
    if mode == "auto" then return autoTank end
    return mode == "tank"
end

-- The main tank assignment counts as the tank role too.
local function GroupRole(unit)
    if Clean(GetPartyAssignment("MAINTANK", unit)) then return "TANK" end
    return Clean(UnitGroupRolesAssigned(unit)) or "NONE"
end

-- A tank without aggro: is the mob's target another tank or your pet holding
-- it? Kept on the plate, so a mob stays off-tanked while its target flickers.
local function CheckOfftank(plate, unit, level)
    local target = unit .. "target"
    if UnitExists(target) and (Clean(UnitIsPlayer(target)) or Clean(UnitPlayerControlled(target))) then
        if (Clean(UnitThreatSituation(target, unit)) or 0) > 1 then
            plate.offtanked = (GroupRole(target) == "TANK" and not Clean(UnitIsUnit("player", target)))
                or Clean(UnitIsUnit(target, "pet")) or false
        end
    end
    return plate.offtanked and "OFFTANK" or level
end

-- Threat color for a mob that has you on its threat list: alone, with a pet
-- or in a group alike.
local function ThreatColor(plate, unit)
    if ns.Get("nameplateThreat") == "off" or Clean(UnitIsPlayer(unit)) then return end
    local status = Clean(UnitThreatSituation("player", unit))
    if not status then return end
    local level = THREAT_LEVEL[status]
    local role = IsTank() and "tank" or "dps"
    if status >= 2 then
        plate.offtanked = false
    elseif role == "tank" then
        level = CheckOfftank(plate, unit, level)
    end
    local hex = ns.Get(THREAT_KEYS[role][level])
    local c = threatRGB[hex]
    if not c then
        c = { ns.ColorRGB(hex) }
        threatRGB[hex] = c
    end
    return c
end

local function UpdateHealthColor(plate)
    local unit = plate.unit
    local c
    -- On its threat list = the mob is fighting you (Blizzard's test).
    local fighting = Clean(UnitThreatSituation("player", unit)) ~= nil
    -- Threat first, then tapped, then quest mobs (NameplateQuest.lua) until
    -- they fight you.
    c = ThreatColor(plate, unit)
        or (Clean(UnitIsTapDenied(unit)) and COLORS.tapped)
        or (not fighting and NP.QuestColor and NP.QuestColor(unit))
    if not c and Clean(UnitIsPlayer(unit)) then
        local _, class = UnitClass(unit)
        local cc = RAID_CLASS_COLORS[Clean(class)]
        if cc then
            plate.health:SetStatusBarColor(cc.r, cc.g, cc.b)
            return
        end
    end
    if not c then
        local reaction = Clean(UnitReaction(unit, "player"))
        if reaction and reaction >= 5 then
            c = COLORS.friendly
        elseif reaction == 4 and not fighting then
            c = COLORS.neutral  -- a neutral mob fighting you turns hostile red
        else
            c = COLORS.hostile
        end
    end
    plate.health:SetStatusBarColor(c[1], c[2], c[3])
end

local function LevelText(unit)
    local level = Clean(UnitEffectiveLevel(unit))
    if not level then return "" end
    local class = Clean(UnitClassification(unit))
    if level <= 0 or class == "worldboss" then return "|cffff1a1a??|r " end
    local suffix = (class == "elite" or class == "rareelite") and "+" or ""
    local c = GetCreatureDifficultyColor(level)
    return "|cff" .. ns.RGBToHex(c.r, c.g, c.b) .. level .. suffix .. "|r "
end

local function UpdateName(plate)
    local unit = plate.unit
    local name = UnitName(unit)
    if ns.Enabled("nameplateLevel") then
        plate.name:SetFormattedText("%s%s", LevelText(unit), name or "")
    else
        plate.name:SetFormattedText("%s", name or "")
    end
end

local function UpdateRaidIcon(plate)
    local index = Clean(GetRaidTargetIndex(plate.unit))
    if index then
        SetRaidTargetIconTexture(plate.raidIcon, index)
        plate.raidIcon:Show()
    else
        plate.raidIcon:Hide()
    end
end

local function UpdateTarget(plate)
    local lit = Clean(UnitIsUnit(plate.unit, "target")) and true or false
    if plate.lit == lit then return end
    plate.lit = lit
    if lit then
        plate.border:SetColor(1, 1, 1)
    else
        plate.border:SetColor(0, 0, 0)
    end
end

function NP.TargetPlate()
    for unit, plate in pairs(NP.plates) do
        if Clean(UnitIsUnit(unit, "target")) then return plate end
    end
end

local hoverPlate

-- With an enemy targeted the other plates fade, but not the one under the
-- mouse or one that is casting.
local function UpdateAlpha(plate)
    local dim = ns.Get("nameplateFadeOthers") and not plate.lit and plate ~= hoverPlate and not plate.cast:IsShown()
        and Clean(UnitCanAttack("player", "target"))
    plate:SetAlpha(dim and ns.Get("nameplateOtherAlpha") / 100 or 1)
end
NP.UpdateAlpha = UpdateAlpha

-- UPDATE_MOUSEOVER_UNIT only fires when a mouseover starts, so a watcher
-- (shown only while a plate is highlighted) checks ten times a second for
-- it ending.
local hoverWatch = CreateFrame("Frame")
hoverWatch:Hide()
local function ClearHover()
    local plate = hoverPlate
    hoverPlate = nil
    hoverWatch:Hide()
    if plate then
        plate.hover:Hide()
        UpdateAlpha(plate)
    end
end

local hoverElapsed = 0
hoverWatch:SetScript("OnUpdate", function(_, elapsed)
    hoverElapsed = hoverElapsed + elapsed
    if hoverElapsed < 0.1 then return end
    hoverElapsed = 0
    if not (hoverPlate and hoverPlate.unit and Clean(UnitIsUnit(hoverPlate.unit, "mouseover"))) then
        ClearHover()
    end
end)

local function UpdateHover()
    ClearHover()
    if not UnitExists("mouseover") then return end
    for unit, plate in pairs(NP.plates) do
        if Clean(UnitIsUnit(unit, "mouseover")) then
            hoverPlate = plate
            plate.hover:Show()
            UpdateAlpha(plate)
            hoverElapsed = 0
            hoverWatch:Show()
            return
        end
    end
end

local function UpdateAll(plate)
    plate.lit = nil  -- repaint the border whatever it showed before
    UpdateHealth(plate)
    UpdateHealthColor(plate)
    UpdateName(plate)
    UpdateRaidIcon(plate)
    UpdateTarget(plate)
    UpdateAlpha(plate)
end
NP.UpdateHealthColor = UpdateHealthColor

OnPlateEvent = function(plate, event)
    if not plate.unit then return end
    if event == "UNIT_HEALTH" then
        UpdateHealth(plate, true)
    elseif event == "UNIT_MAXHEALTH" then
        UpdateHealth(plate)
    elseif event == "UNIT_THREAT_LIST_UPDATE" or event == "UNIT_FACTION" then
        UpdateHealthColor(plate)
    elseif event == "UNIT_NAME_UPDATE" or event == "UNIT_LEVEL" or event == "UNIT_CLASSIFICATION_CHANGED" then
        UpdateName(plate)
    end
end

-------------------------------------------------------------------------------
--  Attach / detach
-------------------------------------------------------------------------------
local PLATE_EVENTS = { "UNIT_HEALTH", "UNIT_MAXHEALTH", "UNIT_THREAT_LIST_UPDATE",
    "UNIT_FACTION", "UNIT_NAME_UPDATE", "UNIT_LEVEL", "UNIT_CLASSIFICATION_CHANGED" }

local function Detach(unit)
    local plate = NP.plates[unit]
    if not plate then return end
    NP.plates[unit] = nil
    if hoverPlate == plate then ClearHover() end
    RunModules("detach", plate)
    plate:UnregisterAllEvents()
    plate:Hide()
    plate:SetParent(UIParent)
    plate:ClearAllPoints()
    plate.unit = nil
    pool[#pool + 1] = plate
end

local function Attach(unit, nameplate)
    local plate = table.remove(pool) or CreatePlate()
    if plate.layoutGen ~= NP.layoutGen then
        Layout(plate)
        plate.layoutGen = NP.layoutGen
    end
    plate.unit = unit
    plate.offtanked = nil
    NP.plates[unit] = plate
    plate:SetParent(nameplate)
    plate:ClearAllPoints()
    plate:SetPoint("CENTER", nameplate, "CENTER")
    plate:SetFrameLevel(nameplate:GetFrameLevel() + 1)
    for _, ev in ipairs(PLATE_EVENTS) do plate:RegisterUnitEvent(ev, unit) end
    HideBlizzard(nameplate)
    plate:Show()
    UpdateAll(plate)
    RunModules("attach", plate, unit)
end

-- Serene takes attackable units; anything else keeps (or gets back) Blizzard's plate.
local function Evaluate(unit)
    local nameplate = C_NamePlate.GetNamePlateForUnit(unit)
    if not nameplate or nameplate:IsForbidden() then
        Detach(unit)
        return
    end
    local ours = Clean(UnitCanAttack("player", unit))
    if ours then
        if not NP.plates[unit] then Attach(unit, nameplate) end
    else
        Detach(unit)
        RestoreBlizzard(nameplate.UnitFrame)
    end
end

-- World events the manager listens to from login on.
local MANAGER_EVENTS = { "NAME_PLATE_UNIT_ADDED", "NAME_PLATE_UNIT_REMOVED", "PLAYER_TARGET_CHANGED",
    "UPDATE_MOUSEOVER_UNIT", "RAID_TARGET_UPDATE", "GROUP_ROSTER_UPDATE", "PLAYER_ROLES_ASSIGNED",
    "PLAYER_REGEN_ENABLED", "UNIT_FACTION" }
-- Stance and form changes, and Righteous Fury, move the auto role.
local ROLE_EVENTS = { UPDATE_SHAPESHIFT_FORM = true, UNIT_AURA = true }
local manager = CreateFrame("Frame")

local function RegisterManagerEvents()
    for _, ev in ipairs(MANAGER_EVENTS) do manager:RegisterEvent(ev) end
    manager:RegisterEvent("UPDATE_SHAPESHIFT_FORM")
    manager:RegisterUnitEvent("UNIT_AURA", "player")
end

-- Re-runs every visible plate, e.g. after a setting changed.
local MAX_TOKENS = 80
function NP.RefreshAll()
    for unit in pairs(NP.plates) do Detach(unit) end
    for i = 1, MAX_TOKENS do
        local unit = "nameplate" .. i
        if UnitExists(unit) then Evaluate(unit) end
    end
    RunRefreshHooks()
end

-- Repaints every plate in place, for settings that change no frames.
function NP.Repaint()
    for _, plate in pairs(NP.plates) do
        UpdateAll(plate)
        RunModules("attach", plate, plate.unit)
    end
end

function NP.Relayout()
    NP.layoutGen = (NP.layoutGen or 0) + 1
    for _, plate in pairs(NP.plates) do
        Layout(plate)
        plate.layoutGen = NP.layoutGen
        UpdateAll(plate)
    end
end

-------------------------------------------------------------------------------
--  Events
-------------------------------------------------------------------------------
manager:RegisterEvent("PLAYER_LOGIN")
manager:SetScript("OnEvent", function(self, event, unit)
    if event == "PLAYER_LOGIN" then
        self:UnregisterEvent("PLAYER_LOGIN")
        NP.layoutGen = 1
        -- A pooled UnitFrame reused for a unit Serene does not take gets its
        -- hidden pieces back before Blizzard lays it out.
        hooksecurefunc(NamePlateDriverFrame, "OnNamePlateAdded", function(_, added)
            if not added or added == "preview" or not next(held) then return end
            local np = C_NamePlate.GetNamePlateForUnit(added)
            if np and held[np.UnitFrame] and not Clean(UnitCanAttack("player", added)) then
                RestoreBlizzard(np.UnitFrame)
            end
        end)
        RegisterManagerEvents()
        UpdateRole()
        NP.RefreshAll()
    elseif ROLE_EVENTS[event] then
        if UpdateRole() then
            for _, plate in pairs(NP.plates) do UpdateHealthColor(plate) end
        end
    elseif event == "NAME_PLATE_UNIT_ADDED" then
        Evaluate(unit)
    elseif event == "NAME_PLATE_UNIT_REMOVED" then
        Detach(unit)
    elseif event == "UNIT_FACTION" then
        -- Duels and flag changes move a unit between friendly and attackable.
        if unit and unit:find("^nameplate") then Evaluate(unit) end
    elseif event == "PLAYER_TARGET_CHANGED" then
        for _, plate in pairs(NP.plates) do
            UpdateTarget(plate)
            UpdateAlpha(plate)
        end
    elseif event == "UPDATE_MOUSEOVER_UNIT" then
        UpdateHover()
    elseif event == "RAID_TARGET_UPDATE" then
        for _, plate in pairs(NP.plates) do UpdateRaidIcon(plate) end
    else  -- group, role or combat changes move threat colors
        for _, plate in pairs(NP.plates) do UpdateHealthColor(plate) end
    end
end)

-------------------------------------------------------------------------------
--  Settings
-------------------------------------------------------------------------------
local function Relayout() if NP.layoutGen then NP.Relayout() end end
NP.ApplyRelayout = Relayout

-- Threat colors first, so their groups head the options page. Font and
-- sizes are in NameplateLook.lua, after the cast bar and debuff toggles, so
-- the options page lists every toggle first.
ns.RegisterFeature({
    key = "nameplateThreat", label = "Select role", section = "Nameplates", category = "Threat colors",
    tooltip = "Health bars colored by threat",
    space = true, closed = true,
    type = "dropdown", default = "auto",
    apply = Relayout,
    options = function()
        return {
            { value = "auto", label = "Auto" },
            { value = "tank", label = "Tank" },
            { value = "dps",  label = "Damage / healer" },
            { value = "off",  label = "Off" },
        }
    end,
})
local TANK, DPS = "Threat colors while tanking", "Threat colors while healing or dealing damage"
for _, c in ipairs({
    { "nameplateThreatTankHigh",    TANK, "Your aggro",     "00ff00" },
    { "nameplateThreatTankMedium",  TANK, "Losing aggro",   "ffff00", true },
    { "nameplateThreatTankLow",     TANK, "Lost aggro",     "ff0000" },
    { "nameplateThreatTankOfftank", TANK, "Another tank",   "0faac8", true },
    { "nameplateThreatDpsHigh",     DPS,  "Your aggro",     "ff0000" },
    { "nameplateThreatDpsMedium",   DPS,  "Almost pulling", "ffff00", true },
    { "nameplateThreatDpsLow",      DPS,  "Safe",           "00ff00" },
}) do
    ns.RegisterFeature({
        key = c[1], label = c[3], section = "Nameplates", category = "Threat colors", sub = c[2], type = "color",
        default = c[4], beside = c[5], apply = Relayout,
        closed = c[3] == "Your aggro",  -- each role's first color
    })
end
ns.RegisterFeature({
    key = "nameplateLevel", label = "Show target level", section = "Nameplates", category = "Settings", apply = Relayout,
    tooltip = "What enemy nameplates show and how they look",
})
ns.RegisterFeature({
    key = "nameplateHealthText", label = "Show target health", section = "Nameplates", category = "Settings",
    beside = true, apply = Relayout,
})
