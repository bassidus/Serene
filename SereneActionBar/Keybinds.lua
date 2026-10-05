-------------------------------------------------------------------------------
--  Short Keybind Text -- condenses the hotkey label on Blizzard's action bars
--  (CTRL-2 -> C2, Mouse Button 4 -> M4, NUMPAD5 -> N5) and styles it. Only
--  the button texts are touched, never the (secure) buttons.
-------------------------------------------------------------------------------
local _, ns = ...

local function FormatHotkeyText(text)
    if not text or text == "" then return "" end
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
    text = text:gsub("Mouse Button ", "M")
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

-- Blizzard button name prefix -> binding command prefix.
local BARS = {
    { "ActionButton",              "ACTIONBUTTON",          12 },
    { "MultiBarBottomLeftButton",  "MULTIACTIONBAR1BUTTON", 12 },
    { "MultiBarBottomRightButton", "MULTIACTIONBAR2BUTTON", 12 },
    { "MultiBarRightButton",       "MULTIACTIONBAR3BUTTON", 12 },
    { "MultiBarLeftButton",        "MULTIACTIONBAR4BUTTON", 12 },
    { "MultiBar5Button",           "MULTIACTIONBAR5BUTTON", 12 },
    { "MultiBar6Button",           "MULTIACTIONBAR6BUTTON", 12 },
    { "MultiBar7Button",           "MULTIACTIONBAR7BUTTON", 12 },
    { "OverrideActionBarButton",   "ACTIONBUTTON",          6 },
    { "StanceButton",              "SHAPESHIFTBUTTON",      10 },
    { "PetActionButton",           "BONUSACTIONBUTTON",     10 },
}

local buttons = {}  -- [button] = binding command
local hooked = setmetatable({}, { __mode = "k" })

local function BindingKey(btn)
    local key = GetBindingKey(buttons[btn])
    if not key and btn.GetName and btn:GetName() then
        key = GetBindingKey("CLICK " .. btn:GetName() .. ":LeftButton")
    end
    return key
end

-- Formatted text per binding key; bindings are few and rarely change.
local short = {}

-- No binding: leave Blizzard's text alone (it hides it or shows the range dot).
local function SetText(btn, enabled)
    local hk = btn.HotKey
    if not hk then return end
    local key = BindingKey(btn)
    if not key then return end
    if enabled then
        local text = short[key]
        if not text then
            text = FormatHotkeyText(key)
            short[key] = text
        end
        hk:SetText(text)
    else
        hk:SetText(GetBindingText(key, 1))
    end
    hk:Show()
end

-- After Blizzard's own refresh. When off, Blizzard's text already stands.
local function Update(btn)
    if ns.Enabled("shortKeybinds") then SetText(btn, true) end
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

local orig = setmetatable({}, { __mode = "k" })  -- [text] = Blizzard's look
local painting  -- set while we color, so our own calls are not taken for Blizzard's

-- Blizzard turns the hotkey red while the target is out of range.
local function IsRed(r, g, b)
    return type(r) == "number" and r > 0.9 and g < 0.3 and b < 0.3
end

local function Original(fs, t)
    local o = orig[fs]
    if not o then
        local path, sz, flags = fs:GetFont()
        local sr, sg, sb, sa = fs:GetShadowColor()
        o = { t = t, path = path, size = sz, flags = flags, shadow = { sr, sg, sb, sa },
              justify = fs:GetJustifyH(), points = {} }
        o.sx, o.sy = fs:GetShadowOffset()
        -- Blizzard's in-range color (o.r/g/b) and, while out of range, its red.
        local r, g, b = fs:GetTextColor()
        if IsRed(r, g, b) then
            o.red, o.rr, o.rg, o.rb = true, r, g, b
            local c = LIGHTGRAY_FONT_COLOR
            if c then r, g, b = c.r, c.g, c.b else r, g, b = 0.75, 0.75, 0.75 end
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
        if o.font and o.path then
            fs:SetFont(o.path, o.size, o.flags or "")
            fs:SetShadowColor(o.shadow[1], o.shadow[2], o.shadow[3], o.shadow[4])
            fs:SetShadowOffset(o.sx or 0, o.sy or 0)
        end
        o.font = nil
        return
    end
    local flags, shadow = o.flags, nil
    if t.outline ~= "default" then flags, shadow = ns.FontFlags(t.outline) end
    -- Relative to each text's own size, so smaller pet/stance text stays smaller.
    ns.SetFont(fs, t.font, (o.size or t.defaultSize) + t.size - t.defaultSize, flags, o.path)
    if t.outline == "default" then
        fs:SetShadowColor(o.shadow[1], o.shadow[2], o.shadow[3], o.shadow[4])
        fs:SetShadowOffset(o.sx or 0, o.sy or 0)
    else
        ns.SetShadow(fs, shadow)
    end
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
            if fs.SetVertexColor then hooksecurefunc(fs, "SetVertexColor", OnColor) end
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
            fs:SetJustifyH(o.justify or t.justify)
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
    KEYBIND.noRed = ns.Enabled("rangeColors") and true or false
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
    local fs = _G.ActionButton1 and _G.ActionButton1[t.field]
    return fs and Original(fs, t)
end

local function CollectButtons()
    for _, bar in ipairs(BARS) do
        local prefix, command, count = bar[1], bar[2], bar[3]
        for i = 1, count do
            local btn = _G[prefix .. i]
            if btn and btn.HotKey then
                buttons[btn] = command .. i
                if not hooked[btn] then
                    hooked[btn] = true
                    -- Blizzard rewrites the text on every binding/action change;
                    -- re-apply right after whichever refresh method the button has.
                    for _, method in ipairs({ "UpdateHotkeys", "SetHotkeys" }) do
                        if type(btn[method]) == "function" then
                            hooksecurefunc(btn, method, Update)
                        end
                    end
                end
            end
        end
    end
end

-- Macro names: hidden with alpha only, so Blizzard's own text updates carry on.
local macroHidden = setmetatable({}, { __mode = "k" })
local function MacroText(btn, show)
    local name = btn.Name
    if not name then return end
    if not show then
        name:SetAlpha(0)
        macroHidden[name] = true
    elseif macroHidden[name] then
        name:SetAlpha(1)
        macroHidden[name] = nil
    end
end

-- Rewrites every button; settings back on default put Blizzard's look back.
local function Apply()
    CollectButtons()
    ReadSettings()
    local enabled = ns.Enabled("shortKeybinds")
    local showMacro = ns.Enabled("showMacroText")
    for btn in pairs(buttons) do
        SetText(btn, enabled)
        Style(btn)
        MacroText(btn, showMacro)
    end
end

-- Deferred one frame so Blizzard's own UPDATE_BINDINGS pass runs first; a
-- burst of events (or settings applied together at login) is handled once.
-- Events only matter while something is changed; a setting change always runs.
local pending, forced = false, false
local function Run()
    pending = false
    if forced or KEYBIND.styled or MACRO.styled or ns.Enabled("shortKeybinds") then Apply() end
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
f:SetScript("OnEvent", function()
    if SereneDB then Queue() end
end)

-------------------------------------------------------------------------------
--  Settings
-------------------------------------------------------------------------------
local SECTION = "Action bars"

ns.RegisterFeature({
    key = "shortKeybinds", label = "Shorten keybind text", section = SECTION, category = "Keybinds",
    apply = ApplySetting,
    tooltip = "Shortens the keybind shown on each button: CTRL-2 becomes C2, Mouse Button 4 M4, NUMPAD5 N5.",
})
ns.RegisterFontSettings({
    prefix = "keybind", label = "Keybind text", section = SECTION, category = "Keybinds", apply = ApplySetting,
    size = { 6, 24, KEYBIND.defaultSize }, outline = "default", color = "keybindColor", button = "Font",
    position = "keybindOffsetX",
    blizzard = function()
        local o = Button1(KEYBIND)
        return o and ns.OutlineOf(o.flags, o.sx, o.sy) or {}
    end,
})
ns.RegisterFeature({
    key = "keybindColor", label = "Keybind color", section = SECTION, category = "Keybinds",
    type = "color", default = "default",
    apply = ApplySetting,
    specials = {
        { value = "default", label = "Default", swatch = function()
            local o = Button1(KEYBIND)
            return o and ns.RGBToHex(o.r, o.g, o.b)
        end },
        { value = "class",   label = "Class", swatch = ns.PlayerClassHex },
    },
})
-- Both pads reach 12 past the button on every side, so they look alike:
-- the keybind counts from the middle of the button, the macro name from
-- its bottom.
ns.RegisterPositionSettings({
    prefix = "keybind", label = "Keybind position", section = SECTION, category = "Keybinds",
    apply = ApplySetting, x = { -30, 30, KEYBIND.x }, y = { -30, 30, KEYBIND.y }, button = { -18, 18, -18, 18 },
    tooltip = "The dot is the middle of the keybind text. The small square is Blizzard's spot.",
})
ns.RegisterFeature({
    key = "showMacroText", label = "Show macro names", section = SECTION, category = "Macro names",
    default = false, apply = ApplySetting,
    tooltip = "Shows the name written on buttons that hold a macro.",
})
ns.RegisterFontSettings({
    prefix = "macro", label = "Macro name text", section = SECTION, category = "Macro names", apply = ApplySetting,
    size = { 6, 24, MACRO.defaultSize }, outline = "default", color = "macroColor", requires = "showMacroText",
    button = "Font", position = "macroOffsetX",
    blizzard = function()
        local o = Button1(MACRO)
        return o and ns.OutlineOf(o.flags, o.sx, o.sy) or {}
    end,
})
ns.RegisterFeature({
    key = "macroColor", label = "Macro name color", section = SECTION, category = "Macro names",
    type = "color", default = "default", requires = "showMacroText",
    apply = ApplySetting,
    specials = {
        { value = "default", label = "Default", swatch = function()
            local o = Button1(MACRO)
            return o and ns.RGBToHex(o.r, o.g, o.b)
        end },
        { value = "class",   label = "Class", swatch = ns.PlayerClassHex },
    },
})
ns.RegisterPositionSettings({
    prefix = "macro", label = "Macro name position", section = SECTION, category = "Macro names",
    apply = ApplySetting, requires = "showMacroText",
    x = { -30, 30, MACRO.x }, y = { -12, 48, MACRO.y }, button = { -18, 18, 0, 36 },
    tooltip = "The dot is the bottom middle of the macro name. The small square is Blizzard's spot.",
})
