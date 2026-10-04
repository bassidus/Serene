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
--  Style -- font, size, outline, color and position of the hotkey text.
--  Blizzard's look is captured per hotkey just before its first change and
--  put back exactly once a setting returns to default. Untouched hotkeys
--  cost nothing.
-------------------------------------------------------------------------------
local DEFAULT_SIZE = 12  -- Blizzard's action button hotkey size

local orig = setmetatable({}, { __mode = "k" })  -- [hotkey] = Blizzard's look
local painting  -- set while we color, so our own calls are not taken for Blizzard's

-- Current settings, read once per Apply.
local font, size, outline, color, offX, offY
local noRed   -- Range Coloring is on: the icon shows range, the text stays put
local styled  -- any of them off default

-- Blizzard turns the text red while the target is out of range.
local function IsRed(r, g, b)
    return type(r) == "number" and r > 0.9 and g < 0.3 and b < 0.3
end

local function Original(hk)
    local o = orig[hk]
    if not o then
        local path, sz, flags = hk:GetFont()
        local sr, sg, sb, sa = hk:GetShadowColor()
        o = { path = path, size = sz, flags = flags, shadow = { sr, sg, sb, sa },
              justify = hk:GetJustifyH(), points = {} }
        o.sx, o.sy = hk:GetShadowOffset()
        -- Blizzard's in-range color (o.r/g/b) and, while out of range, its red.
        local r, g, b = hk:GetTextColor()
        if IsRed(r, g, b) then
            o.red, o.rr, o.rg, o.rb = true, r, g, b
            local c = LIGHTGRAY_FONT_COLOR
            if c then r, g, b = c.r, c.g, c.b else r, g, b = 0.75, 0.75, 0.75 end
        end
        o.r, o.g, o.b = r, g, b
        for i = 1, hk:GetNumPoints() do o.points[i] = { hk:GetPoint(i) } end
        orig[hk] = o
    end
    return o
end

local function StyleFont(hk, o)
    if font == "default" and size == DEFAULT_SIZE and outline == "default" then
        if o.font and o.path then
            hk:SetFont(o.path, o.size, o.flags or "")
            hk:SetShadowColor(o.shadow[1], o.shadow[2], o.shadow[3], o.shadow[4])
            hk:SetShadowOffset(o.sx or 0, o.sy or 0)
        end
        o.font = nil
        return
    end
    local flags, shadow = o.flags, nil
    if outline ~= "default" then flags, shadow = ns.FontFlags(outline) end
    -- Relative to each hotkey's own size, so smaller pet/stance text stays smaller.
    ns.SetFont(hk, font, (o.size or DEFAULT_SIZE) + size - DEFAULT_SIZE, flags, o.path)
    if outline == "default" then
        hk:SetShadowColor(o.shadow[1], o.shadow[2], o.shadow[3], o.shadow[4])
        hk:SetShadowOffset(o.sx or 0, o.sy or 0)
    else
        ns.SetShadow(hk, shadow)
    end
    o.font = true
end

-- The color the text should have: Blizzard's out of range red (unless Range
-- Coloring shows range on the icon), else our color, else Blizzard's own.
local function Wanted(o)
    if o.red and not noRed then return o.rr, o.rg, o.rb end
    if color then return color[1], color[2], color[3] end
    return o.r, o.g, o.b
end

local function Paint(hk, r, g, b)
    painting = true
    hk:SetTextColor(r, g, b)
    painting = nil
end

-- Every color Blizzard sets is remembered; while we manage the color, ours
-- goes straight back on.
local function OnColor(hk, r, g, b)
    if painting then return end
    local o = orig[hk]
    if IsRed(r, g, b) then
        o.red, o.rr, o.rg, o.rb = true, r, g, b
    else
        o.red, o.r, o.g, o.b = nil, r, g, b
    end
    if o.colored then
        local wr, wg, wb = Wanted(o)
        if wr ~= r or wg ~= g or wb ~= b then Paint(hk, wr, wg, wb) end
    end
end

local function StyleColor(hk, o)
    if color or noRed then
        if not o.hooked then
            o.hooked = true
            hooksecurefunc(hk, "SetTextColor", OnColor)
            if hk.SetVertexColor then hooksecurefunc(hk, "SetVertexColor", OnColor) end
        end
        o.colored = true
        Paint(hk, Wanted(o))
    elseif o.colored then
        o.colored = nil
        Paint(hk, Wanted(o))  -- Blizzard's own color, red included
    end
end

-- Offsets put the text's right edge relative to the middle of the button;
-- it stays right-aligned like Blizzard's, so wide text grows to the left.
-- At the defaults Blizzard's exact anchors are put back; the fractions are
-- where its spot really lands (button 1), so the first step does not jump.
local BLIZZARD_X, BLIZZARD_Y = 18, 13
local FRACTION_X, FRACTION_Y = 0.5, -0.5  -- Blizzard: 18.5, 12.5

local function Place(btn, hk, o)
    if offX == BLIZZARD_X and offY == BLIZZARD_Y then
        if o.placed then
            hk:ClearAllPoints()
            for _, p in ipairs(o.points) do hk:SetPoint(p[1], p[2], p[3], p[4], p[5]) end
            hk:SetJustifyH(o.justify or "RIGHT")
            o.placed = nil
        end
        return
    end
    hk:ClearAllPoints()
    hk:SetPoint("RIGHT", btn, "CENTER", offX + FRACTION_X, offY + FRACTION_Y)
    hk:SetJustifyH("RIGHT")
    o.placed = true
end

local function ReadSettings()
    font, size, outline = ns.Get("keybindFont"), ns.Get("keybindFontSize"), ns.Get("keybindOutline")
    offX, offY = ns.Get("keybindOffsetX"), ns.Get("keybindOffsetY")
    local mode = ns.Get("keybindColor")
    if mode == "class" then
        local _, class = UnitClass("player")
        local c = class and (C_ClassColor and C_ClassColor.GetClassColor(class) or RAID_CLASS_COLORS[class])
        color = c and { c.r, c.g, c.b } or { 1, 1, 1 }
    else
        local r, g, b = ns.ColorRGB(mode)
        color = r and { r, g, b } or nil
    end
    noRed = ns.Enabled("rangeColors") and true or false
    styled = font ~= "default" or size ~= DEFAULT_SIZE or outline ~= "default" or color ~= nil or noRed
        or offX ~= BLIZZARD_X or offY ~= BLIZZARD_Y
end

local function Style(btn)
    local hk = btn.HotKey
    if not hk or not (styled or orig[hk]) then return end
    local o = Original(hk)
    StyleFont(hk, o)
    StyleColor(hk, o)
    Place(btn, hk, o)
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

-- Rewrites every button; settings back on default put Blizzard's look back.
-- Macro names: hidden with alpha only, so Blizzard's own text updates carry on.
local macroHidden = setmetatable({}, { __mode = "k" })
local function MacroText(btn, hide)
    local name = btn.Name
    if not name then return end
    if hide then
        name:SetAlpha(0)
        macroHidden[name] = true
    elseif macroHidden[name] then
        name:SetAlpha(1)
        macroHidden[name] = nil
    end
end

local function Apply()
    CollectButtons()
    ReadSettings()
    local enabled = ns.Enabled("shortKeybinds")
    local hideMacro = ns.Enabled("hideMacroText")
    for btn in pairs(buttons) do
        SetText(btn, enabled)
        Style(btn)
        MacroText(btn, hideMacro)
    end
end

-- Deferred one frame so Blizzard's own UPDATE_BINDINGS pass runs first; a
-- burst of events (or settings applied together at login) is handled once.
-- Events only matter while something is changed; a setting change always runs.
local pending, forced = false, false
local function Run()
    pending = false
    if forced or styled or ns.Enabled("shortKeybinds") then Apply() end
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
local SECTION = "Action Bars"

ns.RegisterFeature({
    key = "shortKeybinds", label = "Short Keybind Text", section = SECTION, apply = ApplySetting,
    tooltip = "Shortens keybind text on the action bars (CTRL-2 -> C2, Mouse Button 4 -> M4, NUMPAD5 -> N5).",
})
ns.RegisterFeature({
    key = "hideMacroText", label = "Hide Macro Text", section = SECTION, apply = ApplySetting,
})
ns.RegisterFeature({
    key = "keybindFont", label = "Keybind Font", section = SECTION, type = "dropdown", default = "default",
    preview = true, apply = ApplySetting,
    options = ns.FontOptions,
})
ns.RegisterFeature({
    key = "keybindFontSize", label = "Keybind Font Size", section = SECTION, type = "slider",
    min = 6, max = 24, step = 1, default = DEFAULT_SIZE, apply = ApplySetting,
})
ns.RegisterFeature({
    key = "keybindOutline", label = "Keybind Outline", section = SECTION, type = "outline", default = "default",
    apply = ApplySetting,
    blizzard = function()
        local hk = _G.ActionButton1HotKey
        if not hk then return {} end
        local o = Original(hk)
        return ns.OutlineOf(o.flags, o.sx, o.sy)
    end,
})
ns.RegisterFeature({
    key = "keybindColor", label = "Keybind Color", section = SECTION, type = "color", default = "default",
    apply = ApplySetting,
    specials = {
        { value = "default", label = "Default" },
        { value = "class",   label = "Class" },
    },
})
ns.RegisterFeature({
    key = "keybindOffsetX", label = "Keybind Offset X", section = SECTION, type = "slider",
    min = -25, max = 45, step = 1, default = BLIZZARD_X, apply = ApplySetting,
    tooltip = "Where the text ends, from the middle of the button; the default is Blizzard's spot.",
})
ns.RegisterFeature({
    key = "keybindOffsetY", label = "Keybind Offset Y", section = SECTION, type = "slider",
    min = -30, max = 30, step = 1, default = BLIZZARD_Y, apply = ApplySetting,
    tooltip = "0 is the middle of the button; the default is Blizzard's spot.",
})
