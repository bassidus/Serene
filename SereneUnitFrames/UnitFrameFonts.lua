-------------------------------------------------------------------------------
--  Unit Frame Fonts -- font, size and outline of the names, the level and
--  the health/mana text on the unit frames, each its own group. Sizes are
--  relative to each text's own size, so smaller party/pet text stays
--  smaller; the size setting's default is the player frame's size.
--  Blizzard's look is captured on first touch and put back exactly once a
--  group is on its defaults again.
-------------------------------------------------------------------------------
local _, ns = ...

local function SizeOf(fs)
    local _, size = fs:GetFont()
    return math.floor(size + 0.5)
end

local GROUPS = {
    { prefix = "unitFrameName",  label = "Name text",        category = "Name",
      base = SizeOf(PlayerName), color = "unitFrameNameColor" },
    { prefix = "unitFrameLevel", label = "Level text",       category = "Level",
      base = SizeOf(PlayerLevelText), color = "unitFrameLevelColor" },
    { prefix = "unitFrameBar",   label = "Health/mana font", category = "Health & mana",
      base = SizeOf(PlayerFrame.healthbar.TextString) },
}
local NAME, LEVEL, BAR = GROUPS[1], GROUPS[2], GROUPS[3]

-- The font strings of a frame, per group; built once, since target of
-- target styles itself every frame.
local strings = {}

local function Strings(frame)
    if strings[frame] then return strings[frame] end
    local p = ns.UnitFrameParts(frame)
    local bars = {}
    for _, bar in ipairs(p.bars) do
        bars[#bars + 1] = bar.TextString
        bars[#bars + 1] = bar.LeftText
        bars[#bars + 1] = bar.RightText
    end
    strings[frame] = { [NAME] = { p.name }, [LEVEL] = { p.levelText }, [BAR] = bars }
    return strings[frame]
end

local orig = setmetatable({}, { __mode = "k" })  -- [font string] = Blizzard's look (ns.FontState)

local function IsDefault(g)
    return ns.Get(g.prefix .. "Font") == "default" and ns.Get(g.prefix .. "FontSize") == g.base
        and ns.Get(g.prefix .. "Outline") == "default"
end

local function StyleString(fs, g)
    if IsDefault(g) then
        -- Blizzard's again; captured anew on the next change.
        if orig[fs] then ns.RestoreFont(fs, orig[fs]) end
        orig[fs] = nil
        return
    end
    orig[fs] = orig[fs] or ns.FontState(fs)
    local o = orig[fs]
    ns.ApplyFont(fs, o, ns.Get(g.prefix .. "Font"), o.size + ns.Get(g.prefix .. "FontSize") - g.base,
        ns.Get(g.prefix .. "Outline"))
end

local function Style(frame)
    for g, list in pairs(Strings(frame)) do
        for _, fs in pairs(list) do
            -- Untouched strings on their defaults need nothing.
            if orig[fs] or not IsDefault(g) then StyleString(fs, g) end
        end
    end
end

local function Apply()
    for _, frame in ipairs(ns.UnitFrames()) do Style(frame) end
end

hooksecurefunc("UnitFrame_Update", function(frame)
    if ns.IsUnitFrame(frame) then Style(frame) end
end)

for _, g in ipairs(GROUPS) do
    ns.RegisterFontSettings({
        prefix = g.prefix, label = g.label, section = "Unit frames", category = g.category, apply = Apply,
        size = { 6, 24, g.base }, outline = "default", color = g.color, button = "Font",
        blizzard = function()
            local fs = Strings(PlayerFrame)[g][1]
            local o = orig[fs] or ns.FontState(fs)
            return ns.OutlineOf(o.flags, o.sx, o.sy)
        end,
    })
end
