-------------------------------------------------------------------------------
--  Bagnon and Bagnonium: each loads its own copy of BagBrother's classes
--  under its own global. Item:UpdateBorder grays a slot (locked, or left out
--  by a search) on every update, lock and search. Slot buttons copy their
--  class's methods when first made, at login, so the hook reaches them all.
-------------------------------------------------------------------------------
local _, ns = ...

for _, name in ipairs({ "Bagnon", "Bagnonium" }) do
    local addon = _G[name]
    if addon then
        hooksecurefunc(addon.Item, "UpdateBorder", function(button)
            local info = button.info
            local marked = info.itemID and ns.IsCrossed(info.itemID, info.quality)
            ns.ShowMark(button, button.icon, marked)
            if marked then button:SetDesaturated(true) end
        end)

        ns.repaints[#ns.repaints + 1] = function()
            addon.Frames:Update()
        end
    end
end
