-------------------------------------------------------------------------------
--  Hide -- small extras on the unit frames: the damage numbers on the
--  portraits, the red combat and threat glow, the mana bar's flashes and
--  the PvP, leader and group icons. All hidden with alpha (ns.SetHidden),
--  so Blizzard can keep showing and hiding them as it likes.
-------------------------------------------------------------------------------
local _, ns = ...

local SetHidden = ns.SetHidden

local playerMain = PlayerFrame.PlayerFrameContent.PlayerFrameContentMain
local playerExtra = PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual
local targetExtra = TargetFrame.TargetFrameContent.TargetFrameContentContextual
local focusExtra = FocusFrame.TargetFrameContent.TargetFrameContentContextual
local manaBar = playerMain.ManaBarArea.ManaBar

-- What each page can hide: { setting, regions }, in the page's order.
local LABELS = {
    HideHits = "Hide portrait damage numbers", HideThreat = "Hide combat & threat glow",
    HideManaFlash = "Hide mana bar flashes", HidePvP = "Hide PvP icons",
    HideLeader = "Hide leader crown", HideGroup = "Hide group number",
}
local REGIONS = {
    player = {
        { "HideHits", { playerMain.HitIndicator } },
        { "HideThreat", { PlayerFrame.PlayerFrameContainer.FrameFlash } },
        { "HideManaFlash", { manaBar.FullPowerFrame, manaBar.FeedbackFrame } },
        { "HidePvP", { playerExtra.PVPIcon, playerExtra.PrestigePortrait } },
        { "HideLeader", { playerExtra.LeaderIcon } },
        { "HideGroup", { playerExtra.GroupIndicator } },
    },
    target = {
        { "HideThreat", { TargetFrame.TargetFrameContainer.Flash } },
        { "HidePvP", { targetExtra.PvpIcon, targetExtra.PrestigePortrait } },
        { "HideLeader", { targetExtra.LeaderIcon } },
    },
    focus = {
        { "HideThreat", { FocusFrame.TargetFrameContainer.Flash } },
        { "HidePvP", { focusExtra.PvpIcon, focusExtra.PrestigePortrait } },
        { "HideLeader", { focusExtra.LeaderIcon } },
    },
    pet = {
        { "HideHits", { PetHitIndicator } },
        { "HideThreat", { PetFrameFlash, PetAttackModeTexture } },
    },
}

-- The player frame's red combat glow is the same texture as the yellow one
-- while resting, so UnitFrameRest.lua hides it, outside an inn only.
local PLAYER_THREAT = ns.FramePages("player")[1].key.HideThreat

for _, page in ipairs(ns.FramePages("player", "target", "focus", "pet")) do
    for i, entry in ipairs(REGIONS[page.id]) do
        local name, regions = entry[1], entry[2]
        local key = page.key[name]
        ns.RegisterFeature({
            key = key, label = LABELS[name], section = page.section, view = page.view, category = "Hide",
            tooltip = i == 1 and "Clutter on the frame" or nil,
            default = false,
            apply = function()
                local on = ns.Get(key)
                for _, region in ipairs(regions) do SetHidden(region, on) end
                if key == PLAYER_THREAT then PlayerFrame_UpdateStatus() end
            end,
        })
    end
end
