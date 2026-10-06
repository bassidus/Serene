-------------------------------------------------------------------------------
--  Resting -- hides the pulsing yellow glow on the player frame and the
--  Zzz animation while resting (inn, city). The glow is the same texture
--  as the red one in combat, so it is only hidden while resting. Blizzard
--  shows both again whenever it updates the status, so they are hidden
--  right after; hiding the glow also stops its pulse.
-------------------------------------------------------------------------------
local _, ns = ...

local GLOW = PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.StatusTexture
local ZZZ = PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.PlayerRestLoop

hooksecurefunc("PlayerFrame_UpdateStatus", function()
    if not IsResting() then return end
    if ns.Enabled("unitFrameHideRestGlow") then GLOW:Hide() end
    if ns.Enabled("unitFrameHideRestZzz") then
        ZZZ.PlayerRestLoopAnim:Stop()
        ZZZ:Hide()
    end
end)

-- Turning a setting off lets Blizzard show its own state again.
local function Apply() PlayerFrame_UpdateStatus() end

ns.RegisterFeature({
    key = "unitFrameHideRestGlow", label = "Hide resting glow", section = "Unit frames", category = "Resting",
    tooltip = "Resting effects on your player frame",
    beside = true,  -- to the right of Appearance; loaded before the other categories for that
    apply = Apply,
})
ns.RegisterFeature({
    key = "unitFrameHideRestZzz", label = "Hide resting Zzz", section = "Unit frames", category = "Resting",
    default = false,
    apply = Apply,
})
