-------------------------------------------------------------------------------
--  Nameplate Visibility -- which enemy plates stand out. The fading itself is
--  UpdateAlpha in Nameplates.lua; this file holds its setting.
-------------------------------------------------------------------------------
local _, ns = ...
local NP = ns.NP

local function UpdateAll()
    for _, plate in pairs(NP.plates) do NP.UpdateAlpha(plate) end
end

ns.RegisterFeature({
    key = "nameplateFadeOthers", label = "Fade other enemies", section = "Nameplates", category = "Settings",
    tooltip = "Casters and the enemy under the mouse never fade",
    beside = true, apply = UpdateAll,
})
ns.RegisterFeature({
    key = "nameplateOtherAlpha", label = "Other enemies' opacity", section = "Nameplates",
    category = "Settings", type = "slider", space = true, min = 0, max = 100, step = 5, default = 20, suffix = "%",
    requires = "nameplateFadeOthers", apply = UpdateAll,
})
