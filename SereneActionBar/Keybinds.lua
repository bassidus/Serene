-------------------------------------------------------------------------------
--  Short Keybind Text -- condenses the hotkey label on Blizzard's action bars
--  (CTRL-2 -> C2, Mouse Button 4 -> M4, NUMPAD5 -> N5) and styles it. Only
--  the button texts are touched, never the (secure) buttons.
-------------------------------------------------------------------------------
local _, ns = ...

local function FormatHotkeyText(text)
    -- Gamepad binds resolve to glyph markup (no substitution below matches);
    -- keyboard binds keep the raw tokens the substitutions are written against.
    local resolved = GetBindingText(text, 1)
    if resolved and resolved:find("|A:", 1, true) then
        text = resolved
    end
    text = text:gsub("CTRL%-", "C")
    text = text:gsub("ALT%-", "A")
    text = text:gsub("SHIFT%-", "S")
    text = text:gsub("META%-", "M")
    text = text:gsub("MOUSEWHEELUP", "MwU")
    text = text:gsub("MOUSEWHEELDOWN", "MwD")
    text = text:gsub("CAPSLOCK", "Caps")
    -- Specific NUMPAD keys before the generic prefix, or they become unmatchable.
    text = text:gsub("NUMPADDECIMAL", "N.")
    text = text:gsub("NUMPADPLUS", "N+")
    text = text:gsub("NUMPADMINUS", "N-")
    text = text:gsub("NUMPADMULTIPLY", "N*")
    text = text:gsub("NUMPADDIVIDE", "N/")
    text = text:gsub("NUMPAD", "N")
    text = text:gsub("BUTTON", "M")
    return text
end

-- The bars' buttons and the vehicle bar's, which uses the main bar's binds.
local BARS = { { "OverrideActionBarButton", "ACTIONBUTTON", 6 }, unpack(ns.ACTION_BUTTONS) }

-- The method each bar rewrites its hotkey text with on every binding or
-- action change, re-applied right after; the stance bar has none, so only
-- UPDATE_BINDINGS reaches it.
local HOTKEY_METHOD = { PetActionButton = "SetHotkeys", StanceButton = false }

local buttons = {}  -- [button] = binding command
local hooked = {}

local function BindingKey(btn)
    return GetBindingKey(buttons[btn]) or GetBindingKey("CLICK " .. btn:GetName() .. ":LeftButton")
end

-- No binding: leave Blizzard's text alone (it hides it or shows the range dot).
local function SetText(btn, enabled)
    local hk = btn.HotKey
    local key = BindingKey(btn)
    if not key then return end
    if enabled then
        hk:SetText(FormatHotkeyText(key))
    else
        hk:SetText(GetBindingText(key, 1))
    end
    hk:Show()
end

-- After Blizzard's own refresh. When off, Blizzard's text already stands.
local function Update(btn)
    if ns.Get("shortKeybinds") then SetText(btn, true) end
end

-------------------------------------------------------------------------------
--  Style -- font, size, outline, color and position of the hotkey text and
--  the macro name. Blizzard's look is captured per text just before its
--  first change and put back exactly once a setting returns to default.
--  Untouched texts cost nothing.
-------------------------------------------------------------------------------
-- One entry per text: the button's field, its settings prefix and Blizzard's
-- size. Offsets put the text's `point` relative to the button's `rel`; at
-- Blizzard's spot (x, y) its exact anchors are put back. The fractions are
-- where that spot really lands (button 1), so the first step does not jump.
-- Moved keybinds are centered on their spot; Blizzard right-aligns them,
-- ending at 18.5, so its spot is about the middle of a short bind like C2.
-- Current settings are read into each entry once per Apply.
local KEYBIND = { field = "HotKey", prefix = "keybind", defaultSize = 12, point = "CENTER", rel = "CENTER",
                  justify = "CENTER", x = 12, y = 13, fx = 0, fy = -0.5 }  -- Blizzard: 12.5 high
local MACRO = { field = "Name", prefix = "macro", defaultSize = 10, point = "BOTTOM", rel = "BOTTOM",
                justify = "CENTER", x = 0, y = 2, fx = 0, fy = 0 }
local TEXTS = { KEYBIND, MACRO }

local orig = {}  -- [text] = Blizzard's look
local painting  -- set while we color, so our own calls are not taken for Blizzard's

-- Blizzard turns the hotkey red while the target is out of range.
local function IsRed(r, g, b)
    return r > 0.9 and g < 0.3 and b < 0.3
end

local function Original(fs, t)
    local o = orig[fs]
    if not o then
        o = ns.FontState(fs)
        o.t, o.justify, o.points = t, fs:GetJustifyH(), {}
        -- Blizzard's in-range color (o.r/g/b) and, while out of range, its red.
        local r, g, b = fs:GetTextColor()
        if IsRed(r, g, b) then
            o.red, o.rr, o.rg, o.rb = true, r, g, b
            r, g, b = LIGHTGRAY_FONT_COLOR:GetRGB()
        end
        o.r, o.g, o.b = r, g, b
        for i = 1, fs:GetNumPoints() do o.points[i] = { fs:GetPoint(i) } end
        orig[fs] = o
    end
    return o
end

local function StyleFont(fs, o)
    local t = o.t
    if t.font == "default" and t.size == t.defaultSize and t.outline == "default" then
        if o.font then ns.RestoreFont(fs, o) end
        o.font = nil
        return
    end
    -- Relative to each text's own size, so smaller pet/stance text stays smaller.
    ns.ApplyFont(fs, o, t.font, o.size + t.size - t.defaultSize, t.outline)
    o.font = true
end

-- The color the text should have: Blizzard's out of range red (unless Range
-- Coloring shows range on the icon), else our color, else Blizzard's own.
local function Wanted(o)
    local t = o.t
    if o.red and not t.noRed then return o.rr, o.rg, o.rb end
    if t.color then return t.color[1], t.color[2], t.color[3] end
    return o.r, o.g, o.b
end

local function Paint(fs, r, g, b)
    painting = true
    fs:SetTextColor(r, g, b)
    painting = nil
end

-- Every color Blizzard sets is remembered; while we manage the color, ours
-- goes straight back on.
local function OnColor(fs, r, g, b)
    if painting then return end
    local o = orig[fs]
    if IsRed(r, g, b) then
        o.red, o.rr, o.rg, o.rb = true, r, g, b
    else
        o.red, o.r, o.g, o.b = nil, r, g, b
    end
    if o.colored then
        local wr, wg, wb = Wanted(o)
        if wr ~= r or wg ~= g or wb ~= b then Paint(fs, wr, wg, wb) end
    end
end

local function StyleColor(fs, o)
    if o.t.color or o.t.noRed then
        if not o.hooked then
            o.hooked = true
            hooksecurefunc(fs, "SetTextColor", OnColor)
            hooksecurefunc(fs, "SetVertexColor", OnColor)
        end
        o.colored = true
        Paint(fs, Wanted(o))
    elseif o.colored then
        o.colored = nil
        Paint(fs, Wanted(o))  -- Blizzard's own color, red included
    end
end

local function Place(btn, fs, o)
    local t = o.t
    if t.offX == t.x and t.offY == t.y then
        if o.placed then
            fs:ClearAllPoints()
            for _, p in ipairs(o.points) do fs:SetPoint(p[1], p[2], p[3], p[4], p[5]) end
            fs:SetJustifyH(o.justify)
            o.placed = nil
        end
        return
    end
    fs:ClearAllPoints()
    fs:SetPoint(t.point, btn, t.rel, t.offX + t.fx, t.offY + t.fy)
    fs:SetJustifyH(t.justify)
    o.placed = true
end

local function ReadSettings()
    for _, t in ipairs(TEXTS) do
        local p = t.prefix
        t.font, t.size, t.outline = ns.Get(p .. "Font"), ns.Get(p .. "FontSize"), ns.Get(p .. "Outline")
        t.offX, t.offY = ns.Get(p .. "OffsetX"), ns.Get(p .. "OffsetY")
        local mode = ns.Get(p .. "Color")
        local r, g, b = ns.ColorRGB(mode == "class" and ns.PlayerClassHex() or mode)
        t.color = r and { r, g, b } or nil
        t.styled = t.font ~= "default" or t.size ~= t.defaultSize or t.outline ~= "default" or t.color ~= nil
            or t.offX ~= t.x or t.offY ~= t.y
    end
    -- Range Coloring is on: the icon shows range, the keybind stays put.
    KEYBIND.noRed = ns.Get("rangeColors")
    KEYBIND.styled = KEYBIND.styled or KEYBIND.noRed
end

local function Style(btn)
    for _, t in ipairs(TEXTS) do
        local fs = btn[t.field]
        if fs and (t.styled or orig[fs]) then
            local o = Original(fs, t)
            StyleFont(fs, o)
            StyleColor(fs, o)
            Place(btn, fs, o)
        end
    end
end

-- Blizzard's look of button 1's text, for the options' Default previews.
local function Button1(t)
    return Original(ActionButton1[t.field], t)
end

local function CollectButtons()
    for _, bar in ipairs(BARS) do
        local prefix, command, count = bar[1], bar[2], bar[3]
        local method = HOTKEY_METHOD[prefix]
        if method == nil then method = "UpdateHotkeys" end
        for i = 1, count do
            local btn = _G[prefix .. i]
            buttons[btn] = command .. i
            if method and not hooked[btn] then
                hooked[btn] = true
                hooksecurefunc(btn, method, Update)
            end
        end
    end
end


-- Rewrites every button; settings back on default put Blizzard's look back.
local function Apply()
    CollectButtons()
    ReadSettings()
    local enabled = ns.Get("shortKeybinds")
    local showMacro = ns.Get("showMacroText")
    for btn in pairs(buttons) do
        SetText(btn, enabled)
        Style(btn)
        -- Hidden with alpha only, so Blizzard's own text updates carry on.
        ns.SetHidden(btn.Name, not showMacro)
    end
end

-- Deferred one frame so Blizzard's own UPDATE_BINDINGS pass runs first; a
-- burst of events (or settings applied together at login) is handled once.
-- Events only matter while something is changed; a setting change always runs.
local pending, forced = false, false
local function Run()
    pending = false
    if forced or KEYBIND.styled or MACRO.styled or ns.Get("shortKeybinds") then Apply() end
    forced = false
end
local function Queue(force)
    if force then forced = true end
    if pending then return end
    pending = true
    C_Timer.After(0, Run)
end
local function ApplySetting() Queue(true) end
ns.RefreshKeybinds = ApplySetting  -- Range Coloring changes whether the text turns red

local f = CreateFrame("Frame")
f:RegisterEvent("UPDATE_BINDINGS")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function() Queue() end)

-------------------------------------------------------------------------------
--  Settings
-------------------------------------------------------------------------------
local SECTION = "Action Bars"

ns.RegisterFeature({
    key = "shortKeybinds", label = "Shorten keybind text", section = SECTION, category = "Settings",
    tooltip = "Text and range color on the action buttons",
    apply = ApplySetting,
})
ns.RegisterFeature({
    key = "showMacroText", label = "Show macro names", section = SECTION, category = "Settings",
    beside = true,
    apply = ApplySetting,
})
ns.RegisterFontSettings({
    prefix = "keybind", label = "Keybind text", section = SECTION, category = "Settings", apply = ApplySetting,
    size = { 6, 24, KEYBIND.defaultSize }, outline = "default", color = "keybindColor", button = "Font",
    position = "keybindOffsetX",
    blizzard = function()
        local o = Button1(KEYBIND)
        return ns.OutlineOf(o.flags, o.sx, o.sy)
    end,
})
ns.RegisterFeature({
    key = "keybindColor", label = "Keybind color", section = SECTION, category = "Settings",
    type = "color", default = "default",
    apply = ApplySetting,
    specials = {
        { value = "default", label = "Default", swatch = function()
            local o = Button1(KEYBIND)
            return ns.RGBToHex(o.r, o.g, o.b)
        end },
        { value = "class",   label = "Class", swatch = ns.PlayerClassHex },
    },
})
-- Both pads reach 12 past the button on every side, so they look alike:
-- the keybind counts from the middle of the button, the macro name from
-- its bottom.
ns.RegisterPositionSettings({
    prefix = "keybind", label = "Keybind position", section = SECTION, category = "Settings",
    apply = ApplySetting, x = { -30, 30, KEYBIND.x }, y = { -30, 30, KEYBIND.y }, box = { -18, 18, -18, 18 },
})
ns.RegisterFontSettings({
    prefix = "macro", label = "Macro name text", section = SECTION, category = "Settings", apply = ApplySetting,
    beside = true,
    size = { 6, 24, MACRO.defaultSize }, outline = "default", color = "macroColor", requires = "showMacroText",
    button = "Font", position = "macroOffsetX",
    blizzard = function()
        local o = Button1(MACRO)
        return ns.OutlineOf(o.flags, o.sx, o.sy)
    end,
})
ns.RegisterFeature({
    key = "macroColor", label = "Macro name color", section = SECTION, category = "Settings",
    type = "color", default = "default", requires = "showMacroText",
    apply = ApplySetting,
    specials = {
        { value = "default", label = "Default", swatch = function()
            local o = Button1(MACRO)
            return ns.RGBToHex(o.r, o.g, o.b)
        end },
        { value = "class",   label = "Class", swatch = ns.PlayerClassHex },
    },
})
ns.RegisterPositionSettings({
    prefix = "macro", label = "Macro name position", section = SECTION, category = "Settings",
    apply = ApplySetting, requires = "showMacroText",
    x = { -30, 30, MACRO.x }, y = { -12, 48, MACRO.y }, box = { -18, 18, 0, 36 },
})
