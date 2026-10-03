-------------------------------------------------------------------------------
--  Tooltip Position -- re-owns default-anchored GameTooltips to follow the
--  mouse cursor. Hooks GameTooltip_SetDefaultAnchor, which runs before any
--  content is set, so SetOwner here wipes nothing. Tooltips that addons or
--  Blizzard anchor explicitly (action buttons, bags...) keep their place.
-------------------------------------------------------------------------------
local _, ns = ...

-- value -> { anchor, x offset, y offset }; "default" leaves Blizzard alone.
-- The X/Y offset settings are added on top.
local ANCHORS = {
    cursorRight = { "ANCHOR_CURSOR_RIGHT", 24, -8 },
    cursorLeft  = { "ANCHOR_CURSOR_LEFT", -24, -8 },
}

local function CursorAnchor()
    return ANCHORS[ns.Get("tooltipAnchor")]
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
if GameTooltip.FadeOut then
    hooksecurefunc(GameTooltip, "FadeOut", function(self)
        if self == GameTooltip and CursorAnchor() then self:Hide() end
    end)
end

ns.RegisterFeature({
    key = "tooltipAnchor", type = "dropdown", default = "cursorRight",
    label = "Tooltip Position", section = "Tooltip",
    tooltip = "Where the tooltip appears for units, objects and other default-placed tooltips.",
    options = function()
        return {
            { value = "default",     label = "Blizzard default" },
            { value = "cursorRight", label = "Right of cursor" },
            { value = "cursorLeft",  label = "Left of cursor" },
        }
    end,
})
ns.RegisterFeature({
    key = "tooltipOffsetX", type = "slider", default = 0, min = -100, max = 100, step = 1,
    label = "Cursor Offset X", section = "Tooltip",
    tooltip = "Moves a cursor-placed tooltip sideways: positive is right, negative left.",
})
ns.RegisterFeature({
    key = "tooltipOffsetY", type = "slider", default = 0, min = -100, max = 100, step = 1,
    label = "Cursor Offset Y", section = "Tooltip",
    tooltip = "Moves a cursor-placed tooltip up and down: positive is up, negative down.",
})
