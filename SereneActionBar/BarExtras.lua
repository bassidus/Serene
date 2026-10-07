-------------------------------------------------------------------------------
--  Bar Extras -- zoomed button icons (their rough edges cropped).
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

-- Its setting is registered with the keybind ones (Keybinds.lua).
ns.ApplyZoomIcons = ApplyZoom
