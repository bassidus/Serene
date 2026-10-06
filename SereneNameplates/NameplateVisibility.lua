-------------------------------------------------------------------------------
--  Nameplate Visibility -- which enemy plates stand out. The fading itself is
--  UpdateAlpha in Nameplates.lua; this file holds its setting.
-------------------------------------------------------------------------------
local _, ns = ...
local NP = ns.NP

ns.RegisterFeature({
    key = "nameplateOtherAlpha", label = "Other enemies' opacity", section = "Enemy nameplates",
    category = "Visibility", type = "slider", min = 20, max = 100, step = 5, default = 50, suffix = "%",
    apply = function()
        for _, plate in pairs(NP.plates) do NP.UpdateAlpha(plate) end
    end,
    tooltip = "With an enemy targeted, the other enemies' plates fade to this opacity.\n"
        .. "The one under the mouse and any that is casting stay fully visible.",
})
