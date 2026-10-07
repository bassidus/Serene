-------------------------------------------------------------------------------
--  Bar Extras -- dark bar art instead of Forever's bronze in Dark mode, and
--  zoomed button icons (their rough edges cropped).
-------------------------------------------------------------------------------
local _, ns = ...

-------------------------------------------------------------------------------
--  Zoomed icons: the button's icon texture keeps its crop through texture
--  changes, so it is set once per button.
-------------------------------------------------------------------------------
local CROP = 0.08

-- fn(button) for every action button.
local function EachButton(fn)
    for _, bar in ipairs(ns.ACTION_BUTTONS) do
        for i = 1, bar[3] do fn(_G[bar[1] .. i]) end
    end
end

local function ApplyZoom()
    local c = ns.Get("zoomActionIcons") and CROP or 0
    EachButton(function(btn) btn.icon:SetTexCoord(c, 1 - c, c, 1 - c) end)
end

-------------------------------------------------------------------------------
--  Bar art: Forever's bar art (frame, wyverns, dividers, button rims) is
--  bronze, drawn from these files; desaturated and darkened (Dark mode) it
--  recedes behind the icons.
--  The micro menu's sheet also holds its colored icons, so only the button
--  backgrounds there.
-------------------------------------------------------------------------------
local BRONZE = { [7948326] = true, [8154526] = true, [8119721] = true, [8200846] = "ButtonBG" }

local bronze = {}  -- [texture] = true, every bronze texture found

local DARK = 0.6

local function Paint(tex)
    local dark = ns.Get("darkMode")
    local v = dark and DARK or 1
    tex:SetDesaturated(dark)
    tex:SetVertexColor(v, v, v)
end

local function Repaint(tex)
    if ns.Get("darkMode") then Paint(tex) end
end

local function IsBronze(tex)
    local file = BRONZE[tex:GetTexture()]
    if file == true then return true end
    return file and (tex:GetAtlas() or ""):find(file, 1, true) ~= nil
end

local function Collect(frame)
    for _, r in ipairs({ frame:GetRegions() }) do
        if r:GetObjectType() == "Texture" and not bronze[r] and IsBronze(r) then
            bronze[r] = true
            -- Blizzard swaps the atlas on some (a bar's empty-slot rims).
            hooksecurefunc(r, "SetAtlas", Repaint)
        end
    end
    for _, child in ipairs({ frame:GetChildren() }) do Collect(child) end
end

local function ApplyArt()
    if ns.Get("darkMode") and not next(bronze) then
        for _, frame in ipairs({ MainActionBar, BagsBar, MicroMenuContainer }) do Collect(frame) end
        EachButton(Collect)
    end
    for tex in pairs(bronze) do Paint(tex) end
end

-- Its setting is registered with the keybind ones (Keybinds.lua).
ns.ApplyZoomIcons = ApplyZoom
ns.OnDarkMode(ApplyArt)
