-------------------------------------------------------------------------------
--  Farther Camera Zoom -- lets the camera zoom out to the farthest distance the
--  client allows (cameraDistanceMaxZoomFactor 2.6, Blizzard's default 1.9).
--  Turning it off puts Blizzard's default back, but only if Serene set the
--  value (SereneDB.cameraZoomSet), so a distance set elsewhere is left alone.
-------------------------------------------------------------------------------
local _, ns = ...

local CVAR = "cameraDistanceMaxZoomFactor"
local MAX = 2.6

local function Apply()
    if ns.Enabled("maxCameraZoom") then
        local current = tonumber(GetCVar(CVAR))
        if not current or math.abs(current - MAX) > 0.01 then SetCVar(CVAR, MAX) end
        SereneDB.cameraZoomSet = true
    elseif SereneDB.cameraZoomSet then
        SetCVar(CVAR, GetCVarDefault(CVAR))
        SereneDB.cameraZoomSet = nil
    end
end

ns.RegisterFeature({
    key = "maxCameraZoom", label = "Farther camera zoom", section = "Quality of life", category = "Camera & cinematics",
    apply = Apply,
    tooltip = "Lets you zoom the camera out farther than Blizzard's default, as far as the game allows.",
})
