-------------------------------------------------------------------------------
--  Fast Auto Loot -- loots every slot when the loot window opens; Shift skips.
-------------------------------------------------------------------------------
local _, ns = ...

local lootFrame

local function Apply()
    if ns.Get("quickLoot") then
        if not lootFrame then
            lootFrame = CreateFrame("Frame")
            lootFrame:SetScript("OnEvent", function()
                local n = GetNumLootItems()
                if IsShiftKeyDown() or n == 0 then return end
                local slot = 0
                C_Timer.NewTicker(0.05, function()
                    slot = slot + 1
                    LootSlot(slot)
                end, n)
            end)
        end
        lootFrame:RegisterEvent("LOOT_READY")
    elseif lootFrame then
        lootFrame:UnregisterEvent("LOOT_READY")
    end
end

ns.RegisterFeature({
    key = "quickLoot", label = "Fast auto loot", section = "General", category = "Loot & items", apply = Apply,
    tooltip = "Faster looting and fewer confirmations",
})
