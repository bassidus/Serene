-------------------------------------------------------------------------------
--  Baganator: a corner widget, because Baganator hides those at the start
--  of every refresh of a slot, empty ones too, and undoes its gray. The
--  widget is an empty frame holding the mark, anchored to the whole icon.
--  It shows itself and tells Baganator it didn't: a corner shows only its
--  first shown widget, and this one comes first.
-------------------------------------------------------------------------------
local _, ns = ...

if not Baganator then return end

local icons = {}
Baganator.API.RegisterCornerWidget("Serene junk", "serenejunk",
    function(widget, details)
        local marked = ns.IsCrossed(details.itemID, details.quality)
        widget:SetShown(marked)
        if marked then icons[widget]:SetDesaturated(true) end
        return false
    end,
    function(button)
        local widget = CreateFrame("Frame", nil, button)
        widget:SetSize(1, 1)
        ns.NewMark(widget, button.icon)
        icons[widget] = button.icon
        return widget
    end,
    { corner = "top_left", priority = 1 }, true)

ns.repaints[#ns.repaints + 1] = function()
    Baganator.API.RequestItemButtonsRefresh()
end
