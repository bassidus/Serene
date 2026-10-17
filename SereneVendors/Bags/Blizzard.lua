-------------------------------------------------------------------------------
--  Blizzard's bags: slot buttons are pooled, so the mark and the gray are
--  set again on every UpdateItems. Blizzard grays locked items itself.
-------------------------------------------------------------------------------
local _, ns = ...

local function MarkBag(bag)
    for _, button in bag:EnumerateValidItems() do
        local info = C_Container.GetContainerItemInfo(button:GetBagID(), button:GetID())
        local marked = info and ns.IsCrossed(info.itemID, info.quality)
        if ns.ShowMark(button, button.icon, marked) then
            button.icon:SetDesaturated(marked or (info and info.isLocked))
        end
    end
end

local BAGS = { ContainerFrameCombinedBags }
local i = 1
while _G["ContainerFrame" .. i] do
    BAGS[#BAGS + 1] = _G["ContainerFrame" .. i]
    i = i + 1
end
for _, bag in ipairs(BAGS) do hooksecurefunc(bag, "UpdateItems", MarkBag) end

ns.repaints[#ns.repaints + 1] = function()
    for _, bag in ipairs(BAGS) do
        if bag:IsShown() then MarkBag(bag) end
    end
end
