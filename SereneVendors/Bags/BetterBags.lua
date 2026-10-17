-------------------------------------------------------------------------------
--  BetterBags: a slot draws onto a decoration, a button its theme makes, and
--  skips the draw while nothing it reads has changed. Every full draw ends
--  in Unlock, which undoes the gray, as does a drag's end; ResetVisuals
--  blanks a slot that changes to an empty one. A repaint restyles every
--  button, so they all draw again.
-------------------------------------------------------------------------------
local _, ns = ...

if not C_AddOns.IsAddOnLoaded("BetterBags") then return end

local addon = LibStub("AceAddon-3.0"):GetAddon("BetterBags")
local themes = addon:GetModule("Themes")

local function Paint(item, ctx)
    local decoration = themes:GetItemButton(ctx, item)
    local data = item.currentData
    local marked = data and not data.isItemEmpty
        and ns.IsCrossed(data.itemInfo.itemID, data.itemInfo.itemQuality)
    ns.ShowMark(decoration, decoration.icon, marked)
    if marked then SetItemButtonDesaturated(decoration, true) end
end

local proto = addon:GetModule("ItemFrame").itemProto
hooksecurefunc(proto, "Unlock", Paint)
hooksecurefunc(proto, "ResetVisuals", Paint)

ns.repaints[#ns.repaints + 1] = function()
    addon:GetModule("Refresh"):RequestRedraw(true)
end
