-------------------------------------------------------------------------------
--  Resting -- hides the pulsing yellow glow on the player frame and the
--  Zzz animation while resting (inn, city). The glow is the same texture
--  as the red one in combat, so it follows Hide resting glow while resting
--  and Hide combat & threat glow (UnitFrameHide.lua) otherwise. Blizzard
--  shows both again whenever it updates the status, so they are hidden
--  right after; hiding the glow also stops its pulse.
-------------------------------------------------------------------------------
local _, ns = ...

local PLAYER = ns.FramePages("player")[1]
local KEY = PLAYER.key

local GLOW = PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.StatusTexture
local ZZZ = PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.PlayerRestLoop

hooksecurefunc("PlayerFrame_UpdateStatus", function()
    if not IsResting() then
        if ns.Get(KEY.HideThreat) then GLOW:Hide() end
        return
    end
    if ns.Get(KEY.HideRestGlow) then GLOW:Hide() end
    if ns.Get(KEY.HideRestZzz) then
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
