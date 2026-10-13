-------------------------------------------------------------------------------
--  Unit Frame Fonts -- font, size and outline in two groups: the names and
--  levels, and the status numbers. Sizes are relative to each text's own
--  size, so texts of different sizes keep their difference; the size
--  setting's default is the player frame's.
--  Blizzard's look is captured on first touch and put back exactly once a
--  group is on its defaults again.
-------------------------------------------------------------------------------
local _, ns = ...

local function SizeOf(fs)
    local _, size = fs:GetFont()
    return math.floor(size + 0.5)
end

local player = ns.UnitFrameParts(PlayerFrame)
local GROUPS = {
    { prefix = "unitFrame", label = "Name and level", base = SizeOf(player.name) },
    { prefix = "unitFrameNumbers", label = "Status numbers", base = SizeOf(PlayerFrame.healthbar.TextString) },
}
local names, numbers = GROUPS[1], GROUPS[2]
for _, g in ipairs(GROUPS) do
    g.fontKey, g.sizeKey, g.outlineKey = g.prefix .. "Font", g.prefix .. "FontSize", g.prefix .. "Outline"
    g.isDefault = true  -- until Apply reads the settings
end

-- [frame] = { [group] = its font strings }
local strings = {}
for _, frame in ipairs(ns.UnitFrames()) do
    local p = ns.UnitFrameParts(frame)
    local barTexts = {}
    for _, bar in ipairs(p.bars) do
        barTexts[#barTexts + 1] = bar.TextString
        barTexts[#barTexts + 1] = bar.LeftText
        barTexts[#barTexts + 1] = bar.RightText
    end
    strings[frame] = { [names] = { p.name, p.levelText }, [numbers] = barTexts }
end

local orig = {}  -- [font string] = Blizzard's look (ns.FontState)

-- Target of target passes through UnitFrame_Update every frame, so a string
-- is styled again only when its settings changed (gen) or Blizzard put
-- another font on it since.
local gen = 0
local done = {}  -- [font string] = { path, size, flags, gen } as we left it

local function StillStyled(fs)
    local d = done[fs]
    if not d or d.gen ~= gen then return false end
    local path, size, flags = fs:GetFont()
    return path == d[1] and size == d[2] and flags == d[3]
end

local function MarkStyled(fs)
    local d = done[fs] or {}
    d[1], d[2], d[3] = fs:GetFont()
    d.gen = gen
    done[fs] = d
end

-- The group's settings, read into it once per Apply.
local function ReadSettings(g)
    g.font, g.size, g.outline = ns.Get(g.fontKey), ns.Get(g.sizeKey), ns.Get(g.outlineKey)
    g.isDefault = g.font == "default" and g.size == g.base and g.outline == "default"
end

local function StyleString(fs, g)
    if g.isDefault then
        -- Blizzard's again; captured anew on the next change.
        if orig[fs] then ns.RestoreFont(fs, orig[fs]) end
        orig[fs], done[fs] = nil, nil
        return
    end
    if StillStyled(fs) then return end
    orig[fs] = orig[fs] or ns.FontState(fs)
    local o = orig[fs]
    ns.ApplyFont(fs, o, g.font, o.size + g.size - g.base, g.outline)
    MarkStyled(fs)
end

local function Style(frame)
    for g, list in pairs(strings[frame]) do
        for _, fs in pairs(list) do
            -- Untouched strings on their defaults need nothing.
            if orig[fs] or not g.isDefault then StyleString(fs, g) end
        end
    end
end

local function Apply()
    gen = gen + 1
    for _, g in ipairs(GROUPS) do ReadSettings(g) end
    for _, frame in ipairs(ns.UnitFrames()) do Style(frame) end
end

ns.OnUnitFrameUpdate(Style)

-- def: the rest of the group's RegisterFontSettings fields.
local function Register(g, def)
    def.prefix, def.label, def.apply = g.prefix, g.label, Apply
    def.size, def.outline, def.button = { 6, 24, g.base }, "default", "Font"
    def.blizzard = function()
        local fs = strings[PlayerFrame][g][1]
        local o = orig[fs] or ns.FontState(fs)
        return ns.OutlineOf(o.flags, o.sx, o.sy)
    end
    ns.RegisterFontSettings(def)
end

function ns.RegisterNameFont(def) Register(names, def) end
function ns.RegisterNumbersFont(def) Register(numbers, def) end
