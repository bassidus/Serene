-------------------------------------------------------------------------------
--  Overlay -- framerate, latency and the heaviest addons on screen while
--  playing. Its settings are groups on the Performance page, whose addon
--  list is also where addons are pinned (SereneDB.overlayPinned). Spot,
--  size, scale and column widths are kept in SereneDB.overlayPos.
--
--  Unlocked, the frame drags to move, the corner grip resizes it (Shift:
--  scales it, text and all) and the lines between the columns drag to
--  change their width. Locking only stops that; what shows stays the same.
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
local GRIP, DIVIDER_W = 14, 8
local MIN_H, MIN_COL, MIN_NAME = 40, 30, 40
local MIN_SCALE, MAX_SCALE = 0.5, 2.5
local DEFAULTS = { width = 260, height = 120, scale = 1, cpuW = 55, memW = 70 }

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

-- Spot (left/top in UIParent units, nil = the default corner), size,
-- scale and column widths.
local function Saved(key)
    local p = SereneDB.overlayPos
    if p and p[key] ~= nil then return p[key] end
    return DEFAULTS[key]
end

local function Save(key, value)
    SereneDB.overlayPos = SereneDB.overlayPos or {}
    SereneDB.overlayPos[key] = value
end

local frame, bg, line, grip, summary, ticker
local header = {}    -- name, cpu, mem: column titles
local dividers = {}  -- cpuW, memW: drag handles at those columns' left edge
local rows = {}      -- { name, cpu, mem } font strings per line
local parts = {}     -- the summary line's pieces, reused
local ticks, sizing = 0, false
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

local function Place()
    local s = Saved("scale")
    frame:SetScale(s)
    frame:ClearAllPoints()
    local left = Saved("left")
    if left then
        frame:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", left / s, Saved("top") / s)
    else
        frame:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -6 / s, 6 / s)
    end
end

-- After a move or resize: kept as the top left corner, so a resize leaves
-- it in place.
local function SavePlace()
    local s = frame:GetScale()
    Save("left", frame:GetLeft() * s)
    Save("top", frame:GetTop() * s)
    Place()
end

local function Render()
    local locked = ns.Enabled("overlayLocked")
    local cpuW = ns.Enabled("overlayAddonCpu") and Saved("cpuW") or 0
    local memW = ns.Enabled("overlayAddonMemory") and Saved("memW") or 0
    local colsW = cpuW + memW + (cpuW + memW > 0 and COL_GAP or 0)
    -- Never narrower than the columns plus the least name room.
    local minW = 2 * PAD_X + MIN_NAME + colsW
    frame:SetResizeBounds(minW, MIN_H)
    local width = math.max(minW, Saved("width"))
    local height = Saved("height")
    local rowH = math.ceil(fontSize * 1.3)

    local n = 0
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
        n = n + 1
        parts[n] = Colored("cpu", p, ns.FormatPercent(p)) .. " cpu"
    end
    if ns.Enabled("overlayMemory") then
        local total = 0
        for _, e in ipairs(ns.entries) do total = total + e.mem end
        n = n + 1
        parts[n] = Colored("mem", nil, ns.FormatMemory(total))
    end
    for i = n + 1, #parts do parts[i] = nil end

    local y = PAD_Y
    summary:SetShown(n > 0)
    if n > 0 then
        summary:SetText(table.concat(parts, "  "))
        summary:ClearAllPoints()
        summary:SetPoint("TOPLEFT", PAD_X, -y)
        summary:SetPoint("TOPRIGHT", -PAD_X, -y)
        y = y + rowH + 2
        line:ClearAllPoints()
        line:SetPoint("TOPLEFT", PAD_X, -y)
        line:SetPoint("TOPRIGHT", -PAD_X, -y)
        y = y + 4
    end

    local tableTop = y
    PlaceRow(header, y, cpuW, memW)
    y = y + rowH

    -- Pinned addons first claim the room; the heaviest of the rest fill
    -- what is left, up to overlayTop. Shown in sort order either way.
    local entries = ns.entries
    table.sort(entries, ns.SORTS[ns.Get("overlaySort")])
    local pinned = SereneDB.overlayPinned or {}
    local fit = math.max(0, math.floor((height - y - PAD_Y) / rowH))
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
    for i = shown + 1, #rows do
        local r = rows[i]
        r.name:Hide(); r.cpu:Hide(); r.mem:Hide()
    end
    line:SetShown(n > 0)

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
            d:SetPoint("TOPRIGHT", frame, "TOPRIGHT", x, -tableTop)
            d:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", x, PAD_Y)
        end
    end

    if not sizing then
        frame:SetWidth(width)
        frame:SetHeight(height)
    end
end

local function Update()
    local memory = ns.Enabled("overlayMemory") or ns.Enabled("overlayAddonMemory")
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
    SetFont(summary)
    for _, fs in pairs(header) do SetFont(fs) end
    for _, r in ipairs(rows) do
        SetFont(r.name); SetFont(r.cpu); SetFont(r.mem)
    end
    bg:SetColorTexture(0, 0, 0, ns.Get("overlayBackground") / 100)
end

local function CursorX(region)
    return GetCursorPosition() / region:GetEffectiveScale()
end

local function Tooltip(self)
    if sizing then return end
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
        GameTooltip:AddLine("Drag to move. Drag the corner to resize, with Shift to scale. Drag the lines between the columns to change their width.",
            0.6, 0.6, 0.6, true)
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

-- Plain drag resizes (the text keeps its size); Shift-drag scales the
-- whole overlay with its top left corner in place; right-click puts size
-- and scale back.
local function CreateGrip()
    grip = CreateFrame("Button", nil, frame)
    grip:SetSize(GRIP, GRIP)
    grip:SetPoint("BOTTOMRIGHT", -1, 1)
    grip:SetFrameLevel(frame:GetFrameLevel() + 10)
    grip:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up")
    grip:SetHighlightTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Highlight")
    grip:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Down")
    grip:RegisterForClicks("RightButtonUp")

    local leftUI, topUI, grabOffset
    local function ScaleDrag()
        local scale = (CursorX(UIParent) - grabOffset - leftUI) / frame:GetWidth()
        scale = math.floor(math.min(MAX_SCALE, math.max(MIN_SCALE, scale)) * 100 + 0.5) / 100
        if scale ~= frame:GetScale() then
            frame:SetScale(scale)
            frame:ClearAllPoints()
            frame:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", leftUI / scale, topUI / scale)
        end
    end

    grip:SetScript("OnMouseDown", function(self, button)
        if button ~= "LeftButton" then return end
        GameTooltip_Hide()
        if IsShiftKeyDown() then
            local s = frame:GetScale()
            leftUI, topUI = frame:GetLeft() * s, frame:GetTop() * s
            -- Where in the grip the cursor caught it, so the overlay does not jump.
            grabOffset = CursorX(UIParent) - frame:GetRight() * s
            self:SetScript("OnUpdate", ScaleDrag)
        else
            sizing = true
            frame:StartSizing("BOTTOMRIGHT")
        end
    end)
    grip:SetScript("OnMouseUp", function(self, button)
        if button ~= "LeftButton" then return end
        if sizing then
            frame:StopMovingOrSizing()
            sizing = false
        else
            self:SetScript("OnUpdate", nil)
            Save("scale", frame:GetScale())
        end
        SavePlace()
        Render()
    end)
    grip:SetScript("OnClick", function()
        Save("width", nil)
        Save("height", nil)
        Save("scale", nil)
        SavePlace()
        Render()
    end)
    grip:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText("Drag to resize", 1, 1, 1)
        GameTooltip:AddLine("Shift-drag to scale. Right click to reset size and scale.", 0.6, 0.6, 0.6, true)
        GameTooltip:Show()
    end)
    grip:SetScript("OnLeave", GameTooltip_Hide)
end

local function Build()
    frame = CreateFrame("Frame", "SereneOverlayFrame", UIParent)
    frame:SetFrameStrata("HIGH")
    frame:SetClampedToScreen(true)
    frame:SetMovable(true)
    frame:SetResizable(true)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetDontSavePosition(true)

    bg = frame:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    line = frame:CreateTexture(nil, "ARTWORK")
    line:SetColorTexture(1, 1, 1, 0.2)
    line:SetHeight(1)
    summary = NewText("LEFT")
    header.name, header.cpu, header.mem = NewText("LEFT"), NewText("RIGHT"), NewText("RIGHT")
    Style()  -- a font string takes no text before it has a font
    header.name:SetText("AddOn")
    header.cpu:SetText("CPU")
    header.mem:SetText("Memory")
    for _, fs in pairs(header) do fs:SetTextColor(HEADER_COLOR[1], HEADER_COLOR[2], HEADER_COLOR[3]) end
    CreateDivider("cpuW")
    CreateDivider("memW")
    CreateGrip()

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
    frame:SetScript("OnSizeChanged", function(_, w, h)
        if not sizing then return end
        Save("width", w)
        Save("height", h)
        Render()
    end)
    frame:SetScript("OnEnter", Tooltip)
    frame:SetScript("OnLeave", GameTooltip_Hide)
end

local function Apply()
    if ns.Enabled("overlayShown") then
        if not frame then Build() end
        Style()
        Place()
        grip:SetShown(not ns.Enabled("overlayLocked"))
        frame:Show()
        Update()
        if not ticker then ticker = C_Timer.NewTicker(UPDATE_INTERVAL, Update) end
    elseif frame then
        frame:Hide()
        if ticker then ticker:Cancel(); ticker = nil end
    end
end

-- Reset also puts the overlay back in its corner at its default size and
-- unpins every addon.
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
    tooltip = "Unlocked, the overlay drags to move, the corner resizes it (Shift-drag scales it) and the lines between the columns change their width.",
})
ns.RegisterFeature({
    key = "overlayTop", label = "Heaviest addons", section = SECTION, category = "Overlay", type = "slider",
    min = 0, max = 20, step = 1, default = 5, requires = ON, apply = Apply,
    tooltip = "How many of the heaviest addons to list. Pinned addons (the box at the left of an addon under Usage) show besides these.",
})
ns.RegisterFeature({
    key = "overlaySort", label = "Sort by", section = SECTION, category = "Overlay", type = "dropdown",
    default = "mem", requires = ON, apply = Apply,
    options = function()
        return {
            { value = "cpu",  label = "CPU" },
            { value = "mem",  label = "Memory" },
            { value = "name", label = "Name" },
        }
    end,
})

local VALUES = {
    { "overlayFps",         "Framerate" },
    { "overlayLatency",     "Latency" },
    { "overlayCpu",         "Total addon CPU" },
    { "overlayMemory",      "Total addon memory" },
    { "overlayAddonCpu",    "CPU column" },
    { "overlayAddonMemory", "Memory column" },
}
for i, v in ipairs(VALUES) do
    ns.RegisterFeature({
        key = v[1], label = v[2], section = SECTION, category = "Values", requires = ON, apply = Apply,
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
