-------------------------------------------------------------------------------
--  Alert -- a short line of large text above the middle of the screen that
--  fades out on its own. A new alert replaces the one showing.
-------------------------------------------------------------------------------
local _, ns = ...

local HOLD, FADE = 1.5, 0.5

local frame = CreateFrame("Frame", nil, UIParent)
frame:SetSize(1, 1)
frame:SetPoint("CENTER", 0, 180)
frame:SetFrameStrata("HIGH")
frame:Hide()

local text = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalHuge")
text:SetPoint("CENTER")
text:SetShadowOffset(1, -1)

local fade = frame:CreateAnimationGroup()
local alpha = fade:CreateAnimation("Alpha")
alpha:SetFromAlpha(1)
alpha:SetToAlpha(0)
alpha:SetStartDelay(HOLD)
alpha:SetDuration(FADE)
fade:SetScript("OnFinished", function() frame:Hide() end)

function ns.Alert(msg, r, g, b)
    fade:Stop()
    text:SetText(msg)
    text:SetTextColor(r, g, b)
    frame:Show()
    fade:Play()
end
