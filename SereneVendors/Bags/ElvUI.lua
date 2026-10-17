-------------------------------------------------------------------------------
--  ElvUI's bags: B:UpdateSlot repaints a slot, its gray included, on every
--  bag update and lock change, in the bags and the bank. Nothing is drawn
--  while ElvUI's bags are turned off, and Blizzard.lua marks Blizzard's.
-------------------------------------------------------------------------------
local _, ns = ...

if not ElvUI then return end

local B = ElvUI[1]:GetModule("Bags")

hooksecurefunc(B, "UpdateSlot", function(_, frame, bagID, slotID)
    local slot = frame.Bags[bagID] and frame.Bags[bagID][slotID]
    if not slot then return end
    local marked = slot.itemID and ns.IsCrossed(slot.itemID, slot.rarity)
    ns.ShowMark(slot, slot.icon, marked)
    if marked then SetItemButtonDesaturated(slot, true) end
end)

ns.repaints[#ns.repaints + 1] = function()
    B:UpdateAllBagSlots()
end
