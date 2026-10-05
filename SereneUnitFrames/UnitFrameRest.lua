-------------------------------------------------------------------------------
--  Resting -- hides the pulsing yellow glow on the player frame and the
--  Zzz animation while resting (inn, city). The glow is the same texture
--  as the red one in combat, so it is only hidden while resting. Blizzard
--  shows both again whenever it updates the status, so they are hidden
--  right after; hiding the glow also stops its pulse.
-------------------------------------------------------------------------------
local _, ns = ...

local function Parts()
    local content = PlayerFrame and PlayerFrame.PlayerFrameContent
    local main = content and content.PlayerFrameContentMain
    local extra = content and content.PlayerFrameContentContextual
    return main and main.StatusTexture, extra and extra.PlayerRestLoop
end

local function Hide()
    if not IsResting() then return end
    local glow, zzz = Parts()
    if glow and ns.Enabled("unitFrameHideRestGlow") then glow:Hide() end
    if zzz and ns.Enabled("unitFrameHideRestZzz") then
        if zzz.PlayerRestLoopAnim then zzz.PlayerRestLoopAnim:Stop() end
        zzz:Hide()
    end
end

if PlayerFrame_UpdateStatus then hooksecurefunc("PlayerFrame_UpdateStatus", Hide) end

-- Turning a setting off lets Blizzard show its own state again.
local function Apply()
    if PlayerFrame_UpdateStatus then pcall(PlayerFrame_UpdateStatus) else Hide() end
end

ns.RegisterFeature({
    key = "unitFrameHideRestGlow", label = "Hide Resting Glow", section = "Unit Frames", category = "Resting",
    default = false,
    apply = Apply, tooltip = "Stops the player frame from pulsing yellow in inns and cities.",
})
ns.RegisterFeature({
    key = "unitFrameHideRestZzz", label = "Hide Resting Zzz", section = "Unit Frames", category = "Resting",
    default = false,
    apply = Apply, tooltip = "Hides the Zzz animation on the player frame while resting.",
})
