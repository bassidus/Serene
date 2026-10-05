-------------------------------------------------------------------------------
--  Tooltip Font -- changes the shared tooltip font objects (header/body/small)
--  instead of restyling every line on every show. The originals are
--  captured at load and restored exactly when all settings are on default.
-------------------------------------------------------------------------------
local _, ns = ...

local BLIZZARD_SIZE = 12  -- GameTooltipText's own size

-- Font object -> size relative to the body size (Blizzard: 14 / 12 / 10).
local FONT_OBJECTS = {
    GameTooltipHeaderText = 2,
    GameTooltipText       = 0,
    GameTooltipTextSmall  = -2,
}

local original = {}
for name in pairs(FONT_OBJECTS) do
    local obj = _G[name]
    if obj then
        local o = { obj:GetFont() }
        o.shadow = { obj:GetShadowColor() }
        o.sx, o.sy = obj:GetShadowOffset()
        original[name] = o
    end
end

local function RestoreShadow(obj, orig)
    obj:SetShadowColor(orig.shadow[1] or 0, orig.shadow[2] or 0, orig.shadow[3] or 0, orig.shadow[4] or 1)
    obj:SetShadowOffset(orig.sx or 0, orig.sy or 0)
end

local function Apply()
    local font = ns.Get("tooltipFont")
    local size = ns.Get("tooltipFontSize")
    local outline = ns.Get("tooltipOutline")
    for name, delta in pairs(FONT_OBJECTS) do
        local obj, orig = _G[name], original[name]
        if obj and orig then
            if font == "default" and size == BLIZZARD_SIZE and outline == "default" then
                obj:SetFont(orig[1], orig[2], orig[3])
                RestoreShadow(obj, orig)
            else
                local flags, shadow = orig[3], nil
                if outline ~= "default" then flags, shadow = ns.FontFlags(outline) end
                -- "default" and a missing file both mean the original typeface.
                ns.SetFont(obj, font, size + delta, flags, orig[1])
                if outline == "default" then RestoreShadow(obj, orig) else ns.SetShadow(obj, shadow) end
            end
        end
    end
end

ns.RegisterFontSettings({
    prefix = "tooltip", label = "Tooltip Font", section = "Tooltip", category = "Appearance", apply = Apply,
    size = { 8, 20, 10 }, outline = "default",
    blizzard = function()
        local orig = original.GameTooltipText
        return orig and ns.OutlineOf(orig[3], orig.sx, orig.sy) or {}
    end,
})
