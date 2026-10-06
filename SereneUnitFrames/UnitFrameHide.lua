-------------------------------------------------------------------------------
--  Hide -- small extras on the unit frames: the damage numbers on the
--  portraits, the red combat and threat glow, the mana bar's flashes and
--  the PvP, leader and group icons. All hidden with alpha (ns.SetHidden),
--  so Blizzard can keep showing and hiding them as it likes.
-------------------------------------------------------------------------------
local _, ns = ...

local SECTION = "Unit frames"
local SetHidden = ns.SetHidden

local playerMain = PlayerFrame.PlayerFrameContent.PlayerFrameContentMain
local playerExtra = PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual
local targetExtra = TargetFrame.TargetFrameContent.TargetFrameContentContextual
local focusExtra = FocusFrame.TargetFrameContent.TargetFrameContentContextual
local manaBar = playerMain.ManaBarArea.ManaBar

-- [setting] = what it hides
local REGIONS = {
    unitFrameHideHits = { playerMain.HitIndicator, PetHitIndicator },
    unitFrameHideThreat = { PlayerFrame.PlayerFrameContainer.FrameFlash, TargetFrame.TargetFrameContainer.Flash,
                            FocusFrame.TargetFrameContainer.Flash, PetFrameFlash, PetAttackModeTexture },
    unitFrameHideManaFlash = { manaBar.FullPowerFrame, manaBar.FeedbackFrame },
    unitFrameHidePvP = { playerExtra.PVPIcon, playerExtra.PrestigePortrait, targetExtra.PvpIcon,
                         targetExtra.PrestigePortrait, focusExtra.PvpIcon, focusExtra.PrestigePortrait },
    unitFrameHideLeader = { playerExtra.LeaderIcon, targetExtra.LeaderIcon, focusExtra.LeaderIcon },
    unitFrameHideGroup = { playerExtra.GroupIndicator },
}

local function Apply(key)
    return function()
        local on = ns.Enabled(key)
        for _, region in ipairs(REGIONS[key]) do SetHidden(region, on) end
    end
end

-- The player frame's red combat glow is the same texture as the yellow one
-- while resting (UnitFrameRest.lua), so it is only hidden outside an inn.
local GLOW = playerMain.StatusTexture

hooksecurefunc("PlayerFrame_UpdateStatus", function()
    if ns.Enabled("unitFrameHideThreat") and not IsResting() then GLOW:Hide() end
end)

local applyThreat = Apply("unitFrameHideThreat")

ns.RegisterFeature({
    key = "unitFrameHideHits", label = "Hide portrait damage numbers", section = SECTION, category = "Hide",
    tooltip = "Clutter on the unit frames",
    default = false, apply = Apply("unitFrameHideHits"),
})
ns.RegisterFeature({
    key = "unitFrameHideThreat", label = "Hide combat & threat glow", section = SECTION, category = "Hide",
    default = false,
    apply = function()
        applyThreat()
        PlayerFrame_UpdateStatus()
    end,
})
ns.RegisterFeature({
    key = "unitFrameHideManaFlash", label = "Hide mana bar flashes", section = SECTION, category = "Hide",
    default = false, apply = Apply("unitFrameHideManaFlash"),
})
ns.RegisterFeature({
    key = "unitFrameHidePvP", label = "Hide PvP icons", section = SECTION, category = "Hide",
    default = false, apply = Apply("unitFrameHidePvP"),
})
ns.RegisterFeature({
    key = "unitFrameHideLeader", label = "Hide leader crown", section = SECTION, category = "Hide",
    default = false, apply = Apply("unitFrameHideLeader"),
})
ns.RegisterFeature({
    key = "unitFrameHideGroup", label = "Hide group number", section = SECTION, category = "Hide",
    default = false, apply = Apply("unitFrameHideGroup"),
})
