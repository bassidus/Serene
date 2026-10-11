-------------------------------------------------------------------------------
--  Tooltip on Unit Frame Bars -- Blizzard's health and mana bars take mouse
--  motion (for their hover text), so moving onto them leaves the unit frame
--  and its tooltip fades. The bars show the frame's unit tooltip instead;
--  their own OnLeave already hides it. Nothing is written to Blizzard's
--  frames; the (secure) unit frame's unit is only read.
--
--  The pet frame's name and the gap between its bars take no mouse, so
--  passing over them leaves the frame and its tooltip blinks or goes. On
--  the pet frame its art decides instead: the tooltip shows while the mouse
--  is on it.
-------------------------------------------------------------------------------
local _, ns = ...

local frameOf = {}  -- bar -> its unit frame

local function OnEnter(bar)
    local frame = frameOf[bar]
    local unit = frame.unit
    if not unit or not UnitExists(unit) then return end
    GameTooltip_SetDefaultAnchor(GameTooltip, frame)
    GameTooltip:SetUnit(unit, frame.hideStatusOnTooltip)
end

for _, frame in ipairs(ns.UnitFrames()) do
    for _, bar in ipairs(ns.UnitFrameParts(frame).bars) do
        frameOf[bar] = frame
        bar:HookScript("OnEnter", OnEnter)
    end
end

local function OnPetArt()
    return ns.HoveredUnitFrame() == PetFrame
end

-- Blizzard's OnLeave has hidden the tooltip; on the art it comes back.
local function OnPetLeave()
    if OnPetArt() then OnEnter(PetFrame.healthbar) end
end
for _, part in ipairs({ PetFrame, PetFrame.healthbar, PetFrame.manabar }) do
    part:HookScript("OnLeave", OnPetLeave)
end

-- Onto the art or off it through a part with no mouse, no OnEnter or
-- OnLeave fires.
ns.OnUnitFrameHover(function(frame, old)
    if frame == PetFrame then
        OnEnter(PetFrame.healthbar)
    elseif old == PetFrame and GameTooltip:GetOwner() == PetFrame then
        GameTooltip:Hide()
    end
end)
