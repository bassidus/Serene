-------------------------------------------------------------------------------
--  FPS & Latency -- a small on-screen readout ("60 fps  45 ms"). Framerate
--  and latency are separate settings; the box shows whichever are on and is
--  hidden when neither is. Bottom-right corner by default; drag it anywhere
--  with the left mouse button, right-click puts it back. The spot is kept
--  in SereneDB.statsPos. Hovering shows home and world latency apart.
--  Font, outline, layout, labels, value colors and background are settings.
--
--  Blizzard's "Toggle Framerate" key (Ctrl+R by default) shows and hides
--  this box instead: an override binding on whatever key(s) TOGGLEFPS uses
--  clicks a hidden button of ours, so Blizzard's own FPS text never shows.
--  Override bindings cannot change in combat; changes wait for combat to end.
-------------------------------------------------------------------------------
local _, ns = ...

local SECTION = "FPS & Latency"
local UPDATE_INTERVAL = 1
local PAD_X, PAD_Y, LINE_GAP = 5, 3, 2
local DEFAULT_POINT = { "BOTTOMRIGHT", "BOTTOMRIGHT", -6, 6 }

local GOOD, OK, BAD = "40ff40", "ffd100", "ff4040"

local function FpsColor(fps)
    if fps >= 50 then return GOOD elseif fps >= 25 then return OK end
    return BAD
end

local function MsColor(ms)
    if ms < 100 then return GOOD elseif ms < 250 then return OK end
    return BAD
end

local classHex
local function ClassColor()
    if not classHex then
        local _, class = UnitClass("player")
        local c = class and (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[class]
        if not c then return "ffffff" end
        classHex = string.format("%02x%02x%02x", c.r * 255, c.g * 255, c.b * 255)
    end
    return classHex
end

local function ValueColor(kind, v)
    local mode = ns.Get("statsColors")
    if mode == "class" then return ClassColor() end
    return ns.ColorHex(mode) or (kind == "fps" and FpsColor(v) or MsColor(v))
end

local LABELS = { fps = { "FPS: ", " fps" }, ms = { "MS: ", " ms" } }

local function Part(kind, v)
    local num = string.format("|cff%s%d|r", ValueColor(kind, v), v)
    local style = ns.Get("statsLabels")
    if style == "none" then return num end
    if style == "prefix" then return LABELS[kind][1] .. num end
    return num .. LABELS[kind][2]
end

local function Latency()
    local _, _, home, world = GetNetStats()
    home, world = home or 0, world or 0
    local source = ns.Get("statsLatencySource")
    if source == "home" then return home elseif source == "world" then return world end
    return math.max(home, world)
end

local frame, bg, ticker
local lines = {}  -- two font strings, filled in display order

local function Place()
    local p = SereneDB.statsPos or DEFAULT_POINT
    frame:ClearAllPoints()
    frame:SetPoint(p[1], UIParent, p[2], p[3], p[4])
end

local texts, shownText = {}, {}  -- reused every tick; shownText is what is on screen

-- Font, outline and background; runs when a setting changes.
local function Style()
    shownText[1], shownText[2] = nil, nil  -- the next Update lays out again
    local font = ns.Get("statsFont")
    local size = ns.Get("statsFontSize")
    local flags, shadow = ns.FontFlags(ns.Get("statsOutline"))
    for _, fs in ipairs(lines) do
        ns.SetFont(fs, font, size, flags)
        ns.SetShadow(fs, shadow)
    end
    bg:SetColorTexture(0, 0, 0, ns.Get("statsBackground") / 100)
end

local function Update()
    local n = 0
    if ns.Enabled("statsFps") then
        n = n + 1
        texts[n] = Part("fps", math.floor((GetFramerate() or 0) + 0.5))
    end
    if ns.Enabled("statsLatency") then
        n = n + 1
        texts[n] = Part("ms", Latency())
    end
    for i = n + 1, #lines do texts[i] = nil end

    -- Nothing changed since the last tick: skip the relayout.
    if texts[1] == shownText[1] and texts[2] == shownText[2] then return end
    shownText[1], shownText[2] = texts[1], texts[2]

    local stacked = ns.Get("statsLayout") == "stacked"
    local gap = math.floor(ns.Get("statsFontSize") * 0.8)
    local x, y, w, h = 0, 0, 0, 0
    for i, fs in ipairs(lines) do
        local s = texts[i]
        fs:SetShown(s ~= nil)
        if s then
            fs:SetText(s)
            local sw, sh = fs:GetStringWidth(), fs:GetStringHeight()
            fs:ClearAllPoints()
            if stacked then
                if i > 1 then y = y + LINE_GAP end
                fs:SetPoint("TOPLEFT", frame, "TOPLEFT", PAD_X, -PAD_Y - y)
                y = y + sh
                w, h = math.max(w, sw), y
            else
                if i > 1 then x = x + gap end
                fs:SetPoint("TOPLEFT", frame, "TOPLEFT", PAD_X + x, -PAD_Y)
                x = x + sw
                w, h = x, math.max(h, sh)
            end
        end
    end
    frame:SetSize(w + 2 * PAD_X, h + 2 * PAD_Y)
end

local function Build()
    frame = CreateFrame("Frame", "SereneStatsDisplay", UIParent)
    frame:SetFrameStrata("HIGH")
    frame:SetClampedToScreen(true)
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")
    if frame.SetDontSavePosition then frame:SetDontSavePosition(true) end

    bg = frame:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    for i = 1, 2 do
        local fs = frame:CreateFontString(nil, "OVERLAY")
        fs:SetJustifyH("LEFT")
        lines[i] = fs
    end

    frame:SetScript("OnDragStart", function(self)
        if ns.Enabled("statsLocked") then return end
        GameTooltip_Hide()
        self:StartMoving()
    end)
    frame:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        self:SetUserPlaced(false)
        local point, _, relPoint, x, y = self:GetPoint()
        SereneDB.statsPos = { point, relPoint, x, y }
    end)
    frame:SetScript("OnMouseUp", function(_, button)
        if button == "RightButton" and not ns.Enabled("statsLocked") then
            SereneDB.statsPos = nil
            Place()
        end
    end)
    frame:SetScript("OnEnter", function(self)
        local _, _, home, world = GetNetStats()
        GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT")
        GameTooltip:SetText("FPS & Latency", 1, 1, 1)
        GameTooltip:AddDoubleLine("Framerate", string.format("%.0f fps", GetFramerate() or 0), 1, 0.82, 0, 1, 1, 1)
        GameTooltip:AddDoubleLine("Latency (home)", (home or 0) .. " ms", 1, 0.82, 0, 1, 1, 1)
        GameTooltip:AddDoubleLine("Latency (world)", (world or 0) .. " ms", 1, 0.82, 0, 1, 1, 1)
        if not ns.Enabled("statsLocked") then
            GameTooltip:AddLine(" ")
            GameTooltip:AddLine("Drag to move. Right-click to reset the position.", 0.6, 0.6, 0.6)
        end
        GameTooltip:Show()
    end)
    frame:SetScript("OnLeave", GameTooltip_Hide)

    Place()
end

local function Apply()
    SereneDB.statsDisplay = nil    -- the old on/off switch, replaced by the two settings
    SereneDB.statsToggleKey = nil  -- the toggle key is always ours now
    if ns.Enabled("statsFps") or ns.Enabled("statsLatency") then
        if not frame then Build() end
        Style()
        frame:Show()
        Update()
        if not ticker then ticker = C_Timer.NewTicker(UPDATE_INTERVAL, Update) end
    elseif frame then
        frame:Hide()
        if ticker then ticker:Cancel(); ticker = nil end
    end
end

-- Reset Defaults also puts the box back in its corner.
ns.OnReset(function()
    SereneDB.statsPos = nil
    SereneDB.statsToggleMemory = nil
    if frame then Place() end
end)

-------------------------------------------------------------------------------
--  Toggle key -- hides the box, remembering which of the two were on, and
--  brings exactly those back (both if nothing is remembered).
-------------------------------------------------------------------------------
local toggleButton = CreateFrame("Button", "SereneStatsToggle", UIParent)
toggleButton:SetScript("OnClick", function()
    local fps, latency = ns.Enabled("statsFps"), ns.Enabled("statsLatency")
    if fps or latency then
        SereneDB.statsToggleMemory = { fps = fps and true or false, latency = latency and true or false }
        fps, latency = false, false
    else
        local last = SereneDB.statsToggleMemory
        fps, latency = not last or last.fps, not last or last.latency
        SereneDB.statsToggleMemory = nil
    end
    SereneDB.statsFps, SereneDB.statsLatency = fps, latency
    Apply()
    if ns.RefreshOptions then ns.RefreshOptions() end
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
            SetOverrideBindingClick(bindOwner, false, key, "SereneStatsToggle")
        end
    end
end

bindOwner:RegisterEvent("PLAYER_LOGIN")
bindOwner:RegisterEvent("UPDATE_BINDINGS")
bindOwner:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_REGEN_ENABLED" or event == "PLAYER_LOGIN" then self:UnregisterEvent(event) end
    if SereneDB then UpdateBinding() end
end)

-------------------------------------------------------------------------------
--  Settings
-------------------------------------------------------------------------------
local MOVE_HINT = "\nThe box sits bottom right by default; drag it anywhere, right-click it to put it back."
ns.RegisterFeature({
    key = "statsFps", label = "Show Framerate", section = SECTION, apply = Apply,
    tooltip = "Shows the framerate on screen, next to the latency when both are on." .. MOVE_HINT,
})
ns.RegisterFeature({
    key = "statsLatency", label = "Show Latency", section = SECTION, apply = Apply,
    tooltip = "Shows the latency on screen (hover the box for home and world apart)." .. MOVE_HINT,
})
ns.RegisterFeature({
    key = "statsLocked", label = "Lock Position", section = SECTION, default = false, apply = Apply,
    tooltip = "Stops the box from being dragged or reset by right-click.",
})
ns.RegisterFeature({
    key = "statsLatencySource", label = "Latency Shown", section = SECTION, type = "dropdown", default = "max",
    apply = Apply,
    tooltip = "Which latency the box shows. Home is your connection to the realm (chat, auction house); world is combat and movement.",
    options = function()
        return {
            { value = "max",   label = "Highest of home and world" },
            { value = "home",  label = "Home" },
            { value = "world", label = "World" },
        }
    end,
})
ns.RegisterFeature({
    key = "statsLayout", label = "Layout", section = SECTION, type = "dropdown", default = "row",
    apply = Apply,
    tooltip = "Framerate and latency side by side, or one above the other.",
    options = function()
        return {
            { value = "row",     label = "Side by side" },
            { value = "stacked", label = "Stacked" },
        }
    end,
})
ns.RegisterFeature({
    key = "statsLabels", label = "Labels", section = SECTION, type = "dropdown", default = "suffix",
    apply = Apply,
    tooltip = "How the numbers are labeled.",
    options = function()
        return {
            { value = "suffix", label = "60 fps  45 ms" },
            { value = "prefix", label = "FPS: 60  MS: 45" },
            { value = "none",   label = "60  45 (numbers only)" },
        }
    end,
})
ns.RegisterFeature({
    key = "statsColors", label = "Number Colors", section = SECTION, type = "color", default = "status",
    apply = Apply,
    tooltip = "Color of the numbers.",
    specials = {
        { value = "status", label = "By value",
          tooltip = "Green is good, yellow is so-so, red is bad (framerate 50 / 25, latency 100 / 250 ms)." },
        { value = "class",  label = "Class", tooltip = "Your class color." },
    },
})
ns.RegisterFeature({
    key = "statsFont", label = "Font", section = SECTION, type = "dropdown", default = "default",
    preview = true, apply = Apply,
    tooltip = "Typeface for the box.",
    options = ns.FontOptions,
})
ns.RegisterFeature({
    key = "statsFontSize", label = "Font Size", section = SECTION, type = "slider",
    min = 8, max = 28, step = 1, default = 12, apply = Apply,
    tooltip = "Size of the text.",
})
ns.RegisterFeature({
    key = "statsOutline", label = "Outline", section = SECTION, type = "outline", default = "OUTLINE",
    apply = Apply,
    tooltip = "Edge around the text, to keep it readable on bright backgrounds; tick any number. "
        .. "Thick wins over Outline.",
})
ns.RegisterFeature({
    key = "statsBackground", label = "Background Opacity", section = SECTION, type = "slider",
    min = 0, max = 100, step = 5, default = 0, apply = Apply,
    tooltip = "Dark backdrop behind the text, in percent. 0 = none.",
})
