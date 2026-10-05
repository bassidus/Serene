-------------------------------------------------------------------------------
--  Performance -- an options page with what the Game Menu button's tooltip
--  shows, but listing every loaded addon instead of the top three. Updates
--  once a second while open; memory is rescanned only every few ticks since
--  that walks every addon. Turns the client's addon profiler back on when
--  something has switched it off (CVar addonProfilerEnabled).
--
--  Under the list, "Show overlay" turns on the overlay (Overlay.lua); while
--  it is on, its settings open below and the list gets a pin column.
-------------------------------------------------------------------------------
local _, ns = ...

local UPDATE_INTERVAL = 1
local MEMORY_EVERY = 5  -- ticks between memory rescans
local ROW_H, HEADER_H = 18, 22
local CPU_W, MEM_W = 70, 80
local STAT_ROW_H = 18
local TOP = -10     -- level with the first row of a settings page
local PIN_W = 18    -- the pin column, while the overlay is on
local CHECK_H = 26  -- the Show overlay checkbox
local GAP = 10

local Profiler = C_AddOnProfiler
local Metric = Enum.AddOnProfilerMetric

local function SortKey()
    return ns.SORTS[SereneDB.perfSort] and SereneDB.perfSort or "mem"
end

-- /serene reset: back to sorting by memory; an open page shows it on its next update.
ns.OnResetAll(function() SereneDB.perfSort = nil end)

-------------------------------------------------------------------------------
--  Page
-------------------------------------------------------------------------------
local function Build(content, page)
    local W = ns.Widgets
    local scroll = content:GetParent()
    local entries = ns.entries

    -- Summary: two columns of label / value.
    local STATS = {
        { "fps",     "Average framerate" }, { "cpuAvg",  "Average CPU" },
        { "latency", "Average latency" },   { "cpuPeak", "Peak CPU" },
        { "memory",  "Addon memory" },
    }
    local values, holders = {}, {}
    for i, s in ipairs(STATS) do
        local col, row = (i - 1) % 2, math.floor((i - 1) / 2)
        local holder = CreateFrame("Frame", nil, content)
        holder:SetHeight(STAT_ROW_H)
        local y = TOP - row * STAT_ROW_H
        if col == 0 then
            holder:SetPoint("TOPLEFT", content, "TOPLEFT", 0, y)
            holder:SetPoint("TOPRIGHT", content, "TOP", -12, y)
        else
            holder:SetPoint("TOPLEFT", content, "TOP", 12, y)
            holder:SetPoint("TOPRIGHT", content, "TOPRIGHT", 0, y)
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
    local AVERAGES = { fps = { "Average framerate", "%.0f fps" }, latency = { "Average latency", "%.0f ms" } }
    for key, a in pairs(AVERAGES) do
        local h = holders[key]
        h:EnableMouse(true)
        h:SetScript("OnEnter", function(self)
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:SetText(a[1], 1, 1, 1)
            GameTooltip:AddLine(string.format("Over the last %d minutes.",
                ns.WINDOW / 60), nil, nil, nil, true)
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
        if not Profiler.IsEnabled() then
            ns.Print("Addon profiling is still off. Another addon may be switching it off.")
        end
        GameTooltip_Hide()
    end)
    local statsBottom = TOP - math.ceil(#STATS / 2) * STAT_ROW_H - 14

    -- Table header, clickable to sort.
    local head = CreateFrame("Frame", nil, content)
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

    local pinHead = CreateFrame("Frame", nil, head)
    pinHead:SetPoint("LEFT", 2, 0)
    pinHead:SetSize(PIN_W, HEADER_H)
    pinHead:EnableMouse(true)
    local pinText = pinHead:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    pinText:SetPoint("CENTER")
    pinText:SetText("Pin")
    pinText:SetTextColor(W.DIM[1], W.DIM[2], W.DIM[3])
    pinHead:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText("Pinned addons", 1, 1, 1)
        GameTooltip:AddLine("Always shown in the overlay, besides the heaviest ones.", nil, nil, nil, true)
        GameTooltip:Show()
    end)
    pinHead:SetScript("OnLeave", GameTooltip_Hide)

    -- Rows: a fixed set of row frames reused for whatever is scrolled into view.
    local list = CreateFrame("Frame", nil, content)
    list:SetPoint("TOPLEFT", head, "BOTTOMLEFT", 0, -2)
    list:SetPoint("TOPRIGHT", head, "BOTTOMRIGHT", 0, -2)
    list:EnableMouseWheel(true)
    local thumb = W.Solid(list, "ARTWORK", W.ACCENT, 0.6)
    thumb:SetWidth(3)

    local function TogglePin(name)
        SereneDB.overlayPinned = SereneDB.overlayPinned or {}
        SereneDB.overlayPinned[name] = not SereneDB.overlayPinned[name] or nil
        Render()
        ns.UpdateOverlay()
    end

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
            GameTooltip:AddDoubleLine("Average CPU per frame:", ns.FormatMs(e.recentMs), 1, 0.82, 0, 1, 1, 1)
            GameTooltip:AddDoubleLine("Peak CPU:", ns.FormatMs(e.peakMs), 1, 0.82, 0, 1, 1, 1)
            GameTooltip:AddDoubleLine("Memory:", ns.FormatMemory(e.mem), 1, 0.82, 0, 1, 1, 1)
            GameTooltip:Show()
        end)
        r:SetScript("OnLeave", GameTooltip_Hide)

        local pin = CreateFrame("Button", nil, r)
        pin:SetSize(12, 12)
        pin:SetPoint("LEFT", 5, 0)
        W.Solid(pin, "BACKGROUND", W.FIELD):SetAllPoints()
        local edges = W.Border(pin, W.EDGE)
        pin.check = W.Solid(pin, "ARTWORK", W.ACCENT)
        pin.check:SetPoint("TOPLEFT", 2, -2)
        pin.check:SetPoint("BOTTOMRIGHT", -2, 2)
        pin:SetScript("OnClick", function()
            W.PlayClick()
            TogglePin(r.entry.name)
        end)
        pin:SetScript("OnEnter", function() W.SetBorderColor(edges, W.ACCENT) end)
        pin:SetScript("OnLeave", function() W.SetBorderColor(edges, W.EDGE) end)
        r.pin = pin

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
        table.sort(entries, ns.SORTS[key])

        local pins = ns.Enabled("overlayShown")
        local pinned = SereneDB.overlayPinned or {}
        local nameX = pins and 6 + PIN_W or 6
        pinHead:SetShown(pins)
        headers.name:SetPoint("LEFT", nameX, 0)

        local n = VisibleRows()
        offset = math.min(offset, math.max(0, #entries - n))
        local shown = math.min(n, #entries)
        for i = 1, shown do
            local e, r = entries[i + offset], Row(i)
            r.entry = e
            r.pin:SetShown(pins)
            r.pin.check:SetShown(pinned[e.name] and true or false)
            r.name:SetPoint("LEFT", nameX, 0)
            r.name:SetText(e.info.icon .. e.info.title)
            r.cpu:SetText(ns.FormatPercent(e.cpu))
            r.mem:SetText(ns.FormatMemory(e.mem))
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

    -- At either end of the list the wheel scrolls the page instead.
    list:SetScript("OnMouseWheel", function(_, delta)
        local new = math.max(0, math.min(#entries - VisibleRows(), offset - delta * 3))
        if new == offset then
            scroll:GetScript("OnMouseWheel")(scroll, delta)
            return
        end
        offset = new
        Render()
    end)

    ---------------------------------------------------------------------------
    --  Overlay: the checkbox, and under it the overlay's settings in two
    --  columns, shown while it is on.
    ---------------------------------------------------------------------------
    local F = ns.featureByKey
    local showBox = W.Checkbox(content, F.overlayShown)
    local widgets = { showBox }

    local block = CreateFrame("Frame", nil, content)
    local function Add(w, col, y)
        if col == 1 then
            w:SetPoint("TOPLEFT", block, "TOPLEFT", 0, y)
            w:SetPoint("TOPRIGHT", block, "TOP", -GAP / 2, y)
        else
            w:SetPoint("TOPLEFT", block, "TOP", GAP / 2, y)
            w:SetPoint("TOPRIGHT", block, "TOPRIGHT", 0, y)
        end
        widgets[#widgets + 1] = w
    end
    -- Left: the top line; right: the addon rows.
    local CHECKS = {
        { "overlayFps",     "overlayLocked" },
        { "overlayLatency", "overlayAddonCpu" },
        { "overlayCpu",     "overlayAddonMemory" },
        { "overlayMemory" },
    }
    local by = 0
    for _, pair in ipairs(CHECKS) do
        for col, key in ipairs(pair) do Add(W.Checkbox(block, F[key]), col, by) end
        by = by - 28
    end
    by = by - GAP
    Add(W.Slider(block, F.overlayTop), 1, by)
    Add(W.Dropdown(block, F.overlaySort), 2, by)
    by = by - 50 - GAP
    Add(W.Slider(block, F.overlayBackground), 1, by)
    -- Level with the slider's bar rather than its label.
    Add(W.FontGroup(block, F.overlayFont.group), 2, by - 16)
    by = by - 46 - GAP
    local note = block:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    note:SetPoint("TOPLEFT", 0, by)
    note:SetPoint("TOPRIGHT", 0, by)
    note:SetJustifyH("LEFT")
    note:SetText("Tick the box at the left of an addon to always show it in the overlay.")

    -- The list takes what the window leaves above the checkbox; the
    -- settings under it make the page scroll.
    local listTop = statsBottom - HEADER_H - 2
    local wasOn
    local function Layout()
        local listH = math.max(3 * ROW_H, scroll:GetHeight() + listTop - 6 - CHECK_H - 4)
        list:SetHeight(listH)
        local y = listTop - listH - 6
        showBox:ClearAllPoints()
        showBox:SetPoint("TOPLEFT", 0, y)
        showBox:SetPoint("TOPRIGHT", 0, y)
        y = y - CHECK_H - 4

        local on = ns.Enabled("overlayShown") and true or false
        block:SetShown(on)
        if on then
            -- Indented to line up with the checkbox's label.
            block:ClearAllPoints()
            block:SetPoint("TOPLEFT", 26, y - 4)
            block:SetPoint("TOPRIGHT", 0, y - 4)
            local blockH = -by + note:GetStringHeight()
            block:SetHeight(blockH)
            y = y - 4 - blockH - GAP
        end
        content:SetHeight(-y)
        Render()

        -- Just turned on: bring the settings into view.
        if on and wasOn == false then
            C_Timer.After(0, function() scroll:GetScript("OnMouseWheel")(scroll, -1000) end)
        end
        wasOn = on
    end
    widgets[#widgets + 1] = { Refresh = Layout }

    local function UpdateStats()
        for key, a in pairs(AVERAGES) do
            local avg = ns.Average(key)
            if avg then values[key]:SetFormattedText(a[2], avg) else values[key]:SetText("-") end
        end

        local total = 0
        for _, e in ipairs(entries) do total = total + e.mem end
        values.memory:SetText(ns.FormatMemory(total))

        local on = Profiler.IsEnabled()
        enable:SetShown(not on)
        values.cpuAvg:SetShown(on)
        if on then
            values.cpuAvg:SetText(ns.FormatPercent(ns.TotalCpu()))
            local peak = Metric.PeakTime
            local peakMs = Profiler.GetOverallMetric(peak)
            local peakPct = ns.Percent(peakMs, peak)
            values.cpuPeak:SetText(peakPct and ns.FormatPercent(peakPct) or ns.FormatMs(peakMs))
        else
            values.cpuAvg:SetText("-")
            values.cpuPeak:SetText("-")
        end
    end

    local ticks, ticker = 0, nil
    local function Update()
        ns.Collect(ticks % MEMORY_EVERY == 0)
        ticks = ticks + 1
        UpdateStats()
        Render()
    end

    scroll:HookScript("OnSizeChanged", Layout)
    page:HookScript("OnShow", function()
        ticks = 0
        Layout()
        Update()
        if not ticker then ticker = C_Timer.NewTicker(UPDATE_INTERVAL, Update) end
    end)
    page:HookScript("OnHide", function()
        if ticker then ticker:Cancel(); ticker = nil end
    end)

    -- Room for the summary, the header, about a dozen rows and the checkbox.
    return -listTop + 12 * ROW_H + 6 + CHECK_H + 4, widgets
end

ns.RegisterPage("Performance", Build)
