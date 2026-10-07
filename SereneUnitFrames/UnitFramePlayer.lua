-------------------------------------------------------------------------------
--  Player Frame -- the resting glow and Zzz, the level, and a blue glow
--  around the frame while stealthed.
-------------------------------------------------------------------------------
local _, ns = ...

local main = PlayerFrame.PlayerFrameContent.PlayerFrameContentMain

-------------------------------------------------------------------------------
--  Resting (inn, city): Blizzard shows the yellow glow and the Zzz again
--  whenever it updates the status, so they are hidden right after; hiding
--  the glow also stops its pulse. The glow is the same texture as the red
--  one in combat, which stays.
-------------------------------------------------------------------------------
local GLOW = main.StatusTexture
local ZZZ = PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.PlayerRestLoop

hooksecurefunc("PlayerFrame_UpdateStatus", function()
    if not IsResting() then return end
    if ns.Get("playerFrameHideRestGlow") then GLOW:Hide() end
    if ns.Get("playerFrameHideRestZzz") then
        ZZZ.PlayerRestLoopAnim:Stop()
        ZZZ:Hide()
    end
end)

-- Turning a setting off lets Blizzard show its own state again.
function ns.ApplyRest() PlayerFrame_UpdateStatus() end

-------------------------------------------------------------------------------
--  Level: the number and its circle
-------------------------------------------------------------------------------
function ns.ApplyHideLevel()
    local on = ns.Get("playerFrameHideLevel")
    ns.SetHidden(PlayerLevelText, on)
    ns.SetHidden(main.LevelBackgroundCircle, on)
end

-------------------------------------------------------------------------------
--  Stealth: Blizzard's vehicle status glow around the portrait frame, tinted
--  blue, on a frame of our own.
-------------------------------------------------------------------------------
local stealth = CreateFrame("Frame", nil, PlayerFrame)
stealth:SetAllPoints()
local border = stealth:CreateTexture(nil, "BACKGROUND")
border:SetAtlas("ui-hud-unitframe-player-portraiton-vehicle-status")
border:SetSize(201, 83.5)
border:SetPoint("CENTER", PlayerFrame, "CENTER", -4, 0)
border:SetVertexColor(0.21, 0.49, 1)
border:Hide()

local function UpdateStealth()
    border:SetShown(ns.Get("playerFrameStealth") and IsStealthed())
end
stealth:SetScript("OnEvent", UpdateStealth)

function ns.ApplyStealth()
    if ns.Get("playerFrameStealth") then
        stealth:RegisterEvent("UPDATE_STEALTH")
    else
        stealth:UnregisterAllEvents()
    end
    UpdateStealth()
end
