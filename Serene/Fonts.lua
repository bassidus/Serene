-------------------------------------------------------------------------------
--  Fonts -- the typeface list and outline flags every font setting shares,
--  and a safe way to put them on a font string.
-------------------------------------------------------------------------------
local _, ns = ...

local BUILTIN = {
    { value = "Fonts\\FRIZQT__.TTF", label = "Friz Quadrata" },
    { value = "Fonts\\ARIALN.TTF",   label = "Arial Narrow" },
    { value = "Fonts\\skurri.ttf",   label = "Skurri" },
    { value = "Fonts\\MORPHEUS.ttf", label = "Morpheus" },
}

-- "Blizzard default", Blizzard's fonts, then LibSharedMedia's. Each font is
-- listed once, matched by path, file name and name. Built once per opening
-- of the options window (ns.ForgetFontOptions): every change there refreshes
-- every font field, and each of them reads this list.
local fontList

function ns.ForgetFontOptions() fontList = nil end

local function FontOptions()
    if fontList then return fontList end
    local list = { { value = "default", label = "Blizzard default" } }
    local seen = {}
    local function Key(path) return path:lower():match("([^\\/]+)$") end
    for _, o in ipairs(BUILTIN) do
        list[#list + 1] = o
        seen[o.value:lower()], seen[Key(o.value)], seen[o.label:lower()] = true, true, true
    end
    local LSM = LibStub("LibSharedMedia-3.0", true)
    if LSM then
        local extra = {}
        for name, path in pairs(LSM:HashTable("font")) do
            if not (seen[path:lower()] or seen[Key(path)] or seen[name:lower()]) then
                seen[path:lower()], seen[Key(path)], seen[name:lower()] = true, true, true
                extra[#extra + 1] = { value = path, label = name }
            end
        end
        table.sort(extra, function(a, b) return a.label < b.label end)
        for _, o in ipairs(extra) do list[#list + 1] = o end
    end
    fontList = list
    return list
end

-- Registers a feature's font, size and outline settings ("<prefix>Font",
-- "<prefix>FontSize", "<prefix>Outline") as one group: the options window
-- shows it as a single row that opens an editor for all three. The typeface
-- starts on "default", Blizzard's.
-- def = { prefix =, label = row name, section =, category =, apply =,
--         size = { min, max, default },
--         outline = default outline value ("default" offers Blizzard's own look),
--         blizzard = see type "outline" in Core.lua,
--         color = key of a color setting for the same text; it is shown in
--         the group's row and editor instead of a row of its own,
--         requires = see Core.lua; the row is dimmed and locked with it,
--         button = text for a plain button in place of the row, e.g. "Font"
--         where the category already names the text; label titles its editor,
--         beside = the row goes right of the previous setting (see Core.lua),
--         space = an empty row above it }
function ns.RegisterFontSettings(def)
    local group = { label = def.label, color = def.color, button = def.button }
    group.font = {
        key = def.prefix .. "Font", label = "Font", section = def.section,
        category = def.category, type = "dropdown",
        default = "default", preview = true, apply = def.apply, options = FontOptions, group = group,
        requires = def.requires, beside = def.beside, space = def.space,
    }
    group.size = {
        key = def.prefix .. "FontSize", label = "Size", section = def.section,
        category = def.category, type = "slider",
        min = def.size[1], max = def.size[2], step = 1, default = def.size[3], apply = def.apply, group = group,
        requires = def.requires,
    }
    group.outline = {
        key = def.prefix .. "Outline", label = "Outline",
        section = def.section, category = def.category, type = "outline",
        default = def.outline, blizzard = def.blizzard, apply = def.apply, group = group,
        requires = def.requires,
    }
    ns.RegisterFeature(group.font)
    ns.RegisterFeature(group.size)
    ns.RegisterFeature(group.outline)
end

-- Sets a font string's (or font object's) font from a setting's value.
-- "default" and a file that fails to load both mean `fallback`
-- (default: STANDARD_TEXT_FONT).
function ns.SetFont(fs, font, size, flags, fallback)
    fallback = fallback or STANDARD_TEXT_FONT
    local path = (font and font ~= "default") and font or fallback
    if fs:SetFont(path, size, flags or "") == false then
        fs:SetFont(fallback, size, flags or "")
    end
end

-------------------------------------------------------------------------------
--  Outline -- a setting holds the chosen flags as "OUTLINE,SHADOW" ("" for
--  none), or "default" for Blizzard's own look where a feature offers that.
--  Thick wins over plain outline when both are ticked.
-------------------------------------------------------------------------------
ns.OUTLINE_FLAGS = {
    { value = "OUTLINE",      label = "Outline" },
    { value = "THICKOUTLINE", label = "Thick" },
    { value = "MONOCHROME",   label = "Monochrome" },
    { value = "SHADOW",       label = "Shadow" },
}

-- Setting value -> set of flags ({ OUTLINE = true, ... }); nil for "default".
function ns.OutlineSet(value)
    if value == "default" then return nil end
    local set = {}
    for word in (value or ""):gmatch("[%a]+") do set[word] = true end
    return set
end

-- Set of flags -> setting value, in a fixed order.
function ns.OutlineValue(set)
    local words = {}
    for _, o in ipairs(ns.OUTLINE_FLAGS) do
        if set[o.value] then words[#words + 1] = o.value end
    end
    return table.concat(words, ",")
end

-- A font's own flags and shadow offset as a set, to show Blizzard's look.
function ns.OutlineOf(flags, shadowX, shadowY)
    flags = (flags or ""):upper()
    local set = {}
    if flags:find("THICKOUTLINE") then
        set.THICKOUTLINE = true
    elseif flags:find("OUTLINE") then
        set.OUTLINE = true
    end
    if flags:find("MONOCHROME") then set.MONOCHROME = true end
    if (shadowX or 0) ~= 0 or (shadowY or 0) ~= 0 then set.SHADOW = true end
    return set
end

-- Setting value -> SetFont flags string and whether to draw a shadow.
function ns.FontFlags(value)
    local set = ns.OutlineSet(value) or {}
    local flags = set.THICKOUTLINE and "THICKOUTLINE" or set.OUTLINE and "OUTLINE" or ""
    if set.MONOCHROME then flags = flags == "" and "MONOCHROME" or (flags .. ", MONOCHROME") end
    return flags, set.SHADOW and true or false
end

function ns.SetShadow(fs, on)
    if on then
        fs:SetShadowColor(0, 0, 0, 1)
        fs:SetShadowOffset(1, -1)
    else
        fs:SetShadowOffset(0, 0)
    end
end

-- A text's own look, to put back later: { path, size, flags, shadow, sx, sy }.
function ns.FontState(fs)
    local o = { shadow = { fs:GetShadowColor() } }
    o.path, o.size, o.flags = fs:GetFont()
    o.sx, o.sy = fs:GetShadowOffset()
    return o
end

local function RestoreShadow(fs, o)
    fs:SetShadowColor(unpack(o.shadow))
    fs:SetShadowOffset(o.sx, o.sy)
end

function ns.RestoreFont(fs, o)
    fs:SetFont(o.path, o.size, o.flags)
    RestoreShadow(fs, o)
end

-- Font settings on a text whose own look is o (ns.FontState): an outline of
-- "default" keeps its flags and shadow.
function ns.ApplyFont(fs, o, font, size, outline)
    if outline == "default" then
        ns.SetFont(fs, font, size, o.flags, o.path)
        RestoreShadow(fs, o)
    else
        local flags, shadow = ns.FontFlags(outline)
        ns.SetFont(fs, font, size, flags, o.path)
        ns.SetShadow(fs, shadow)
    end
end
