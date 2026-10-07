-------------------------------------------------------------------------------
--  Unit frames -- the Blizzard unit frames Serene styles and their parts,
--  shared by Unit Frames and Dark mode.
-------------------------------------------------------------------------------
local _, ns = ...

-- Boss and arena frames go through the same Blizzard updates and are left
-- alone.
local FRAMES = {
    PlayerFrame, PetFrame, TargetFrame, TargetFrameToT, FocusFrame, FocusFrameToT,
    PartyFrame.MemberFrame1, PartyFrame.MemberFrame2, PartyFrame.MemberFrame3, PartyFrame.MemberFrame4,
}

local ours = {}
for _, frame in ipairs(FRAMES) do ours[frame] = true end

function ns.UnitFrames() return FRAMES end

function ns.IsUnitFrame(frame) return ours[frame] end

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
