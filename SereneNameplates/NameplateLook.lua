-------------------------------------------------------------------------------
--  Nameplate Look -- the nameplate settings that are not on/off toggles:
--  font, font size, outline, width and height. Read by
--  Nameplates.lua and its modules through ns.Get; registered last so the
--  options page lists them under the toggles.
-------------------------------------------------------------------------------
local _, ns = ...
local Relayout = ns.NP.ApplyRelayout

ns.RegisterFontSettings({
    prefix = "nameplate", label = "Font", section = "Nameplates", category = "Settings", apply = Relayout,
    size = { 7, 16, 10 }, outline = "OUTLINE", button = "Font",
})
ns.RegisterFeature({
    key = "nameplateWidth", label = "Width", section = "Nameplates", category = "Settings", type = "slider",
    min = 60, max = 220, step = 2, default = 130, apply = Relayout,
})
ns.RegisterFeature({
    key = "nameplateHeight", label = "Health bar height", section = "Nameplates", category = "Settings",
    type = "slider", beside = true,
    min = 4, max = 24, step = 1, default = 12, apply = Relayout,
})
