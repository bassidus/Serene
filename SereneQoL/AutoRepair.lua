-------------------------------------------------------------------------------
--  Repair at Vendors -- repairs everything on MERCHANT_SHOW. Personal gold only:
--  Forever has no guild bank repairs.
-------------------------------------------------------------------------------
local _, ns = ...

local function AutoRepair()
    if not (CanMerchantRepair and CanMerchantRepair()) then return end
    local cost, canRepair = GetRepairAllCost()
    if not (canRepair and cost and cost > 0) then return end
    if GetMoney() < cost then
        ns.Print("|cffff6060Not enough gold to repair.|r")
        return
    end
    RepairAllItems(false)
    ns.Print("Repaired all items for " .. ns.CoinString(cost))
end

local f = CreateFrame("Frame")
f:RegisterEvent("MERCHANT_SHOW")
f:SetScript("OnEvent", function()
    if ns.Enabled("autoRepair") then AutoRepair() end
end)

ns.RegisterFeature({
    key = "autoRepair", label = "Repair at vendors", section = "General", category = "Vendors & trainers",
    beside = true,  -- to the right of Loot & items
    tooltip = "Repairs all your gear with your own gold when you talk to a vendor who can repair. The cost is shown in chat.",
})
