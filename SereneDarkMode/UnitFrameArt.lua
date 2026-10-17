-------------------------------------------------------------------------------
--  Unit Frame Art -- the unit frames' border art in Dark mode.
-------------------------------------------------------------------------------
local _, ns = ...

local DARK = 0.3  -- vertex color of the desaturated frame art

local darkened = {}  -- [texture] = Blizzard's desaturation

local function SetDark(tex, on)
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

-- The name's background in the frame art is see-through, so the world shows
-- through it. A black copy of the art under it fills that in; where the art
-- is solid the copy is hidden.
local backings = {}  -- [main frame art] = its black copy

local function Backing(tex)
    local b = backings[tex]
    if not b then
        b = tex:GetParent():CreateTexture(nil, "BACKGROUND", nil, -8)
        b:SetAllPoints(tex)
        backings[tex] = b
    end
    return b
end

local function Paint(frame)
    local dark = ns.Get("darkMode")
    local art = ns.UnitFrameParts(frame).art
    for _, tex in pairs(art) do SetDark(tex, dark) end
    -- Target and focus swap the art's atlas (rare, elite...).
    local b = Backing(art[1])
    b:SetAtlas(art[1]:GetAtlas())
    b:SetVertexColor(0, 0, 0)
    b:SetShown(dark and art[1]:IsShown())
end

-- [frame] = true once painted again on its first UnitFrame_Update after
-- login or a change, which can come after the setting applies; target of
-- target passes through UnitFrame_Update every frame while it shows.
local painted = {}

local function PaintAll()
    wipe(painted)
    for _, frame in ipairs(ns.UnitFrames()) do Paint(frame) end
    -- The gold ring around the pet's happiness icon, while Serene Unit
    -- Frames is loaded.
    if ns.petHappinessRing then SetDark(ns.petHappinessRing, ns.Get("darkMode")) end
end

ns.OnUnitFrameUpdate(function(frame)
    if not painted[frame] then
        painted[frame] = true
        Paint(frame)
    end
end)

-- Target and focus swap their frame art (rare, elite...) after UnitFrame_Update.
hooksecurefunc(TargetFrame, "CheckClassification", Paint)
hooksecurefunc(FocusFrame, "CheckClassification", Paint)

ns.OnDarkMode(PaintAll)
