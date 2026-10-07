local _, ns = ...
setmetatable(ns, { __index = Serene })

ns.SECTION = "Unit frames"

-- The frames we style. Boss and arena frames go through the same Blizzard
-- updates and are left alone.
local FRAMES = {
    PlayerFrame, PetFrame, TargetFrame, TargetFrameToT, FocusFrame, FocusFrameToT,
    PartyFrame.MemberFrame1, PartyFrame.MemberFrame2, PartyFrame.MemberFrame3, PartyFrame.MemberFrame4,
}

local ours = {}
for _, frame in ipairs(FRAMES) do ours[frame] = true end

function ns.UnitFrames() return FRAMES end

function ns.IsUnitFrame(frame) return ours[frame] end
