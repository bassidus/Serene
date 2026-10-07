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
--  time Dark mode is on.
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
    tex:SetDesaturated(dark or art[tex])
    tex:SetVertexColor(v, v, v)
end

local function Repaint(tex)
    if ns.Get("darkMode") then Paint(tex) end
end

local function Collect(frame, isArt)
    for _, r in ipairs({ frame:GetRegions() }) do
        if r:GetObjectType() == "Texture" and art[r] == nil and isArt(r) then
            art[r] = r:IsDesaturated()
            hooksecurefunc(r, "SetAtlas", Repaint)
        end
    end
    for _, child in ipairs({ frame:GetChildren() }) do Collect(child, isArt) end
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
        for _, fn in ipairs(hooks) do fn() end
    end,
})
