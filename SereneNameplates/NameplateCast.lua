-------------------------------------------------------------------------------
--  Nameplate Cast Bar -- purple when interruptible, grey when not, a red
--  "Interrupted" flash when it was.
--
--  Start/end times can be secret, so the bar runs on the unit's duration
--  object (SetTimerDuration); the "not interruptible" flag can be secret too,
--  so the color comes from C_CurveUtil.EvaluateColorValueFromBoolean instead
--  of an if.
-------------------------------------------------------------------------------
local _, ns = ...
local NP = ns.NP

local CAST_COLOR    = { 0.70, 0.40, 0.90 }
local SHIELD_COLOR  = { 0.45, 0.45, 0.45 }
local INTERRUPT_COLOR = { 0.90, 0.15, 0.15 }
local INTERRUPT_HOLD = 0.6

local casting = {}  -- plate -> true while its bar runs (drives the timer text)

-------------------------------------------------------------------------------
--  Frames
-------------------------------------------------------------------------------
local function Create(plate)
    local cast = CreateFrame("StatusBar", nil, plate)
    cast:SetStatusBarTexture(NP.BAR)
    cast:Hide()
    NP.Background(cast)
    NP.Border(cast)

    local text = CreateFrame("Frame", nil, cast)
    text:SetAllPoints()
    text:SetFrameLevel(cast:GetFrameLevel() + 4)
    cast.name = text:CreateFontString(nil, "OVERLAY")
    cast.name:SetPoint("LEFT", 3, 0)
    cast.name:SetJustifyH("LEFT")
    cast.name:SetWordWrap(false)
    cast.timer = text:CreateFontString(nil, "OVERLAY")
    cast.timer:SetPoint("RIGHT", -3, 0)
    cast.timer:SetJustifyH("RIGHT")
    cast.name:SetPoint("RIGHT", cast.timer, "LEFT", -4, 0)

    -- Icon left of the bar, as tall as health + cast together; NP.StackBelow
    -- places the bar and sets the icon's width.
    local iconFrame = CreateFrame("Frame", nil, cast)
    iconFrame:SetPoint("TOPRIGHT", plate.health, "TOPLEFT", -3, 0)
    iconFrame:SetPoint("BOTTOMRIGHT", cast, "BOTTOMLEFT", -3, 0)
    cast.icon = iconFrame:CreateTexture(nil, "ARTWORK")
    cast.icon:SetAllPoints()
    cast.icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
    NP.Border(iconFrame)
    cast.iconFrame = iconFrame

    plate.cast = cast
end

local function Layout(plate)
    local cast = plate.cast
    local h = math.max(6, ns.Get("nameplateHeight") - 2)
    cast:SetHeight(h)
    NP.SetFont(cast.name, -1)
    NP.SetFont(cast.timer, -1)
end

-------------------------------------------------------------------------------
--  Cast state
-------------------------------------------------------------------------------
-- Time left, ten times a second, for every running bar.
local ticker = CreateFrame("Frame")
ticker:Hide()
local elapsedSince = 0
ticker:SetScript("OnUpdate", function(self, elapsed)
    if not next(casting) then self:Hide() return end
    elapsedSince = elapsedSince + elapsed
    if elapsedSince < 0.1 then return end
    elapsedSince = 0
    for plate in pairs(casting) do
        plate.cast.timer:SetFormattedText("%.1f", plate.cast.duration:GetRemainingDuration())
    end
end)

local function CancelHold(cast)
    if cast.holdTimer then
        cast.holdTimer:Cancel()
        cast.holdTimer = nil
    end
end

local function StopCast(plate)
    local cast = plate.cast
    casting[plate] = nil
    if cast.holdTimer then return end  -- the interrupted flash hides it itself
    cast:Hide()
    cast.timer:SetText("")
end

local function ApplyColor(cast, notInterruptible)
    if type(notInterruptible) == "nil" then notInterruptible = false end
    local ev = C_CurveUtil.EvaluateColorValueFromBoolean
    cast:SetStatusBarColor(
        ev(notInterruptible, SHIELD_COLOR[1], CAST_COLOR[1]),
        ev(notInterruptible, SHIELD_COLOR[2], CAST_COLOR[2]),
        ev(notInterruptible, SHIELD_COLOR[3], CAST_COLOR[3]))
end

local function UpdateCast(plate)
    local unit, cast = plate.unit, plate.cast
    if not unit or not ns.Get("nameplateCastBar") then StopCast(plate) return end

    local name, _, texture, _, _, _, _, notInt = UnitCastingInfo(unit)
    local channel = false
    if type(name) == "nil" then
        name, _, texture, _, _, _, notInt = UnitChannelInfo(unit)
        channel = true
    end
    if type(name) == "nil" then StopCast(plate) return end

    CancelHold(cast)
    cast.icon:SetTexture(texture)
    cast.name:SetText(name)
    cast.name:SetTextColor(1, 1, 1)
    ApplyColor(cast, notInt)

    cast.duration = channel and UnitChannelDuration(unit) or UnitCastingDuration(unit)
    if not cast.duration then StopCast(plate) return end
    cast:SetTimerDuration(cast.duration, nil, channel
        and Enum.StatusBarTimerDirection.RemainingTime
        or Enum.StatusBarTimerDirection.ElapsedTime)
    cast:Show()
    casting[plate] = true
    ticker:Show()
end

local function ShowInterrupted(plate)
    local cast = plate.cast
    if not cast:IsShown() then return end
    casting[plate] = nil
    cast:SetStatusBarColor(INTERRUPT_COLOR[1], INTERRUPT_COLOR[2], INTERRUPT_COLOR[3])
    cast:SetMinMaxValues(0, 1)
    cast:SetValue(1)
    cast.name:SetText(INTERRUPTED)
    cast.timer:SetText("")
    CancelHold(cast)
    cast.holdTimer = C_Timer.NewTimer(INTERRUPT_HOLD, function()
        cast.holdTimer = nil
        if not casting[plate] then cast:Hide() end
    end)
end

-------------------------------------------------------------------------------
--  Events, registered on each plate for its own unit while the cast bar is on
-------------------------------------------------------------------------------
local CAST_EVENTS = {
    "UNIT_SPELLCAST_START", "UNIT_SPELLCAST_STOP", "UNIT_SPELLCAST_FAILED",
    "UNIT_SPELLCAST_INTERRUPTED", "UNIT_SPELLCAST_DELAYED",
    "UNIT_SPELLCAST_CHANNEL_START", "UNIT_SPELLCAST_CHANNEL_UPDATE", "UNIT_SPELLCAST_CHANNEL_STOP",
    "UNIT_SPELLCAST_INTERRUPTIBLE", "UNIT_SPELLCAST_NOT_INTERRUPTIBLE",
}
local IS_CAST_EVENT = {}
for _, ev in ipairs(CAST_EVENTS) do IS_CAST_EVENT[ev] = true end

NP.RegisterModule({
    create = Create,
    layout = Layout,
    attach = function(plate, unit)
        if ns.Get("nameplateCastBar") then
            for _, ev in ipairs(CAST_EVENTS) do plate:RegisterUnitEvent(ev, unit) end
        end
        UpdateCast(plate)
    end,
    detach = function(plate)
        CancelHold(plate.cast)
        StopCast(plate)
    end,
    event = function(plate, event)
        if not IS_CAST_EVENT[event] then return end
        if event == "UNIT_SPELLCAST_INTERRUPTED" then
            ShowInterrupted(plate)
        else
            -- Start, stop and updates all re-read the unit: after a stop a new
            -- cast may already be running (chain casts).
            UpdateCast(plate)
        end
    end,
})

ns.RegisterFeature({
    key = "nameplateCastBar", label = "Show target cast bar", section = "Nameplates", category = "Settings",
    apply = function() if NP.layoutGen then NP.RefreshAll() end end,
})
