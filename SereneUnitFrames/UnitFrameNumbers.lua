-------------------------------------------------------------------------------
--  Status Numbers -- the numbers on the health and mana bars: Blizzard's own
--  Status Text CVars, plus Current (the value without the max) and the
--  text's alignment. Targets of targets have no numbers and are left out.
-------------------------------------------------------------------------------
local _, ns = ...

local Clean = ns.Clean

local FORMAT, ALIGN_KEY = "unitFrameNumbersFormat", "unitFrameNumbersAlign"

local FRAMES = {}  -- the frames whose bars show numbers
for _, frame in ipairs(ns.UnitFrames()) do
    if frame.healthbar.TextString then FRAMES[#FRAMES + 1] = frame end
end

-------------------------------------------------------------------------------
--  Format
-------------------------------------------------------------------------------
-- The numbers always show ("statusText" on). Current is Blizzard's
-- "current / max" with the max taken off afterwards (Blizzard's own switch
-- for that is a field on each bar, which we leave alone).
local TEXT_MODES = { current = "NUMERIC", value = "NUMERIC", percent = "PERCENT", both = "BOTH" }

local function SetCurrent(bar, textString, value)
    local text = bar.capNumericDisplay and AbbreviateLargeNumbers(value) or BreakUpLargeNumbers(value)
    if bar.prefix and bar.alwaysPrefix then text = bar.prefix .. " " .. text end
    textString:SetText(text)
end

local function CurrentOnly(bar, textString, value)
    if ns.Get(FORMAT) ~= "current" or GetCVar("statusTextDisplay") ~= "NUMERIC" then return end
    if not textString:IsShown() or bar.isZero or bar.numericDisplayTransformFunc or bar.disableMaxValue then
        return
    end
    -- The value is secret, but formatting it and setting the text takes it
    -- like Blizzard's own "current / max" does; it is never compared.
    SetCurrent(bar, textString, value)
end

local hooked

local function HookBars()
    if hooked then return end
    hooked = true
    for _, frame in ipairs(FRAMES) do
        for _, bar in ipairs(ns.UnitFrameParts(frame).bars) do
            hooksecurefunc(bar, "UpdateTextStringWithValues", CurrentOnly)
        end
    end
end

local lastFormat

function ns.ApplyNumbersFormat()
    HookBars()
    local value = ns.Get(FORMAT)
    local mode = TEXT_MODES[value]
    -- Current and Current / max share a CVar value, so the option itself
    -- counts too (and the first time, so Current takes the max off at login).
    local display = GetCVar("statusTextDisplay")
    local changed = display ~= mode or lastFormat ~= value
    lastFormat = value
    if display ~= mode then SetCVar("statusTextDisplay", mode) end
    -- The bars only redraw their text when "statusText" changes or the value
    -- does, so at full health a new mode would not show until a hit.
    -- Changing "statusText" lets Blizzard's own CVAR_UPDATE handler redraw
    -- them; calling the bars from here can't read their (secret) values.
    if GetCVar("statusText") ~= "1" then
        SetCVar("statusText", "1")
    elseif changed and not InCombatLockdown() then
        SetCVar("statusText", "0")
        SetCVar("statusText", "1")
    end
end

-------------------------------------------------------------------------------
--  Alignment: left and right keep Blizzard's anchor (in the middle of the
--  bar), with the text as wide as the bar and justified to one side.
--  Blizzard's anchors read back as secret values, so they can't be copied
--  or moved.
-------------------------------------------------------------------------------
local JUSTIFY = { left = "LEFT", right = "RIGHT" }
local PAD = 2  -- from the bar's edge, like Blizzard's own left/right text
local aligned = {}  -- [font string] = true while justified to a side

-- Returns false while a bar to align has no width yet.
local function AlignBars(frame)
    local justify = JUSTIFY[ns.Get(ALIGN_KEY)]
    local done = true
    for _, bar in ipairs(ns.UnitFrameParts(frame).bars) do
        local fs = bar.TextString
        local width = fs and Clean(bar:GetWidth())
        if justify and width and width > 2 * PAD then
            fs:SetWidth(width - 2 * PAD)
            fs:SetJustifyH(justify)
            aligned[fs] = true
        else
            if justify and fs then done = false end
            if aligned[fs] then
                fs:SetWidth(0)  -- back to fitting the text, as Blizzard has it
                fs:SetJustifyH("CENTER")
                aligned[fs] = nil
            end
        end
    end
    return done
end

local alignDone = {}  -- [frame] = false until its bars follow the setting
for _, frame in ipairs(FRAMES) do alignDone[frame] = false end

hooksecurefunc("UnitFrame_Update", function(frame)
    if alignDone[frame] == false then alignDone[frame] = AlignBars(frame) end
end)

function ns.ApplyNumbersAlign()
    for _, frame in ipairs(FRAMES) do alignDone[frame] = AlignBars(frame) end
end

-------------------------------------------------------------------------------
--  Always hidden on some units, with alpha, since Blizzard shows the text
--  again on mouseover and on every update.
-------------------------------------------------------------------------------
local HIDE = {  -- [setting] = its frames
    unitFrameNumbersHidePlayer = { PlayerFrame },
    unitFrameNumbersHideTarget = { TargetFrame },
    unitFrameNumbersHideFocus  = { FocusFrame },
    unitFrameNumbersHidePet    = { PetFrame },
    unitFrameNumbersHideParty  = { PartyFrame.MemberFrame1, PartyFrame.MemberFrame2,
                                   PartyFrame.MemberFrame3, PartyFrame.MemberFrame4 },
}

function ns.ApplyNumbersHide()
    for key, frames in pairs(HIDE) do
        local on = ns.Get(key)
        for _, frame in ipairs(frames) do
            for _, bar in ipairs(ns.UnitFrameParts(frame).bars) do
                ns.SetHidden(bar.TextString, on)
                ns.SetHidden(bar.LeftText, on)
                ns.SetHidden(bar.RightText, on)
            end
        end
    end
end
