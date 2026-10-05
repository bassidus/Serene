-------------------------------------------------------------------------------
--  Nameplate Look -- the nameplate settings that are not on/off toggles:
--  threat color mode, font, font size, outline, width and height. Read by
--  Nameplates.lua and its modules through ns.Get; registered last so the
--  options page lists them under the toggles.
-------------------------------------------------------------------------------
local _, ns = ...
local Relayout = ns.NP.ApplyRelayout

ns.RegisterFeature({
    key = "nameplateThreat", label = "Threat colors", section = "Nameplates", category = "Colors",
    type = "dropdown", default = "auto",
    apply = Relayout,
    tooltip = "Colors the health bars of mobs fighting you by threat.\nTank: green = you hold it, yellow = losing it, red = someone else has it, blue = another tank or your pet has it.\nDamage/Healer: red = you have aggro, yellow = about to pull it, green = someone else has it.\nAuto picks Tank in Defensive Stance, Bear Form or with Righteous Fury.",
    options = function()
        return {
            { value = "auto", label = "Auto" },
            { value = "tank", label = "Tank" },
            { value = "dps",  label = "Damage / healer" },
            { value = "off",  label = "Off" },
        }
    end,
})
ns.RegisterFontSettings({
    prefix = "nameplate", label = "Font", section = "Nameplates", category = "Text", apply = Relayout,
    size = { 7, 16, 10 }, outline = "OUTLINE",
})
ns.RegisterFeature({
    key = "nameplateWidth", label = "Width", section = "Nameplates", category = "Size", type = "slider",
    min = 60, max = 220, step = 2, default = 130, apply = Relayout,
})
ns.RegisterFeature({
    key = "nameplateHeight", label = "Health bar height", section = "Nameplates", category = "Size", type = "slider",
    min = 4, max = 24, step = 1, default = 12, apply = Relayout,
})
