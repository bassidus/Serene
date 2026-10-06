-------------------------------------------------------------------------------
--  Fast Auto Loot -- loots every slot when the loot window opens; Shift skips.
-------------------------------------------------------------------------------
local _, ns = ...

local lootFrame

local function Apply()
    if ns.Enabled("quickLoot") then
        if not lootFrame then
            lootFrame = CreateFrame("Frame")
            lootFrame:SetScript("OnEvent", function()
                if IsShiftKeyDown() then return end
                for i = 1, GetNumLootItems() do
                    C_Timer.After(0.05 * i, function() LootSlot(i) end)
                end
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
