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
    key = "nameplateFadeOthers", label = "Enable", section = "Enemy nameplates", category = "Visibility",
    closed = true, apply = UpdateAll,
})
ns.RegisterFeature({
    key = "nameplateOtherAlpha", label = "Other enemies' opacity", section = "Enemy nameplates",
    category = "Visibility", type = "slider", min = 0, max = 100, step = 5, default = 20, suffix = "%",
    requires = "nameplateFadeOthers", apply = UpdateAll,
    tooltip = "With an enemy targeted, the other enemies' plates fade to this opacity.\n"
        .. "The one under the mouse and any that is casting stay fully visible.",
})
