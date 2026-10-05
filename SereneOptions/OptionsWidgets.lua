-------------------------------------------------------------------------------
--  Options widgets -- every widget is bound to one registered feature, writes
--  through ns.SetValue and has a Refresh() that re-reads SereneDB. Plain
--  textures, no Blizzard templates, so nothing depends on the client's UI kit.
-------------------------------------------------------------------------------
local ns = Serene

local W = {}
ns.Widgets = W

-- Warm darks, like the logo's face.
W.ACCENT = ns.ACCENT
W.BG     = { 0.07, 0.055, 0.055, 0.97 }
W.PANEL  = { 0.1, 0.08, 0.078, 1 }
W.FIELD  = { 0.125, 0.1, 0.097, 1 }
W.EDGE   = { 0.28, 0.22, 0.21, 1 }
W.GOLD   = { 1, 0.82, 0 }
W.DIM    = W.GOLD

local ACCENT, FIELD, EDGE, DIM = W.ACCENT, W.FIELD, W.EDGE, W.DIM
local CONTROL_W = 260

function W.Solid(parent, layer, c, a)
    local t = parent:CreateTexture(nil, layer)
    t:SetColorTexture(c[1], c[2], c[3], a or c[4] or 1)
    return t
end

-- 1px border; returns the four edges so the color can change on hover.
function W.Border(frame, c)
    local edges = {}
    for i = 1, 4 do edges[i] = W.Solid(frame, "BORDER", c) end
    edges[1]:SetPoint("TOPLEFT"); edges[1]:SetPoint("TOPRIGHT"); edges[1]:SetHeight(1)
    edges[2]:SetPoint("BOTTOMLEFT"); edges[2]:SetPoint("BOTTOMRIGHT"); edges[2]:SetHeight(1)
    edges[3]:SetPoint("TOPLEFT"); edges[3]:SetPoint("BOTTOMLEFT"); edges[3]:SetWidth(1)
    edges[4]:SetPoint("TOPRIGHT"); edges[4]:SetPoint("BOTTOMRIGHT"); edges[4]:SetWidth(1)
    return edges
end

function W.SetBorderColor(edges, c)
    for _, e in ipairs(edges) do e:SetColorTexture(c[1], c[2], c[3], c[4] or 1) end
end

-- Only for a setting under no category: a category's settings are explained
-- by the "?" after its heading.
local function AttachTooltip(region, f)
    if not f.tooltip or f.category then return end
    region:HookScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText(f.label, 1, 1, 1)
        GameTooltip:AddLine(f.tooltip, nil, nil, nil, true)
        GameTooltip:Show()
    end)
    region:HookScript("OnLeave", GameTooltip_Hide)
end

local function PlayClick()
    PlaySound(SOUNDKIT.U_CHAT_SCROLL_BUTTON)
end
W.PlayClick = PlayClick

-- The tab name of the Serene* addon a setting needs (f.addon), while that
-- addon is not loaded.
local function MissingAddon(f)
    if f.addon and not C_AddOns.IsAddOnLoaded(f.addon) then
        return C_AddOns.GetAddOnMetadata(f.addon, "X-Serene-Section") or f.addon
    end
end

-- Dims a widget whose setting depends on a toggle that is off or an addon
-- that is not loaded; returns whether it can be used.
-- A requires key is met while that boolean is on, or with "!" in front
-- while it is off.
local function Met(key)
    if key:sub(1, 1) == "!" then return not SereneDB[key:sub(2)] end
    return SereneDB[key] and true or false
end

local function Available(holder, f)
    local on = not MissingAddon(f)
    local req = f.requires
    if type(req) == "table" then
        for _, key in ipairs(req) do on = on and Met(key) end
    elseif req then
        on = on and Met(req)
    end
    holder:SetAlpha(on and 1 or 0.4)
    return on
end

-- Draws text in a font file, falling back to the stock font if it fails to load.
local function SetPreviewFont(fs, path)
    fs:SetFontObject(GameFontHighlight)
    if path ~= "default" and not fs:SetFont(path, 13, "") then fs:SetFontObject(GameFontHighlight) end
end

-- A dropdown setting's label for a value; a saved value no longer offered
-- (e.g. an uninstalled font) shows as its file name.
local function OptionLabel(f, value)
    for _, o in ipairs(f.options()) do
        if o.value == value then return o.label end
    end
    local s = tostring(value)
    return s:match("([^\\/]+)$") or s
end

-------------------------------------------------------------------------------
--  Checkbox -- bound to f.key, or to f.get()/f.set(on) for state that is not
--  in SereneDB.
-------------------------------------------------------------------------------
function W.Checkbox(parent, f)
    local function Checked()
        if f.get then return f.get() end
        return SereneDB[f.key]
    end

    local row = CreateFrame("Button", nil, parent)
    row:SetHeight(26)

    local box = CreateFrame("Frame", nil, row)
    box:SetSize(16, 16)
    box:SetPoint("LEFT", 0, 0)
    W.Solid(box, "BACKGROUND", FIELD):SetAllPoints()
    local edges = W.Border(box, EDGE)
    local check = W.Solid(box, "ARTWORK", ACCENT)
    check:SetPoint("TOPLEFT", 3, -3)
    check:SetPoint("BOTTOMRIGHT", -3, 3)

    local label = row:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    label:SetPoint("LEFT", box, "RIGHT", 10, 0)
    label:SetText(f.label)
    row.label = label

    row:SetScript("OnClick", function()
        PlayClick()
        if f.set then f.set(not Checked()) else ns.SetValue(f.key, not SereneDB[f.key]) end
    end)
    row:SetScript("OnEnter", function() W.SetBorderColor(edges, ACCENT) end)
    row:SetScript("OnLeave", function() W.SetBorderColor(edges, EDGE) end)
    AttachTooltip(row, f)

    -- "Requires Enemy nameplates" beside the label; on the parent, so the row's
    -- dimming leaves it readable.
    local note
    if f.addon then
        note = parent:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        note:SetPoint("LEFT", label, "RIGHT", 12, 0)
        note:SetTextColor(ACCENT[1], ACCENT[2], ACCENT[3])
    end

    function row.Refresh()
        check:SetShown(Checked() and true or false)
        row:SetEnabled(Available(row, f))
        if note then
            local missing = MissingAddon(f)
            note:SetText(missing and "Requires " .. missing or "")
            note:SetShown(missing ~= nil)
        end
    end
    return row
end

-------------------------------------------------------------------------------
--  Dropdown popup -- one shared list, scrolled with the mouse wheel when it
--  holds more than MAX_ROWS entries. Closes on any click outside it.
-------------------------------------------------------------------------------
local MAX_ROWS, ROW_H = 12, 20
local menu, menuRows, state = nil, {}, {}

local function MenuRow(i)
    if menuRows[i] then return menuRows[i] end
    local r = CreateFrame("Button", nil, menu)
    r:SetHeight(ROW_H)
    r:SetPoint("TOPLEFT", 1, -1 - (i - 1) * ROW_H)
    r:SetPoint("TOPRIGHT", -6, -1 - (i - 1) * ROW_H)
    r.hl = W.Solid(r, "BACKGROUND", ACCENT, 0.18)
    r.hl:SetAllPoints()
    r.hl:Hide()
    r.text = r:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    r.text:SetPoint("LEFT", 8, 0)
    r.text:SetPoint("RIGHT", -4, 0)
    r.text:SetJustifyH("LEFT")
    r:SetScript("OnEnter", function(self) self.hl:Show() end)
    r:SetScript("OnLeave", function(self) self.hl:Hide() end)
    r:SetScript("OnClick", function(self)
        local onSelect = state.onSelect
        menu:Hide()
        PlayClick()
        onSelect(self.value)
    end)
    menuRows[i] = r
    return r
end

local function Render()
    local opts = state.options
    local n = math.min(#opts, MAX_ROWS)
    for i = 1, n do
        local o = opts[i + state.offset]
        local r = MenuRow(i)
        r.value = o.value
        if state.preview then SetPreviewFont(r.text, o.value) else r.text:SetFontObject(GameFontHighlight) end
        r.text:SetText(o.label)
        if o.value == state.selected then
            r.text:SetTextColor(ACCENT[1], ACCENT[2], ACCENT[3])
        else
            r.text:SetTextColor(1, 1, 1)
        end
        r:Show()
    end
    for i = n + 1, #menuRows do menuRows[i]:Hide() end
    menu:SetHeight(n * ROW_H + 2)

    -- Scroll position marker along the right edge.
    if #opts > MAX_ROWS then
        local trackH = n * ROW_H
        local thumbH = math.max(12, trackH * MAX_ROWS / #opts)
        local y = (trackH - thumbH) * state.offset / (#opts - MAX_ROWS)
        menu.thumb:SetHeight(thumbH)
        menu.thumb:SetPoint("TOPRIGHT", -2, -1 - y)
        menu.thumb:Show()
    else
        menu.thumb:Hide()
    end
end

local function GetMenu()
    if menu then return menu end
    menu = CreateFrame("Frame", nil, UIParent)
    menu:SetFrameStrata("FULLSCREEN_DIALOG")
    menu:SetClampedToScreen(true)
    menu:EnableMouse(true)
    menu:EnableMouseWheel(true)
    W.Solid(menu, "BACKGROUND", W.PANEL):SetAllPoints()
    W.Border(menu, EDGE)
    menu.thumb = W.Solid(menu, "ARTWORK", ACCENT, 0.6)
    menu.thumb:SetWidth(3)
    menu:Hide()

    menu:SetScript("OnMouseWheel", function(_, delta)
        local maxOffset = math.max(0, #state.options - MAX_ROWS)
        state.offset = math.min(maxOffset, math.max(0, state.offset - delta * 2))
        Render()
    end)
    menu:RegisterEvent("GLOBAL_MOUSE_DOWN")
    menu:SetScript("OnEvent", function(self)
        -- The anchor is spared so a click on it toggles the list closed via OpenMenu.
        if self:IsShown() and not self:IsMouseOver()
           and not (state.anchor and state.anchor:IsMouseOver()) then
            self:Hide()
        end
    end)
    return menu
end

local function CloseMenu()
    if menu then menu:Hide() end
end

function W.OpenMenu(anchor, options, selected, onSelect, preview)
    GetMenu()
    if menu:IsShown() and state.anchor == anchor then
        menu:Hide()
        return
    end
    state = { anchor = anchor, options = options, selected = selected,
              onSelect = onSelect, preview = preview, offset = 0 }
    -- Open scrolled so the current choice is in view.
    for i, o in ipairs(options) do
        if o.value == selected then
            state.offset = math.max(0, math.min(i - math.floor(MAX_ROWS / 2), #options - MAX_ROWS))
            break
        end
    end
    -- The list lives on UIParent; match the (possibly scaled) options window.
    menu:SetScale(anchor:GetEffectiveScale() / UIParent:GetEffectiveScale())
    menu:ClearAllPoints()
    menu:SetPoint("TOPLEFT", anchor, "BOTTOMLEFT", 0, -2)
    menu:SetWidth(anchor:GetWidth())
    Render()
    menu:Show()
end

-------------------------------------------------------------------------------
--  Field -- a label over a button showing the current value, with a down
--  arrow; clicking it opens a popup. Returns the holder, the button, the
--  value text (single line, left of the arrow) and the arrow.
-------------------------------------------------------------------------------
-- Without labelText the button sits at the top, e.g. right under the
-- checkbox it belongs to.
local function Field(parent, labelText, onClick)
    local holder = CreateFrame("Frame", nil, parent)
    holder:SetHeight(labelText and 50 or 30)

    local btn = CreateFrame("Button", nil, holder)
    btn:SetSize(CONTROL_W, 24)
    if labelText then
        local label = holder:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
        label:SetPoint("TOPLEFT", 0, 0)
        label:SetText(labelText)
        btn:SetPoint("TOPLEFT", label, "BOTTOMLEFT", 0, -6)
    else
        btn:SetPoint("TOPLEFT", 0, 0)
    end
    W.Solid(btn, "BACKGROUND", FIELD):SetAllPoints()
    local edges = W.Border(btn, EDGE)

    local arrow = btn:CreateTexture(nil, "ARTWORK")
    arrow:SetTexture("Interface\\Buttons\\Arrow-Down-Up")
    arrow:SetSize(12, 12)
    arrow:SetPoint("RIGHT", -8, -2)
    arrow:SetVertexColor(DIM[1], DIM[2], DIM[3])

    local text = btn:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    text:SetPoint("LEFT", 8, 0)
    text:SetPoint("RIGHT", arrow, "LEFT", -4, 0)
    text:SetJustifyH("LEFT")
    text:SetWordWrap(false)

    btn:SetScript("OnClick", function(self)
        PlayClick()
        onClick(self)
    end)
    btn:SetScript("OnEnter", function() W.SetBorderColor(edges, ACCENT) end)
    btn:SetScript("OnLeave", function() W.SetBorderColor(edges, EDGE) end)
    -- Narrower than CONTROL_W in a half-width category; a plain button keeps its own width.
    holder:SetScript("OnSizeChanged", function(_, w)
        if not btn.plain and w > 0 then btn:SetWidth(math.min(CONTROL_W, w)) end
    end)
    return holder, btn, text, arrow
end

-- A field turned into a plain button reading `label`, sized to it.
local function AsButton(btn, text, arrow, label)
    arrow:Hide()
    text:ClearAllPoints()
    text:SetPoint("CENTER")
    text:SetJustifyH("CENTER")
    text:SetText(label)
    btn:SetWidth(math.ceil(text:GetStringWidth()) + 32)
    btn.plain = true
end

-------------------------------------------------------------------------------
--  Dropdown
-------------------------------------------------------------------------------
function W.Dropdown(parent, f)
    local holder, btn, text = Field(parent, not f.hideLabel and f.label, function(self)
        W.OpenMenu(self, f.options(), ns.Get(f.key), function(v) ns.SetValue(f.key, v) end, f.preview)
    end)
    AttachTooltip(btn, f)

    function holder.Refresh()
        local value = ns.Get(f.key)
        if f.preview then SetPreviewFont(text, value) end
        text:SetText(OptionLabel(f, value))
        btn:SetEnabled(Available(holder, f))
    end
    return holder
end

-------------------------------------------------------------------------------
--  Color -- the feature's special choices as text chips, then a swatch per
--  palette color, then "+" for any other color in Blizzard's color picker
--  (it shows that color once one is picked). One row, for the editor that
--  W.ColorField opens; labeled shows the setting's label above it, for a
--  font group's editor.
-------------------------------------------------------------------------------
local SWATCH, SWATCH_GAP = 20, 4

-- A small bordered square showing hex colors, several side by side (e.g.
-- "By value": green, yellow, red). SetColors(hex, ...) hides it when given
-- none and returns whether it shows.
local function Swatch(parent, size)
    local s = CreateFrame("Frame", nil, parent)
    s:SetSize(size, size)
    W.Border(s, EDGE)
    local stripes = {}
    function s.SetColors(...)
        local hexes = { ... }
        local n, inner = #hexes, size - 2
        for i = 1, math.max(n, #stripes) do
            local t = stripes[i]
            if i <= n then
                if not t then
                    t = s:CreateTexture(nil, "ARTWORK")
                    stripes[i] = t
                end
                local r, g, b = ns.ColorRGB(hexes[i])
                t:SetColorTexture(r or 1, g or 1, b or 1, 1)
                t:ClearAllPoints()
                t:SetPoint("TOPLEFT", 1 + (i - 1) * inner / n, -1)
                t:SetSize(inner / n, inner)
                t:Show()
            elseif t then
                t:Hide()
            end
        end
        s:SetShown(n > 0)
        return n > 0
    end
    return s
end

-- Shows a color setting's value on a swatch. Returns the value's name and
-- whether the swatch shows.
local function ShowColor(swatch, f)
    local value = ns.Get(f.key)
    local hex = ns.ColorHex(value)
    if hex then
        for _, p in ipairs(ns.PALETTE) do
            if p.hex == hex then return p.label, swatch.SetColors(hex) end
        end
        return "#" .. hex, swatch.SetColors(hex)
    end
    for _, s in ipairs(f.specials or {}) do
        if s.value == value then
            if s.swatch then return s.label, swatch.SetColors(s.swatch()) end
            return s.label, swatch.SetColors()
        end
    end
end

-- Blizzard's picker, raised above the options window while it is open.
local function OpenColorPicker(value, onChange)
    local picker = ColorPickerFrame
    local r, g, b = ns.ColorRGB(value)
    if not r then r, g, b = 1, 1, 1 end
    -- The picker calls this every frame while its wheel is held, changed or not.
    local last = value
    local function Picked()
        local hex = ns.RGBToHex(picker:GetColorRGB())
        if hex == last then return end
        last = hex
        onChange(hex)
    end
    local function Cancelled() onChange(value) end
    picker:SetupColorPickerAndShow({ r = r, g = g, b = b, hasOpacity = false,
                                     swatchFunc = Picked, cancelFunc = Cancelled })
    if not picker.sereneStrata then
        picker.sereneStrata = picker:GetFrameStrata()
        picker:HookScript("OnHide", function(self) self:SetFrameStrata(self.sereneStrata) end)
    end
    picker:SetFrameStrata("FULLSCREEN_DIALOG")
    picker:Raise()
end

function W.Color(parent, f, labeled)
    local holder = CreateFrame("Frame", nil, parent)
    local top = 0
    if labeled then
        local label = holder:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
        label:SetPoint("TOPLEFT")
        label:SetText(f.label)
        top = -(math.ceil(label:GetStringHeight()) + 6)
    end
    holder:SetHeight(SWATCH - top)

    -- Every color setting sits under a category, whose "?" explains it.
    local choices = {}  -- { button, edges, value (special word or hex), [fill] }
    local function Choice(button, value)
        local c = { button = button, value = value }
        W.Solid(button, "BACKGROUND", FIELD):SetAllPoints()
        c.edges = W.Border(button, EDGE)
        button:SetScript("OnEnter", function() W.SetBorderColor(c.edges, ACCENT) end)
        button:SetScript("OnLeave", function() holder.Refresh() end)
        choices[#choices + 1] = c
        return c
    end

    local x = 0
    local function Place(button, width)
        button:SetSize(width, SWATCH)
        button:SetPoint("TOPLEFT", x, top)
        x = x + width + SWATCH_GAP
    end

    for _, s in ipairs(f.specials or {}) do
        local chip = CreateFrame("Button", nil, holder)
        local text = chip:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        text:SetText(s.label)
        local width = math.ceil(text:GetStringWidth()) + 14
        -- The color(s) the choice stands for, before its name.
        local swatch = s.swatch and Swatch(chip, 10)
        if swatch and swatch.SetColors(s.swatch()) then
            swatch:SetPoint("LEFT", 6, 0)
            text:SetPoint("LEFT", swatch, "RIGHT", 4, 0)
            width = width + 14
        else
            text:SetPoint("CENTER")
        end
        Place(chip, width)
        local c = Choice(chip, s.value)
        c.text = text
        chip:SetScript("OnClick", function() PlayClick(); ns.SetValue(f.key, s.value) end)
    end
    if f.specials then x = x + 6 end

    for _, p in ipairs(ns.PALETTE) do
        local swatch = CreateFrame("Button", nil, holder)
        Place(swatch, SWATCH)
        Choice(swatch, p.hex)
        local fill = swatch:CreateTexture(nil, "ARTWORK")
        fill:SetPoint("TOPLEFT", 2, -2)
        fill:SetPoint("BOTTOMRIGHT", -2, 2)
        local r, g, b = ns.ColorRGB(p.hex)
        fill:SetColorTexture(r, g, b, 1)
        swatch:SetScript("OnClick", function() PlayClick(); ns.SetValue(f.key, p.hex) end)
    end

    local button = CreateFrame("Button", nil, holder)
    Place(button, SWATCH)
    local custom = Choice(button, nil)
    custom.fill = button:CreateTexture(nil, "ARTWORK")
    custom.fill:SetPoint("TOPLEFT", 2, -2)
    custom.fill:SetPoint("BOTTOMRIGHT", -2, 2)
    custom.plus = button:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    custom.plus:SetPoint("CENTER", 0, 1)
    custom.plus:SetText("+")
    button:SetScript("OnClick", function()
        PlayClick()
        OpenColorPicker(ns.Get(f.key), function(hex) ns.SetValue(f.key, hex) end)
    end)
    holder.width = x - SWATCH_GAP  -- the row's own width, for the editor

    function holder.Refresh()
        local value = ns.Get(f.key)
        local selected = ns.ColorHex(value) or value
        local matched = false
        for _, c in ipairs(choices) do
            local on = c.value ~= nil and c.value == selected
            matched = matched or on
            W.SetBorderColor(c.edges, on and ACCENT or EDGE)
            if c.text then
                if on then c.text:SetTextColor(ACCENT[1], ACCENT[2], ACCENT[3]) else c.text:SetTextColor(1, 1, 1) end
            end
        end
        -- A color off the palette lives on the "+" swatch.
        local r, g, b = ns.ColorRGB(value)
        local own = not matched and r ~= nil
        custom.fill:SetShown(own)
        custom.plus:SetShown(not own)
        if own then custom.fill:SetColorTexture(r, g, b, 1) end
        W.SetBorderColor(custom.edges, own and ACCENT or EDGE)
        local on = Available(holder, f)
        for _, c in ipairs(choices) do c.button:SetEnabled(on) end
    end
    return holder
end

-- The flags an outline setting stands for, Blizzard's own on "default".
local function ShownOutline(f)
    local set = ns.OutlineSet(ns.Get(f.key))
    if set then return set end
    return f.blizzard and f.blizzard() or {}
end

-------------------------------------------------------------------------------
--  Outline -- a checkbox per font flag (ns.OUTLINE_FLAGS), any number at
--  once, after a "Default" chip when the feature's default is Blizzard's own
--  look. On Default the boxes show that look (f.blizzard returns it as a
--  set); ticking one starts from there.
-------------------------------------------------------------------------------
function W.Outline(parent, f)
    local holder = CreateFrame("Frame", nil, parent)
    holder:SetHeight(50)

    local label = holder:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    label:SetPoint("TOPLEFT", 0, 0)
    label:SetText(f.label)

    local function Shown() return ShownOutline(f) end

    local x = 0
    local controls = {}

    local chip
    if f.default == "default" then
        local button = CreateFrame("Button", nil, holder)
        W.Solid(button, "BACKGROUND", FIELD):SetAllPoints()
        local edges = W.Border(button, EDGE)
        local text = button:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        text:SetPoint("CENTER")
        text:SetText("Default")
        local width = math.ceil(text:GetStringWidth()) + 14
        button:SetSize(width, 20)
        button:SetPoint("TOPLEFT", label, "BOTTOMLEFT", 0, -6)
        x = width + 16
        button:SetScript("OnClick", function() PlayClick(); ns.SetValue(f.key, "default") end)
        button:SetScript("OnEnter", function() W.SetBorderColor(edges, ACCENT) end)
        button:SetScript("OnLeave", function() holder.Refresh() end)
        AttachTooltip(button, f)
        chip = { button = button, edges = edges, text = text }
        controls[#controls + 1] = button
    end

    local boxes = {}
    for _, o in ipairs(ns.OUTLINE_FLAGS) do
        local row = CreateFrame("Button", nil, holder)
        local box = CreateFrame("Frame", nil, row)
        box:SetSize(16, 16)
        box:SetPoint("LEFT", 0, 0)
        W.Solid(box, "BACKGROUND", FIELD):SetAllPoints()
        local edges = W.Border(box, EDGE)
        local check = W.Solid(box, "ARTWORK", ACCENT)
        check:SetPoint("TOPLEFT", 3, -3)
        check:SetPoint("BOTTOMRIGHT", -3, 3)
        local text = row:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
        text:SetPoint("LEFT", box, "RIGHT", 6, 0)
        text:SetText(o.label)
        local width = 22 + math.ceil(text:GetStringWidth())
        row:SetSize(width, 20)
        row:SetPoint("TOPLEFT", label, "BOTTOMLEFT", x, -6)
        x = x + width + 14
        row:SetScript("OnClick", function()
            PlayClick()
            local set = Shown()
            set[o.value] = not set[o.value] or nil
            ns.SetValue(f.key, ns.OutlineValue(set))
        end)
        row:SetScript("OnEnter", function() W.SetBorderColor(edges, ACCENT) end)
        row:SetScript("OnLeave", function() W.SetBorderColor(edges, EDGE) end)
        AttachTooltip(row, f)
        boxes[#boxes + 1] = { flag = o.value, check = check }
        controls[#controls + 1] = row
    end
    holder.width = x - 14  -- the row's own width, for the editor

    function holder.Refresh()
        local set = Shown()
        for _, b in ipairs(boxes) do b.check:SetShown(set[b.flag] and true or false) end
        if chip then
            local on = ns.Get(f.key) == "default"
            W.SetBorderColor(chip.edges, on and ACCENT or EDGE)
            if on then chip.text:SetTextColor(ACCENT[1], ACCENT[2], ACCENT[3]) else chip.text:SetTextColor(1, 1, 1) end
        end
        local on = Available(holder, f)
        for _, c in ipairs(controls) do c:SetEnabled(on) end
    end
    return holder
end

-------------------------------------------------------------------------------
--  Slider
-------------------------------------------------------------------------------
function W.Slider(parent, f)
    local holder = CreateFrame("Frame", nil, parent)
    holder:SetHeight(46)

    local label = holder:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    label:SetPoint("TOPLEFT", 0, 0)
    label:SetText(f.label)

    local slider = CreateFrame("Slider", nil, holder)
    slider:SetOrientation("HORIZONTAL")
    slider:SetSize(CONTROL_W, 16)
    slider:SetPoint("TOPLEFT", label, "BOTTOMLEFT", 0, -8)
    slider:SetMinMaxValues(f.min, f.max)
    slider:SetValueStep(f.step or 1)
    slider:SetObeyStepOnDrag(true)
    slider:EnableMouseWheel(true)

    local track = W.Solid(slider, "BACKGROUND", FIELD)
    track:SetPoint("LEFT")
    track:SetPoint("RIGHT")
    track:SetHeight(4)

    local thumb = slider:CreateTexture(nil, "OVERLAY")
    thumb:SetColorTexture(ACCENT[1], ACCENT[2], ACCENT[3], 1)
    thumb:SetSize(8, 16)
    slider:SetThumbTexture(thumb)

    local fill = W.Solid(slider, "ARTWORK", ACCENT, 0.5)
    fill:SetPoint("LEFT", track, "LEFT")
    fill:SetPoint("RIGHT", thumb, "CENTER")
    fill:SetHeight(4)

    local valueText = holder:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    valueText:SetPoint("BOTTOMRIGHT", slider, "TOPRIGHT", 0, 8)
    valueText:SetTextColor(ACCENT[1], ACCENT[2], ACCENT[3])

    local step, suffix = f.step or 1, f.suffix or ""
    slider:SetScript("OnValueChanged", function(_, v, userInput)
        v = math.floor(v / step + 0.5) * step
        valueText:SetText(v .. suffix)
        if userInput and v ~= ns.Get(f.key) then ns.SetValue(f.key, v) end
    end)
    slider:SetScript("OnMouseWheel", function(self, delta)
        local v = math.min(f.max, math.max(f.min, ns.Get(f.key) + delta * step))
        if v ~= ns.Get(f.key) then
            self:SetValue(v)
            ns.SetValue(f.key, v)
        end
    end)
    AttachTooltip(slider, f)
    -- Narrower than CONTROL_W in a half-width row.
    holder:SetScript("OnSizeChanged", function(_, w)
        if w > 0 then slider:SetWidth(math.min(CONTROL_W, w)) end
    end)

    function holder.Refresh()
        local v = ns.Get(f.key)
        slider:SetValue(v)
        valueText:SetText(v .. suffix)
        local on = Available(holder, f)
        slider:EnableMouse(on)
        slider:EnableMouseWheel(on)
    end
    return holder
end

-------------------------------------------------------------------------------
--  Position pad -- for a ns.RegisterPositionSettings pair, in the editor
--  W.Position opens: what the offsets count from drawn to scale, a dot
--  where they put the text.
--  Click or drag to move it; right-click puts back the defaults.
-------------------------------------------------------------------------------
local DOT = 8  -- the dot's size

local function PositionPad(parent, pos)
    local fx, fy, scale = pos.x, pos.y, pos.scale
    local holder = CreateFrame("Frame", nil, parent)

    local pad = CreateFrame("Frame", nil, holder)
    pad:SetSize((fx.max - fx.min) * scale, (fy.max - fy.min) * scale)
    pad:SetPoint("TOPLEFT", 0, 0)
    W.Solid(pad, "BACKGROUND", FIELD):SetAllPoints()
    local edges = W.Border(pad, EDGE)
    holder:SetHeight(pad:GetHeight())

    -- Offset units -> pixels from the pad's bottom left.
    local function PX(x) return (x - fx.min) * scale end
    local function PY(y) return (y - fy.min) * scale end

    local b = pos.box
    local box = CreateFrame("Frame", nil, pad)
    box:SetPoint("BOTTOMLEFT", PX(b[1]), PY(b[3]))
    box:SetSize((b[2] - b[1]) * scale, (b[4] - b[3]) * scale)
    W.Solid(box, "BACKGROUND", EDGE, 0.5):SetAllPoints()
    W.Border(box, DIM)
    local home = W.Solid(box, "ARTWORK", DIM)
    home:SetSize(4, 4)
    home:SetPoint("CENTER", pad, "BOTTOMLEFT", PX(fx.default), PY(fy.default))

    -- Its own frame, so it draws over the box.
    local dot = CreateFrame("Frame", nil, pad)
    dot:SetSize(DOT, DOT)
    dot:SetFrameLevel(box:GetFrameLevel() + 1)
    W.Solid(dot, "ARTWORK", ACCENT):SetAllPoints()

    local valueText = holder:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    valueText:SetPoint("TOPLEFT", pad, "TOPRIGHT", 12, 0)
    valueText:SetJustifyH("LEFT")
    local hint = holder:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    hint:SetPoint("TOPLEFT", valueText, "BOTTOMLEFT", 0, -6)
    hint:SetText("Right-click: default")
    -- Wide pads (e.g. the tooltip's) widen the editor to fit the readout.
    holder.width = pad:GetWidth() + 12 + math.ceil(hint:GetStringWidth())

    local function Set(f, v)
        if v ~= ns.Get(f.key) then ns.SetValue(f.key, v) end
    end
    local function Step(v, f)
        return math.min(f.max, math.max(f.min, math.floor(v + 0.5)))
    end
    local function FollowCursor()
        local ui = pad:GetEffectiveScale()
        local cx, cy = GetCursorPosition()
        Set(fx, Step((cx / ui - pad:GetLeft()) / scale + fx.min, fx))
        Set(fy, Step((cy / ui - pad:GetBottom()) / scale + fy.min, fy))
    end
    local function Stop() pad:SetScript("OnUpdate", nil) end

    pad:SetScript("OnMouseDown", function(_, mouse)
        if mouse == "RightButton" then
            PlayClick()
            Set(fx, fx.default)
            Set(fy, fy.default)
        else
            FollowCursor()
            pad:SetScript("OnUpdate", FollowCursor)
        end
    end)
    pad:SetScript("OnMouseUp", Stop)
    pad:SetScript("OnHide", Stop)
    pad:SetScript("OnEnter", function() W.SetBorderColor(edges, ACCENT) end)
    pad:SetScript("OnLeave", function() W.SetBorderColor(edges, EDGE) end)

    function holder.Refresh()
        local x, y = ns.Get(fx.key), ns.Get(fy.key)
        dot:ClearAllPoints()
        dot:SetPoint("CENTER", pad, "BOTTOMLEFT", PX(x), PY(y))
        valueText:SetText("X " .. x .. "\nY " .. y)
        local on = Available(holder, fx)
        pad:EnableMouse(on)
        if not on then Stop() end
    end
    return holder
end

-------------------------------------------------------------------------------
--  Editor -- a popup under a field holding that field's own controls under
--  a title; shared by font groups and colors. Closes on a click outside it
--  (its dropdown list and the color picker count as inside) or on the field
--  again.
-------------------------------------------------------------------------------
local EDITOR_PAD, EDITOR_TITLE_H = 14, 24
local editor, editorAnchor
local panels = {}  -- font group or color setting -> its controls, built on first open

local function GetEditor()
    if editor then return editor end
    editor = CreateFrame("Frame", nil, UIParent)
    -- Over the options window, under the dropdown list and the color picker.
    editor:SetFrameStrata("FULLSCREEN")
    editor:SetClampedToScreen(true)
    editor:EnableMouse(true)
    W.Solid(editor, "BACKGROUND", W.PANEL):SetAllPoints()
    W.Border(editor, EDGE)
    editor.title = editor:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    editor.title:SetPoint("TOPLEFT", EDITOR_PAD, -EDITOR_PAD)
    editor.title:SetTextColor(ACCENT[1], ACCENT[2], ACCENT[3])
    editor:Hide()

    local function Over(frame) return frame and frame:IsShown() and frame:IsMouseOver() end
    editor:RegisterEvent("GLOBAL_MOUSE_DOWN")
    editor:SetScript("OnEvent", function(self)
        -- The field toggles it via OpenEditor.
        if self:IsShown() and not self:IsMouseOver() and not Over(menu) and not Over(ColorPickerFrame)
           and not (editorAnchor and editorAnchor:IsMouseOver()) then
            self:Hide()
        end
    end)
    editor:SetScript("OnHide", CloseMenu)
    return editor
end

-- build(panel) returns the panel's widgets, stacked top to bottom; the
-- panel is as wide as the widest of them (its .width) or a control.
local function OpenEditor(anchor, id, title, build)
    GetEditor()
    if editor:IsShown() and editorAnchor == anchor then
        editor:Hide()
        return
    end
    CloseMenu()
    editorAnchor = anchor
    for _, p in pairs(panels) do p:Hide() end
    local panel = panels[id]
    if not panel then
        panel = CreateFrame("Frame", nil, editor)
        panel:SetPoint("TOPLEFT", EDITOR_PAD, -(EDITOR_PAD + EDITOR_TITLE_H))
        panel.widgets = build(panel)
        local width, y = CONTROL_W, 0
        for _, w in ipairs(panel.widgets) do
            width = math.max(width, w.width or 0)
            w:SetPoint("TOPLEFT", 0, y)
            w:SetPoint("TOPRIGHT", 0, y)
            y = y - w:GetHeight() - 10
        end
        panel:SetSize(width, -y - 10)
        panels[id] = panel
    end
    panel:Show()
    for _, w in ipairs(panel.widgets) do w.Refresh() end
    editor.title:SetText(title)
    editor:SetSize(panel:GetWidth() + 2 * EDITOR_PAD, panel:GetHeight() + EDITOR_TITLE_H + 2 * EDITOR_PAD)
    -- Lives on UIParent like the dropdown list; match the options window's scale.
    editor:SetScale(anchor:GetEffectiveScale() / UIParent:GetEffectiveScale())
    editor:ClearAllPoints()
    editor:SetPoint("TOPLEFT", anchor, "BOTTOMLEFT", 0, -2)
    editor:Show()
end

-- Keeps an open editor's controls in step with its field.
local function RefreshEditor(id)
    local panel = panels[id]
    if panel and panel:IsVisible() then
        for _, w in ipairs(panel.widgets) do w.Refresh() end
    end
end

local function OpenPosition(anchor, pos)
    OpenEditor(anchor, pos, pos.label, function(panel) return { PositionPad(panel, pos) } end)
end

-------------------------------------------------------------------------------
--  Font group -- one field for a ns.RegisterFontSettings group: font, size
--  and outline at a glance, drawn in that font, after a swatch of its color
--  if it has one; its editor holds the group's own dropdown, slider and
--  outline controls, and the palette. With group.button the row is just a
--  button reading that, without a label above it, and a "Position" button
--  beside it for the group's position pair.
-------------------------------------------------------------------------------
-- "Outline, Shadow"; "No outline" for none.
local function OutlineLabel(f)
    local set, words = ShownOutline(f), {}
    for _, o in ipairs(ns.OUTLINE_FLAGS) do
        if set[o.value] then words[#words + 1] = o.label end
    end
    return #words > 0 and table.concat(words, ", ") or "No outline"
end

function W.FontGroup(parent, group)
    local color = group.color and ns.featureByKey[group.color]
    local holder, btn, text, arrow = Field(parent, not group.button and group.label, function(self)
        OpenEditor(self, group, group.label, function(panel)
            local list = { W.Dropdown(panel, group.font), W.Slider(panel, group.size), W.Outline(panel, group.outline) }
            if color then list[#list + 1] = W.Color(panel, color, true) end
            return list
        end)
    end)

    if group.button then
        AsButton(btn, text, arrow, group.button)
        local pos = group.position and ns.featureByKey[group.position].pos
        local posHolder, posBtn
        if pos then
            local posText, posArrow
            posHolder, posBtn, posText, posArrow = Field(holder, nil, function(self) OpenPosition(self, pos) end)
            posHolder:SetPoint("TOPLEFT", btn, "TOPRIGHT", 8, 0)
            AsButton(posBtn, posText, posArrow, pos.button)
            -- A field's holder takes its width from the page; this one has none.
            posHolder:SetWidth(posBtn:GetWidth())
            AttachTooltip(posBtn, pos.x)
        end
        function holder.Refresh()
            btn:SetEnabled(Available(holder, group.font))
            RefreshEditor(group)
            if pos then
                posBtn:SetEnabled(Available(posHolder, pos.x))
                RefreshEditor(pos)
            end
        end
        return holder
    end

    local swatch = color and Swatch(btn, 14)
    if swatch then swatch:SetPoint("LEFT", 8, 0) end

    function holder.Refresh()
        if swatch then
            local _, shown = ShowColor(swatch, color)
            text:SetPoint("LEFT", shown and 30 or 8, 0)
        end
        local font = ns.Get(group.font.key)
        SetPreviewFont(text, font)
        text:SetText(OptionLabel(group.font, font) .. " / " .. ns.Get(group.size.key)
            .. " / " .. OutlineLabel(group.outline))
        btn:SetEnabled(Available(holder, group.font))
        RefreshEditor(group)
    end
    return holder
end

-------------------------------------------------------------------------------
--  Position -- a button for a ns.RegisterPositionSettings pair; its editor
--  holds the pad.
-------------------------------------------------------------------------------
function W.Position(parent, pos)
    local holder, btn, text, arrow = Field(parent, nil, function(self) OpenPosition(self, pos) end)
    AsButton(btn, text, arrow, pos.button)
    AttachTooltip(btn, pos.x)

    function holder.Refresh()
        btn:SetEnabled(Available(holder, pos.x))
        RefreshEditor(pos)
    end
    return holder
end

-------------------------------------------------------------------------------
--  Color field -- the color as a swatch and its name (a special such as
--  "By class" shows as its name only); its editor holds the palette. With
--  f.button just a button reading that, without a label above it.
-------------------------------------------------------------------------------
function W.ColorField(parent, f)
    local holder, btn, text, arrow = Field(parent, not f.button and f.label, function(self)
        OpenEditor(self, f, f.label, function(panel) return { W.Color(panel, f) } end)
    end)
    AttachTooltip(btn, f)

    if f.button then
        AsButton(btn, text, arrow, f.button)
        function holder.Refresh()
            btn:SetEnabled(Available(holder, f))
            RefreshEditor(f)
        end
        return holder
    end

    local swatch = Swatch(btn, 14)
    swatch:SetPoint("LEFT", 8, 0)

    function holder.Refresh()
        local name, shown = ShowColor(swatch, f)
        text:SetPoint("LEFT", shown and 30 or 8, 0)
        text:SetText(name)
        btn:SetEnabled(Available(holder, f))
        RefreshEditor(f)
    end
    return holder
end

-------------------------------------------------------------------------------
--  Help -- a gold "?" whose click shows help in the tooltip until it is
--  clicked again, a click lands anywhere else or the popups close.
--  help = { { label =, text = }, ... }, under title.
-------------------------------------------------------------------------------
local helpOpen  -- the "?" whose help shows
local helpWatch = CreateFrame("Frame")

local function HelpShown(q)
    return helpOpen == q and GameTooltip:IsShown() and GameTooltip:GetOwner() == q
end

local function CloseHelp()
    local q = helpOpen
    if not q then return end
    helpOpen = nil
    helpWatch:UnregisterEvent("GLOBAL_MOUSE_DOWN")
    if GameTooltip:GetOwner() == q then GameTooltip_Hide() end
    q.Paint(q:IsMouseOver())
end

helpWatch:SetScript("OnEvent", function()
    -- A click on the "?" itself toggles it closed in its OnClick.
    if helpOpen and not helpOpen:IsMouseOver() then CloseHelp() end
end)

function W.Help(parent, title, help)
    local q = CreateFrame("Button", nil, parent)
    q:SetSize(16, 16)
    -- A size up and outlined so it stands out as bold.
    local text = q:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    local path, size = text:GetFont()
    text:SetFont(path, size, "OUTLINE")
    text:SetPoint("CENTER")
    text:SetText("?")

    -- White while hovered or showing its help.
    function q.Paint(hover)
        local c = (hover or HelpShown(q)) and { 1, 1, 1 } or W.GOLD
        text:SetTextColor(c[1], c[2], c[3])
    end
    q:SetScript("OnClick", function(self)
        PlayClick()
        local shown = HelpShown(self)
        CloseHelp()
        if shown then return end
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText(title, 1, 1, 1)
        for _, h in ipairs(help) do
            GameTooltip:AddLine(" ")
            GameTooltip:AddLine(h.label, ACCENT[1], ACCENT[2], ACCENT[3])
            GameTooltip:AddLine(h.text, nil, nil, nil, true)
        end
        GameTooltip:Show()
        helpOpen = self
        helpWatch:RegisterEvent("GLOBAL_MOUSE_DOWN")
        self.Paint(true)
    end)
    q:SetScript("OnEnter", function() q.Paint(true) end)
    q:SetScript("OnLeave", function() q.Paint(false) end)
    q.Paint(false)
    return q
end

-- The dropdown list, the editor and the help, e.g. when the page changes.
function W.ClosePopups()
    CloseMenu()
    if editor then editor:Hide() end
    CloseHelp()
end
