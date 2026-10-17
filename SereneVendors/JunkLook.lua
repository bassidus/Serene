-------------------------------------------------------------------------------
--  Junk Look -- registers after Auto sell, so on the options page the two
--  junk settings sit to the right of Auto repair and Auto sell.
-------------------------------------------------------------------------------
local _, ns = ...

ns.RegisterFeature({
    key = "junkSmallCross", label = "Smaller cross", section = "Quality of Life", category = "Vendors & trainers",
    tooltip = "A small cross in the icon's top-right corner.",
    default = false, requires = "junkMarking", beside = true, apply = ns.LayOutMarks,
})
