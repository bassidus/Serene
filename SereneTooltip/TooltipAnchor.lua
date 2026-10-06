-------------------------------------------------------------------------------
--  Tooltip Position -- re-owns default-anchored GameTooltips to follow the
--  mouse cursor. Hooks GameTooltip_SetDefaultAnchor, which runs before any
--  content is set, so SetOwner here wipes nothing. Tooltips that addons or
--  Blizzard anchor explicitly (action buttons, bags...) keep their place.
-------------------------------------------------------------------------------
local _, ns = ...

-- side -> { anchor, x offset, y offset }; the X/Y offset settings are added
-- on top.
local ANCHORS = {
    right = { "ANCHOR_CURSOR_RIGHT", 24, -8 },
    left  = { "ANCHOR_CURSOR_LEFT", -24, -8 },
}

local function CursorAnchor()
    return ns.Get("tooltipCursor") and ANCHORS[ns.Get("tooltipCursorSide")]
end

hooksecurefunc("GameTooltip_SetDefaultAnchor", function(tooltip, parent)
    if tooltip ~= GameTooltip or tooltip:IsForbidden() then return end
    local a = CursorAnchor()
    if not a then return end
    -- pcall: a forbidden owner cannot be passed to SetOwner.
    pcall(tooltip.SetOwner, tooltip, parent, a[1],
        a[2] + ns.Get("tooltipOffsetX"), a[3] + ns.Get("tooltipOffsetY"))
end)

-- World-unit tooltips fade out slowly on mouse-off; while riding the cursor
-- that fade trails the pointer, so hide them at once instead.
hooksecurefunc(GameTooltip, "FadeOut", function(self)
    if CursorAnchor() then self:Hide() end
end)

ns.RegisterFeature({
    key = "tooltipCursor", type = "dropdown", default = true,
    tooltip = "A button's tooltip always stays by its button",
    label = "Where tooltips appear", section = "Tooltip", category = "Position",
    options = function()
        return {
            { value = true,  label = "Anchored to cursor" },
            { value = false, label = "Blizzard default" },
        }
    end,
})
ns.RegisterFeature({
    key = "tooltipCursorSide", type = "dropdown", default = "right", beside = true,
    label = "Side of cursor", section = "Tooltip", category = "Position", requires = "tooltipCursor",
    options = function()
        return {
            { value = "left",  label = "Left" },
            { value = "right", label = "Right" },
        }
    end,
})
ns.RegisterFeature({
    key = "tooltipOffsetX", label = "X offset", section = "Tooltip", category = "Position",
    type = "slider", min = -100, max = 100, step = 1, default = 0, requires = "tooltipCursor",
})
ns.RegisterFeature({
    key = "tooltipOffsetY", label = "Y offset", section = "Tooltip", category = "Position",
    type = "slider", min = -100, max = 100, step = 1, default = 0, requires = "tooltipCursor", beside = true,
})
