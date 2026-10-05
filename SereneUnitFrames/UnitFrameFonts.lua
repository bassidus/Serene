-------------------------------------------------------------------------------
--  Unit Frame Fonts -- font, size and outline of the names, the level and
--  the health/mana text on the unit frames, each its own group. Sizes are
--  relative to each text's own size, so smaller party/pet text stays
--  smaller; the size setting's default is the player frame's size.
--  Blizzard's look is captured on first touch and put back exactly once a
--  group is on its defaults again.
-------------------------------------------------------------------------------
local _, ns = ...

local function SizeOf(fs, fallback)
    local _, size = fs and fs:GetFont()
    return size and math.floor(size + 0.5) or fallback
end

local playerBar = PlayerFrame and PlayerFrame.healthbar
local GROUPS = {
    { prefix = "unitFrameName",  label = "Name text",        category = "Name",
      base = SizeOf(PlayerName, 10), color = "unitFrameNameColor" },
    { prefix = "unitFrameLevel", label = "Level text",       category = "Level",
      base = SizeOf(PlayerLevelText, 12), color = "unitFrameLevelColor" },
    { prefix = "unitFrameBar",   label = "Health/mana font", category = "Health & mana",
      base = SizeOf(playerBar and playerBar.TextString, 10) },
}
local NAME, LEVEL, BAR = GROUPS[1], GROUPS[2], GROUPS[3]

-- The font strings of a frame, per group.
local function Strings(frame)
    local p = ns.UnitFrameParts(frame)
    local bars = {}
    for _, bar in ipairs({ frame.healthbar, frame.manabar }) do
        if bar then
            bars[#bars + 1] = bar.TextString
            bars[#bars + 1] = bar.LeftText
            bars[#bars + 1] = bar.RightText
        end
    end
    return { [NAME] = { p.name }, [LEVEL] = { p.levelText }, [BAR] = bars }
end

local orig = setmetatable({}, { __mode = "k" })  -- [font string] = Blizzard's look

local function Original(fs)
    local o = orig[fs]
    if not o then
        local path, size, flags = fs:GetFont()
        o = { path = path, size = size, flags = flags, shadow = { fs:GetShadowColor() } }
        o.sx, o.sy = fs:GetShadowOffset()
        orig[fs] = o
    end
    return o
end

local function IsDefault(g)
    return ns.Get(g.prefix .. "Font") == "default" and ns.Get(g.prefix .. "FontSize") == g.base
        and ns.Get(g.prefix .. "Outline") == "default"
end

local function StyleString(fs, g)
    if IsDefault(g) then
        local o = orig[fs]
        if o and o.path then
            fs:SetFont(o.path, o.size, o.flags or "")
            fs:SetShadowColor(o.shadow[1] or 0, o.shadow[2] or 0, o.shadow[3] or 0, o.shadow[4] or 1)
            fs:SetShadowOffset(o.sx or 0, o.sy or 0)
        end
        orig[fs] = nil  -- Blizzard's again; captured anew on the next change
        return
    end
    local o = Original(fs)
    local outline = ns.Get(g.prefix .. "Outline")
    local flags, shadow = o.flags, nil
    if outline ~= "default" then flags, shadow = ns.FontFlags(outline) end
    ns.SetFont(fs, ns.Get(g.prefix .. "Font"), (o.size or g.base) + ns.Get(g.prefix .. "FontSize") - g.base,
        flags, o.path)
    if outline == "default" then
        fs:SetShadowColor(o.shadow[1] or 0, o.shadow[2] or 0, o.shadow[3] or 0, o.shadow[4] or 1)
        fs:SetShadowOffset(o.sx or 0, o.sy or 0)
    else
        ns.SetShadow(fs, shadow)
    end
end

local function Style(frame)
    if not frame or frame.IsForbidden and frame:IsForbidden() then return end
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

if UnitFrame_Update then
    hooksecurefunc("UnitFrame_Update", function(frame)
        if ns.IsUnitFrame(frame) then Style(frame) end
    end)
end

for _, g in ipairs(GROUPS) do
    ns.RegisterFontSettings({
        prefix = g.prefix, label = g.label, section = "Unit frames", category = g.category, apply = Apply,
        size = { 6, 24, g.base }, outline = "default", color = g.color, button = "Font",
        blizzard = function()
            local fs = Strings(PlayerFrame)[g][1]
            if not fs then return {} end
            local o = orig[fs]
            if o then return ns.OutlineOf(o.flags, o.sx, o.sy) end
            local _, _, flags = fs:GetFont()
            return ns.OutlineOf(flags, fs:GetShadowOffset())
        end,
    })
end
