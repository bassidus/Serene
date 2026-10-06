-------------------------------------------------------------------------------
--  Indicators -- crossed swords beside the target and focus frames while
--  that unit is in combat (whether a mob is already pulled), and a blue
--  border around the player frame while stealthed, each on its own page.
--  Both are our own textures on frames of our own, so nothing of
--  Blizzard's is touched.
-------------------------------------------------------------------------------
local _, ns = ...

local Clean = ns.Clean

-------------------------------------------------------------------------------
--  Combat icon
-------------------------------------------------------------------------------
local SWORDS = "Interface\\Icons\\ABILITY_DUALWIELD"
local icons = {}  -- [unit] = icon frame

local function MakeIcon(parent)
    local f = CreateFrame("Frame", nil, parent)
    f:SetSize(22, 22)
    -- Right of the portrait, level with the name.
    f:SetPoint("LEFT", parent, "RIGHT", -6, 12)
    local tex = f:CreateTexture(nil, "ARTWORK")
    tex:SetAllPoints()
    tex:SetTexture(SWORDS)
    tex:SetTexCoord(0.08, 0.92, 0.08, 0.92)
    f:Hide()
    return f
end

icons.target = MakeIcon(TargetFrame)
icons.focus = MakeIcon(FocusFrame)

local PAGES = ns.FramePages("target", "focus")
local iconKeys = { target = PAGES[1].key.CombatIcon, focus = PAGES[2].key.CombatIcon }

local function UpdateIcon(unit)
    icons[unit]:SetShown(ns.Get(iconKeys[unit]) and Clean(UnitAffectingCombat(unit)) == true)
end

local combat = CreateFrame("Frame")
combat:SetScript("OnEvent", function(_, event, unit)
    if event == "PLAYER_TARGET_CHANGED" then
        UpdateIcon("target")
    elseif event == "PLAYER_FOCUS_CHANGED" then
        UpdateIcon("focus")
    else  -- UNIT_FLAGS, for target or focus
        UpdateIcon(unit)
    end
end)

local function ApplyCombat()
    if ns.Get(iconKeys.target) or ns.Get(iconKeys.focus) then
        combat:RegisterUnitEvent("UNIT_FLAGS", "target", "focus")
        combat:RegisterEvent("PLAYER_TARGET_CHANGED")
        combat:RegisterEvent("PLAYER_FOCUS_CHANGED")
    else
        combat:UnregisterAllEvents()
    end
    UpdateIcon("target")
    UpdateIcon("focus")
end

-------------------------------------------------------------------------------
--  Stealth border: Blizzard's vehicle status glow around the portrait frame,
--  tinted blue.
-------------------------------------------------------------------------------
local stealth = CreateFrame("Frame", nil, PlayerFrame)
stealth:SetAllPoints()
local border = stealth:CreateTexture(nil, "BACKGROUND")
border:SetAtlas("ui-hud-unitframe-player-portraiton-vehicle-status")
border:SetSize(201, 83.5)
border:SetPoint("CENTER", PlayerFrame, "CENTER", -4, 0)
border:SetVertexColor(0.21, 0.49, 1)
border:Hide()

local PLAYER = ns.FramePages("player")[1]

local function UpdateStealth()
    border:SetShown(ns.Get(PLAYER.key.Stealth) and IsStealthed())
end
stealth:SetScript("OnEvent", UpdateStealth)

local function ApplyStealth()
    if ns.Get(PLAYER.key.Stealth) then
        stealth:RegisterEvent("UPDATE_STEALTH")
    else
        stealth:UnregisterAllEvents()
    end
    UpdateStealth()
end

ns.RegisterFeature({
    key = PLAYER.key.Stealth, label = "Blue border in stealth", section = PLAYER.section, view = PLAYER.view,
    category = "Appearance",
    default = false, apply = ApplyStealth,
})
for _, page in ipairs(PAGES) do
    ns.RegisterFeature({
        key = page.key.CombatIcon, label = "Combat icon", section = page.section, view = page.view,
        category = "Appearance",
        default = false, apply = ApplyCombat,
    })
end
