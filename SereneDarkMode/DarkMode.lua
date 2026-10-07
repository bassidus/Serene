-------------------------------------------------------------------------------
--  Dark Mode -- the checkbox in the options window's footer. Forever's
--  bronze and Blizzard's gold art go dark: desaturated and darkened, so it
--  recedes behind what it frames.
-------------------------------------------------------------------------------
local _, ns = ...

-- A file with its own way of darkening passes its redraw here.
local hooks = {}
function ns.OnDarkMode(fn)
    hooks[#hooks + 1] = fn
end

-------------------------------------------------------------------------------
--  Art that only needs desaturating and darkening: every texture under the
--  frame named root that isArt(texture) picks out. The search runs the first
--  time Dark mode is on; ns.AddDarkArtNow searches a frame that shows up
--  later right away.
-------------------------------------------------------------------------------
local DARK = 0.4
local art = {}       -- [texture] = Blizzard's desaturation
local sources = {}   -- { root, isArt } not searched yet

function ns.AddDarkArt(root, isArt)
    sources[#sources + 1] = { root, isArt }
end

local function Paint(tex)
    local dark = ns.Get("darkMode")
    local v = dark and DARK or 1
    -- Some art is see-through by its vertex color's alpha (a bag slot's
    -- extended rim).
    local _, _, _, a = tex:GetVertexColor()
    tex:SetDesaturated(dark or art[tex])
    tex:SetVertexColor(v, v, v, a)
end

local function Repaint(tex)
    if ns.Get("darkMode") then Paint(tex) end
end

local function Collect(frame, isArt)
    for _, r in ipairs({ frame:GetRegions() }) do
        if r:GetObjectType() == "Texture" and art[r] == nil and isArt(r) then
            art[r] = r:IsDesaturated()
            hooksecurefunc(r, "SetAtlas", Repaint)
            Repaint(r)
        end
    end
    for _, child in ipairs({ frame:GetChildren() }) do Collect(child, isArt) end
end

ns.AddDarkArtNow = Collect

-------------------------------------------------------------------------------
--  Tints: parts Blizzard colors itself (icons by usability or range, a
--  quality border, a background) keep the color they are given, times
--  factor(color) in Dark mode.
--  With isEmpty, the texture is a slot whose empty look is bronze in the
--  icon itself, which turns into the bag's or item's icon once something is
--  put there: while empty it is desaturated and darkened like the art.
--  Blizzard's updates reset the icon's desaturation, so it is painted again
--  whenever Blizzard touches it.
-------------------------------------------------------------------------------
local ICON = 0.7  -- items and spells keep their colors, a little darker

-- Only an icon in its plain color: the colors Blizzard and Range Coloring
-- give it (out of range, out of mana, unusable) stay as they are, or the
-- dimming muddies them.
function ns.DimIcon(c)
    -- A color read back with GetVertexColor need not be exactly 1.
    return (c[1] > 0.99 and c[2] > 0.99 and c[3] > 0.99) and ICON or 1
end

local tints = {}  -- [texture] = { color = Blizzard's { r, g, b, a }, factor =, isEmpty =, emptied = }
local painting  -- Tint's own calls also run its hooks

local function Tint(tex)
    if painting then return end
    painting = true
    local t = tints[tex]
    local dark = ns.Get("darkMode")
    local k = dark and t.factor(t.color) or 1
    if t.isEmpty then
        if dark and t.isEmpty(tex) then
            k = DARK
            t.emptied = true
            tex:SetDesaturated(true)
        elseif t.emptied then
            t.emptied = nil
            tex:SetDesaturated(false)
        end
    end
    local c = t.color
    tex:SetVertexColor(c[1] * k, c[2] * k, c[3] * k, c[4])
    painting = false
end

function ns.AddDarkTint(tex, factor, isEmpty)
    if tints[tex] then return end
    tints[tex] = { color = { tex:GetVertexColor() }, factor = factor, isEmpty = isEmpty }
    hooksecurefunc(tex, "SetVertexColor", function(self, r, g, b, a)
        if painting then return end
        tints[self].color = { r, g, b, a or 1 }
        Tint(self)
    end)
    if isEmpty then
        hooksecurefunc(tex, "SetTexture", Tint)
        hooksecurefunc(tex, "SetAtlas", Tint)
        hooksecurefunc(tex, "SetDesaturated", Tint)
    end
    Tint(tex)
end

-------------------------------------------------------------------------------
--  Texts: a stack's count keeps the color Blizzard gives it, a little
--  darker.
-------------------------------------------------------------------------------
local TEXT = 0.8

local texts = {}  -- [font string] = Blizzard's { r, g, b, a }

local function PaintText(fs)
    local c = texts[fs]
    local k = ns.Get("darkMode") and TEXT or 1
    painting = true
    fs:SetTextColor(c[1] * k, c[2] * k, c[3] * k, c[4])
    painting = false
end

function ns.AddDarkText(fs)
    if texts[fs] then return end
    texts[fs] = { fs:GetTextColor() }
    hooksecurefunc(fs, "SetTextColor", function(self, r, g, b, a)
        if painting then return end
        texts[self] = { r, g, b, a or 1 }
        PaintText(self)
    end)
    PaintText(fs)
end

-- Registered after the core's minimap icon, which is then already made.
ns.RegisterFeature({
    key = "darkMode", label = "Dark mode",
    apply = function()
        if ns.Get("darkMode") then
            for _, source in ipairs(sources) do Collect(_G[source[1]], source[2]) end
            wipe(sources)
        end
        for tex in pairs(art) do Paint(tex) end
        for tex in pairs(tints) do Tint(tex) end
        for fs in pairs(texts) do PaintText(fs) end
        for _, fn in ipairs(hooks) do fn() end
    end,
})
