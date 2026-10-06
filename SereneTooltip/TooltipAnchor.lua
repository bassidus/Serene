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
hooksecurefunc(GameTooltip, "FadeOut", function(self)
    if CursorAnchor() then self:Hide() end
end)

ns.RegisterFeature({
    key = "tooltipAnchor", type = "dropdown", default = "cursorRight",
    tooltip = "Where tooltips show; a button's tooltip stays by its button",
    label = "Where tooltips appear", section = "Tooltip", category = "Position",
    options = function()
        return {
            { value = "default",     label = "Blizzard default" },
            { value = "cursorRight", label = "Right of cursor" },
            { value = "cursorLeft",  label = "Left of cursor" },
        }
    end,
})
-- The box is the cursor; the dot moves the tooltip from its usual spot beside it.
ns.RegisterPositionSettings({
    prefix = "tooltip", label = "Offset from cursor", button = "Offset from cursor",
    section = "Tooltip", category = "Position",
    x = { -100, 100, 0 }, y = { -100, 100, 0 }, box = { -3, 3, -3, 3 }, scale = 1,
})
