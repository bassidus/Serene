-------------------------------------------------------------------------------
--  Nameplate Look -- the nameplate settings that are not on/off toggles:
--  font, font size, outline, width and height. Read by
--  Nameplates.lua and its modules through ns.Get; registered last so the
--  options page lists them under the toggles.
-------------------------------------------------------------------------------
local _, ns = ...
local Relayout = ns.NP.ApplyRelayout

ns.RegisterFontSettings({
    prefix = "nameplate", label = "Font", section = "Enemy nameplates", category = "Text", apply = Relayout,
    size = { 7, 16, 10 }, outline = "OUTLINE", button = "Font",
})
ns.RegisterFeature({
    key = "nameplateWidth", label = "Width", section = "Enemy nameplates", category = "Size", type = "slider",
    closed = true,
    min = 60, max = 220, step = 2, default = 130, apply = Relayout,
})
ns.RegisterFeature({
    key = "nameplateHeight", label = "Health bar height", section = "Enemy nameplates", category = "Size", type = "slider",
    min = 4, max = 24, step = 1, default = 12, apply = Relayout,
})
