-------------------------------------------------------------------------------
--  Combat Alert -- "+ Combat" when a fight starts, "- Combat" when it ends.
-------------------------------------------------------------------------------
local _, ns = ...

local watcher = CreateFrame("Frame")
watcher:SetScript("OnEvent", function(_, event)
    if event == "PLAYER_REGEN_DISABLED" then
        ns.Alert("+ Combat", 1, 0.3, 0.3)
    else
        ns.Alert("- Combat", 0.3, 1, 0.3)
    end
end)

ns.RegisterFeature({
    key = "combatAlert", label = "Combat in/out text", section = "Quality of Life", category = "General",
    tooltip = "Large text when a fight starts and ends.",
    default = false,
    apply = function()
        if ns.Get("combatAlert") then
            watcher:RegisterEvent("PLAYER_REGEN_DISABLED")
            watcher:RegisterEvent("PLAYER_REGEN_ENABLED")
        else
            watcher:UnregisterAllEvents()
        end
    end,
})
