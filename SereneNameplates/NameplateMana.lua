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

local owner  -- the plate the bar is on

local function Size()
    bar:SetHeight(math.max(4, math.floor(ns.Get("nameplateHeight") / 3)))
end

local function Release()
    if not owner then return end
    owner.manaBar = nil
    NP.StackBelow(owner)
    owner = nil
    bar:Hide()
end

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

local function Update()
    local plate = ns.Get("nameplateMana") and HasMana() and NP.TargetPlate() or nil
    if plate ~= owner then
        Release()
        if not plate then return end
        owner = plate
        plate.manaBar = bar
        bar:SetParent(plate)
        Size()
        NP.StackBelow(plate)
        bar:Show()
    end
    UpdateValue()
end

-- Listens only while the setting is on.
local watcher = CreateFrame("Frame")
watcher:SetScript("OnEvent", function(_, event, _, powerType)
    if event == "UNIT_POWER_UPDATE" then
        if powerType == "MANA" and owner then UpdateValue() end
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

NP.RegisterModule({
    attach = function(plate, unit)
        if Clean(UnitIsUnit(unit, "target")) then Update() end
    end,
    detach = function(plate)
        if plate == owner then Release() end
    end,
    layout = function(plate)
        if plate == owner then Size() end
    end,
})

ns.RegisterFeature({
    key = "nameplateMana", label = "Show target mana bar", section = "Nameplates",
    category = "Settings",
    apply = Sync,
})
