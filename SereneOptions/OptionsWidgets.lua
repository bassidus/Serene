-------------------------------------------------------------------------------
--  Options widgets -- every widget is bound to one registered feature, writes
--  through ns.SetValue and has a Refresh() that re-reads SereneDB. The
--  surfaces are the CurseForge banner's browns, in rounded panels drawn from
--  Serene's own textures (Media: Corner, CornerFill, Glow); the controls
--  wear Blizzard's classic art, except the sliders (Media: Knob).
-------------------------------------------------------------------------------
local ns = Serene

local W = {}
ns.Widgets = W

W.GOLD  = { 1, 0.82, 0 }
W.WHITE = { 1, 1, 1 }
W.TAN   = { 0.69, 0.6, 0.47 }

local GOLD, WHITE = W.GOLD, W.WHITE
local EDGE = { 0.4, 0.27, 0.19 }          -- 1px borders of swatches and chips
local HIGHLIGHT = { 0.196, 0.388, 0.8 }   -- the quest log's selection blue
local GRAY = { 0.5, 0.5, 0.5 }  -- a disabled button's text
local DARK = { 0, 0, 0, 0.6 }  -- behind chips and swatches

local MEDIA = "Interface\\AddOns\\Serene\\Media\\"
local ART = {
    check     = "Interface\\Buttons\\UI-CheckBox-Up",
    checkDown = "Interface\\Buttons\\UI-CheckBox-Down",
    checkHl   = "Interface\\Buttons\\UI-CheckBox-Highlight",
    checkMark = "Interface\\Buttons\\UI-CheckBox-Check",
    button    = "Interface\\Buttons\\UI-Panel-Button-Up",
    buttonDown = "Interface\\Buttons\\UI-Panel-Button-Down",
    buttonOff = "Interface\\Buttons\\UI-Panel-Button-Disabled",
    buttonHl  = "Interface\\Buttons\\UI-Panel-Button-Highlight",
    arrow     = "Interface\\ChatFrame\\UI-ChatIcon-ScrollDown-Up",
    arrowDown = "Interface\\ChatFrame\\UI-ChatIcon-ScrollDown-Down",
    titleHl   = "Interface\\QuestFrame\\UI-QuestLogTitleHighlight",
    rowHl     = "Interface\\QuestFrame\\UI-QuestTitleHighlight",
}

function W.Solid(parent, layer, c, a)
    local t = parent:CreateTexture(nil, layer)
    t:SetColorTexture(c[1], c[2], c[3], a or c[4] or 1)
    return t
end

-------------------------------------------------------------------------------
--  Panels -- a fill and a 1px line around it, both with rounded corners: the
--  corners are quarter pieces (Media\Corner, Media\CornerFill) flipped into
--  place, the rest plain textures, so they stay round at any size. A fill is
--  flat (fill) or a top-to-bottom fade (top, bottom); glow lays Media\Glow,
--  in that color, over it.
-------------------------------------------------------------------------------
local RADIUS = 8
local STYLES = {
    -- The banner: a reddish glow fading out to near black.
    WINDOW = { fill = { 0.09, 0.059, 0.043, 0.97 }, glow = { 0.227, 0.106, 0.063 }, line = { 0.42, 0.24, 0.14, 1 } },
    PANEL  = { top = { 0, 0, 0, 0.18 }, bottom = { 0, 0, 0, 0.28 }, line = { 0.59, 0.35, 0.22, 0.45 } },
    GROUP  = { top = { 1, 0.55, 0.35, 0.045 }, bottom = { 1, 0.55, 0.35, 0.015 }, line = { 0.59, 0.35, 0.22, 0.35 } },
    POPUP  = { fill = { 0.09, 0.059, 0.043, 0.98 }, glow = { 0.227, 0.106, 0.063 }, line = { 0.42, 0.24, 0.14, 1 } },
    FIELD  = { fill = { 0, 0, 0, 0.55 }, line = { 0.63, 0.39, 0.24, 0.6 } },
}

-- Texcoords turning the top-left quarter into each corner.
local CORNERS = {
    TOPLEFT = { 0, 1, 0, 1 }, TOPRIGHT = { 1, 0, 0, 1 },
    BOTTOMLEFT = { 0, 1, 1, 0 }, BOTTOMRIGHT = { 1, 0, 1, 0 },
}

-- Returns the panel: SetLineColor(c) (e.g. on hover; nil puts the style's
-- back) and SetShown(on).
function W.Panel(frame, style)
    local s = STYLES[style]
    local top, bottom = s.top or s.fill, s.bottom or s.fill
    local fills, lines = {}, {}

    local function Piece(list, layer, sub, file)
        local t = frame:CreateTexture(nil, layer, nil, sub)
        if file then t:SetTexture(file) else t:SetColorTexture(1, 1, 1, 1) end
        list[#list + 1] = t
        return t
    end
    local function Shade(t)
        if s.fill then
            t:SetVertexColor(s.fill[1], s.fill[2], s.fill[3], s.fill[4])
        else
            t:SetGradient("VERTICAL", CreateColor(unpack(bottom)), CreateColor(unpack(top)))
        end
    end

    -- Fill: a full-height middle, the sides between the corners, the corners.
    local mid = Piece(fills, "BACKGROUND", -8)
    mid:SetPoint("TOPLEFT", RADIUS, 0)
    mid:SetPoint("BOTTOMRIGHT", -RADIUS, 0)
    Shade(mid)
    for _, side in ipairs({ "LEFT", "RIGHT" }) do
        local t = Piece(fills, "BACKGROUND", -8)
        local x = side == "LEFT" and RADIUS or -RADIUS
        t:SetPoint("TOP" .. side, 0, -RADIUS)
        t:SetPoint("BOTTOM" .. (side == "LEFT" and "RIGHT" or "LEFT"), frame, "BOTTOM" .. side, x, RADIUS)
        Shade(t)
    end
    for point, coords in pairs(CORNERS) do
        local t = Piece(fills, "BACKGROUND", -8, MEDIA .. "CornerFill")
        t:SetSize(RADIUS, RADIUS)
        t:SetPoint(point)
        t:SetTexCoord(unpack(coords))
        local c = point:find("TOP") and top or bottom
        t:SetVertexColor(c[1], c[2], c[3], c[4])
    end
    if s.glow then
        local glow = Piece(fills, "BACKGROUND", -7, MEDIA .. "Glow")
        glow:SetAllPoints()
        glow:SetVertexColor(s.glow[1], s.glow[2], s.glow[3])
    end

    -- Line: the corners, then the four straight runs between them.
    for point, coords in pairs(CORNERS) do
        local t = Piece(lines, "BORDER", 0, MEDIA .. "Corner")
        t:SetSize(RADIUS, RADIUS)
        t:SetPoint(point)
        t:SetTexCoord(unpack(coords))
    end
    for _, edge in ipairs({ "TOP", "BOTTOM" }) do
        local t = Piece(lines, "BORDER", 0)
        t:SetPoint(edge .. "LEFT", RADIUS, 0)
        t:SetPoint(edge .. "RIGHT", -RADIUS, 0)
        t:SetHeight(1)
    end
    for _, edge in ipairs({ "LEFT", "RIGHT" }) do
        local t = Piece(lines, "BORDER", 0)
        t:SetPoint("TOP" .. edge, 0, -RADIUS)
        t:SetPoint("BOTTOM" .. edge, 0, RADIUS)
        t:SetWidth(1)
    end

    local panel = {}
    function panel.SetLineColor(c)
        c = c or s.line
        for _, t in ipairs(lines) do t:SetVertexColor(c[1], c[2], c[3], c[4] or 1) end
    end
    function panel.SetShown(on)
        for _, t in ipairs(fills) do t:SetShown(on) end
        for _, t in ipairs(lines) do t:SetShown(on) end
    end
    panel.SetLineColor()
    return panel
end

-------------------------------------------------------------------------------
--  Window parts
-------------------------------------------------------------------------------
-- Blizzard's close button in a window's top right corner. A child of the
-- title bar and raised above it: as a sibling at the same level, the
-- mouse-enabled drag bar swallowed the clicks.
function W.CloseButton(titleBar, window)
    local close = CreateFrame("Button", nil, titleBar)
    close:SetFrameLevel(titleBar:GetFrameLevel() + 2)
    close:RegisterForClicks("LeftButtonUp")
    close:SetSize(32, 32)
    close:SetPoint("TOPRIGHT", -4, -4)
    close:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
    close:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
    close:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight", "ADD")
    close:SetScript("OnClick", function() window:Hide() end)
    return close
end

local SCROLL_STEP = 40

-- A thin bar centered in the margin right of scroll, shown only while the
-- content does not fit; the wheel scrolls (with Ctrl it goes to onCtrlWheel)
-- and the bar can be dragged. Returns ScrollTo(offset).
function W.ScrollBar(scroll, margin, onCtrlWheel)
    local bar = CreateFrame("Button", nil, scroll:GetParent())
    bar:SetWidth(9)
    bar:Hide()
    local thumb = W.Solid(bar, "ARTWORK", GOLD)
    thumb:SetPoint("TOP")
    thumb:SetPoint("BOTTOM")
    thumb:SetWidth(3)
    thumb:SetAlpha(0.5)

    local function Range() return scroll:GetVerticalScrollRange() end
    local function PlaceBar()
        local range, viewH = Range(), scroll:GetHeight()
        bar:SetShown(range > 0.5)
        if range <= 0.5 then return end
        local barH = math.max(20, viewH * viewH / (viewH + range))
        bar:SetHeight(barH)
        bar:ClearAllPoints()
        bar:SetPoint("TOPLEFT", scroll, "TOPRIGHT", margin / 2 - 4, -(viewH - barH) * scroll:GetVerticalScroll() / range)
    end
    local function ScrollTo(v)
        scroll:SetVerticalScroll(math.max(0, math.min(Range(), v)))
        PlaceBar()
    end
    local function Refit() ScrollTo(scroll:GetVerticalScroll()) end

    scroll:EnableMouseWheel(true)
    scroll:SetScript("OnMouseWheel", function(_, delta)
        if IsControlKeyDown() then
            if onCtrlWheel then onCtrlWheel(delta) end
            return
        end
        W.ClosePopups()
        ScrollTo(scroll:GetVerticalScroll() - delta * SCROLL_STEP)
    end)
    scroll:SetScript("OnScrollRangeChanged", Refit)
    scroll:SetScript("OnSizeChanged", Refit)
    scroll:SetScript("OnShow", Refit)

    local function CursorY() return select(2, GetCursorPosition()) / bar:GetEffectiveScale() end
    local startY, startScroll
    local function Drag()
        local track = scroll:GetHeight() - bar:GetHeight()
        if track > 0 then ScrollTo(startScroll + (startY - CursorY()) * Range() / track) end
    end
    bar:SetScript("OnMouseDown", function(self, button)
        if button ~= "LeftButton" then return end
        W.ClosePopups()
        startY, startScroll = CursorY(), scroll:GetVerticalScroll()
        self:SetScript("OnUpdate", Drag)
    end)
    bar:SetScript("OnMouseUp", function(self) self:SetScript("OnUpdate", nil) end)
    bar:SetScript("OnHide", function(self) self:SetScript("OnUpdate", nil) end)
    bar:SetScript("OnEnter", function() thumb:SetAlpha(1) end)
    bar:SetScript("OnLeave", function() thumb:SetAlpha(0.5) end)
    return ScrollTo
end

-------------------------------------------------------------------------------
--  Blizzard's control art
-------------------------------------------------------------------------------
-- The quest log's blue selection bar over a button, hidden; the caller shows
-- it on hover or while selected.
function W.Highlight(btn, file)
    local t = btn:CreateTexture(nil, "BORDER")
    t:SetTexture(file or ART.titleHl)
    t:SetBlendMode("ADD")
    t:SetVertexColor(HIGHLIGHT[1], HIGHLIGHT[2], HIGHLIGHT[3])
    t:SetAllPoints()
    t:Hide()
    return t
end

-- A checkbox's box drawn on parent, size across (the art has a margin
-- around the box it shows). Returns it with SetChecked(on), SetHover(on)
-- and SetPushed(on).
local function CheckArt(parent, size)
    local box = CreateFrame("Frame", nil, parent)
    box:SetSize(size, size)
    local up = box:CreateTexture(nil, "ARTWORK")
    up:SetAllPoints()
    up:SetTexture(ART.check)
    local hl = box:CreateTexture(nil, "ARTWORK", nil, 1)
    hl:SetAllPoints()
    hl:SetTexture(ART.checkHl)
    hl:SetBlendMode("ADD")
    hl:Hide()
    local mark = box:CreateTexture(nil, "OVERLAY")
    mark:SetAllPoints()
    mark:SetTexture(ART.checkMark)

    function box.SetChecked(on) mark:SetShown(on and true or false) end
    function box.SetHover(on) hl:SetShown(on) end
    function box.SetPushed(on) up:SetTexture(on and ART.checkDown or ART.check) end
    return box
end

-- Wires a button's hover and press to its CheckArt.
local function CheckRow(row, art)
    row:HookScript("OnEnter", function() art.SetHover(true) end)
    row:HookScript("OnLeave", function() art.SetHover(false) end)
    row:HookScript("OnMouseDown", function() art.SetPushed(true) end)
    row:HookScript("OnMouseUp", function() art.SetPushed(false) end)
end

-- The red panel button's art, left cap, middle and right cap of its file.
local BUTTON_SLICES = { { 0, 0.09375 }, { 0.09375, 0.53125 }, { 0.53125, 0.625 } }
local BUTTON_V, BUTTON_CAP = 0.6875, 12

-- Dresses btn (any button, the secure Reload one too) as Blizzard's red
-- panel button reading label: gold text, white while hovered or locked.
-- opts.fit: as wide as its text. Adds
-- btn.SetLabel(text) and btn.SetLocked(on), which keeps it lit (e.g. armed).
function W.RedButton(btn, label, opts)
    opts = opts or {}
    local slices, lit = {}, {}
    local function Slices(list, layer, file)
        for i, sl in ipairs(BUTTON_SLICES) do
            local t = btn:CreateTexture(nil, layer)
            t:SetTexture(file)
            t:SetTexCoord(sl[1], sl[2], 0, BUTTON_V)
            if i == 1 then
                t:SetPoint("TOPLEFT"); t:SetPoint("BOTTOMLEFT"); t:SetWidth(BUTTON_CAP)
            elseif i == 3 then
                t:SetPoint("TOPRIGHT"); t:SetPoint("BOTTOMRIGHT"); t:SetWidth(BUTTON_CAP)
            else
                t:SetPoint("TOPLEFT", BUTTON_CAP, 0); t:SetPoint("BOTTOMRIGHT", -BUTTON_CAP, 0)
            end
            list[i] = t
        end
    end
    Slices(slices, "BACKGROUND", ART.button)
    Slices(lit, "HIGHLIGHT", ART.buttonHl)
    for _, t in ipairs(lit) do t:SetBlendMode("ADD") end

    local function Art(file)
        for i, t in ipairs(slices) do
            t:SetTexture(file)
            t:SetTexCoord(BUTTON_SLICES[i][1], BUTTON_SLICES[i][2], 0, BUTTON_V)
        end
    end

    local text = btn:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    -- Centered on the art's face, which sits a little lower than the middle.
    text:SetPoint("CENTER", 0, -1)
    btn.label = text

    local locked = false
    local function Paint()
        local c = not btn:IsEnabled() and GRAY or (locked or btn:IsMouseOver()) and WHITE or GOLD
        text:SetTextColor(c[1], c[2], c[3])
    end
    function btn.SetLabel(s)
        text:SetText(s)
        if opts.fit then btn:SetWidth(math.ceil(text:GetStringWidth()) + 2 * BUTTON_CAP + 12) end
    end
    function btn.SetLocked(on)
        locked = on
        if on then btn:LockHighlight() else btn:UnlockHighlight() end
        Paint()
    end
    btn:HookScript("OnEnter", Paint)
    btn:HookScript("OnLeave", Paint)
    btn:HookScript("OnMouseDown", function(self) if self:IsEnabled() then Art(ART.buttonDown) end end)
    btn:HookScript("OnMouseUp", function() Art(ART.button) end)
    btn:HookScript("OnEnable", function() Art(ART.button); Paint() end)
    btn:HookScript("OnDisable", function() Art(ART.buttonOff); Paint() end)
    btn:SetHeight(22)
    btn.SetLabel(label)
    Paint()
    return btn
end

-- A button that runs /reload: the Forever client blocks ReloadUI() from
-- addon code, so it is a secure macro button (the click is the player's).
function W.ReloadButton(parent)
    local btn = CreateFrame("Button", nil, parent, "InsecureActionButtonTemplate")
    btn:RegisterForClicks("AnyUp")
    btn:SetAttribute("useOnKeyDown", false)
    btn:SetAttribute("type", "macro")
    btn:SetAttribute("macrotext", "/reload")
    return btn
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
local function Met(key)
    if key:sub(1, 1) == "!" then return not ns.Get(key:sub(2)) end
    return ns.Get(key) and true or false
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

-- The shared menu rows keep a font set by SetFont even after SetFontObject,
-- so the stock font goes back on with SetFont too.
local function SetStockFont(fs)
    fs:SetFont(GameFontHighlight:GetFont())
end

-- Draws text in a font file; the stock font stays if it fails to load.
local function SetPreviewFont(fs, path)
    SetStockFont(fs)
    if path ~= "default" then fs:SetFont(path, 13, "") end
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

-- A setting's one-line tooltip, at the default anchor so Serene Tooltip's
-- cursor anchor and offsets place it like every other tooltip.
local function ShowTip(owner, text)
    GameTooltip_SetDefaultAnchor(GameTooltip, owner)
    GameTooltip:SetText(text, 1, 1, 1, 1, true)
    GameTooltip:Show()
end

-------------------------------------------------------------------------------
--  Checkbox -- bound to f.key, or to f.get()/f.set(on) for state that is not
--  in SereneDB.
-------------------------------------------------------------------------------
function W.Checkbox(parent, f)
    local function Checked()
        if f.get then return f.get() end
        return ns.Get(f.key)
    end

    local row = CreateFrame("Button", nil, parent)
    row:SetHeight(26)

    -- The art's box shows about 16 across in the middle, at the row's left.
    local box = CheckArt(row, 26)
    box:SetPoint("LEFT", -5, 0)
    CheckRow(row, box)

    local label = row:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    label:SetPoint("LEFT", 26, 0)
    label:SetText(f.label)
    row.label = label

    row:SetScript("OnClick", function()
        PlayClick()
        if f.set then f.set(not Checked()) else ns.SetValue(f.key, not Checked()) end
    end)
    if f.tooltip then
        row:HookScript("OnEnter", function(self) ShowTip(self, f.tooltip) end)
        row:HookScript("OnLeave", GameTooltip_Hide)
    end

    -- "Requires Serene Nameplates" beside the label; on the parent, so the row's
    -- dimming leaves it readable.
    local note
    if f.addon then
        note = parent:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        note:SetPoint("LEFT", label, "RIGHT", 12, 0)
    end

    function row.Refresh()
        box.SetChecked(Checked())
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
local MENU_PAD = 5  -- inside the list's rounded line
local menu, menuRows, state = nil, {}, {}

local function MenuRow(i)
    if menuRows[i] then return menuRows[i] end
    local r = CreateFrame("Button", nil, menu)
    r:SetHeight(ROW_H)
    r:SetPoint("TOPLEFT", MENU_PAD, -MENU_PAD - (i - 1) * ROW_H)
    r:SetPoint("TOPRIGHT", -MENU_PAD - 5, -MENU_PAD - (i - 1) * ROW_H)
    r.hl = W.Highlight(r, ART.rowHl)
    -- The current choice is ticked.
    r.mark = r:CreateTexture(nil, "OVERLAY")
    r.mark:SetTexture(ART.checkMark)
    r.mark:SetSize(16, 16)
    r.mark:SetPoint("LEFT", 2, 0)
    r.text = r:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    r.text:SetPoint("LEFT", 20, 0)
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
        if state.preview then SetPreviewFont(r.text, o.value) else SetStockFont(r.text) end
        r.text:SetText(o.label)
        r.mark:SetShown(o.value == state.selected)
        r:Show()
    end
    for i = n + 1, #menuRows do menuRows[i]:Hide() end
    menu:SetHeight(n * ROW_H + 2 * MENU_PAD)

    -- Scroll position marker along the right edge.
    if #opts > MAX_ROWS then
        local trackH = n * ROW_H
        local thumbH = math.max(12, trackH * MAX_ROWS / #opts)
        local y = (trackH - thumbH) * state.offset / (#opts - MAX_ROWS)
        menu.thumb:SetHeight(thumbH)
        menu.thumb:SetPoint("TOPRIGHT", -MENU_PAD, -MENU_PAD - y)
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
    W.Panel(menu, "POPUP")
    menu.thumb = W.Solid(menu, "ARTWORK", GOLD, 0.5)
    menu.thumb:SetWidth(3)
    menu:Hide()

    menu:SetScript("OnMouseWheel", function(_, delta)
        local maxOffset = math.max(0, #state.options - MAX_ROWS)
        state.offset = math.min(maxOffset, math.max(0, state.offset - delta * 2))
        Render()
    end)
    -- Listens only while it is open.
    menu:SetScript("OnShow", function(self) self:RegisterEvent("GLOBAL_MOUSE_DOWN") end)
    menu:SetScript("OnHide", function(self) self:UnregisterEvent("GLOBAL_MOUSE_DOWN") end)
    menu:SetScript("OnEvent", function(self)
        -- The anchor is spared so a click on it toggles the list closed via OpenMenu.
        if not self:IsMouseOver() and not (state.anchor and state.anchor:IsMouseOver()) then
            self:Hide()
        end
    end)
    return menu
end

local function CloseMenu()
    if menu then menu:Hide() end
end

local function OpenMenu(anchor, options, selected, onSelect, preview)
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
-- checkbox it belongs to. Inline: the label on the left of the row, level
-- with the button at its right. tooltip shows over the label's text.
local function Field(parent, labelText, onClick, inline, tooltip)
    local holder = CreateFrame("Frame", nil, parent)
    holder:SetHeight(labelText and not inline and 50 or 30)

    local btn = CreateFrame("Button", nil, holder)
    btn:SetSize(W.CONTROL_W, 24)
    local label
    if labelText and inline then
        btn:SetPoint("TOPRIGHT", 0, 0)
        label = holder:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
        label:SetPoint("LEFT", holder, "TOPLEFT", 0, -12)
        label:SetPoint("RIGHT", btn, "LEFT", -8, 0)
        label:SetJustifyH("LEFT")
        label:SetText(labelText)
    elseif labelText then
        label = holder:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
        label:SetPoint("TOPLEFT", 0, 0)
        label:SetText(labelText)
        btn:SetPoint("TOPLEFT", label, "BOTTOMLEFT", 0, -6)
    else
        btn:SetPoint("TOPLEFT", 0, 0)
    end
    if label and tooltip then
        -- A text takes no mouse, so a frame over the words themselves does.
        local hover = CreateFrame("Frame", nil, holder)
        hover:SetPoint("LEFT", label, "LEFT")
        hover:SetSize(math.ceil(label:GetStringWidth()), math.ceil(label:GetStringHeight()))
        hover:EnableMouse(true)
        hover:SetScript("OnEnter", function(self) ShowTip(self, tooltip) end)
        hover:SetScript("OnLeave", GameTooltip_Hide)
    end
    btn.panel = W.Panel(btn, "FIELD")

    -- Blizzard's round scroll-down button, pressed while the field is.
    local arrow = btn:CreateTexture(nil, "ARTWORK")
    arrow:SetTexture(ART.arrow)
    arrow:SetSize(24, 24)
    arrow:SetPoint("RIGHT", 0, 0)

    local text = btn:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    text:SetPoint("LEFT", 10, 0)
    text:SetPoint("RIGHT", arrow, "LEFT", -2, 0)
    text:SetJustifyH("LEFT")
    text:SetWordWrap(false)

    btn:SetScript("OnClick", function(self)
        PlayClick()
        onClick(self)
    end)
    btn:SetScript("OnEnter", function() btn.panel.SetLineColor(GOLD) end)
    btn:SetScript("OnLeave", function() btn.panel.SetLineColor() end)
    btn:SetScript("OnMouseDown", function() arrow:SetTexture(ART.arrowDown) end)
    btn:SetScript("OnMouseUp", function() arrow:SetTexture(ART.arrow) end)
    -- Narrower than CONTROL_W in a half-width category; a plain button keeps its own width.
    holder:SetScript("OnSizeChanged", function(_, w)
        if not btn.plain and w > 0 then btn:SetWidth(math.min(W.CONTROL_W, w)) end
    end)
    return holder, btn, text, arrow
end

-- A field turned into a red button reading `label`, sized to it. The field's
-- hover scripts stay and only touch hidden parts.
local function AsButton(btn, text, arrow, label)
    btn.panel.SetShown(false)
    arrow:Hide()
    text:Hide()
    W.RedButton(btn, label, { fit = true })
    btn.plain = true
end

-------------------------------------------------------------------------------
--  Dropdown
-------------------------------------------------------------------------------
function W.Dropdown(parent, f)
    local holder, btn, text = Field(parent, not f.hideLabel and f.label, function(self)
        OpenMenu(self, f.options(), ns.Get(f.key), function(v) ns.SetValue(f.key, v) end, f.preview)
    end, f.inline, f.tooltip)

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

-- A small bordered square showing a hex color. SetColors(hex) hides it when
-- given none and returns whether it shows.
local function Swatch(parent, size)
    local s = CreateFrame("Frame", nil, parent)
    s:SetSize(size, size)
    s.edges = ns.Border(s, EDGE)
    local fill = s:CreateTexture(nil, "ARTWORK")
    fill:SetPoint("TOPLEFT", 1, -1)
    fill:SetPoint("BOTTOMRIGHT", -1, 1)
    function s.SetColors(hex)
        local r, g, b = ns.ColorRGB(hex)
        if r then fill:SetColorTexture(r, g, b, 1) end
        s:SetShown(r ~= nil)
        return r ~= nil
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
local pickerStrata  -- the picker's own strata, put back as it closes
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
    if not pickerStrata then
        pickerStrata = picker:GetFrameStrata()
        picker:HookScript("OnHide", function(self) self:SetFrameStrata(pickerStrata) end)
    end
    picker:SetFrameStrata("FULLSCREEN_DIALOG")
    picker:Raise()
end

-- A dark button framed in EDGE, white while hovered; onLeave repaints it.
-- Returns its edges for PaintChip.
local function Chip(button, onLeave)
    W.Solid(button, "BACKGROUND", DARK):SetAllPoints()
    local edges = ns.Border(button, EDGE)
    button:SetScript("OnEnter", function() ns.SetBorderColor(edges, WHITE) end)
    button:SetScript("OnLeave", onLeave)
    return edges
end

-- A picked chip is framed in gold, its text too.
local function PaintChip(edges, text, on)
    ns.SetBorderColor(edges, on and GOLD or EDGE)
    if text then
        local c = on and GOLD or WHITE
        text:SetTextColor(c[1], c[2], c[3])
    end
end

local function Color(parent, f, labeled)
    local holder = CreateFrame("Frame", nil, parent)
    local top = 0
    if labeled then
        local label = holder:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
        label:SetPoint("TOPLEFT")
        label:SetText(f.label)
        top = -(math.ceil(label:GetStringHeight()) + 6)
    end
    holder:SetHeight(SWATCH - top)

    local choices = {}  -- { button, edges, value (special word or hex), [text] }
    local function Choice(button, value)
        local c = { button = button, value = value, edges = Chip(button, function() holder.Refresh() end) }
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
        -- The color the choice stands for, before its name.
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
            PaintChip(c.edges, c.text, on)
        end
        -- A color off the palette lives on the "+" swatch.
        local r, g, b = ns.ColorRGB(value)
        local own = not matched and r ~= nil
        custom.fill:SetShown(own)
        custom.plus:SetShown(not own)
        if own then custom.fill:SetColorTexture(r, g, b, 1) end
        PaintChip(custom.edges, nil, own)
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

    local x = 0
    local controls = {}

    local chip
    if f.default == "default" then
        local button = CreateFrame("Button", nil, holder)
        local edges = Chip(button, function() holder.Refresh() end)
        local text = button:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        text:SetPoint("CENTER")
        text:SetText("Default")
        local width = math.ceil(text:GetStringWidth()) + 14
        button:SetSize(width, 20)
        button:SetPoint("TOPLEFT", label, "BOTTOMLEFT", 0, -6)
        x = width + 16
        button:SetScript("OnClick", function() PlayClick(); ns.SetValue(f.key, "default") end)
        chip = { button = button, edges = edges, text = text }
        controls[#controls + 1] = button
    end

    local boxes = {}
    for _, o in ipairs(ns.OUTLINE_FLAGS) do
        local row = CreateFrame("Button", nil, holder)
        local box = CheckArt(row, 24)
        box:SetPoint("LEFT", -4, 0)
        CheckRow(row, box)
        local text = row:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
        text:SetPoint("LEFT", 22, 0)
        text:SetText(o.label)
        local width = 22 + math.ceil(text:GetStringWidth())
        row:SetSize(width, 20)
        row:SetPoint("TOPLEFT", label, "BOTTOMLEFT", x, -6)
        x = x + width + 14
        row:SetScript("OnClick", function()
            PlayClick()
            local set = ShownOutline(f)
            set[o.value] = not set[o.value] or nil
            ns.SetValue(f.key, ns.OutlineValue(set))
        end)
        boxes[#boxes + 1] = { flag = o.value, box = box }
        controls[#controls + 1] = row
    end
    holder.width = x - 14  -- the row's own width, for the editor

    function holder.Refresh()
        local set = ShownOutline(f)
        for _, b in ipairs(boxes) do b.box.SetChecked(set[b.flag]) end
        if chip then PaintChip(chip.edges, chip.text, ns.Get(f.key) == "default") end
        local on = Available(holder, f)
        for _, c in ipairs(controls) do c:SetEnabled(on) end
    end
    return holder
end

-------------------------------------------------------------------------------
--  Grid -- a checkbox per row and column for one setting whose value is a
--  table { [row key] = { [column field] = true } }. f.rows is { { key =,
--  label = }, ... } under the heading f.rowLabel, f.columns { { field =,
--  label = }, ... }; a row without an entry reads as empty. f.link, a
--  heading, adds a dropdown at the end of each row that ties it to another
--  row (its `link` field): a linked row takes that row's ticks and its own
--  boxes are dimmed.
-------------------------------------------------------------------------------
local GRID_LABEL_W, GRID_COL_W, GRID_ROW_H, GRID_LINK_W = 104, 76, 26, 128
local NO_ROW, NO_LINK = {}, "None"

function W.Grid(parent, f)
    local holder = CreateFrame("Frame", nil, parent)
    holder:SetHeight(GRID_ROW_H * (#f.rows + 1))
    local linkX = GRID_LABEL_W + #f.columns * GRID_COL_W + 4

    local function RowValue(key)
        return ns.Get(f.key)[key] or NO_ROW
    end

    local function Copy()
        local value = {}
        for k, v in pairs(ns.Get(f.key)) do value[k] = v end
        return value
    end

    local function With(row, field, v)
        local new = {}
        for k, old in pairs(row) do new[k] = old end
        new[field] = v
        return new
    end

    local labels = {}
    for _, row in ipairs(f.rows) do labels[row.key] = row.label end

    local function Heading(text, x, w)
        local head = holder:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        head:SetPoint("TOPLEFT", x, 0)
        head:SetSize(w, GRID_ROW_H)
        head:SetText(text)
        return head
    end
    if f.rowLabel then Heading(f.rowLabel, 0, GRID_LABEL_W):SetJustifyH("LEFT") end
    for c, col in ipairs(f.columns) do
        Heading(col.label, GRID_LABEL_W + (c - 1) * GRID_COL_W, GRID_COL_W)
    end
    if f.link then Heading(f.link, linkX, GRID_LINK_W) end

    -- Only rows that are not linked themselves, so a link is never a chain.
    local function LinkOptions(key)
        local options = { { value = false, label = NO_LINK } }
        for _, row in ipairs(f.rows) do
            if row.key ~= key and not RowValue(row.key).link then
                options[#options + 1] = { value = row.key, label = row.label }
            end
        end
        return options
    end

    -- Rows linked to this one move along to its new target.
    local function SetLink(key, target)
        local value = Copy()
        value[key] = With(RowValue(key), "link", target or nil)
        if target then
            for k, row in pairs(value) do
                if row.link == key then value[k] = With(row, "link", target) end
            end
        end
        ns.SetValue(f.key, value)
    end

    local cells, rowButtons, links = {}, {}, {}
    for r, row in ipairs(f.rows) do
        local y = -r * GRID_ROW_H
        local label = holder:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
        label:SetPoint("TOPLEFT", 0, y)
        label:SetSize(GRID_LABEL_W, GRID_ROW_H)
        label:SetJustifyH("LEFT")
        label:SetText(row.label)
        rowButtons[row.key] = {}
        for c, col in ipairs(f.columns) do
            local btn = CreateFrame("Button", nil, holder)
            btn:SetSize(GRID_COL_W, GRID_ROW_H)
            btn:SetPoint("TOPLEFT", GRID_LABEL_W + (c - 1) * GRID_COL_W, y)
            local box = CheckArt(btn, 26)
            box:SetPoint("CENTER")
            CheckRow(btn, box)
            btn:SetScript("OnClick", function()
                PlayClick()
                local old = RowValue(row.key)
                local value = Copy()
                value[row.key] = With(old, col.field, not old[col.field] or nil)
                ns.SetValue(f.key, value)
            end)
            cells[#cells + 1] = { key = row.key, field = col.field, box = box }
            table.insert(rowButtons[row.key], btn)
        end
        if f.link then
            local field, btn, text = Field(holder, nil, function(self)
                OpenMenu(self, LinkOptions(row.key), RowValue(row.key).link or false,
                    function(v) SetLink(row.key, v) end)
            end)
            field:SetPoint("TOPLEFT", linkX, y - 1)
            field:SetWidth(GRID_LINK_W)
            links[row.key] = { btn = btn, text = text }
        end
    end

    function holder.Refresh()
        for _, cell in ipairs(cells) do
            local own = RowValue(cell.key)
            local shown = own.link and RowValue(own.link) or own
            cell.box.SetChecked(shown[cell.field])
        end
        local on = Available(holder, f)
        for key, buttons in pairs(rowButtons) do
            local free = on and not RowValue(key).link
            for _, b in ipairs(buttons) do
                b:SetEnabled(free)
                b:SetAlpha((free or not on) and 1 or 0.4)
            end
        end
        for key, link in pairs(links) do
            local target = RowValue(key).link
            link.text:SetText(target and labels[target] or NO_LINK)
            link.btn:SetEnabled(on)
        end
    end
    return holder
end

-------------------------------------------------------------------------------
--  Slider
-------------------------------------------------------------------------------
local KNOB = 20
local BAR_INSET = 4  -- the fill's distance from the track's line
local BAR = { top = { 0.82, 0.53, 0.16, 0.9 }, bottom = { 0.5, 0.27, 0.08, 0.9 } }

-- With hideLabel the row above (a checkbox, or text) is its label, and the
-- value goes at that row's right end.
function W.Slider(parent, f)
    local holder = CreateFrame("Frame", nil, parent)
    holder:SetHeight(f.hideLabel and 27 or 48)

    local label = holder:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    label:SetPoint("TOPLEFT", 0, 0)
    label:SetText(f.label)

    -- The track is a field's capsule (twice RADIUS high, so its ends are
    -- round), filled up to the knob. Its middle is level with a field's
    -- beside it (6 under the label, 24 high).
    local slider = CreateFrame("Slider", nil, holder)
    slider:SetOrientation("HORIZONTAL")
    slider:SetSize(W.CONTROL_W, 2 * RADIUS)
    if f.hideLabel then
        label:Hide()
        slider:SetPoint("TOPLEFT", 0, -1)
    else
        slider:SetPoint("TOPLEFT", label, "BOTTOMLEFT", 0, -(6 + 12 - RADIUS))
    end
    slider:SetMinMaxValues(f.min, f.max)
    slider:SetValueStep(f.step or 1)
    slider:SetObeyStepOnDrag(true)
    slider:EnableMouseWheel(true)
    local track = W.Panel(slider, "FIELD")
    slider:SetThumbTexture(MEDIA .. "Knob")
    local thumb = slider:GetThumbTexture()
    thumb:SetSize(KNOB, KNOB)
    thumb:SetDrawLayer("OVERLAY")

    -- The fill: a bar from a round left end to the knob's middle, inside
    -- the track's line.
    local bar = slider:CreateTexture(nil, "ARTWORK")
    bar:SetPoint("TOPLEFT", 2 * BAR_INSET, -BAR_INSET)
    bar:SetPoint("BOTTOMRIGHT", thumb, "CENTER", 0, -(RADIUS - BAR_INSET))
    bar:SetColorTexture(1, 1, 1, 1)
    bar:SetGradient("VERTICAL", CreateColor(unpack(BAR.bottom)), CreateColor(unpack(BAR.top)))
    for _, corner in ipairs({ "TOPLEFT", "BOTTOMLEFT" }) do
        local top = corner == "TOPLEFT"
        local cap = slider:CreateTexture(nil, "ARTWORK")
        cap:SetTexture(MEDIA .. "CornerFill")
        cap:SetTexCoord(unpack(CORNERS[corner]))
        cap:SetSize(BAR_INSET, RADIUS - BAR_INSET)
        cap:SetPoint(corner, BAR_INSET, top and -BAR_INSET or BAR_INSET)
        local c = top and BAR.top or BAR.bottom
        cap:SetVertexColor(c[1], c[2], c[3], c[4])
    end
    slider:SetScript("OnEnter", function() track.SetLineColor(GOLD) end)
    slider:SetScript("OnLeave", function() track.SetLineColor() end)

    local valueText = holder:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    -- On the label's line; without one, level with the middle of a 26 high
    -- row 2 above.
    if f.hideLabel then
        valueText:SetPoint("RIGHT", slider, "TOPRIGHT", 0, 1 + 2 + 13)
    else
        valueText:SetPoint("BOTTOMRIGHT", slider, "TOPRIGHT", 0, 6 + 12 - RADIUS)
    end
    valueText:SetTextColor(GOLD[1], GOLD[2], GOLD[3])

    local step, suffix = f.step or 1, f.suffix or ""
    slider:SetScript("OnValueChanged", function(_, v, userInput)
        v = math.floor(v / step + 0.5) * step
        valueText:SetText(v .. suffix)
        if userInput and v ~= ns.Get(f.key) then ns.SetValue(f.key, v) end
    end)
    slider:SetScript("OnMouseWheel", function(self, delta)
        if IsControlKeyDown() then return W.ScaleWindow(delta) end
        local v = math.min(f.max, math.max(f.min, ns.Get(f.key) + delta * step))
        if v ~= ns.Get(f.key) then
            self:SetValue(v)
            ns.SetValue(f.key, v)
        end
    end)
    -- Narrower than CONTROL_W in a half-width row.
    holder:SetScript("OnSizeChanged", function(_, w)
        if w > 0 then slider:SetWidth(math.min(W.CONTROL_W, w)) end
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
    W.Panel(editor, "POPUP")
    editor.title = editor:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    editor.title:SetPoint("TOPLEFT", EDITOR_PAD, -EDITOR_PAD)
    editor.title:SetTextColor(GOLD[1], GOLD[2], GOLD[3])
    editor:Hide()

    local function Over(frame) return frame and frame:IsShown() and frame:IsMouseOver() end
    editor:SetScript("OnEvent", function(self)
        -- The field toggles it via OpenEditor.
        if not self:IsMouseOver() and not Over(menu) and not Over(ColorPickerFrame)
           and not (editorAnchor and editorAnchor:IsMouseOver()) then
            self:Hide()
        end
    end)
    -- Listens only while it is open.
    editor:SetScript("OnShow", function(self) self:RegisterEvent("GLOBAL_MOUSE_DOWN") end)
    editor:SetScript("OnHide", function(self)
        self:UnregisterEvent("GLOBAL_MOUSE_DOWN")
        CloseMenu()
    end)
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
        local width, y = W.CONTROL_W, 0
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

-------------------------------------------------------------------------------
--  Font group -- one field for a ns.RegisterFontSettings group: font, size
--  and outline at a glance, drawn in that font, after a swatch of its color
--  if it has one; its editor holds the group's own dropdown, slider and
--  outline controls, and the palette. With group.button the row is just a
--  button reading that, without a label above it.
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
            if color then list[#list + 1] = Color(panel, color, true) end
            return list
        end)
    end)

    if group.button then
        AsButton(btn, text, arrow, group.button)
        function holder.Refresh()
            btn:SetEnabled(Available(holder, group.font))
            RefreshEditor(group)
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
--  Color field -- the color as a swatch and its name (a special without a
--  swatch shows as its name only); its editor holds the palette. With
--  f.compact a row as high as a checkbox's: the swatch where the box would
--  be and f.compact beside it.
-------------------------------------------------------------------------------
local function OpenColor(anchor, f)
    OpenEditor(anchor, f, f.label, function(panel) return { Color(panel, f) } end)
end

local function CompactColor(parent, f)
    local row = CreateFrame("Button", nil, parent)
    row:SetHeight(26)
    -- Where a checkbox's box shows, so it lines up with the rows above.
    local swatch = Swatch(row, 16)
    swatch:SetPoint("LEFT", 0, 0)
    local label = row:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    label:SetPoint("LEFT", 26, 0)
    label:SetText(f.compact)

    row:SetScript("OnClick", function(self)
        PlayClick()
        OpenColor(self, f)
    end)
    row:SetScript("OnEnter", function() ns.SetBorderColor(swatch.edges, GOLD) end)
    row:SetScript("OnLeave", function() ns.SetBorderColor(swatch.edges, EDGE) end)

    function row.Refresh()
        ShowColor(swatch, f)
        row:SetEnabled(Available(row, f))
        RefreshEditor(f)
    end
    return row
end

function W.ColorField(parent, f)
    if f.compact then return CompactColor(parent, f) end
    local holder, btn, text, arrow = Field(parent, f.label, function(self) OpenColor(self, f) end)

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
--  Text -- f.label alone, as high as a checkbox row: the label of a setting
--  under it.
-------------------------------------------------------------------------------
function W.Text(parent, f)
    local holder = CreateFrame("Frame", nil, parent)
    holder:SetHeight(26)
    local label = holder:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    label:SetPoint("LEFT", 0, 0)
    label:SetText(f.label)
    function holder.Refresh() Available(holder, f) end
    return holder
end

-------------------------------------------------------------------------------
--  Button -- a plain button reading f.button that runs f.click.
-------------------------------------------------------------------------------
function W.Button(parent, f)
    local holder, btn, text, arrow = Field(parent, nil, function() f.click() end)
    AsButton(btn, text, arrow, f.button)
    function holder.Refresh()
        btn:SetEnabled(Available(holder, f))
    end
    return holder
end

-- The dropdown list and the editor, e.g. when the page changes.
function W.ClosePopups()
    CloseMenu()
    if editor then editor:Hide() end
end
