-------------------------------------------------------------------------------
--  Nameplate Combo Points -- five boxes under the health bar of the enemy
--  holding your combo points.
--
--  Combo points belong to the enemy they were built on. GetComboPoints only
--  reads the target, so the plate that last showed points keeps them after a
--  target switch, counted by UnitPower, which keeps its count until you build
--  on another enemy. Only one enemy holds them, so a single row moves between
--  plates (NP.MovingRow), which fits it in under the health bar.
-------------------------------------------------------------------------------
local _, ns = ...
local NP = ns.NP

local MAX = 5
local GAP = 3  -- the boxes' borders sit outside them; 3 leaves a 1px gap
local ON_COLOR  = { 1.00, 0.82, 0.00, 1 }
local OFF_COLOR = { 0.05, 0.05, 0.05, 0.85 }
local CLASSES = { ROGUE = true, DRUID = true }

local row = CreateFrame("Frame")
row:Hide()
row.boxes = {}
for i = 1, MAX do
    local box = CreateFrame("Frame", nil, row)
    box.fill = box:CreateTexture(nil, "ARTWORK")
    box.fill:SetAllPoints()
    NP.Border(box)
    row.boxes[i] = box
end

local function Size()
    local h = math.max(4, math.floor(ns.Get("nameplateHeight") / 3))
    local w = (ns.Get("nameplateWidth") - GAP * (MAX - 1)) / MAX
    row:SetHeight(h)
    for i, box in ipairs(row.boxes) do
        box:SetSize(w, h)
        box:SetPoint("LEFT", row, "LEFT", (i - 1) * (w + GAP), 0)
    end
end

local Update
local Move, Owner = NP.MovingRow(row, "comboRow", Size, function() Update() end)

function Update()
    local plate, points
    if ns.Get("nameplateComboPoints") then
        -- Both can be secret; a secret count hides the row.
        points = ns.Clean(GetComboPoints("player", "target")) or 0
        if points > 0 then
            plate = NP.TargetPlate()
        else
            points = ns.Clean(UnitPower("player", Enum.PowerType.ComboPoints)) or 0
            if points > 0 then plate = Owner() end
        end
    end
    Move(plate)
    if not plate then return end
    for i, box in ipairs(row.boxes) do
        local c = i <= points and ON_COLOR or OFF_COLOR
        box.fill:SetColorTexture(c[1], c[2], c[3], c[4])
    end
end

-- Only rogues and druids listen, and only while the setting is on.
local watcher = CreateFrame("Frame")
watcher:SetScript("OnEvent", function(_, event, _, powerType)
    if event == "UNIT_POWER_UPDATE" and powerType ~= "COMBO_POINTS" then return end
    Update()
end)

local function Sync()
    local _, class = UnitClass("player")
    if ns.Get("nameplateComboPoints") and CLASSES[class] then
        watcher:RegisterEvent("PLAYER_TARGET_CHANGED")
        watcher:RegisterUnitEvent("UNIT_POWER_UPDATE", "player")
    else
        watcher:UnregisterAllEvents()
    end
    Update()
end
NP.OnRefresh(Sync)

ns.RegisterFeature({
    key = "nameplateComboPoints", label = "Show combo points", section = "Nameplates",
    category = "Settings", beside = true,
    apply = Sync,
})
