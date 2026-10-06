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
    key = "nameplateFadeOthers", label = "Enable", section = "Serene Nameplates", category = "Visibility",
    tooltip = "Fades enemies you have not targeted, except casters and the one under the mouse",
    closed = true, apply = UpdateAll,
})
ns.RegisterFeature({
    key = "nameplateOtherAlpha", label = "Other enemies' opacity", section = "Serene Nameplates",
    category = "Visibility", type = "slider", min = 0, max = 100, step = 5, default = 20, suffix = "%",
    requires = "nameplateFadeOthers", apply = UpdateAll,
})
