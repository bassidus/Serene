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
for name in pairs(FONT_OBJECTS) do original[name] = ns.FontState(_G[name]) end

local function Apply()
    local font = ns.Get("tooltipFont")
    local size = ns.Get("tooltipFontSize")
    local outline = ns.Get("tooltipOutline")
    for name, delta in pairs(FONT_OBJECTS) do
        local obj, orig = _G[name], original[name]
        if font == "default" and size == BLIZZARD_SIZE and outline == "default" then
            ns.RestoreFont(obj, orig)
        else
            ns.ApplyFont(obj, orig, font, size + delta, outline)
        end
    end
end

ns.RegisterFontSettings({
    prefix = "tooltip", label = "Font", section = "Tooltip", category = "Settings", apply = Apply,
    size = { 8, 20, 10 }, outline = "default", button = "Font",
    blizzard = function()
        local orig = original.GameTooltipText
        return ns.OutlineOf(orig.flags, orig.sx, orig.sy)
    end,
})
