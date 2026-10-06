-------------------------------------------------------------------------------
--  Resting -- hides the pulsing yellow glow on the player frame and the
--  Zzz animation while resting (inn, city). The glow is the same texture
--  as the red one in combat, so it is only hidden while resting. Blizzard
--  shows both again whenever it updates the status, so they are hidden
--  right after; hiding the glow also stops its pulse.
-------------------------------------------------------------------------------
local _, ns = ...

local PLAYER = ns.FramePages("player")[1]
local KEY = PLAYER.key

local GLOW = PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.StatusTexture
local ZZZ = PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.PlayerRestLoop

hooksecurefunc("PlayerFrame_UpdateStatus", function()
    if not IsResting() then return end
    if ns.Enabled(KEY.HideRestGlow) then GLOW:Hide() end
    if ns.Enabled(KEY.HideRestZzz) then
        ZZZ.PlayerRestLoopAnim:Stop()
        ZZZ:Hide()
    end
end)

-- Turning a setting off lets Blizzard show its own state again.
local function Apply() PlayerFrame_UpdateStatus() end

ns.RegisterFeature({
    key = KEY.HideRestGlow, label = "Hide resting glow", section = PLAYER.section, view = PLAYER.view,
    category = "Hide",
    apply = Apply,
})
ns.RegisterFeature({
    key = KEY.HideRestZzz, label = "Hide resting Zzz", section = PLAYER.section, view = PLAYER.view,
    category = "Hide",
    default = false,
    apply = Apply,
})
