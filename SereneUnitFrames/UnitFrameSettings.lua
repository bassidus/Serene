-------------------------------------------------------------------------------
--  Settings -- the Unit frames page, registered here in its own order, since
--  its categories mix settings from several files.
-------------------------------------------------------------------------------
local _, ns = ...

local SECTION = ns.SECTION

-- All frames
ns.RegisterFeature({
    key = "unitFrameClassColors", label = "Show class colors", section = SECTION, category = "All frames",
    default = true, apply = ns.ApplyClassColors,
})
ns.RegisterFeature({
    key = "unitFrameSmoothBars", label = "Use smooth bars", section = SECTION, category = "All frames",
    beside = true, default = true, apply = ns.ApplySmoothBars,
})
ns.RegisterFeature({
    key = "unitFrameHideHits", label = "Hide damage numbers", section = SECTION, category = "All frames",
    default = false, apply = ns.ApplyHideHits,
})
ns.RegisterNameFont({ section = SECTION, category = "All frames", beside = true })

-- Player frame
ns.RegisterFeature({
    key = "playerFrameHideRestGlow", label = "Hide resting glow", section = SECTION, category = "Player frame",
    apply = ns.ApplyRest,
})
ns.RegisterFeature({
    key = "playerFrameHideLevel", label = "Hide player level", section = SECTION, category = "Player frame",
    beside = true, default = false, apply = ns.ApplyHideLevel,
})
ns.RegisterFeature({
    key = "playerFrameHideRestZzz", label = "Hide resting Zzz", section = SECTION, category = "Player frame",
    default = false, apply = ns.ApplyRest,
})
ns.RegisterFeature({
    key = "playerFrameStealth", label = "Use blue glow in stealth", section = SECTION, category = "Player frame",
    beside = true, default = false, apply = ns.ApplyStealth,
})

-- Status numbers
ns.RegisterFeature({
    key = "unitFrameNumbersFormat", label = "Format", section = SECTION, category = "Status numbers",
    type = "dropdown", default = "both", apply = ns.ApplyNumbersFormat,
    options = function()
        return {
            { value = "current",  label = "Current" },
            { value = "value",    label = "Current / max" },
            { value = "percent",  label = "Percent" },
            { value = "both",     label = "Both" },
        }
    end,
})
ns.RegisterFeature({
    key = "unitFrameNumbersAlign", label = "Alignment", section = SECTION, category = "Status numbers",
    type = "dropdown", beside = true, default = "center", apply = ns.ApplyNumbersAlign,
    options = function()
        return {
            { value = "left",   label = "Left" },
            { value = "center", label = "Center" },
            { value = "right",  label = "Right" },
        }
    end,
})
ns.RegisterNumbersFont({ section = SECTION, category = "Status numbers" })
local HIDE = "Hide numbers on the following units"
for _, unit in ipairs({
    { "Player" }, { "Target", true },
    { "Focus" },  { "Pet", true },
    { "Party" },
}) do
    ns.RegisterFeature({
        key = "unitFrameNumbersHide" .. unit[1], label = unit[1], section = SECTION, category = "Status numbers",
        sub = HIDE, closed = true, beside = unit[2], apply = ns.ApplyNumbersHide,
    })
end
ns.RegisterFeature({
    key = "unitFrameNumbersHover", label = "Show on mouseover", section = SECTION, category = "Status numbers",
    sub = HIDE, space = true, apply = ns.ApplyNumbersHide,
})
