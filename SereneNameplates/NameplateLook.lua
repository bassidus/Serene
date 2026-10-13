-------------------------------------------------------------------------------
--  Nameplate Look -- the nameplate settings that go after every module's
--  toggles on the options page: only your own debuffs, size and font. Read
--  by Nameplates.lua and its modules through ns.Get.
-------------------------------------------------------------------------------
local _, ns = ...
local NP = ns.NP
local Relayout = NP.ApplyRelayout

ns.RegisterFeature({
    key = "nameplateDebuffsMine", label = "Show only own debuffs", section = "Nameplates", category = "Settings",
    default = false, requires = "nameplateDebuffs", apply = NP.ApplyDebuffsMine,
})
ns.RegisterFeature({
    key = "nameplateWidth", label = "Plate width", section = "Nameplates", category = "Settings", type = "slider",
    space = true, min = 60, max = 220, step = 2, default = 130, apply = Relayout,
})
ns.RegisterFeature({
    key = "nameplateHeight", label = "Plate height", section = "Nameplates", category = "Settings",
    type = "slider", beside = true,
    min = 4, max = 24, step = 1, default = 12, apply = Relayout,
})
ns.RegisterFontSettings({
    prefix = "nameplate", label = "Font", section = "Nameplates", category = "Settings", apply = Relayout,
    size = { 7, 16, 10 }, outline = "OUTLINE", button = "Font", space = true,
})
