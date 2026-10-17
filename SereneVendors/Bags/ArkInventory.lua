-------------------------------------------------------------------------------
--  ArkInventory: API.ItemFrameUpdated runs after every paint of a slot, its
--  lock gray included. Only bags and bank: its other windows show mounts,
--  pets, the mail and worn gear. Its item records keep a link, not the item
--  ID or quality.
-------------------------------------------------------------------------------
local _, ns = ...

if not ArkInventory then return end

local LOCATIONS = { ArkInventory.Const.Location.Bag, ArkInventory.Const.Location.Bank }

hooksecurefunc(ArkInventory.API, "ItemFrameUpdated", function(frame, loc)
    if not tContains(LOCATIONS, loc) then return end
    local item = ArkInventory.API.ItemFrameItemTableGet(frame)
    local itemID = item and item.h and C_Item.GetItemInfoInstant(item.h)
    local marked = itemID and ns.IsCrossed(itemID, C_Item.GetItemQualityByID(item.h))
    ns.ShowMark(frame, frame.icon, marked)
    if marked then frame.icon:SetDesaturated(true) end
end)

ns.repaints[#ns.repaints + 1] = function()
    for _, loc in ipairs(LOCATIONS) do
        ArkInventory.Frame_Main_Generate(loc, ArkInventory.Const.Window.Draw.Refresh)
    end
end
