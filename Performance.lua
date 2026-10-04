-------------------------------------------------------------------------------
--  Performance -- an options page with what the Game Menu button's tooltip
--  shows, but listing every loaded addon instead of the top three. Updates
--  once a second while open; memory is rescanned only every few ticks since
--  that walks every addon. Turns the client's addon profiler back on when
--  something has switched it off (CVar addonProfilerEnabled).
-------------------------------------------------------------------------------
local _, ns = ...

local UPDATE_INTERVAL = 1
local MEMORY_EVERY = 5  -- ticks between memory rescans
local ROW_H, HEADER_H = 18, 22
local CPU_W, MEM_W = 70, 80
local STAT_ROW_H = 18

-------------------------------------------------------------------------------
--  Framerate and latency history -- sampled once a second in the background
--  (whether the page is open or not), kept for the last WINDOW seconds.
--  Paused over loading screens and for SETTLE seconds after, so their dips
--  do not count.
-------------------------------------------------------------------------------
local WINDOW = 300
local SETTLE = 5

local history = { time = {}, fps = {}, latency = {} }
local slot = 0
local paused = true  -- until the first loading screen is over
local settle = 0     -- bumped per loading screen, so an older timer cannot unpause

C_Timer.NewTicker(1, function()
    if paused then return end
    -- World latency only: home (realm, chat) shares its connection on
    -- this client and reads the same.
    local _, _, _, world = GetNetStats()
    slot = slot % WINDOW + 1
    history.time[slot] = GetTime()
    history.fps[slot] = GetFramerate() or 0
    history.latency[slot] = world or 0
end)

local loading = CreateFrame("Frame")
loading:RegisterEvent("PLAYER_LEAVING_WORLD")
loading:RegisterEvent("PLAYER_ENTERING_WORLD")
loading:SetScript("OnEvent", function(_, event)
    paused = true
    settle = settle + 1
    if event == "PLAYER_ENTERING_WORLD" then
        local mine = settle
        C_Timer.After(SETTLE, function()
            if settle == mine then paused = false end
        end)
    end
end)

-- Average of one series over the window; nil without samples.
local function Average(key)
    local now, values = GetTime(), history[key]
    local n, sum = 0, 0
    for i, t in pairs(history.time) do
        if now - t <= WINDOW then
            n, sum = n + 1, sum + values[i]
        end
    end
    if n == 0 then return nil end
    return sum / n
end

-------------------------------------------------------------------------------
--  Data
-------------------------------------------------------------------------------
local Profiler = C_AddOnProfiler
local Metric = Enum and Enum.AddOnProfilerMetric

local function ProfilerOn()
    return Profiler and Profiler.GetAddOnMetric and Metric
        and (not Profiler.IsEnabled or Profiler.IsEnabled())
end

local function ProfilerOff()
    return Profiler and Profiler.IsEnabled and not Profiler.IsEnabled()
end

-- Share of the client's frame time, in percent. Without the application
-- metric an average is compared to the current frame time instead; a peak
-- has nothing comparable then and stays nil (shown in ms).
local function Percent(value, metric)
    if not value then return nil end
    local ok, app = false, nil
    if Profiler.GetApplicationMetric then ok, app = pcall(Profiler.GetApplicationMetric, metric) end
    if ok and app and app > 0 then return value / app * 100 end
    if metric == Metric.PeakTime then return nil end
    local fps = GetFramerate()
    if fps and fps > 0 then return value / (1000 / fps) * 100 end
    return nil
end

local function FormatMs(ms)
    return ms and string.format("%.3f ms", ms) or "-"
end

local function FormatPercent(p)
    if not p then return "-" end
    if p <= 0 then return "0%" end
    if p >= 10 then return string.format("%.0f%%", p) end
    if p >= 1 then return string.format("%.1f%%", p) end
    return string.format("%.2f%%", p)
end

-- Same units as Blizzard's tooltip (1000 KB to the MB).
local function FormatMemory(kb)
    if kb >= 1000 then return string.format("%.2f MB", kb / 1000) end
    return string.format("%.0f KB", kb)
end

local NumAddOns = (C_AddOns and C_AddOns.GetNumAddOns) or GetNumAddOns
local AddOnInfo = (C_AddOns and C_AddOns.GetAddOnInfo) or GetAddOnInfo
local IsLoaded = (C_AddOns and C_AddOns.IsAddOnLoaded) or IsAddOnLoaded

local Metadata = (C_AddOns and C_AddOns.GetAddOnMetadata) or GetAddOnMetadata

-- Title (with version), notes and icon per addon; these never change.
local infoCache = {}
local function Info(i)
    local name, title, notes = AddOnInfo(i)
    local info = infoCache[name]
    if info then return name, info end
    if not title or title == "" then title = name end
    local version = Metadata(name, "Version")
    local icon = Metadata(name, "IconTexture")
    info = {
        title = title,
        -- The name column shows titles, so it sorts by them (without color codes).
        sortName = title:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", ""):lower(),
        version = version ~= "" and version or nil,
        notes = notes ~= "" and notes or nil,
        icon = icon and icon ~= "" and ("|T" .. icon .. ":14:14:0:0|t ") or "",
    }
    infoCache[name] = info
    return name, info
end

local function AddOnMetric(name, metric)
    local ok, v = pcall(Profiler.GetAddOnMetric, name, metric)
    return ok and v or nil
end

local entries = {}
local entryByName = {}  -- one row record per addon, reused every tick

local function Collect(rescanMemory)
    if rescanMemory and UpdateAddOnMemoryUsage then UpdateAddOnMemoryUsage() end
    local cpuOn = ProfilerOn()
    wipe(entries)
    for i = 1, NumAddOns() do
        if IsLoaded(i) then
            local name, info = Info(i)
            local e = entryByName[name]
            if not e then
                e = { name = name, info = info, sortName = info.sortName }
                entryByName[name] = e
            end
            e.mem = GetAddOnMemoryUsage and GetAddOnMemoryUsage(i) or 0
            if cpuOn then
                e.recentMs = AddOnMetric(name, Metric.RecentAverageTime)
                e.peakMs = AddOnMetric(name, Metric.PeakTime)
                e.cpu = Percent(e.recentMs, Metric.RecentAverageTime)
            else
                e.recentMs, e.peakMs, e.cpu = nil, nil, nil
            end
            entries[#entries + 1] = e
        end
    end
end

local SORTS = {
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

local function SortKey()
    return SORTS[SereneDB.perfSort] and SereneDB.perfSort or "mem"
end

-------------------------------------------------------------------------------
--  Page
-------------------------------------------------------------------------------
local function Build(page)
    local W = ns.Widgets

    -- Summary: two columns of label / value.
    local STATS = {
        { "fps",     "Average Framerate" }, { "cpuAvg",  "Average CPU" },
        { "latency", "Average Latency" },   { "cpuPeak", "Peak CPU" },
        { "memory",  "AddOn Memory" },
    }
    local values, holders = {}, {}
    for i, s in ipairs(STATS) do
        local col, row = (i - 1) % 2, math.floor((i - 1) / 2)
        local holder = CreateFrame("Frame", nil, page)
        holder:SetHeight(STAT_ROW_H)
        local y = -36 - row * STAT_ROW_H
        if col == 0 then
            holder:SetPoint("TOPLEFT", page, "TOPLEFT", 0, y)
            holder:SetPoint("TOPRIGHT", page, "TOP", -12, y)
        else
            holder:SetPoint("TOPLEFT", page, "TOP", 12, y)
            holder:SetPoint("TOPRIGHT", page, "TOPRIGHT", 0, y)
        end
        local label = holder:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        label:SetPoint("LEFT")
        label:SetText(s[2])
        label:SetTextColor(W.DIM[1], W.DIM[2], W.DIM[3])
        local value = holder:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        value:SetPoint("RIGHT")
        value:SetJustifyH("RIGHT")
        values[s[1]] = value
        holders[s[1]] = holder
    end

    -- Framerate and latency: averages over the window, explained in a tooltip.
    local AVERAGES = { fps = { "Average Framerate", "%.0f fps" }, latency = { "Average Latency", "%.0f ms" } }
    for key, a in pairs(AVERAGES) do
        local h = holders[key]
        h:EnableMouse(true)
        h:SetScript("OnEnter", function(self)
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:SetText(a[1], 1, 1, 1)
            GameTooltip:AddLine(string.format("Over the last %d minutes. Loading screens and the few seconds after are left out.",
                WINDOW / 60), nil, nil, nil, true)
            GameTooltip:Show()
        end)
        h:SetScript("OnLeave", GameTooltip_Hide)
    end

    -- Shown over the Average CPU value while the client's profiler is off.
    local enable = CreateFrame("Button", nil, values.cpuAvg:GetParent())
    enable:SetAllPoints()
    enable:Hide()
    local enableText = enable:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    enableText:SetPoint("RIGHT")
    enableText:SetText("off - click to enable")
    enableText:SetTextColor(1, 0.45, 0.45)
    enable:SetScript("OnEnter", function(self)
        enableText:SetTextColor(1, 1, 1)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText("Addon profiling is off", 1, 1, 1)
        GameTooltip:AddLine("Some addons turn the client's addon profiler off to save CPU. Click to turn it back on.", nil, nil, nil, true)
        GameTooltip:Show()
    end)
    enable:SetScript("OnLeave", function()
        enableText:SetTextColor(1, 0.45, 0.45)
        GameTooltip_Hide()
    end)
    enable:SetScript("OnClick", function()
        C_CVar.SetCVar("addonProfilerEnabled", "1")
        if ProfilerOff() then
            ns.Print("Addon profiling is still off. Another addon may be switching it off.")
        end
        GameTooltip_Hide()
    end)
    local statsBottom = -36 - math.ceil(#STATS / 2) * STAT_ROW_H - 14

    -- Table header, clickable to sort.
    local head = CreateFrame("Frame", nil, page)
    head:SetPoint("TOPLEFT", 0, statsBottom)
    head:SetPoint("TOPRIGHT", 0, statsBottom)
    head:SetHeight(HEADER_H)
    W.Solid(head, "BACKGROUND", W.PANEL):SetAllPoints()
    local headLine = W.Solid(head, "ARTWORK", W.EDGE)
    headLine:SetPoint("BOTTOMLEFT")
    headLine:SetPoint("BOTTOMRIGHT")
    headLine:SetHeight(1)

    local Render
    local headers = {}
    local function HeaderButton(key, text, justify, place)
        local b = CreateFrame("Button", nil, head)
        b:SetHeight(HEADER_H)
        place(b)
        local fs = b:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        fs:SetAllPoints()
        fs:SetJustifyH(justify)
        fs:SetText(text)
        b.text = fs
        b:SetScript("OnClick", function()
            SereneDB.perfSort = key
            Render()
        end)
        b:SetScript("OnEnter", function() fs:SetTextColor(1, 1, 1) end)
        b:SetScript("OnLeave", function() Render() end)
        headers[key] = b
    end
    HeaderButton("name", "AddOn", "LEFT", function(b)
        b:SetPoint("LEFT", 6, 0)
        b:SetPoint("RIGHT", -(CPU_W + MEM_W + 16), 0)
    end)
    HeaderButton("cpu", "CPU", "RIGHT", function(b)
        b:SetPoint("RIGHT", -(MEM_W + 16), 0)
        b:SetWidth(CPU_W)
    end)
    HeaderButton("mem", "Memory", "RIGHT", function(b)
        b:SetPoint("RIGHT", -10, 0)
        b:SetWidth(MEM_W)
    end)

    -- Rows: a fixed set of row frames reused for whatever is scrolled into view.
    local list = CreateFrame("Frame", nil, page)
    list:SetPoint("TOPLEFT", head, "BOTTOMLEFT", 0, -2)
    list:SetPoint("BOTTOMRIGHT", page, "BOTTOMRIGHT", 0, 6)
    list:EnableMouseWheel(true)
    local thumb = W.Solid(list, "ARTWORK", W.ACCENT, 0.6)
    thumb:SetWidth(3)

    local rows, offset = {}, 0
    local function Row(i)
        if rows[i] then return rows[i] end
        local r = CreateFrame("Button", nil, list)
        r:SetHeight(ROW_H)
        r:SetPoint("TOPLEFT", 0, -(i - 1) * ROW_H)
        r:SetPoint("TOPRIGHT", 0, -(i - 1) * ROW_H)
        if i % 2 == 0 then W.Solid(r, "BACKGROUND", W.FIELD, 0.6):SetAllPoints() end
        local hl = W.Solid(r, "BORDER", W.ACCENT, 0.12)
        hl:SetAllPoints()
        r:SetHighlightTexture(hl)
        r:SetScript("OnEnter", function(self)
            local e = self.entry
            if not e then return end
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:AddLine(e.info.title)
            GameTooltip:AddLine(e.name .. (e.info.version and ("  |cff808080" .. e.info.version .. "|r") or ""), 1, 1, 1)
            if e.info.notes then GameTooltip:AddLine(e.info.notes, W.DIM[1], W.DIM[2], W.DIM[3], true) end
            GameTooltip:AddLine(" ")
            GameTooltip:AddDoubleLine("Average CPU per frame:", FormatMs(e.recentMs), 1, 0.82, 0, 1, 1, 1)
            GameTooltip:AddDoubleLine("Peak CPU:", FormatMs(e.peakMs), 1, 0.82, 0, 1, 1, 1)
            GameTooltip:AddDoubleLine("Memory:", FormatMemory(e.mem), 1, 0.82, 0, 1, 1, 1)
            GameTooltip:Show()
        end)
        r:SetScript("OnLeave", GameTooltip_Hide)
        r.name = r:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        r.name:SetPoint("LEFT", 6, 0)
        r.name:SetPoint("RIGHT", -(CPU_W + MEM_W + 16), 0)
        r.name:SetJustifyH("LEFT")
        r.name:SetWordWrap(false)
        r.cpu = r:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        r.cpu:SetPoint("RIGHT", -(MEM_W + 16), 0)
        r.cpu:SetWidth(CPU_W)
        r.cpu:SetJustifyH("RIGHT")
        r.mem = r:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        r.mem:SetPoint("RIGHT", -10, 0)
        r.mem:SetWidth(MEM_W)
        r.mem:SetJustifyH("RIGHT")
        rows[i] = r
        return r
    end

    local function VisibleRows()
        return math.max(1, math.floor(list:GetHeight() / ROW_H))
    end

    Render = function()
        local key = SortKey()
        for k, b in pairs(headers) do
            if k == key then
                b.text:SetTextColor(W.ACCENT[1], W.ACCENT[2], W.ACCENT[3])
            else
                b.text:SetTextColor(W.DIM[1], W.DIM[2], W.DIM[3])
            end
        end
        table.sort(entries, SORTS[key])

        local n = VisibleRows()
        offset = math.min(offset, math.max(0, #entries - n))
        local shown = math.min(n, #entries)
        for i = 1, shown do
            local e, r = entries[i + offset], Row(i)
            r.entry = e
            r.name:SetText(e.info.icon .. e.info.title)
            r.cpu:SetText(FormatPercent(e.cpu))
            r.mem:SetText(FormatMemory(e.mem))
            r:Show()
        end
        for i = shown + 1, #rows do rows[i]:Hide() end

        if #entries > n then
            local trackH = n * ROW_H
            local thumbH = math.max(12, trackH * n / #entries)
            thumb:SetHeight(thumbH)
            thumb:ClearAllPoints()
            thumb:SetPoint("TOPRIGHT", -1, -(trackH - thumbH) * offset / (#entries - n))
            thumb:Show()
        else
            thumb:Hide()
        end
    end

    list:SetScript("OnMouseWheel", function(_, delta)
        offset = math.max(0, math.min(#entries - VisibleRows(), offset - delta * 3))
        Render()
    end)

    local function UpdateStats()
        for key, a in pairs(AVERAGES) do
            local avg = Average(key)
            if avg then values[key]:SetFormattedText(a[2], avg) else values[key]:SetText("-") end
        end

        local total = 0
        for _, e in ipairs(entries) do total = total + e.mem end
        values.memory:SetText(FormatMemory(total))

        local off = ProfilerOff()
        enable:SetShown(off)
        values.cpuAvg:SetShown(not off)
        if ProfilerOn() and Profiler.GetOverallMetric then
            local avg = Metric.RecentAverageTime
            values.cpuAvg:SetText(FormatPercent(Percent(Profiler.GetOverallMetric(avg), avg)))
            local peak = Metric.PeakTime
            local peakMs = Profiler.GetOverallMetric(peak)
            local peakPct = Percent(peakMs, peak)
            values.cpuPeak:SetText(peakPct and FormatPercent(peakPct) or FormatMs(peakMs))
        else
            values.cpuAvg:SetText("-")
            values.cpuPeak:SetText("-")
        end
    end

    local ticks, ticker = 0, nil
    local function Update()
        Collect(ticks % MEMORY_EVERY == 0)
        ticks = ticks + 1
        UpdateStats()
        Render()
    end

    page:HookScript("OnShow", function()
        ticks = 0
        Update()
        if not ticker then ticker = C_Timer.NewTicker(UPDATE_INTERVAL, Update) end
    end)
    page:HookScript("OnHide", function()
        if ticker then ticker:Cancel(); ticker = nil end
    end)

    -- Room for the summary, the header and about a dozen rows.
    page.contentHeight = -statsBottom + HEADER_H + 12 * ROW_H
end

ns.RegisterPage("Performance", Build)
