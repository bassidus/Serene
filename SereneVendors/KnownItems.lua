-------------------------------------------------------------------------------
--  Dim Known Items -- at a vendor, items you have already learned (pet
--  grimoires, recipes, mounts, toys...) fade out where they stand. Their
--  tooltip carries Blizzard's "Already known" line, which is what is read,
--  so every kind is caught the same way.
-------------------------------------------------------------------------------
local _, ns = ...

local DIM = 0.35

local function Known(index)
    local data = C_TooltipInfo.GetMerchantItem(index)
    if not data then return false end
    for _, line in ipairs(data.lines) do
        if ns.Clean(line.leftText) == ITEM_SPELL_KNOWN then return true end
    end
    return false
end

local function Dim()
    local on = ns.Get("dimKnownItems")
    for i = 1, MERCHANT_ITEMS_PER_PAGE do
        local itemButton = _G["MerchantItem" .. i .. "ItemButton"]
        local known = on and itemButton:IsShown() and Known(itemButton:GetID())
        _G["MerchantItem" .. i]:SetAlpha(known and DIM or 1)
    end
end

-- The buyback tab shows its items in the same rows.
local function Undim()
    for i = 1, MERCHANT_ITEMS_PER_PAGE do _G["MerchantItem" .. i]:SetAlpha(1) end
end

hooksecurefunc("MerchantFrame_UpdateMerchantInfo", Dim)
hooksecurefunc("MerchantFrame_UpdateBuybackInfo", Undim)

ns.RegisterFeature({
    key = "dimKnownItems", label = "Dim known items", section = "Quality of Life", category = "Vendors & trainers",
    tooltip = "Items you already know fade out at vendors.",
    beside = true,
    apply = function()
        if MerchantFrame:IsShown() then MerchantFrame_Update() end
    end,
})
