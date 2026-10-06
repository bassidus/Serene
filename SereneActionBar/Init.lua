local _, ns = ...
setmetatable(ns, { __index = Serene })

-- Blizzard's action buttons: name prefix, binding command prefix, count.
ns.ACTION_BUTTONS = {
    { "ActionButton",              "ACTIONBUTTON",          12 },
    { "MultiBarBottomLeftButton",  "MULTIACTIONBAR1BUTTON", 12 },
    { "MultiBarBottomRightButton", "MULTIACTIONBAR2BUTTON", 12 },
    { "MultiBarRightButton",       "MULTIACTIONBAR3BUTTON", 12 },
    { "MultiBarLeftButton",        "MULTIACTIONBAR4BUTTON", 12 },
    { "MultiBar5Button",           "MULTIACTIONBAR5BUTTON", 12 },
    { "MultiBar6Button",           "MULTIACTIONBAR6BUTTON", 12 },
    { "MultiBar7Button",           "MULTIACTIONBAR7BUTTON", 12 },
    { "StanceButton",              "SHAPESHIFTBUTTON",      10 },
    { "PetActionButton",           "BONUSACTIONBUTTON",     10 },
}
