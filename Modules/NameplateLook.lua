-------------------------------------------------------------------------------
--  Nameplate Look -- the nameplate settings that are not on/off toggles:
--  threat color mode, font, font size, outline, width and height. Read by
--  Nameplates.lua and its modules through ns.Get; registered last so the
--  options page lists them under the toggles.
-------------------------------------------------------------------------------
local _, ns = ...
local Relayout = ns.NP.ApplyRelayout

ns.RegisterFeature({
    key = "nameplateThreat", label = "Threat Colors", section = "Nameplates", type = "dropdown", default = "auto",
    apply = Relayout,
    tooltip = "Colors health bars by threat while you are in a group.\nTank: green = you hold it, yellow = losing it, red = someone else has it.\nDamage/Healer: orange = you have aggro, yellow = about to pull it.\nAuto picks Tank when your group role is tank.",
    options = function()
        return {
            { value = "auto", label = "Auto (group role)" },
            { value = "tank", label = "Tank" },
            { value = "dps",  label = "Damage / Healer" },
            { value = "off",  label = "Off" },
        }
    end,
})
ns.RegisterFeature({
    key = "nameplateFont", label = "Font", section = "Nameplates", type = "dropdown", default = "default",
    preview = true, apply = Relayout,
    options = ns.FontOptions,
})
ns.RegisterFeature({
    key = "nameplateFontSize", label = "Font Size", section = "Nameplates", type = "slider",
    min = 7, max = 16, step = 1, default = 10, apply = Relayout,
})
ns.RegisterFeature({
    key = "nameplateOutline", label = "Outline", section = "Nameplates", type = "outline", default = "OUTLINE",
    apply = Relayout,
})
ns.RegisterFeature({
    key = "nameplateWidth", label = "Width", section = "Nameplates", type = "slider",
    min = 60, max = 220, step = 2, default = 130, apply = Relayout,
})
ns.RegisterFeature({
    key = "nameplateHeight", label = "Health Bar Height", section = "Nameplates", type = "slider",
    min = 4, max = 24, step = 1, default = 12, apply = Relayout,
})
