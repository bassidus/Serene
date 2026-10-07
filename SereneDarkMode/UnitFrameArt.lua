-------------------------------------------------------------------------------
--  Unit Frame Art -- the unit frames' border art in Dark mode.
-------------------------------------------------------------------------------
local _, ns = ...

local DARK = 0.3  -- vertex color of the desaturated frame art

local darkened = {}  -- [texture] = Blizzard's desaturation

local function SetDark(tex, on)
    if not tex then return end
    if on then
        if darkened[tex] == nil then darkened[tex] = tex:IsDesaturated() or false end
        tex:SetDesaturated(true)
        tex:SetVertexColor(DARK, DARK, DARK)
    elseif darkened[tex] ~= nil then
        tex:SetDesaturated(darkened[tex])
        tex:SetVertexColor(1, 1, 1)
        darkened[tex] = nil
    end
end

local function Paint(frame)
    local dark = ns.Get("darkMode")
    for _, tex in pairs(ns.UnitFrameParts(frame).art) do SetDark(tex, dark) end
end

-- [frame] = true once painted again on its first UnitFrame_Update after
-- login or a change, which can come after the setting applies; target of
-- target passes through UnitFrame_Update every frame while it shows.
local painted = {}

local function PaintAll()
    wipe(painted)
    for _, frame in ipairs(ns.UnitFrames()) do Paint(frame) end
end

hooksecurefunc("UnitFrame_Update", function(frame)
    if ns.IsUnitFrame(frame) and not painted[frame] then
        painted[frame] = true
        Paint(frame)
    end
end)

-- Target and focus swap their frame art (rare, elite...) after UnitFrame_Update.
hooksecurefunc(TargetFrame, "CheckClassification", Paint)
hooksecurefunc(FocusFrame, "CheckClassification", Paint)

ns.OnDarkMode(PaintAll)
