-------------------------------------------------------------------------------
--  Low Durability Warning -- after a fight and on login or a loading screen,
--  says so when any piece of gear is below 30% durability.
-------------------------------------------------------------------------------
local _, ns = ...

local THRESHOLD = 30
local AFTER_COMBAT = 2  -- seconds, so it doesn't replace "- Combat"

local function Check()
    if not ns.Get("durabilityWarning") or InCombatLockdown() then return end
    local lowest
    for slot = 1, 18 do  -- the equipped slots
        local cur, max = GetInventoryItemDurability(slot)
        if cur and max > 0 then
            local pct = cur / max * 100
            if not lowest or pct < lowest then lowest = pct end
        end
    end
    if lowest and lowest < THRESHOLD then
        ns.Alert(("Low durability: %d%%"):format(lowest), 1, 0.5, 0.1)
    end
end

local watcher = CreateFrame("Frame")
watcher:SetScript("OnEvent", function(_, event)
    if event == "PLAYER_REGEN_ENABLED" then
        C_Timer.After(AFTER_COMBAT, Check)
    else
        Check()
    end
end)

ns.RegisterFeature({
    key = "durabilityWarning", label = "Low durability warning", section = "Quality of Life", category = "General",
    beside = true,
    tooltip = "Warns after a fight when any gear is below 30% durability.",
    apply = function()
        if ns.Get("durabilityWarning") then
            watcher:RegisterEvent("PLAYER_ENTERING_WORLD")
            watcher:RegisterEvent("PLAYER_REGEN_ENABLED")
        else
            watcher:UnregisterAllEvents()
        end
    end,
})
