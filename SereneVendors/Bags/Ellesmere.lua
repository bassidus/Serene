-------------------------------------------------------------------------------
--  EllesmereUI Bags: an item overlay painter, which runs after Ellesmere has
--  painted a slot (its gray included) in the bags, the bank, and List view.
--  btn._textOverlay covers the item's icon in every view; List rows draw the
--  icon as btn._lvIcon and hide btn.icon. Marks are kept off btn, which is
--  secure.
-------------------------------------------------------------------------------
local _, ns = ...

if not EUI_Bags then return end

EUI_Bags.RegisterItemOverlayIcon("SereneVendors", function(btn, data)
    local marked = data.info and ns.IsCrossed(data.info.itemID, data.info.quality)
    ns.ShowMark(btn._textOverlay, btn._textOverlay, marked)
    if marked then (btn._lvIcon or btn.icon):SetDesaturated(true) end
end)

-- Both return at once while their window is closed.
ns.repaints[#ns.repaints + 1] = function()
    EUI_Bags:RefreshInventory()
    if EUI_BankFrame then EUI_BankFrame:RefreshBank() end
end
