-------------------------------------------------------------------------------
--  Overlay -- framerate, latency and the heaviest addons on screen while
--  playing. Its settings are a group on the Performance page, whose addon
--  list is also where addons are pinned (SereneDB.overlayPinned). Width
--  is a setting and the height fits what it lists; spot and column widths
--  are kept in SereneDB.overlayPos.
--
--  Unlocked, the frame drags to move and the lines between the columns
--  drag to change their width. Locking only stops that; what shows stays
--  the same.
--
--  Blizzard's "Toggle Framerate" key (Ctrl+R by default) shows and hides
--  the overlay instead: an override binding on whatever key(s) TOGGLEFPS
--  uses clicks a hidden button of ours, so Blizzard's own FPS text never
--  shows. Override bindings cannot change in combat; changes wait for
--  combat to end.
-------------------------------------------------------------------------------
local _, ns = ...

local UPDATE_INTERVAL = 1
local MEMORY_EVERY = 5  -- ticks between memory rescans
local COL_GAP = 6
local PAD_X, PAD_Y = 6, 4  -- around the text
local DIVIDER_W = 8
local MIN_COL, MIN_NAME = 30, 40
local DEFAULTS = { cpuW = 40, memW = 50 }
-- overlayGrow -> the corner that stays put when the size changes.
local ANCHORS = { downright = "TOPLEFT", downleft = "TOPRIGHT", upright = "BOTTOMLEFT", upleft = "BOTTOMRIGHT" }

local GOOD, OK, HIGH, BAD = "40ff40", "ffd100", "ff991a", "ff4040"
local HEADER_COLOR = { 1, 0.82, 0 }
local NAME_COLOR = "d6d6d6"
local FONT, FONT_SIZE = "Fonts\\ARIALN.TTF", 12
local ROW_H = math.ceil(FONT_SIZE * 1.3)

local STATUS = {
    fps = function(v) if v >= 50 then return GOOD elseif v >= 25 then return OK end return BAD end,
    ms  = function(v) if v < 100 then return GOOD elseif v < 250 then return OK end return BAD end,
    cpu = function(v) if v < 5 then return GOOD elseif v < 15 then return OK end return BAD end,
    -- Total addon memory, in KB (1000 to the MB, as shown).
    mem = function(v) if v < 100000 then return GOOD elseif v < 250000 then return OK end return BAD end,
    -- One addon's memory, in KB.
    addonMem = function(v)
        if v < 2000 then return GOOD elseif v < 5000 then return OK elseif v < 10000 then return HIGH end
        return BAD
    end,
}

-- Framerate, latency, CPU and memory colored by how good they are.
local function Colored(kind, v, text)
    return "|cff" .. STATUS[kind](v) .. text .. "|r"
end

-- Spot (point: the corner that stays put, x/y: where it is in UIParent
-- units; nil = the screen's bottom right corner) and column widths. Width
-- is a setting; the height fits what is listed.
local function Saved(key)
    local p = SereneDB.overlayPos
    if p and p[key] ~= nil then return p[key] end
    return DEFAULTS[key]
end

local function Save(key, value)
    SereneDB.overlayPos = SereneDB.overlayPos or {}
    SereneDB.overlayPos[key] = value
end

local frame, bg, line, ticker
local header = {}    -- name, cpu, mem: column titles
local dividers = {}  -- cpuW, memW: drag handles at those columns' left edge
local rows = {}      -- { name, cpu, mem } font strings per line
local totals = {}    -- name, cpu, mem: the totals row (name holds framerate and latency)
local parts = {}     -- the totals row's left side, reused
local picked = {}    -- the addons listed, reused
local ticks = 0
local fontFlags, fontShadow = ns.FontFlags("OUTLINE")

local function NewText(justify)
    local fs = frame:CreateFontString(nil, "OVERLAY")
    ns.SetFont(fs, FONT, FONT_SIZE, fontFlags)
    ns.SetShadow(fs, fontShadow)
    fs:SetJustifyH(justify)
    fs:SetWordWrap(false)
    fs:SetTextColor(1, 1, 1)
    return fs
end

local function Row(i)
    if not rows[i] then
        rows[i] = { name = NewText("LEFT"), cpu = NewText("RIGHT"), mem = NewText("RIGHT") }
    end
    return rows[i]
end

local function PlaceRow(r, y, cpuW, memW)
    r.mem:ClearAllPoints()
    r.mem:SetPoint("TOPRIGHT", -PAD_X, -y)
    r.mem:SetWidth(memW)
    r.mem:Show()
    r.cpu:ClearAllPoints()
    r.cpu:SetPoint("TOPRIGHT", -(PAD_X + memW), -y)
    r.cpu:SetWidth(cpuW)
    r.cpu:Show()
    r.name:ClearAllPoints()
    r.name:SetPoint("TOPLEFT", PAD_X, -y)
    r.name:SetPoint("TOPRIGHT", -(PAD_X + memW + cpuW + COL_GAP), -y)
    r.name:Show()
end

local function Place()
    frame:ClearAllPoints()
    local point = Saved("point")
    if point then
        frame:SetPoint(point, UIParent, "BOTTOMLEFT", Saved("x"), Saved("y"))
    else
        frame:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -6, 6)
    end
end

-- After a move, or when overlayGrow changes: kept as the corner that
-- overlayGrow leaves in place.
local function SavePlace()
    local point = ANCHORS[ns.Get("overlayGrow")]
    Save("point", point)
    Save("x", point:find("LEFT") and frame:GetLeft() or frame:GetRight())
    Save("y", point:find("TOP") and frame:GetTop() or frame:GetBottom())
    Place()
end

local function HideRow(r)
    r.name:Hide(); r.cpu:Hide(); r.mem:Hide()
end

local function Render()
    local locked = ns.Enabled("overlayLocked")
    local list = not ns.Enabled("overlaySummaryOnly")
    local rowH = ROW_H
    local cpuW, memW = Saved("cpuW"), Saved("memW")

    -- The totals row: framerate and latency on the left, the totals in
    -- their columns; without the list they join the left side.
    local fps = math.floor(GetFramerate() + 0.5)
    local ms = ns.Latency()
    parts[1] = Colored("fps", fps, fps .. " fps")
    parts[2] = Colored("ms", ms, ms .. " ms")
    local n, cpuText, memText = 2, nil, nil
    local cpu = ns.TotalCpu()
    local mem = 0
    for _, e in ipairs(ns.entries) do mem = mem + e.mem end
    if list then
        cpuText = Colored("cpu", cpu, ns.FormatPercent(cpu))
        memText = Colored("mem", mem, ns.FormatMemory(mem))
    else
        parts[n + 1] = Colored("cpu", cpu, ns.FormatPercent(cpu) .. " cpu")
        parts[n + 2] = Colored("mem", mem, ns.FormatMemory(mem))
        n = n + 2
    end
    for i = n + 1, #parts do parts[i] = nil end
    totals.name:SetText(table.concat(parts, "  "))

    -- Without the addon list the overlay is just that line, sized to fit it.
    if not list then
        for _, fs in pairs(header) do fs:Hide() end
        for _, r in ipairs(rows) do HideRow(r) end
        for _, d in pairs(dividers) do d:Hide() end
        line:Hide()
        totals.cpu:Hide()
        totals.mem:Hide()
        totals.name:Show()
        totals.name:ClearAllPoints()
        totals.name:SetPoint("TOPLEFT", PAD_X, -PAD_Y)
        totals.name:SetPoint("TOPRIGHT", -PAD_X, -PAD_Y)
        frame:SetSize(math.ceil(totals.name:GetStringWidth()) + 2 * PAD_X, 2 * PAD_Y + rowH)
        return
    end

    local colsW = cpuW + memW + COL_GAP
    -- Never narrower than the columns plus the least name room.
    local minW = 2 * PAD_X + MIN_NAME + colsW
    local width = math.max(minW, ns.Get("overlayWidth"))

    local y = PAD_Y
    PlaceRow(header, y, cpuW, memW)
    y = y + rowH

    -- Pinned addons, and the heaviest overlayTop of the rest, in sort order.
    local bottomH = rowH + 6  -- the totals row and the line above it
    local entries = ns.entries
    table.sort(entries, ns.SORTS[ns.Get("overlaySort")])
    local pinned = SereneDB.overlayPinned or {}
    local extras = ns.Get("overlayTop")
    local shown = 0
    for _, e in ipairs(entries) do
        local pin = pinned[e.name]
        if pin or extras > 0 then
            if not pin then extras = extras - 1 end
            shown = shown + 1
            picked[shown] = e
        end
    end
    for i = shown + 1, #picked do picked[i] = nil end

    for i, e in ipairs(picked) do
        local r = Row(i)
        PlaceRow(r, y, cpuW, memW)
        r.name:SetText("|cff" .. NAME_COLOR .. e.info.plainTitle .. "|r")
        r.cpu:SetText(Colored("cpu", e.cpu, ns.FormatPercent(e.cpu)))
        r.mem:SetText(Colored("addonMem", e.mem, ns.FormatMemory(e.mem)))
        y = y + rowH
    end
    for i = shown + 1, #rows do HideRow(rows[i]) end
    local height = y + bottomH + PAD_Y

    -- The totals keep to the bottom edge, under a line.
    local ty = height - PAD_Y - rowH
    PlaceRow(totals, ty, cpuW, memW)
    totals.cpu:SetText(cpuText)
    totals.mem:SetText(memText)
    line:ClearAllPoints()
    line:SetPoint("TOPLEFT", PAD_X, -(ty - 4))
    line:SetPoint("TOPRIGHT", -PAD_X, -(ty - 4))
    line:Show()

    -- The handles sit at the left edge of each column; CPU's in the middle
    -- of the gap before the names.
    local edge = { cpuW = PAD_X + memW + cpuW, memW = PAD_X + memW }
    for key, d in pairs(dividers) do
        d:SetShown(not locked)
        if not locked then
            local x = -edge[key] + DIVIDER_W / 2 - (key == "cpuW" and COL_GAP / 2 or 0)
            d:ClearAllPoints()
            d:SetPoint("TOPRIGHT", frame, "TOPRIGHT", x, -PAD_Y)
            d:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", x, PAD_Y)
        end
    end

    frame:SetSize(width, height)
end

local function Update()
    ns.Collect(ticks % MEMORY_EVERY == 0)
    ticks = ticks + 1
    Render()
end

-- Redraws right away, e.g. after pinning an addon on the Performance page.
function ns.UpdateOverlay()
    if frame and frame:IsShown() then Render() end
end

local function Style()
    bg:SetColorTexture(0, 0, 0, ns.Get("overlayBackground") / 100)
end

local function CursorX(region)
    return GetCursorPosition() / region:GetEffectiveScale()
end

-- Only while unlocked; locked, the overlay takes no mouse at all.
local function Tooltip(self)
    GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT")
    GameTooltip:SetText("Drag to move", 1, 1, 1)
    GameTooltip:Show()
end

local function CreateDivider(key)
    local d = CreateFrame("Button", nil, frame)
    d:SetWidth(DIVIDER_W)
    d:SetFrameLevel(frame:GetFrameLevel() + 5)
    local tex = d:CreateTexture(nil, "OVERLAY")
    tex:SetColorTexture(HEADER_COLOR[1], HEADER_COLOR[2], HEADER_COLOR[3], 1)
    tex:Hide()  -- shows while hovered, so unlocking changes nothing on screen
    tex:SetPoint("TOP")
    tex:SetPoint("BOTTOM")
    tex:SetWidth(1)
    d:SetScript("OnEnter", function() tex:Show() end)
    d:SetScript("OnLeave", function() tex:Hide() end)

    -- Dragging left widens the column to the right of the line.
    d:SetScript("OnMouseDown", function(self, button)
        if button ~= "LeftButton" then return end
        GameTooltip_Hide()
        local startX, startW = CursorX(frame), Saved(key)
        self:SetScript("OnUpdate", function()
            local other = Saved(key == "cpuW" and "memW" or "cpuW")
            local max = frame:GetWidth() - 2 * PAD_X - MIN_NAME - COL_GAP - other
            local w = math.floor(math.max(MIN_COL, math.min(max, startW + startX - CursorX(frame))) + 0.5)
            if w ~= Saved(key) then
                Save(key, w)
                Render()
            end
        end)
    end)
    d:SetScript("OnMouseUp", function(self) self:SetScript("OnUpdate", nil) end)
    d:SetScript("OnHide", function(self) self:SetScript("OnUpdate", nil) end)
    dividers[key] = d
end

local function Build()
    frame = CreateFrame("Frame", "SereneOverlayFrame", UIParent)
    -- Something to glance at; any window or bar opened over it wins.
    frame:SetFrameStrata("BACKGROUND")
    frame:SetClampedToScreen(true)
    frame:SetMovable(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetDontSavePosition(true)

    bg = frame:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    line = frame:CreateTexture(nil, "ARTWORK")
    line:SetHeight(1)
    line:SetColorTexture(1, 1, 1, 0.2)
    totals.name, totals.cpu, totals.mem = NewText("LEFT"), NewText("RIGHT"), NewText("RIGHT")
    header.name, header.cpu, header.mem = NewText("LEFT"), NewText("RIGHT"), NewText("RIGHT")
    header.name:SetText("AddOn")
    header.cpu:SetText("CPU")
    header.mem:SetText("Memory")
    for _, fs in pairs(header) do fs:SetTextColor(HEADER_COLOR[1], HEADER_COLOR[2], HEADER_COLOR[3]) end
    CreateDivider("cpuW")
    CreateDivider("memW")

    frame:SetScript("OnDragStart", function(self)
        if ns.Enabled("overlayLocked") then return end
        GameTooltip_Hide()
        self:StartMoving()
    end)
    frame:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        self:SetUserPlaced(false)
        SavePlace()
    end)
    frame:SetScript("OnEnter", Tooltip)
    frame:SetScript("OnLeave", GameTooltip_Hide)
end

local function Apply()
    if ns.Enabled("overlayShown") then
        if not frame then Build() end
        Style()
        Place()
        -- Locked, clicks go through to the world.
        frame:EnableMouse(not ns.Enabled("overlayLocked"))
        frame:Show()
        -- overlayGrow changed: keep the spot, anchored by the new corner.
        if (Saved("point") or "BOTTOMRIGHT") ~= ANCHORS[ns.Get("overlayGrow")] then SavePlace() end
        -- Already running: a setting changed, the data from the last tick will do.
        if ticker then
            Render()
        else
            Update()
            ticker = C_Timer.NewTicker(UPDATE_INTERVAL, Update)
        end
    elseif frame then
        frame:Hide()
        if ticker then ticker:Cancel(); ticker = nil end
    end
end

-- Reset also puts the overlay back in its corner and unpins every addon.
ns.OnReset(function()
    SereneDB.overlayPos = nil
    SereneDB.overlayPinned = nil
end, "Performance")

-------------------------------------------------------------------------------
--  Toggle key
-------------------------------------------------------------------------------
local toggleButton = CreateFrame("Button", "SereneOverlayToggle", UIParent)
toggleButton:SetScript("OnClick", function()
    ns.SetValue("overlayShown", not ns.Enabled("overlayShown"))
end)

local bindOwner = CreateFrame("Frame")
local bound  -- the keys currently overridden, joined; nil = none

-- Setting override bindings fires UPDATE_BINDINGS itself, so nothing is
-- redone unless the wanted keys actually differ from what is bound.
local function UpdateBinding()
    local want
    local keys = { GetBindingKey("TOGGLEFPS") }
    if #keys > 0 then want = table.concat(keys, " ") end
    if want == bound then return end
    if InCombatLockdown() then
        bindOwner:RegisterEvent("PLAYER_REGEN_ENABLED")
        return
    end
    ClearOverrideBindings(bindOwner)
    bound = want
    if want then
        for key in want:gmatch("%S+") do
            SetOverrideBindingClick(bindOwner, false, key, "SereneOverlayToggle")
        end
    end
end

bindOwner:RegisterEvent("PLAYER_LOGIN")
bindOwner:RegisterEvent("UPDATE_BINDINGS")
bindOwner:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_REGEN_ENABLED" or event == "PLAYER_LOGIN" then self:UnregisterEvent(event) end
    UpdateBinding()
end)

-------------------------------------------------------------------------------
--  Settings -- the Overlay group of the Performance page, before Usage and
--  closed at first.
-------------------------------------------------------------------------------
local SECTION = "Performance"
local ON = "overlayShown"

-- One group, two settings to a row.
ns.RegisterFeature({
    key = "overlayShown", label = "Show overlay", section = SECTION, category = "Overlay", default = false,
    tooltip = "Performance numbers on screen while you play; Ctrl+R toggles it",
    closed = true,
    apply = Apply,
})
ns.RegisterFeature({
    key = "overlayLocked", label = "Lock position", section = SECTION, category = "Overlay", requires = ON,
    apply = Apply, beside = true,
})

ns.RegisterFeature({
    key = "overlaySummaryOnly", label = "Show summary only", section = SECTION, category = "Overlay", default = false,
    requires = ON, apply = Apply,
})
local LIST = { ON, "!overlaySummaryOnly" }
ns.RegisterFeature({
    key = "overlayGrow", label = "Grows from", section = SECTION, category = "Overlay", type = "dropdown",
    default = "upleft", requires = ON, apply = Apply, space = true,
    options = function()
        return {
            { value = "upleft",    label = "Bottom right corner" },
            { value = "upright",   label = "Bottom left corner" },
            { value = "downleft",  label = "Top right corner" },
            { value = "downright", label = "Top left corner" },
        }
    end,
})
ns.RegisterFeature({
    key = "overlaySort", label = "Sort by", section = SECTION, category = "Overlay", type = "dropdown",
    default = "mem", requires = LIST, apply = Apply, beside = true,
    options = function()
        return {
            { value = "cpu",  label = "CPU" },
            { value = "mem",  label = "Memory" },
            { value = "name", label = "Name" },
        }
    end,
})
ns.RegisterFeature({
    key = "overlayWidth", label = "Width", section = SECTION, category = "Overlay", type = "slider",
    min = 100, max = 800, step = 1, default = 260, requires = LIST, apply = Apply,
})
ns.RegisterFeature({
    key = "overlayBackground", label = "Opacity", section = SECTION, category = "Overlay", type = "slider",
    min = 0, max = 100, step = 5, default = 25, suffix = "%", requires = ON, apply = Apply, beside = true,
})
ns.RegisterFeature({
    key = "overlayTop", label = "Number of addons", section = SECTION, category = "Overlay", type = "slider",
    min = 1, max = 20, step = 1, default = 5, requires = LIST, apply = Apply,
})
