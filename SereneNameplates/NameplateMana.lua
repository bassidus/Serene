-------------------------------------------------------------------------------
--  Nameplate Mana -- a thin blue bar under the health bar of your target,
--  when it has mana.
--
--  Only the target gets one, so a single bar moves between plates, like the
--  combo point row. Power values can be secret: they go to the bar's setters
--  as they are, and are never compared.
-------------------------------------------------------------------------------
local _, ns = ...
local NP = ns.NP

local MANA = Enum.PowerType.Mana
local MANA_COLOR = { 0.20, 0.45, 0.95 }

local Clean = ns.Clean

local bar = CreateFrame("StatusBar")
bar:Hide()
bar:SetStatusBarTexture(NP.BAR)
bar:SetStatusBarColor(MANA_COLOR[1], MANA_COLOR[2], MANA_COLOR[3])
NP.Background(bar)
NP.Border(bar)

local function Size()
    bar:SetHeight(math.max(4, math.floor(ns.Get("nameplateHeight") / 3)))
end

local Update
local Move, Owner = NP.MovingRow(bar, "manaBar", Size, function() Update() end)

-- Most melee mobs have mana as their power type but none of it. Their max
-- is a clean 0; a caster's max is secret (SecretWhenUnitPowerMaxRestricted),
-- so a secret max means mana.
local function HasMana()
    if Clean(UnitPowerType("target")) ~= MANA then return false end
    local max = UnitPowerMax("target", MANA)
    return issecretvalue(max) or max > 0
end

local function UpdateValue()
    bar:SetMinMaxValues(0, UnitPowerMax("target", MANA))
    bar:SetValue(UnitPower("target", MANA))
end

function Update()
    local plate = ns.Get("nameplateMana") and HasMana() and NP.TargetPlate() or nil
    Move(plate)
    if plate then UpdateValue() end
end

-- Listens only while the setting is on.
local watcher = CreateFrame("Frame")
watcher:SetScript("OnEvent", function(_, event, _, powerType)
    if event == "UNIT_POWER_UPDATE" then
        if powerType == "MANA" and Owner() then UpdateValue() end
    else
        Update()
    end
end)

local function Sync()
    if ns.Get("nameplateMana") then
        watcher:RegisterEvent("PLAYER_TARGET_CHANGED")
        watcher:RegisterUnitEvent("UNIT_POWER_UPDATE", "target")
        watcher:RegisterUnitEvent("UNIT_MAXPOWER", "target")
        watcher:RegisterUnitEvent("UNIT_DISPLAYPOWER", "target")
    else
        watcher:UnregisterAllEvents()
    end
    Update()
end
NP.OnRefresh(Sync)

ns.RegisterFeature({
    key = "nameplateMana", label = "Show target mana bar", section = "Nameplates",
    category = "Settings",
    apply = Sync,
})
