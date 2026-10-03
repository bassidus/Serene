-------------------------------------------------------------------------------
--  Nameplates -- a light take on EllesmereUI's enemy nameplates: a flat
--  health bar colored by threat / class / reaction, name with a level
--  colored by difficulty, health percent, raid marker, and a target and
--  mouseover highlight. Cast bar and debuffs are their own files and plug in
--  through NP.RegisterModule. Only attackable units get a Serene plate;
--  friendly plates stay Blizzard's.
--
--  Blizzard's plate is hidden the way Ellesmere does it: its UnitFrame stays
--  on the nameplate at alpha 0 (moving it breaks click targeting between
--  stacked plates) and its aura list is parked off screen, since those
--  icons take the mouse even when invisible. Pooled UnitFrames get both
--  back when Blizzard reuses them for a friendly unit.
--
--  12.1 engine: health, levels and threat can be secret values. They are
--  handed to setters (SetValue, SetFormattedText) as they are and never
--  compared unless issecretvalue says they are plain.
-------------------------------------------------------------------------------
local _, ns = ...

local NP = { plates = {}, modules = {} }
ns.NP = NP

local BAR = "Interface\\Buttons\\WHITE8X8"

-- Colors from EllesmereUI's defaults.
local COLORS = {
    hostile   = { 0.80, 0.137, 0.137 },
    neutral   = { 0.81, 0.72, 0.19 },
    friendly  = { 0.29, 0.69, 0.30 },
    tapped    = { 0.50, 0.50, 0.50 },
    dpsHasAggro     = { 1.00, 0.50, 0.00 },
    dpsNearAggro    = { 0.81, 0.72, 0.19 },
    tankHasAggro    = { 0.05, 0.82, 0.62 },
    tankLosingAggro = { 0.81, 0.72, 0.19 },
    tankNoAggro     = { 1.00, 0.22, 0.17 },
}
NP.COLORS = COLORS

local issecret = issecretvalue
local function Clean(v)
    if issecret and issecret(v) then return nil end
    return v
end
NP.Clean = Clean

function NP.Active()
    return ns.Enabled("nameplates") and not NP.blocked
end

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

local OnPlateEvent

local function Layout(plate)
    plate:SetSize(ns.Get("nameplateWidth"), ns.Get("nameplateHeight"))
    NP.SetFont(plate.name)
    NP.SetFont(plate.healthText, -1)
    local icon = ns.Get("nameplateHeight") + 6
    plate.raidIcon:SetSize(icon, icon)
    RunModules("layout", plate)
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
    elseif UnitHealthPercent and CurveConstants and CurveConstants.ScaleTo100 then
        plate.healthText:SetFormattedText("%d%%", UnitHealthPercent(unit, true, CurveConstants.ScaleTo100))
    else
        local cur, max = Clean(UnitHealth(unit)), Clean(UnitHealthMax(unit))
        if cur and max and max > 0 then
            plate.healthText:SetFormattedText("%d%%", cur / max * 100)
        else
            plate.healthText:SetText("")
        end
    end
end

local function IsTank()
    local mode = ns.Get("nameplateThreat")
    if mode == "tank" then return true end
    if mode == "auto" and UnitGroupRolesAssigned then
        return UnitGroupRolesAssigned("player") == "TANK"
    end
    return false
end

-- Threat color, in a group only (solo you always hold aggro). Status:
-- 3 = securely tanking, 2 = tanking but losing it, 0/1 = not tanking.
local function ThreatColor(unit)
    if ns.Get("nameplateThreat") == "off" or not IsInGroup() then return end
    local status = Clean(UnitThreatSituation("player", unit))
    if not status then return end
    if IsTank() then
        if status >= 3 then return COLORS.tankHasAggro end
        if status == 2 then return COLORS.tankLosingAggro end
        return COLORS.tankNoAggro
    end
    if status >= 3 then return COLORS.dpsHasAggro end
    if status == 2 then return COLORS.dpsNearAggro end
end

local function UpdateHealthColor(plate)
    local unit = plate.unit
    local c
    -- Tapped first, then quest mobs (NameplateQuest.lua), then threat.
    if Clean(UnitIsTapDenied(unit)) then
        c = COLORS.tapped
    else
        c = (NP.QuestColor and NP.QuestColor(unit)) or ThreatColor(unit)
    end
    if not c and ns.Enabled("nameplateClassColors") and Clean(UnitIsPlayer(unit)) then
        local _, class = UnitClass(unit)
        class = Clean(class)
        local cc = class and (C_ClassColor and C_ClassColor.GetClassColor(class) or RAID_CLASS_COLORS[class])
        if cc then
            plate.health:SetStatusBarColor(cc.r, cc.g, cc.b)
            return
        end
    end
    if not c then
        local reaction = Clean(UnitReaction(unit, "player"))
        if reaction and reaction >= 5 then
            c = COLORS.friendly
        elseif reaction == 4 then
            c = COLORS.neutral
        else
            c = COLORS.hostile
        end
    end
    plate.health:SetStatusBarColor(c[1], c[2], c[3])
end

local function LevelText(unit)
    local level = Clean(UnitEffectiveLevel and UnitEffectiveLevel(unit) or UnitLevel(unit))
    if not level then return "" end
    local class = Clean(UnitClassification(unit))
    if level <= 0 or class == "worldboss" then return "|cffff1a1a??|r " end
    local suffix = (class == "elite" or class == "rareelite") and "+" or ""
    local GetColor = GetCreatureDifficultyColor or GetQuestDifficultyColor
    local c = GetColor and GetColor(level)
    local hex = c and string.format("%02x%02x%02x", c.r * 255, c.g * 255, c.b * 255) or "ffffff"
    return "|cff" .. hex .. level .. suffix .. "|r "
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
    local lit = (Clean(UnitIsUnit(plate.unit, "target")) and ns.Enabled("nameplateTargetHighlight")) and true or false
    if plate.lit == lit then return end
    plate.lit = lit
    if lit then
        plate.border:SetColor(1, 1, 1)
    else
        plate.border:SetColor(0, 0, 0)
    end
end

-- UPDATE_MOUSEOVER_UNIT only fires when a mouseover starts, so a watcher
-- (shown only while a plate is highlighted) checks ten times a second for
-- it ending.
local hoverPlate
local hoverWatch = CreateFrame("Frame")
hoverWatch:Hide()
local function ClearHover()
    if hoverPlate then hoverPlate.hover:Hide() end
    hoverPlate = nil
    hoverWatch:Hide()
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
    NP.plates[unit] = plate
    plate:SetParent(nameplate)
    plate:ClearAllPoints()
    plate:SetPoint("CENTER", nameplate, "CENTER")
    plate:SetFrameLevel(nameplate:GetFrameLevel() + 1)
    for _, ev in ipairs(PLATE_EVENTS) do
        pcall(plate.RegisterUnitEvent, plate, ev, unit)
    end
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
    local ours = NP.Active() and Clean(UnitCanAttack("player", unit))
    if ours then
        if not NP.plates[unit] then Attach(unit, nameplate) end
    else
        Detach(unit)
        RestoreBlizzard(nameplate.UnitFrame)
    end
end

-- World events the manager needs only while Serene draws plates.
local MANAGER_EVENTS = { "NAME_PLATE_UNIT_ADDED", "NAME_PLATE_UNIT_REMOVED", "PLAYER_TARGET_CHANGED",
    "UPDATE_MOUSEOVER_UNIT", "RAID_TARGET_UPDATE", "GROUP_ROSTER_UPDATE", "PLAYER_ROLES_ASSIGNED",
    "PLAYER_REGEN_ENABLED", "UNIT_FACTION" }
local manager = CreateFrame("Frame")

local function SyncManagerEvents()
    local on = NP.Active()
    for _, ev in ipairs(MANAGER_EVENTS) do
        if on then manager:RegisterEvent(ev) else manager:UnregisterEvent(ev) end
    end
end

-- Re-runs every visible plate, e.g. after a setting changed.
-- The units come from our own plates and the nameplate tokens themselves;
-- namePlateUnitToken on the nameplate frames is not set on every client,
-- and relying on it alone left every plate detached and hidden.
local MAX_TOKENS = 80
function NP.RefreshAll()
    local units = {}
    for unit in pairs(NP.plates) do units[unit] = true end
    for _, nameplate in ipairs(C_NamePlate.GetNamePlates()) do
        local unit = nameplate.namePlateUnitToken
        if unit then units[unit] = true end
    end
    for i = 1, MAX_TOKENS do
        local unit = "nameplate" .. i
        if UnitExists(unit) then units[unit] = true end
    end
    for unit in pairs(NP.plates) do Detach(unit) end
    for unit in pairs(units) do Evaluate(unit) end
    if not NP.Active() then
        for uf in pairs(held) do RestoreBlizzard(uf) end
    end
    SyncManagerEvents()
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
        -- Two addons drawing the same plates fight over them.
        if C_AddOns.IsAddOnLoaded("EllesmereUINameplates") then
            NP.blocked = true
            ns.Print("Nameplates are off while EllesmereUI Nameplates is loaded.")
            RunRefreshHooks()
            return
        end
        NP.layoutGen = 1
        -- A pooled UnitFrame reused for a unit Serene does not take gets its
        -- hidden pieces back before Blizzard lays it out.
        if NamePlateDriverFrame and NamePlateDriverFrame.OnNamePlateAdded then
            hooksecurefunc(NamePlateDriverFrame, "OnNamePlateAdded", function(_, added)
                if not added or added == "preview" or not next(held) then return end
                local np = C_NamePlate.GetNamePlateForUnit(added)
                if np and held[np.UnitFrame] and not (NP.Active() and Clean(UnitCanAttack("player", added))) then
                    RestoreBlizzard(np.UnitFrame)
                end
            end)
        end
        NP.RefreshAll()
    elseif event == "NAME_PLATE_UNIT_ADDED" then
        Evaluate(unit)
    elseif event == "NAME_PLATE_UNIT_REMOVED" then
        Detach(unit)
    elseif event == "UNIT_FACTION" then
        -- Duels and flag changes move a unit between friendly and attackable.
        if unit and unit:find("^nameplate") then Evaluate(unit) end
    elseif event == "PLAYER_TARGET_CHANGED" then
        for _, plate in pairs(NP.plates) do UpdateTarget(plate) end
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
local function Refresh() if NP.layoutGen then NP.RefreshAll() end end
local function Relayout() if NP.layoutGen then NP.Relayout() end end
NP.ApplyRelayout = Relayout

-- Threat colors, font and sizes are in NameplateLook.lua, after the cast bar
-- and debuff toggles, so the options page lists every toggle first.

ns.RegisterFeature({
    key = "nameplates", cmd = "nameplates", label = "Enable Nameplates", section = "Nameplates", apply = Refresh,
    tooltip = "Serene's own plates for enemies: flat health bar, name and level, cast bar and your debuffs.\nFriendly plates stay Blizzard's. Off while EllesmereUI Nameplates is loaded.",
})
ns.RegisterFeature({
    key = "nameplateClassColors", label = "Class Colors", section = "Nameplates", apply = Relayout,
    tooltip = "Colors enemy players' health bars by class.",
})
ns.RegisterFeature({
    key = "nameplateLevel", label = "Show Level", section = "Nameplates", apply = Relayout,
    tooltip = "Shows the level before the name, colored by difficulty (+ for elites, ?? for bosses).",
})
ns.RegisterFeature({
    key = "nameplateHealthText", label = "Health Percent", section = "Nameplates", apply = Relayout,
    tooltip = "Shows the health percent inside the bar.",
})
ns.RegisterFeature({
    key = "nameplateTargetHighlight", label = "Highlight Target", section = "Nameplates", apply = Relayout,
    tooltip = "White border around your target's plate.",
})
