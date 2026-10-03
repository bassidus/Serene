-------------------------------------------------------------------------------
--  Fonts -- the typeface list every font setting offers (tooltip, keybinds,
--  nameplates, FPS & latency), the outline flags they share and a safe way
--  to put both on a font string.
-------------------------------------------------------------------------------
local _, ns = ...

local MEDIA = "Interface\\AddOns\\Serene\\Media\\Fonts\\"

-- Blizzard's own, then the fonts shipped in Media\Fonts: Serene's set plus
-- the SharedMedia Additional Fonts collection (licenses in Media\Fonts\Licenses),
-- bundled so no extra addon is needed.
local BUILTIN = {
    { value = "Fonts\\FRIZQT__.TTF", label = "Friz Quadrata" },
    { value = "Fonts\\ARIALN.TTF",   label = "Arial Narrow" },
    { value = "Fonts\\skurri.ttf",   label = "Skurri" },
    { value = "Fonts\\MORPHEUS.ttf", label = "Morpheus" },
    { value = MEDIA .. "Accidental Presidency.ttf",                 label = "Accidental Presidency" },
    { value = MEDIA .. "ActionMan.ttf",                             label = "ACTION MAN" },
    { value = MEDIA .. "ALBAS___.ttf",                              label = "Alba Super" },
    { value = MEDIA .. "AnonymousPro-Regular.ttf",                  label = "Anonymous Pro" },
    { value = MEDIA .. "ArmWrestler.ttf",                           label = "Arm Wrestler" },
    { value = MEDIA .. "AtkinsonHyperlegibleNext-Regular.ttf",      label = "Atkinson Hyperlegible Next" },
    { value = MEDIA .. "AvantGarde_LT_Book_Regular.ttf",            label = "AvantGarde LT Book" },
    { value = MEDIA .. "BAARS___.TTF",                              label = "Baar Sophia" },
    { value = MEDIA .. "BarlowCondensed.ttf",                       label = "Barlow Condensed" },
    { value = MEDIA .. "Bazooka.ttf",                               label = "Bazooka" },
    { value = MEDIA .. "Blazed.ttf",                                label = "Blazed" },
    { value = MEDIA .. "BorisBlackBloxx.ttf",                       label = "Boris Black Bloxx" },
    { value = MEDIA .. "BorisBlackBloxxDirty.ttf",                  label = "Boris Black Bloxx Dirty" },
    { value = MEDIA .. "Cabin-Regular.ttf",                         label = "Cabin" },
    { value = MEDIA .. "CelestiaMediumRedux1.55.ttf",               label = "Celestia Redux" },
    { value = MEDIA .. "centurygothic.ttf",                         label = "Century Gothic" },
    { value = MEDIA .. "COLLEGIA.ttf",                              label = "Collegiate" },
    { value = MEDIA .. "ContinuumMedium.ttf",                       label = "Continuum Medium" },
    { value = MEDIA .. "coolinbi.ttf",                              label = "Cooline, Bold Italic" },
    { value = MEDIA .. "DejaVuSans.ttf",                            label = "DejaVu Sans" },
    { value = MEDIA .. "DejaVuSans-Bold.ttf",                       label = "DejaVu Sans, Bold" },
    { value = MEDIA .. "DieDieDie.ttf",                             label = "DieDieDie" },
    { value = MEDIA .. "DIOGENES.ttf",                              label = "Diogenes" },
    { value = MEDIA .. "Disko.ttf",                                 label = "Disko" },
    { value = MEDIA .. "Expressway.ttf",                            label = "Expressway, Bold" },
    { value = MEDIA .. "expressway rg.otf",                         label = "Expressway, Regular" },
    { value = MEDIA .. "FiraSansMedium.ttf",                        label = "Fira Sans Medium" },
    { value = MEDIA .. "FRAKS___.ttf",                              label = "Frakturika Spamless" },
    { value = MEDIA .. "GothamNarrow.otf",                          label = "Gotham Narrow" },
    { value = MEDIA .. "GothamNarrow-Ultra.ttf",                    label = "Gotham Narrow Ultra" },
    { value = MEDIA .. "Homespun.ttf",                              label = "Homespun TT BRK" },
    { value = MEDIA .. "impact.ttf",                                label = "Impact" },
    { value = MEDIA .. "JetBrainsMono-Regular.ttf",                 label = "JetBrains Mono" },
    { value = MEDIA .. "Lato.ttf",                                  label = "Lato" },
    { value = MEDIA .. "LiberationSans-Regular.ttf",                label = "Liberation Sans" },
    { value = MEDIA .. "LiberationSerif-Regular.ttf",               label = "Liberation Serif" },
    { value = MEDIA .. "MystikOrbs.ttf",                            label = "Mystic Orbs" },
    { value = MEDIA .. "NanumGothic-Regular.ttf",                   label = "NanumGothic" },
    { value = MEDIA .. "Nunito-Regular.ttf",                        label = "Nunito" },
    { value = MEDIA .. "OpenDyslexic3-Regular.ttf",                 label = "OpenDyslexic 3" },
    { value = MEDIA .. "Pokemon Solid.ttf",                         label = "Pokemon Solid" },
    { value = MEDIA .. "Poppins.ttf",                               label = "Poppins" },
    { value = MEDIA .. "Prototype.ttf",                             label = "Prototype" },
    { value = MEDIA .. "PTSansNarrow-Bold.ttf",                     label = "PT Sans Narrow, Bold" },
    { value = MEDIA .. "RobotoCondensedBold.ttf",                   label = "Roboto Condensed Bold" },
    { value = MEDIA .. "Rock Show Whiplash.ttf",                    label = "Rock Show Whiplash" },
    { value = MEDIA .. "SF Diego Sans.ttf",                         label = "SF Diego Sans" },
    { value = MEDIA .. "Solange.ttf",                               label = "Solange" },
    { value = MEDIA .. "starcine.ttf",                              label = "Star Cine" },
    { value = MEDIA .. "trashco.ttf",                               label = "Trashco" },
    { value = MEDIA .. "Ubuntu.ttf",                                label = "Ubuntu" },
    { value = MEDIA .. "Ubuntu-C.ttf",                              label = "Ubuntu Condensed" },
    { value = MEDIA .. "Ubuntu-L.ttf",                              label = "Ubuntu Light" },
    { value = MEDIA .. "Verdana.ttf",                               label = "Verdana" },
    { value = MEDIA .. "waltographUI.ttf",                          label = "Waltograph UI" },
    { value = MEDIA .. "X360.ttf",                                  label = "X360" },
    { value = MEDIA .. "YanoneKaffeesatz-Regular.ttf",              label = "Yanone Kaffeesatz Regular" },
}

-- "Blizzard default" first, the built-ins, then any font other addons
-- registered with LibSharedMedia.
function ns.FontOptions()
    local list = { { value = "default", label = "Blizzard default" } }
    -- A font is listed once, also when another addon registers its own copy
    -- of a bundled file: matched by path, file name and name.
    local seen = {}
    local function Key(path) return path:lower():match("([^\\/]+)$") end
    for _, o in ipairs(BUILTIN) do
        list[#list + 1] = o
        seen[o.value:lower()], seen[Key(o.value)], seen[o.label:lower()] = true, true, true
    end
    local LSM = LibStub and LibStub("LibSharedMedia-3.0", true)
    if LSM then
        local extra = {}
        for name, path in pairs(LSM:HashTable("font")) do
            if type(path) == "string" and not (seen[path:lower()] or seen[Key(path)] or seen[name:lower()]) then
                seen[path:lower()], seen[Key(path)], seen[name:lower()] = true, true, true
                extra[#extra + 1] = { value = path, label = name }
            end
        end
        table.sort(extra, function(a, b) return a.label < b.label end)
        for _, o in ipairs(extra) do list[#list + 1] = o end
    end
    return list
end

-- Sets a font string's (or font object's) font from a setting's value.
-- "default" is Blizzard's standard font; a missing file (e.g. an uninstalled
-- LibSharedMedia font) would blank the text, so it falls back to `fallback`
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
--  Thick wins over plain outline when both are ticked. Values from before
--  the checkboxes ("shadow", "none") read the same as then.
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
    for word in tostring(value or ""):upper():gmatch("[%a]+") do set[word] = true end
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
