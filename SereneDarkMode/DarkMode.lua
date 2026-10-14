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
--  frame named root that isArt(texture) picks out, darkened to DARK or to
--  what darkness(texture) returns. The search runs the first time Dark mode
--  is on; ns.AddDarkArtNow searches a frame that shows up later right away.
-------------------------------------------------------------------------------
local DARK = 0.4
local art = {}       -- [texture] = Blizzard's desaturation
local darknessOf = {}  -- [texture] = its darkness function, if it has one
local sources = {}   -- { root, isArt, darkness } not searched yet

function ns.AddDarkArt(root, isArt, darkness)
    sources[#sources + 1] = { root, isArt, darkness }
end

local function Paint(tex)
    local dark = ns.Get("darkMode")
    local v = dark and (darknessOf[tex] and darknessOf[tex](tex) or DARK) or 1
    -- Some art is see-through by its vertex color's alpha (a bag slot's
    -- extended rim).
    local _, _, _, a = tex:GetVertexColor()
    tex:SetDesaturated(dark or art[tex])
    tex:SetVertexColor(v, v, v, a)
end

local function Repaint(tex)
    if ns.Get("darkMode") then Paint(tex) end
end

-- fn(region) for every region under frame. The regions and children are
-- passed along as they come, not put in tables: the quest tracker is
-- searched again after every layout.
local EachChild
local function EachOf(fn, ...)
    for i = 1, select("#", ...) do fn((select(i, ...))) end
end
local function EachRegion(frame, fn)
    EachOf(fn, frame:GetRegions())
    EachChild(fn, frame:GetChildren())
end
function EachChild(fn, ...)
    for i = 1, select("#", ...) do EachRegion((select(i, ...)), fn) end
end
ns.EachRegion = EachRegion

-- A texture that isArt(texture) picks out, unless it is in already.
function ns.AddDarkTexture(r, isArt, darkness)
    if r:GetObjectType() ~= "Texture" or art[r] ~= nil or not isArt(r) then return end
    art[r], darknessOf[r] = r:IsDesaturated(), darkness
    -- Blizzard swaps the atlas on some (a bar's empty-slot rims).
    hooksecurefunc(r, "SetAtlas", Repaint)
    Repaint(r)
end

local function Collect(frame, isArt, darkness)
    EachRegion(frame, function(r) ns.AddDarkTexture(r, isArt, darkness) end)
end

ns.AddDarkArtNow = Collect

-------------------------------------------------------------------------------
--  Slots: an empty bag or item slot shows bronze in its icon texture, which
--  turns into the bag's or item's icon once something is put there. Only the
--  empty look is darkened. Blizzard's updates reset the icon's color, so it
--  is painted again whenever Blizzard touches it.
-------------------------------------------------------------------------------
local slots = {}      -- [icon texture] = isEmpty(icon)
local darkSlots = {}  -- [icon texture] = true while darkened
local painting  -- PaintSlot's own color calls also run its hooks

local function PaintSlot(icon)
    if painting then return end
    painting = true
    if ns.Get("darkMode") and slots[icon](icon) then
        darkSlots[icon] = true
        icon:SetDesaturated(true)
        icon:SetVertexColor(DARK, DARK, DARK)
    elseif darkSlots[icon] then
        darkSlots[icon] = nil
        icon:SetDesaturated(false)
        icon:SetVertexColor(1, 1, 1)
    end
    painting = false
end

function ns.AddDarkSlot(icon, isEmpty)
    if slots[icon] then return end
    slots[icon] = isEmpty
    hooksecurefunc(icon, "SetTexture", PaintSlot)
    hooksecurefunc(icon, "SetAtlas", PaintSlot)
    hooksecurefunc(icon, "SetDesaturated", PaintSlot)
    hooksecurefunc(icon, "SetVertexColor", PaintSlot)
    PaintSlot(icon)
end

-- Registered after the core's minimap icon, which is then already made.
ns.RegisterFeature({
    key = "darkMode", label = "Dark mode", default = false,
    apply = function()
        if ns.Get("darkMode") then
            for _, source in ipairs(sources) do Collect(_G[source[1]], source[2], source[3]) end
            wipe(sources)
        end
        for tex in pairs(art) do Paint(tex) end
        for icon in pairs(slots) do PaintSlot(icon) end
        for _, fn in ipairs(hooks) do fn() end
    end,
})
