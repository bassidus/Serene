-------------------------------------------------------------------------------
--  CPU Meter -- the game menu's CPU numbers in an overlay that stays up:
--  every loaded addon's recent average as a share of the whole client's
--  frame time, highest first. Right-click on the minimap icon or /cpu
--  shows or hides it; drag it to move it. Its spot lives in
--  SereneDB.cpuMeterPoint.
--
--  Nothing exists until it is first shown, so while it is off it costs
--  nothing; once hidden its ticker is cancelled. While it shows, its own
--  updates count towards Serene's number, so they run once per INTERVAL on
--  a ticker rather than an OnUpdate and reuse their tables.
-------------------------------------------------------------------------------
local _, ns = ...

local INTERVAL = 1  -- seconds between updates
local DEFAULT_POINT = { "TOPLEFT", "TOPLEFT", 20, -200 }

local frame

local function Percent(part, whole)
    return whole > 0 and part / whole * 100 or 0
end

local function Place()
    local p = SereneDB.cpuMeterPoint or DEFAULT_POINT
    frame:ClearAllPoints()
    frame:SetPoint(p[1], UIParent, p[2], p[3], p[4])
end

local function Create()
    local METRIC = Enum.AddOnProfilerMetric

    frame = CreateFrame("Frame", nil, UIParent)
    frame:Hide()
    frame:SetFrameStrata("HIGH")
    frame:SetClampedToScreen(true)
    frame:SetMovable(true)
    frame:EnableMouse(true)
    -- Registered while hidden; on an already shown frame it does nothing.
    frame:RegisterForDrag("LeftButton")

    Place()

    local bg = frame:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    bg:SetColorTexture(0, 0, 0, 0.6)

    local text = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    text:SetPoint("TOPLEFT", 6, -6)
    text:SetJustifyH("LEFT")

    local rows, lines = {}, {}
    local function ByValue(a, b)
        if a.value ~= b.value then return a.value > b.value end
        return a.name < b.name
    end

    local function Update()
        local app = C_AddOnProfiler.GetApplicationMetric(METRIC.RecentAverageTime)
        local appPeak = C_AddOnProfiler.GetApplicationMetric(METRIC.PeakTime)

        local n = 0
        for i = 1, C_AddOns.GetNumAddOns() do
            if C_AddOns.IsAddOnLoaded(i) then
                n = n + 1
                local row = rows[n] or {}
                rows[n] = row
                row.name = C_AddOns.GetAddOnInfo(i)
                row.value = Percent(C_AddOnProfiler.GetAddOnMetric(row.name, METRIC.RecentAverageTime), app)
            end
        end
        for i = n + 1, #rows do rows[i] = nil end
        table.sort(rows, ByValue)

        wipe(lines)
        lines[1] = ("Average CPU: %.2f%%"):format(
            Percent(C_AddOnProfiler.GetOverallMetric(METRIC.RecentAverageTime), app))
        lines[2] = ("Peak CPU: %.1f%%"):format(
            Percent(C_AddOnProfiler.GetOverallMetric(METRIC.PeakTime), appPeak))
        lines[3] = " "
        for _, row in ipairs(rows) do
            local color = row.value > 0 and "|cffffffff" or "|cff808080"
            lines[#lines + 1] = ("%s%.2f%%  %s|r"):format(color, row.value, row.name)
        end
        text:SetText(table.concat(lines, "\n"))
        frame:SetSize(text:GetStringWidth() + 12, text:GetStringHeight() + 12)
    end

    local ticker
    frame:SetScript("OnShow", function()
        Update()
        ticker = C_Timer.NewTicker(INTERVAL, Update)
    end)
    frame:SetScript("OnHide", function()
        ticker:Cancel()
        ticker = nil
    end)

    frame:SetScript("OnDragStart", frame.StartMoving)
    frame:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        local point, _, relativePoint, x, y = self:GetPoint()
        SereneDB.cpuMeterPoint = { point, relativePoint, x, y }
    end)
end

local function Apply()
    local shown = ns.Get("cpuMeter")
    if shown and not frame then Create() end
    if frame then frame:SetShown(shown) end
end

function ns.ToggleCPUMeter()
    ns.SetValue("cpuMeter", not ns.Get("cpuMeter"))
end

-- /serene reset: the meter goes back to its default spot.
ns.OnResetAll(function()
    SereneDB.cpuMeterPoint = nil
    if frame then Place() end
end)

ns.RegisterFeature({ key = "cpuMeter", label = "CPU Meter", default = false, apply = Apply })

SLASH_SERENECPU1 = "/cpu"
SlashCmdList.SERENECPU = ns.ToggleCPUMeter
