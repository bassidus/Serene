-------------------------------------------------------------------------------
--  Overlay -- framerate, latency and the heaviest addons on screen while
--  playing. Its settings are groups on the Performance page, whose addon
--  list is also where addons are pinned (SereneDB.overlayPinned). Width
--  and height are settings; spot and column widths are kept in
--  SereneDB.overlayPos.
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
local PAD_X, PAD_Y, COL_GAP = 6, 4, 6
local DIVIDER_W = 8
local MIN_COL, MIN_NAME = 30, 40
local DEFAULTS = { cpuW = 35, memW = 49 }
-- overlayGrow -> the corner that stays put when the size changes.
local ANCHORS = { downright = "TOPLEFT", downleft = "TOPRIGHT", upright = "BOTTOMLEFT", upleft = "BOTTOMRIGHT" }

local GOOD, OK, BAD, PLAIN = "40ff40", "ffd100", "ff4040", "ffffff"
local HEADER_COLOR = { 1, 0.82, 0 }

local STATUS = {
    fps = function(v) if v >= 50 then return GOOD elseif v >= 25 then return OK end return BAD end,
    ms  = function(v) if v < 100 then return GOOD elseif v < 250 then return OK end return BAD end,
    cpu = function(v) if v < 5 then return GOOD elseif v < 15 then return OK end return BAD end,
}

-- "By value" colors framerate, latency and CPU; memory stays white.
local function Colored(kind, v, text)
    local mode, hex = ns.Get("overlayColors"), nil
    if mode == "class" then
        hex = ns.PlayerClassHex()
    else
        hex = ns.ColorHex(mode) or (STATUS[kind] and v and STATUS[kind](v)) or PLAIN
    end
    return "|cff" .. hex .. text .. "|r"
end

-- Spot (point: the corner that stays put, x/y: where it is in UIParent
-- units; nil = the screen's bottom right corner) and column widths.
-- Width and height are settings.
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
local ticks = 0
local fontPath, fontSize, fontFlags, fontShadow

local function SetFont(fs)
    ns.SetFont(fs, fontPath, fontSize, fontFlags)
    ns.SetShadow(fs, fontShadow)
end

local function NewText(justify)
    local fs = frame:CreateFontString(nil, "OVERLAY")
    fs:SetJustifyH(justify)
    fs:SetWordWrap(false)
    fs:SetTextColor(1, 1, 1)
    if fontSize then SetFont(fs) end
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
    r.mem:SetWidth(math.max(1, memW))
    r.mem:SetShown(memW > 0)
    r.cpu:ClearAllPoints()
    r.cpu:SetPoint("TOPRIGHT", -(PAD_X + memW), -y)
    r.cpu:SetWidth(math.max(1, cpuW))
    r.cpu:SetShown(cpuW > 0)
    r.name:ClearAllPoints()
    r.name:SetPoint("TOPLEFT", PAD_X, -y)
    r.name:SetPoint("TOPRIGHT", -(PAD_X + memW + cpuW + COL_GAP), -y)
    r.name:Show()
end

-- x/y are UIParent units and SetPoint offsets the frame's own (scaled)
-- ones, so a new scale also leaves the corner in place.
local function Place()
    local s = ns.Get("overlayScale") / 100
    frame:SetScale(s)
    frame:ClearAllPoints()
    local point = Saved("point")
    if point then
        frame:SetPoint(point, UIParent, "BOTTOMLEFT", Saved("x") / s, Saved("y") / s)
    else
        frame:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -6 / s, 6 / s)
    end
end

-- After a move, or when overlayGrow changes: kept as the corner that
-- overlayGrow leaves in place.
local function SavePlace()
    local s = frame:GetScale()
    local point = ANCHORS[ns.Get("overlayGrow")]
    Save("point", point)
    Save("x", (point:find("LEFT") and frame:GetLeft() or frame:GetRight()) * s)
    Save("y", (point:find("TOP") and frame:GetTop() or frame:GetBottom()) * s)
    Place()
end

local function HideRow(r)
    r.name:Hide(); r.cpu:Hide(); r.mem:Hide()
end

local function Render()
    local locked = ns.Enabled("overlayLocked")
    local list = ns.Enabled("overlayAddons")
    local rowH = math.ceil(fontSize * 1.3)
    local cpuW = list and ns.Enabled("overlayAddonCpu") and Saved("cpuW") or 0
    local memW = list and ns.Enabled("overlayAddonMemory") and Saved("memW") or 0

    -- The totals row: framerate and latency on the left, the totals in
    -- their columns; a total whose column is off joins the left side.
    local n, cpuText, memText = 0, nil, nil
    if ns.Enabled("overlayFps") then
        local fps = math.floor(GetFramerate() + 0.5)
        n = n + 1
        parts[n] = Colored("fps", fps, fps) .. " fps"
    end
    if ns.Enabled("overlayLatency") then
        local ms = ns.Latency()
        n = n + 1
        parts[n] = Colored("ms", ms, ms) .. " ms"
    end
    if ns.Enabled("overlayCpu") then
        local p = ns.TotalCpu()
        local text = Colored("cpu", p, ns.FormatPercent(p))
        if cpuW > 0 then
            cpuText = text
        else
            n = n + 1
            parts[n] = text .. " cpu"
        end
    end
    if ns.Enabled("overlayMemory") then
        local total = 0
        for _, e in ipairs(ns.entries) do total = total + e.mem end
        local text = Colored("mem", nil, ns.FormatMemory(total))
        if memW > 0 then
            memText = text
        else
            n = n + 1
            parts[n] = text
        end
    end
    for i = n + 1, #parts do parts[i] = nil end
    local hasTotals = n > 0 or cpuText ~= nil or memText ~= nil
    totals.name:SetText(table.concat(parts, "  "))

    -- Without the addon list the overlay is just that line, sized to fit it.
    if not list then
        for _, fs in pairs(header) do fs:Hide() end
        for _, r in ipairs(rows) do HideRow(r) end
        for _, d in pairs(dividers) do d:Hide() end
        line:Hide()
        totals.cpu:Hide()
        totals.mem:Hide()
        totals.name:SetShown(n > 0)
        totals.name:ClearAllPoints()
        totals.name:SetPoint("TOPLEFT", PAD_X, -PAD_Y)
        totals.name:SetPoint("TOPRIGHT", -PAD_X, -PAD_Y)
        local textW = n > 0 and math.ceil(totals.name:GetStringWidth()) or 0
        frame:SetSize(textW + 2 * PAD_X, 2 * PAD_Y + (n > 0 and rowH or 0))
        return
    end

    local colsW = cpuW + memW + (cpuW + memW > 0 and COL_GAP or 0)
    -- Never narrower than the columns plus the least name room.
    local minW = 2 * PAD_X + MIN_NAME + colsW
    local width = math.max(minW, ns.Get("overlayWidth"))
    local auto = ns.Enabled("overlayAutoHeight")
    local height = ns.Get("overlayHeight")

    local y = PAD_Y
    PlaceRow(header, y, cpuW, memW)
    y = y + rowH

    -- Pinned addons first claim the room; the heaviest of the rest fill
    -- what is left, up to overlayTop. Shown in sort order either way.
    local bottomH = hasTotals and rowH + 6 or 0  -- the totals row and the line above it
    local entries = ns.entries
    table.sort(entries, ns.SORTS[ns.Get("overlaySort")])
    local pinned = SereneDB.overlayPinned or {}
    local fit = auto and math.huge or math.max(0, math.floor((height - y - bottomH - PAD_Y) / rowH))
    local nPinned = 0
    for _, e in ipairs(entries) do
        if pinned[e.name] then nPinned = nPinned + 1 end
    end
    local extras = math.max(0, math.min(ns.Get("overlayTop"), fit - nPinned))
    local shown = 0
    for _, e in ipairs(entries) do
        if shown >= fit then break end
        local pin = pinned[e.name]
        if pin or extras > 0 then
            if not pin then extras = extras - 1 end
            shown = shown + 1
            local r = Row(shown)
            PlaceRow(r, y, cpuW, memW)
            r.name:SetText(e.info.plainTitle)
            r.cpu:SetText(Colored("cpu", e.cpu, ns.FormatPercent(e.cpu)))
            r.mem:SetText(Colored("mem", nil, ns.FormatMemory(e.mem)))
            y = y + rowH
        end
    end
    for i = shown + 1, #rows do HideRow(rows[i]) end
    if auto then height = y + bottomH + PAD_Y end

    -- The totals keep to the bottom edge, under a line.
    line:SetShown(hasTotals)
    if hasTotals then
        local ty = height - PAD_Y - rowH
        PlaceRow(totals, ty, cpuW, memW)
        totals.cpu:SetText(cpuText or "")
        totals.mem:SetText(memText or "")
        line:ClearAllPoints()
        line:SetPoint("TOPLEFT", PAD_X, -(ty - 4))
        line:SetPoint("TOPRIGHT", -PAD_X, -(ty - 4))
    else
        HideRow(totals)
    end

    -- The handles sit at the left edge of each shown column; the leftmost
    -- one in the middle of the gap before the names.
    local edge = { cpuW = PAD_X + memW + cpuW, memW = PAD_X + memW }
    local leftmost = cpuW > 0 and "cpuW" or "memW"
    for key, d in pairs(dividers) do
        local on = not locked and (key == "cpuW" and cpuW or memW) > 0
        d:SetShown(on)
        if on then
            local x = -edge[key] + DIVIDER_W / 2 - (key == leftmost and COL_GAP / 2 or 0)
            d:ClearAllPoints()
            d:SetPoint("TOPRIGHT", frame, "TOPRIGHT", x, -PAD_Y)
            d:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", x, PAD_Y)
        end
    end

    frame:SetSize(width, height)
end

local function Update()
    local memory = ns.Enabled("overlayMemory")
        or (ns.Enabled("overlayAddons") and ns.Enabled("overlayAddonMemory"))
    ns.Collect(memory and ticks % MEMORY_EVERY == 0)
    ticks = ticks + 1
    Render()
end

-- Redraws right away, e.g. after pinning an addon on the Performance page.
function ns.UpdateOverlay()
    if frame and frame:IsShown() then Render() end
end

local function Style()
    fontPath, fontSize = ns.Get("overlayFont"), ns.Get("overlayFontSize")
    fontFlags, fontShadow = ns.FontFlags(ns.Get("overlayOutline"))
    for _, fs in pairs(header) do SetFont(fs) end
    for _, fs in pairs(totals) do SetFont(fs) end
    for _, r in ipairs(rows) do
        SetFont(r.name); SetFont(r.cpu); SetFont(r.mem)
    end
    bg:SetColorTexture(0, 0, 0, ns.Get("overlayBackground") / 100)
end

local function CursorX(region)
    return GetCursorPosition() / region:GetEffectiveScale()
end

local function Tooltip(self)
    GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT")
    GameTooltip:SetText("Performance overlay", 1, 1, 1)
    GameTooltip:AddDoubleLine("Framerate", string.format("%.0f fps", GetFramerate()), 1, 0.82, 0, 1, 1, 1)
    GameTooltip:AddDoubleLine("Latency", ns.Latency() .. " ms", 1, 0.82, 0, 1, 1, 1)
    GameTooltip:AddDoubleLine("Addon CPU", ns.FormatPercent(ns.TotalCpu()), 1, 0.82, 0, 1, 1, 1)
    if not C_AddOnProfiler.IsEnabled() then
        GameTooltip:AddLine("Addon profiling is off. Turn it on from the Performance page (/serene).",
            1, 0.45, 0.45, true)
    end
    if not ns.Enabled("overlayLocked") then
        GameTooltip:AddLine(" ")
        if ns.Enabled("overlayAddons") then
            GameTooltip:AddLine("Drag to move. Drag the lines between the columns to change their width.",
                0.6, 0.6, 0.6, true)
        else
            GameTooltip:AddLine("Drag to move.", 0.6, 0.6, 0.6, true)
        end
    end
    GameTooltip:Show()
end

local function CreateDivider(key)
    local d = CreateFrame("Button", nil, frame)
    d:SetWidth(DIVIDER_W)
    d:SetFrameLevel(frame:GetFrameLevel() + 5)
    local tex = d:CreateTexture(nil, "OVERLAY")
    tex:SetColorTexture(ns.ACCENT[1], ns.ACCENT[2], ns.ACCENT[3], 1)
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
            local other = key == "cpuW" and (ns.Enabled("overlayAddonMemory") and Saved("memW") or 0)
                or (ns.Enabled("overlayAddonCpu") and Saved("cpuW") or 0)
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
    frame:SetFrameStrata("HIGH")
    frame:SetClampedToScreen(true)
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetDontSavePosition(true)

    bg = frame:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    line = frame:CreateTexture(nil, "ARTWORK")
    line:SetColorTexture(1, 1, 1, 0.2)
    line:SetHeight(1)
    totals.name, totals.cpu, totals.mem = NewText("LEFT"), NewText("RIGHT"), NewText("RIGHT")
    header.name, header.cpu, header.mem = NewText("LEFT"), NewText("RIGHT"), NewText("RIGHT")
    Style()  -- a font string takes no text before it has a font
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
        frame:Show()
        -- overlayGrow changed: keep the spot, anchored by the new corner.
        if (Saved("point") or "BOTTOMRIGHT") ~= ANCHORS[ns.Get("overlayGrow")] then SavePlace() end
        Update()
        if not ticker then ticker = C_Timer.NewTicker(UPDATE_INTERVAL, Update) end
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
--  Settings -- the Performance page's groups after Usage.
-------------------------------------------------------------------------------
local SECTION = "Performance"
local ON = "overlayShown"

ns.RegisterFeature({
    key = "overlayShown", label = "Show overlay", section = SECTION, category = "Overlay", default = false,
    apply = Apply,
    tooltip = "Framerate, latency and your heaviest addons on screen while you play. The game's Toggle Framerate key (Ctrl+R) also shows and hides it.",
})
ns.RegisterFeature({
    key = "overlayLocked", label = "Lock", section = SECTION, category = "Overlay", requires = ON, apply = Apply,
    tooltip = "Unlocked, the overlay drags to move and the lines between the columns change their width.",
})
ns.RegisterFeature({
    key = "overlayAddons", label = "Addon list", section = SECTION, category = "Overlay", requires = ON,
    apply = Apply,
    tooltip = "Off, the overlay shows only the line with framerate, latency and the totals.",
})
local LIST = { ON, "overlayAddons" }
ns.RegisterFeature({
    key = "overlayTop", label = "Heaviest addons", section = SECTION, category = "Overlay", type = "slider",
    min = 1, max = 20, step = 1, default = 5, requires = LIST, apply = Apply,
    tooltip = "How many of the heaviest addons to list. Pinned addons (the box at the left of an addon under Usage) show besides these.",
})
ns.RegisterFeature({
    key = "overlaySort", label = "Sort by", section = SECTION, category = "Overlay", type = "dropdown",
    default = "mem", requires = LIST, apply = Apply,
    options = function()
        return {
            { value = "cpu",  label = "CPU" },
            { value = "mem",  label = "Memory" },
            { value = "name", label = "Name" },
        }
    end,
})

-- The columns only matter with the addon list.
local VALUES = {
    { "overlayFps",         "Framerate",          ON },
    { "overlayLatency",     "Latency",            ON },
    { "overlayCpu",         "Total addon CPU",    ON },
    { "overlayMemory",      "Total addon memory", ON },
    { "overlayAddonCpu",    "CPU column",         LIST },
    { "overlayAddonMemory", "Memory column",      LIST },
}
for i, v in ipairs(VALUES) do
    ns.RegisterFeature({
        key = v[1], label = v[2], section = SECTION, category = "Values", requires = v[3], apply = Apply,
        beside = i == 1,  -- the category, to the right of Overlay
    })
end

ns.RegisterFeature({
    key = "overlayColors", label = "Number color", section = SECTION, category = "Look", type = "color",
    default = "status", requires = ON, apply = Apply,
    specials = {
        { value = "status", label = "By value", swatch = function() return GOOD, OK, BAD end,
          tooltip = "Green when good, yellow when so-so, red when poor." },
        { value = "class",  label = "By class", swatch = ns.PlayerClassHex },
    },
})
ns.RegisterFontSettings({
    prefix = "overlay", label = "Overlay text", section = SECTION, category = "Look", requires = ON, apply = Apply,
    font = "Fonts\\ARIALN.TTF", size = { 8, 28, 12 }, outline = "OUTLINE", color = "overlayColors", button = "Font",
})
ns.RegisterFeature({
    key = "overlayBackground", label = "Background opacity", section = SECTION, category = "Look", type = "slider",
    min = 0, max = 100, step = 5, default = 25, suffix = "%", requires = ON, apply = Apply,
})
ns.RegisterFeature({
    key = "overlayWidth", label = "Width", section = SECTION, category = "Size", type = "slider",
    min = 100, max = 800, step = 1, default = 260, requires = LIST, apply = Apply,
    beside = true,  -- the category, to the right of Look
    tooltip = "Without the addon list the overlay fits its text.",
})
ns.RegisterFeature({
    key = "overlayHeight", label = "Height", section = SECTION, category = "Size", type = "slider",
    min = 40, max = 800, step = 1, default = 130, requires = { ON, "overlayAddons", "!overlayAutoHeight" },
    apply = Apply,
})
ns.RegisterFeature({
    key = "overlayAutoHeight", label = "Automatic height", section = SECTION, category = "Size",
    requires = LIST, apply = Apply,
    tooltip = "Just tall enough for the addons it lists; Height is then not used.",
})
ns.RegisterFeature({
    key = "overlayScale", label = "Scale", section = SECTION, category = "Size", type = "slider",
    min = 50, max = 200, step = 5, default = 100, suffix = "%", requires = ON, apply = Apply,
    tooltip = "Everything at once, text included.",
})
ns.RegisterFeature({
    key = "overlayGrow", label = "Grows toward", section = SECTION, category = "Size", type = "dropdown",
    default = "upleft", requires = ON, apply = Apply,
    tooltip = "Which way the overlay grows when its size or scale changes; the opposite corner stays put.",
    options = function()
        return {
            { value = "downright", label = "Down and right" },
            { value = "downleft",  label = "Down and left" },
            { value = "upright",   label = "Up and right" },
            { value = "upleft",    label = "Up and left" },
        }
    end,
})
