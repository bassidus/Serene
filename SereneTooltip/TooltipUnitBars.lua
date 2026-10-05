-------------------------------------------------------------------------------
--  Tooltip on Unit Frame Bars -- Blizzard's health and mana bars take mouse
--  motion (for their hover text), so moving onto them leaves the unit frame
--  and its tooltip fades. The bars show the frame's unit tooltip instead;
--  their own OnLeave already hides it. Nothing is written to Blizzard's
--  frames; the (secure) unit frame's unit is only read.
-------------------------------------------------------------------------------
local frameOf = {}  -- bar -> its unit frame

local function OnEnter(bar)
    local frame = frameOf[bar]
    local unit = frame and frame.unit
    if not unit or not UnitExists(unit) then return end
    GameTooltip_SetDefaultAnchor(GameTooltip, frame)
    GameTooltip:SetUnit(unit, frame.hideStatusOnTooltip)
end

local function Hook(frame)
    if not frame then return end
    for _, bar in ipairs({ frame.healthbar, frame.manabar }) do
        if bar and not frameOf[bar] and bar.HookScript then
            frameOf[bar] = frame
            bar:HookScript("OnEnter", OnEnter)
        end
    end
end

Hook(PlayerFrame)
Hook(PetFrame)
Hook(TargetFrame)
Hook(TargetFrameToT)
Hook(FocusFrame)
Hook(FocusFrameToT)
for i = 1, 4 do
    Hook(_G["PartyMemberFrame" .. i])
    Hook(PartyFrame and PartyFrame["MemberFrame" .. i])
end
