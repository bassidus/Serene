-------------------------------------------------------------------------------
--  Data -- what the Performance page and the overlay both show: framerate
--  and latency history, and every loaded addon's CPU and memory.
-------------------------------------------------------------------------------
local _, ns = ...

-------------------------------------------------------------------------------
--  Framerate and latency history -- sampled once a second in the background
--  (whether the page is open or not), kept for the last WINDOW seconds.
--  Paused over loading screens, so their dips do not count.
-------------------------------------------------------------------------------
local WINDOW = 300
ns.WINDOW = WINDOW

local history = { time = {}, fps = {}, latency = {} }
local slot = 0
local paused = true  -- until the first loading screen is over

-- World latency only: home (realm, chat) shares its connection on this
-- client and reads the same. nil at login, before the client has measured it.
function ns.Latency()
    local _, _, _, world = GetNetStats()
    return world
end

C_Timer.NewTicker(1, function()
    if paused then return end
    slot = slot % WINDOW + 1
    history.time[slot] = GetTime()
    history.fps[slot] = GetFramerate()
    history.latency[slot] = ns.Latency()
end)

local loading = CreateFrame("Frame")
loading:RegisterEvent("PLAYER_LEAVING_WORLD")
loading:RegisterEvent("PLAYER_ENTERING_WORLD")
loading:SetScript("OnEvent", function(_, event)
    paused = event == "PLAYER_LEAVING_WORLD"
end)

-- Average of one series ("fps" or "latency") over the window; nil without samples.
function ns.Average(key)
    local now, values = GetTime(), history[key]
    local n, sum = 0, 0
    for i, t in pairs(history.time) do
        if now - t <= WINDOW and values[i] then
            n, sum = n + 1, sum + values[i]
        end
    end
    if n == 0 then return nil end
    return sum / n
end

-------------------------------------------------------------------------------
--  Addons
-------------------------------------------------------------------------------
local Profiler = C_AddOnProfiler
local Metric = Enum.AddOnProfilerMetric

-- Share of the client's frame time, in percent; nil before the client has
-- measured any.
function ns.Percent(value, metric)
    local app = Profiler.GetApplicationMetric(metric)
    if value and app > 0 then return value / app * 100 end
end

-- All addons' share of the frame time; nil while the profiler is off.
function ns.TotalCpu()
    if not Profiler.IsEnabled() then return nil end
    local avg = Metric.RecentAverageTime
    return ns.Percent(Profiler.GetOverallMetric(avg), avg)
end

function ns.FormatMs(ms)
    return ms and string.format("%.3f ms", ms) or "-"
end

function ns.FormatPercent(p)
    if not p then return "-" end
    if p <= 0 then return "0%" end
    -- Would round to 0.00%, which reads like the 0% of an addon that did nothing.
    if p < 0.005 then return "<0.01%" end
    if p >= 10 then return string.format("%.0f%%", p) end
    if p >= 1 then return string.format("%.1f%%", p) end
    return string.format("%.2f%%", p)
end

-- Same units as Blizzard's tooltip (1000 KB to the MB).
function ns.FormatMemory(kb)
    if kb >= 1000 then return string.format("%.2f MB", kb / 1000) end
    return string.format("%.0f KB", kb)
end

local Metadata = C_AddOns.GetAddOnMetadata

-- Title (with version), notes and icon per addon; these never change.
local infoCache = {}
local function Info(i)
    local name, title, notes = C_AddOns.GetAddOnInfo(i)
    local info = infoCache[name]
    if info then return name, info end
    if not title or title == "" then title = name end
    local version = Metadata(name, "Version")
    local icon = Metadata(name, "IconTexture")
    local plain = title:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", "")
    info = {
        title = title,
        plainTitle = plain,
        -- The name column shows titles, so it sorts by them.
        sortName = plain:lower(),
        version = version ~= "" and version or nil,
        notes = notes ~= "" and notes or nil,
        icon = icon and icon ~= "" and ("|T" .. icon .. ":14:14:0:0|t ") or "",
    }
    infoCache[name] = info
    return name, info
end

-- One record per loaded addon, refilled by Collect; the page and the
-- overlay each sort it right before they draw.
local entries = {}
ns.entries = entries
local entryByName = {}  -- reused every tick

function ns.Collect(rescanMemory)
    if rescanMemory then UpdateAddOnMemoryUsage() end
    local cpuOn = Profiler.IsEnabled()
    wipe(entries)
    for i = 1, C_AddOns.GetNumAddOns() do
        if C_AddOns.IsAddOnLoaded(i) then
            local name, info = Info(i)
            local e = entryByName[name]
            if not e then
                e = { name = name, info = info, sortName = info.sortName }
                entryByName[name] = e
            end
            e.mem = GetAddOnMemoryUsage(i)
            if cpuOn then
                e.recentMs = Profiler.GetAddOnMetric(name, Metric.RecentAverageTime)
                e.peakMs = Profiler.GetAddOnMetric(name, Metric.PeakTime)
                e.cpu = ns.Percent(e.recentMs, Metric.RecentAverageTime)
            else
                e.recentMs, e.peakMs, e.cpu = nil, nil, nil
            end
            entries[#entries + 1] = e
        end
    end
end

ns.SORTS = {
    name = function(a, b) return a.sortName < b.sortName end,
    cpu = function(a, b)
        if (a.cpu or -1) ~= (b.cpu or -1) then return (a.cpu or -1) > (b.cpu or -1) end
        return a.sortName < b.sortName
    end,
    mem = function(a, b)
        if a.mem ~= b.mem then return a.mem > b.mem end
        return a.sortName < b.sortName
    end,
}
