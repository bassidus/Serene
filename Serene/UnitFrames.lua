-------------------------------------------------------------------------------
--  Unit frames -- the Blizzard unit frames Serene styles and their parts,
--  shared by Unit Frames and Dark mode.
-------------------------------------------------------------------------------
local _, ns = ...

local Clean = ns.Clean

-- Boss and arena frames go through the same Blizzard updates and are left
-- alone.
local FRAMES = {
    PlayerFrame, PetFrame, TargetFrame, TargetFrameToT, FocusFrame, FocusFrameToT,
    PartyFrame.MemberFrame1, PartyFrame.MemberFrame2, PartyFrame.MemberFrame3, PartyFrame.MemberFrame4,
}

local ours = {}
for _, frame in ipairs(FRAMES) do ours[frame] = true end

function ns.UnitFrames() return FRAMES end

-- The parts of each frame, looked up once. art: the frame's border art,
-- art[1] the main one.
local parts = {}

function ns.UnitFrameParts(frame)
    local p = parts[frame]
    if p then return p end
    -- UnitFrame_Initialize keeps the name on the frame.
    p = { name = frame.name, art = {}, bars = { frame.healthbar, frame.manabar } }
    if frame == PlayerFrame then
        local box = frame.PlayerFrameContainer
        local main = frame.PlayerFrameContent.PlayerFrameContentMain
        local extra = frame.PlayerFrameContent.PlayerFrameContentContextual
        p.levelText = PlayerLevelText
        p.art = { box.FrameTexture, box.AlternatePowerFrameTexture, box.VehicleFrameTexture,
                  extra.PlayerPortraitCornerIcon, main.LevelBackgroundCircle }
    elseif frame.TargetFrameContainer then  -- target and focus
        local main = frame.TargetFrameContent.TargetFrameContentMain
        p.levelText = main.LevelText
        p.art = { frame.TargetFrameContainer.FrameTexture, main.LevelBackgroundCircle }
    elseif frame == PetFrame then
        p.art = { PetFrameTexture }
    else  -- target of target, party
        p.art = { frame.FrameTexture or frame.Texture, frame.VehicleTexture }
    end
    parts[frame] = p
    return p
end

-- fn(frame) after Blizzard's UnitFrame_Update on one of these frames. Target
-- of target passes through it every frame while it shows.
local updateHandlers = {}
function ns.OnUnitFrameUpdate(fn)
    updateHandlers[#updateHandlers + 1] = fn
end

hooksecurefunc("UnitFrame_Update", function(frame)
    if not ours[frame] then return end
    for _, fn in ipairs(updateHandlers) do fn(frame) end
end)

-- fn(frame, old) when the unit frame under the mouse changes; either can be
-- nil. The frame goes by its art, not the mouse focus: Blizzard's frames
-- take the mouse well outside their art, and parts of the pet frame (its
-- name, the gap between its bars) take none. The pet frame lies inside the
-- player frame's area and comes first.
local BY_ART = {
    PetFrame, PartyFrame.MemberFrame1, PartyFrame.MemberFrame2, PartyFrame.MemberFrame3,
    PartyFrame.MemberFrame4, PlayerFrame, TargetFrame, FocusFrame,
}

local hoverHandlers = {}
local hovered

local function UnderMouse()
    for _, frame in ipairs(BY_ART) do
        if frame:IsVisible() and Clean(ns.UnitFrameParts(frame).art[1]:IsMouseOver()) then return frame end
    end
end

local function NearMouse()
    for _, frame in ipairs(BY_ART) do
        if frame:IsVisible() and Clean(frame:IsMouseOver()) then return true end
    end
end

-- Started by the mouse entering one of the frames or their bars (always on
-- the way to the art) and stopped once it has left them all, so it only
-- runs while the mouse is on a unit frame.
local hoverWatch = CreateFrame("Frame")
hoverWatch:Hide()
local hoverElapsed = 0
hoverWatch:SetScript("OnUpdate", function(self, elapsed)
    hoverElapsed = hoverElapsed + elapsed
    if hoverElapsed < 0.05 then return end
    hoverElapsed = 0
    local frame = UnderMouse()
    if frame ~= hovered then
        local old = hovered
        hovered = frame
        for _, fn in ipairs(hoverHandlers) do fn(frame, old) end
    end
    if not frame and not NearMouse() then self:Hide() end
end)

local function StartHoverWatch()
    hoverElapsed = 0.05  -- the first check right away
    hoverWatch:Show()
end

function ns.OnUnitFrameHover(fn)
    if not hoverHandlers[1] then
        for _, frame in ipairs(BY_ART) do
            frame:HookScript("OnEnter", StartHoverWatch)
            for _, bar in ipairs(ns.UnitFrameParts(frame).bars) do bar:HookScript("OnEnter", StartHoverWatch) end
        end
    end
    hoverHandlers[#hoverHandlers + 1] = fn
end

function ns.HoveredUnitFrame() return hovered end
