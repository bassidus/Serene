-------------------------------------------------------------------------------
--  Short Keybind Text -- condenses the hotkey label on Blizzard's action bars
--  (CTRL-2 -> C2, Mouse Button 4 -> M4, NUMPAD5 -> N5) and styles it. Only
--  the button texts are touched, never the (secure) buttons.
-------------------------------------------------------------------------------
local _, ns = ...

local shortText = {}  -- [key] = its short text, made once

local function FormatHotkeyText(key)
    if shortText[key] then return shortText[key] end
    local text = key
    -- Gamepad binds resolve to glyph markup (no substitution below matches);
    -- keyboard binds keep the raw tokens the substitutions are written against.
    local resolved = GetBindingText(text, 1)
    if resolved:find("|A:", 1, true) then
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
    shortText[key] = text
    return text
end

-- The bars' buttons and the vehicle bar's, which uses the main bar's binds.
local BARS = { { "OverrideActionBarButton", "ACTIONBUTTON", 6 }, unpack(ns.ACTION_BUTTONS) }

-- The method each bar rewrites its hotkey text with on every binding or
-- action change, re-applied right after; the stance bar has none, so only
-- UPDATE_BINDINGS reaches it.
local HOTKEY_METHOD = { PetActionButton = "SetHotkeys", StanceButton = false }

local buttons = {}  -- [button] = binding command

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
--  Style -- font, size, outline and color of the hotkey text and
--  the macro name. Blizzard's look is captured per text just before its
--  first change and put back exactly once a setting returns to default.
--  Untouched texts cost nothing.
-------------------------------------------------------------------------------
-- One entry per text: the button's field. Both texts share one set of
-- settings, read into `look` once per Apply.
local KEYBIND = { field = "HotKey" }
local MACRO = { field = "Name" }
local TEXTS = { KEYBIND, MACRO }
local DEFAULT_SIZE = 12  -- Blizzard's keybind size, where the size slider starts
local look = {}

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
        o.t = t
        -- Blizzard's in-range color (o.r/g/b) and, while out of range, its red.
        local r, g, b = fs:GetTextColor()
        if IsRed(r, g, b) then
            o.red, o.rr, o.rg, o.rb = true, r, g, b
            r, g, b = LIGHTGRAY_FONT_COLOR:GetRGB()
        end
        o.r, o.g, o.b = r, g, b
        orig[fs] = o
    end
    return o
end

local function StyleFont(fs, o)
    if look.font == "default" and look.size == DEFAULT_SIZE and look.outline == "default" then
        if o.font then ns.RestoreFont(fs, o) end
        o.font = nil
        return
    end
    -- Relative to each text's own size, so the macro name and pet/stance
    -- text stay smaller.
    ns.ApplyFont(fs, o, look.font, o.size + look.size - DEFAULT_SIZE, look.outline)
    o.font = true
end

-- The color the text should have: Blizzard's out of range red (unless Range
-- Coloring shows range on the icon), else our color, else Blizzard's own.
local function Wanted(o)
    if o.red and not o.t.noRed then return o.rr, o.rg, o.rb end
    if look.color then return look.color[1], look.color[2], look.color[3] end
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
    if look.color or o.t.noRed then
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

local function ReadSettings()
    look.font, look.size, look.outline = ns.Get("buttonTextFont"), ns.Get("buttonTextFontSize"),
        ns.Get("buttonTextOutline")
    local mode = ns.Get("buttonTextColor")
    local r, g, b = ns.ColorRGB(mode == "class" and ns.PlayerClassHex() or mode)
    look.color = r and { r, g, b } or nil
    MACRO.styled = look.font ~= "default" or look.size ~= DEFAULT_SIZE or look.outline ~= "default"
        or look.color ~= nil
    -- Range Coloring is on: the icon shows range, the keybind stays put.
    KEYBIND.noRed = ns.Get("rangeColors")
    KEYBIND.styled = MACRO.styled or KEYBIND.noRed
end

local function Style(btn)
    for _, t in ipairs(TEXTS) do
        local fs = btn[t.field]
        if fs and (t.styled or orig[fs]) then
            local o = Original(fs, t)
            StyleFont(fs, o)
            StyleColor(fs, o)
        end
    end
end

-- Blizzard's look of button 1's text, for the options' Default previews.
local function Button1(t)
    return Original(ActionButton1[t.field], t)
end

for _, bar in ipairs(BARS) do
    local prefix, command, count = bar[1], bar[2], bar[3]
    local method = HOTKEY_METHOD[prefix]
    if method == nil then method = "UpdateHotkeys" end
    for i = 1, count do
        local btn = _G[prefix .. i]
        buttons[btn] = command .. i
        if method then hooksecurefunc(btn, method, Update) end
    end
end

-- Rewrites every button; settings back on default put Blizzard's look back.
local function Apply()
    ReadSettings()
    local enabled = ns.Get("shortKeybinds")
    local hideKeybinds, hideMacros = ns.Get("hideKeybinds"), ns.Get("hideMacroText")
    for btn in pairs(buttons) do
        SetText(btn, enabled)
        Style(btn)
        -- Hidden with alpha only, so Blizzard's own text updates carry on.
        ns.SetHidden(btn.HotKey, hideKeybinds)
        ns.SetHidden(btn.Name, hideMacros)
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

-- Every Buttons checkbox is registered here, since the page lists them in
-- registration order and range color and zoom load later; their applies are
-- looked up when they run.
ns.RegisterFeature({
    key = "shortKeybinds", label = "Short keybinds", section = SECTION, category = "Buttons",
    tooltip = "For example CTRL-2 > C2",
    requires = "!hideKeybinds",
    apply = ApplySetting,
})
ns.RegisterFeature({
    key = "rangeColors", label = "Enable out of range color", section = SECTION, category = "Buttons",
    tooltip = "Red overlay on buttons when target is out of range.",
    beside = true, apply = function() ns.ApplyRangeColors() end,
})
ns.RegisterFeature({
    key = "hideKeybinds", label = "Hide keybinds", section = SECTION, category = "Buttons",
    tooltip = "Hide keybinds on buttons.",
    default = false,
    apply = ApplySetting,
})
ns.RegisterFeature({
    key = "zoomActionIcons", label = "Zoom button icons", section = SECTION, category = "Buttons",
    tooltip = "Crops the rough edges off the icons.",
    beside = true, apply = function() ns.ApplyZoomIcons() end,
})
ns.RegisterFeature({
    key = "hideMacroText", label = "Hide macros", section = SECTION, category = "Buttons",
    tooltip = "Hide macro names.",
    default = false,
    apply = ApplySetting,
})
ns.RegisterFontSettings({
    prefix = "buttonText", label = "Keybind and macro text", section = SECTION, category = "Buttons",
    font = "Fonts\\FRIZQT__.TTF",
    size = { 6, 24, DEFAULT_SIZE }, outline = "default", color = "buttonTextColor", button = "Font",
    beside = true,
    apply = ApplySetting,
    blizzard = function()
        local o = Button1(KEYBIND)
        return ns.OutlineOf(o.flags, o.sx, o.sy)
    end,
})
ns.RegisterFeature({
    key = "buttonTextColor", label = "Keybind and macro color", section = SECTION, category = "Buttons",
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
