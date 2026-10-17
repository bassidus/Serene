-------------------------------------------------------------------------------
--  Settings -- the Unit frames page, registered here in its own order, since
--  its categories mix settings from several files.
-------------------------------------------------------------------------------
local _, ns = ...

local SECTION = ns.SECTION

-- All frames
ns.RegisterFeature({
    key = "unitFrameClassColors", label = "Show class colors", section = SECTION, category = "All frames",
    tooltip = "Players' health bars in their class color.",
    apply = ns.ApplyClassColors,
})
ns.RegisterFeature({
    key = "unitFrameSmoothBars", label = "Use smooth bars", section = SECTION, category = "All frames",
    tooltip = "Health and mana glide instead of jumping.",
    beside = true, apply = ns.ApplySmoothBars,
})
ns.RegisterFeature({
    key = "unitFrameHideHits", label = "Hide damage numbers", section = SECTION, category = "All frames",
    tooltip = "No damage numbers on the portraits.",
    default = false, apply = ns.ApplyHideHits,
})
ns.RegisterNameFont({ section = SECTION, category = "All frames", beside = true })

-- Player frame
ns.RegisterFeature({
    key = "playerFrameHideRestGlow", label = "Hide resting glow", section = SECTION, category = "Player frame",
    tooltip = "No yellow glow while resting.",
    apply = ns.ApplyRest,
})
ns.RegisterFeature({
    key = "playerFrameHideLevel", label = "Hide player level", section = SECTION, category = "Player frame",
    tooltip = "No level on your frame.",
    beside = true, default = false, apply = ns.ApplyHideLevel,
})
ns.RegisterFeature({
    key = "playerFrameHideRestZzz", label = "Hide resting Zzz", section = SECTION, category = "Player frame",
    tooltip = "No Zzz while resting.",
    default = false, apply = ns.ApplyRest,
})
ns.RegisterFeature({
    key = "playerFrameStealth", label = "Use blue glow in stealth", section = SECTION, category = "Player frame",
    tooltip = "A blue glow around your frame in stealth.",
    beside = true, default = false, apply = ns.ApplyStealth,
})

-- Pet frame
ns.RegisterFeature({
    key = "petFrameOneBar", label = "Hide power bar", section = SECTION, category = "Pet frame",
    tooltip = "No mana or focus bar; the health bar takes its place.",
    default = false, apply = ns.ApplyPetOneBar,
})
ns.RegisterFeature({
    key = "petFrameHappiness", label = "Happiness icon", section = SECTION, category = "Pet frame",
    tooltip = "How your pet's mood shows on its frame.",
    type = "dropdown", beside = true, default = "paws", apply = ns.ApplyHappiness,
    options = function()
        local list = { { value = "blizzard", label = "Blizzard" } }
        -- Each style's three moods in front of its name.
        for _, o in ipairs({
            { value = "faces",      label = "Faces" },
            { value = "medallions", label = "Medallions" },
            { value = "paws",       label = "Paws" },
            { value = "gems",       label = "Gems" },
            { value = "wolves",     label = "Wolves" },
        }) do
            local icons = ""
            for _, mood in ipairs({ "Unhappy", "Content", "Happy" }) do
                icons = icons .. "|T" .. ns.HappinessIcon(o.value, mood) .. ":16|t"
            end
            list[#list + 1] = { value = o.value, label = icons .. " " .. o.label }
        end
        return list
    end,
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
    { "Player", "the player frame" }, { "Target", "the target frame", true },
    { "Focus", "the focus frame" },   { "Pet", "the pet frame", true },
    { "Party", "the party frames" },
}) do
    ns.RegisterFeature({
        key = "unitFrameNumbersHide" .. unit[1], label = unit[1], section = SECTION, category = "Status numbers",
        tooltip = "No health and mana numbers on " .. unit[2] .. ".",
        sub = HIDE, closed = true, beside = unit[3], apply = ns.ApplyNumbersHide,
    })
end
ns.RegisterFeature({
    key = "unitFrameNumbersHover", label = "Show on mouseover", section = SECTION, category = "Status numbers",
    tooltip = "Hidden numbers show on mouseover.",
    sub = HIDE, space = true, apply = ns.ApplyNumbersHide,
})
