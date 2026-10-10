-------------------------------------------------------------------------------
--  Bar Extras -- zoomed button icons (their rough edges cropped).
-------------------------------------------------------------------------------
local _, ns = ...

-------------------------------------------------------------------------------
--  Zoomed icons: the button's icon texture keeps its crop through texture
--  changes, so it is set once per button.
-------------------------------------------------------------------------------
local CROP = 0.08

local function ApplyZoom()
    local c = ns.Get("zoomActionIcons") and CROP or 0
    ns.EachActionButton(function(btn) btn.icon:SetTexCoord(c, 1 - c, c, 1 - c) end)
end

-- Its setting is registered with the keybind ones (Keybinds.lua).
ns.ApplyZoomIcons = ApplyZoom
