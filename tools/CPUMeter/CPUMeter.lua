-------------------------------------------------------------------------------
--  CPU Meter -- a dev tool, not part of Serene's release.
--
--  The game menu's CPU numbers in an overlay that stays up: every loaded
--  addon's recent average as a share of the whole client's frame time,
--  highest first. Drag it to move it; /cpu shows or hides it.
-------------------------------------------------------------------------------
local ADDON = ...

local METRIC = Enum.AddOnProfilerMetric
local INTERVAL = 1  -- seconds between updates

local frame = CreateFrame("Frame", nil, UIParent)
frame:Hide()
frame:SetFrameStrata("HIGH")
frame:SetClampedToScreen(true)
frame:SetMovable(true)
frame:EnableMouse(true)
-- Registered while hidden; on an already shown frame it does nothing.
frame:RegisterForDrag("LeftButton")

local bg = frame:CreateTexture(nil, "BACKGROUND")
bg:SetAllPoints()
bg:SetColorTexture(0, 0, 0, 0.6)

local text = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
text:SetPoint("TOPLEFT", 6, -6)
text:SetJustifyH("LEFT")

local function Percent(part, whole)
    return whole > 0 and part / whole * 100 or 0
end

local rows, lines = {}, {}

local function Update()
    local app = C_AddOnProfiler.GetApplicationMetric(METRIC.RecentAverageTime)
    local appPeak = C_AddOnProfiler.GetApplicationMetric(METRIC.PeakTime)

    wipe(rows)
    for i = 1, C_AddOns.GetNumAddOns() do
        if C_AddOns.IsAddOnLoaded(i) then
            local name = C_AddOns.GetAddOnInfo(i)
            rows[#rows + 1] = {
                name = name,
                value = Percent(C_AddOnProfiler.GetAddOnMetric(name, METRIC.RecentAverageTime), app),
            }
        end
    end
    table.sort(rows, function(a, b)
        if a.value ~= b.value then return a.value > b.value end
        return a.name < b.name
    end)

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

local elapsedSince = 0
frame:SetScript("OnUpdate", function(_, elapsed)
    elapsedSince = elapsedSince + elapsed
    if elapsedSince < INTERVAL then return end
    elapsedSince = 0
    Update()
end)
frame:SetScript("OnShow", Update)

frame:SetScript("OnDragStart", frame.StartMoving)
frame:SetScript("OnDragStop", function(self)
    self:StopMovingOrSizing()
    local point, _, relativePoint, x, y = self:GetPoint()
    CPUMeterDB.point = { point, relativePoint, x, y }
end)

frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function(self, _, name)
    if name ~= ADDON then return end
    self:UnregisterEvent("ADDON_LOADED")
    CPUMeterDB = CPUMeterDB or { shown = true }
    local p = CPUMeterDB.point or { "TOPLEFT", "TOPLEFT", 20, -200 }
    self:SetPoint(p[1], UIParent, p[2], p[3], p[4])
    self:SetShown(CPUMeterDB.shown)
end)

SLASH_CPUMETER1 = "/cpu"
SlashCmdList.CPUMETER = function()
    CPUMeterDB.shown = not frame:IsShown()
    frame:SetShown(CPUMeterDB.shown)
end
