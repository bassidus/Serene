-------------------------------------------------------------------------------
--  Quick Loot -- loots every slot when the loot window opens; Shift skips.
-------------------------------------------------------------------------------
local _, ns = ...

local lootFrame, ticker

-- One run at a time, and none past the window it was for.
local function Stop()
    if ticker then ticker:Cancel(); ticker = nil end
end

local function Apply()
    if ns.Get("quickLoot") then
        if not lootFrame then
            lootFrame = CreateFrame("Frame")
            lootFrame:SetScript("OnEvent", function(_, event)
                Stop()
                if event == "LOOT_CLOSED" then return end
                local n = GetNumLootItems()
                if IsShiftKeyDown() or n == 0 then return end
                local slot = 0
                ticker = C_Timer.NewTicker(0.05, function()
                    slot = slot + 1
                    LootSlot(slot)
                end, n)
            end)
        end
        lootFrame:RegisterEvent("LOOT_READY")
        lootFrame:RegisterEvent("LOOT_CLOSED")
    elseif lootFrame then
        lootFrame:UnregisterAllEvents()
        Stop()
    end
end

ns.RegisterFeature({
    key = "quickLoot", label = "Quick loot", section = "General", category = "Loot & items", apply = Apply,
    tooltip = "Like Blizzard's auto loot, but quicker.",
})
