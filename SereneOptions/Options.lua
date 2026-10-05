-------------------------------------------------------------------------------
--  Options window -- a sidebar tab per feature section, each page stacking
--  a control per registered feature, then the ns.RegisterPage pages. General
--  also lists every Serene* addon, loaded or not, with a checkbox to turn it
--  on or off. Built on first open; position and scale last for the session.
-------------------------------------------------------------------------------
local ns = Serene
local W = ns.Widgets

local WIDTH, SIDEBAR_W, TITLE_H, PAD, FOOTER_H = 640, 160, 40, 20, 26
local TAB_H, SPACING = 30, 10
local GROUP_PAD = 10  -- inside a category's frame, around its heading and settings
local PAGE_W = WIDTH - SIDEBAR_W - 2 * PAD
local HEADER_H = 26   -- a settings page's title, which stays put while the rest scrolls
local SCROLL_STEP = 40
local MAX_SCREEN = 0.45 -- the window's height at most, as a share of the screen's

local frame
local widgets, pages, tabs = {}, {}, {}

local AddOns = C_AddOns

-- Settings tabs come first, General leading and the rest alphabetical,
-- then page tabs.
local function TabOrder(a, aIsPage, b, bIsPage)
    if aIsPage ~= bIsPage then return bIsPage end
    if (a == "General") ~= (b == "General") then return a == "General" end
    return a < b
end

-- The Serene* addons with a tab, found by the X-Serene-Section (a settings
-- tab) or X-Serene-Page (an ns.RegisterPage tab) line in their TOC, loaded
-- or not; in tab order.
local function Modules()
    local list = {}
    for i = 1, AddOns.GetNumAddOns() do
        local name = AddOns.GetAddOnInfo(i)
        local section = AddOns.GetAddOnMetadata(name, "X-Serene-Section")
        local page = AddOns.GetAddOnMetadata(name, "X-Serene-Page")
        if section or page then
            list[#list + 1] = {
                name = name,
                tab = section or page,
                title = AddOns.GetAddOnMetadata(name, "Title") or name,
                isPage = not section,
            }
        end
    end
    table.sort(list, function(a, b) return TabOrder(a.tab, a.isPage, b.tab, b.isPage) end)
    return list
end

local function TabNames()
    local list, isPage = {}, {}
    for _, f in ipairs(ns.features) do
        if f.section and isPage[f.section] == nil then
            isPage[f.section] = false
            list[#list + 1] = f.section
        end
    end
    for _, def in ipairs(ns.pages) do
        if isPage[def.name] == nil then
            isPage[def.name] = true
            list[#list + 1] = def.name
        end
    end
    table.sort(list, function(a, b) return TabOrder(a, isPage[a], b, isPage[b]) end)
    return list
end

local function ShowPage(section)
    W.ClosePopups()
    for s, page in pairs(pages) do page:SetShown(s == section) end
    for s, tab in pairs(tabs) do tab:SetSelected(s == section) end
    SereneDB.optionsPage = section
end

-- Sidebar look shared by the section tabs and the Reload UI button: dim text,
-- white on hover, accent bar + tint when selected. Decorates an existing button.
local function StyleSidebarButton(btn, label)
    btn:SetHeight(TAB_H)

    local hl = W.Solid(btn, "BACKGROUND", W.ACCENT, 0.12)
    hl:SetAllPoints()
    local bar = W.Solid(btn, "ARTWORK", W.ACCENT)
    bar:SetPoint("TOPLEFT")
    bar:SetPoint("BOTTOMLEFT")
    bar:SetWidth(3)

    local text = btn:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    text:SetPoint("LEFT", 16, 0)
    text:SetText(label)
    btn.label = text

    local selected = false
    function btn:SetSelected(on)
        selected = on
        hl:SetShown(on)
        bar:SetShown(on)
        if on then text:SetTextColor(1, 1, 1) else text:SetTextColor(W.DIM[1], W.DIM[2], W.DIM[3]) end
    end
    btn:SetScript("OnEnter", function() if not selected then text:SetTextColor(1, 1, 1) end end)
    btn:SetScript("OnLeave", function() btn:SetSelected(selected) end)
    btn:SetSelected(false)
    return btn
end

local function CreateTab(parent, section, index)
    local tab = StyleSidebarButton(CreateFrame("Button", nil, parent), section)
    tab:SetPoint("TOPLEFT", 0, -(index - 1) * TAB_H)
    tab:SetPoint("TOPRIGHT", 0, -(index - 1) * TAB_H)
    tab:SetScript("OnClick", function() ShowPage(section) end)
    return tab
end

-------------------------------------------------------------------------------
--  Reload UI button. The Forever client blocks ReloadUI() from addon code, so
--  the button is a secure macro button running /reload (the click itself is
--  the player's). A protected child would make the whole window protected --
--  no Hide (Escape) in combat -- so on entering combat it is detached and a
--  plain look-alike that only explains takes its place; it returns after
--  combat. PLAYER_REGEN_DISABLED still runs before the lockdown starts.
-------------------------------------------------------------------------------
local sidebarRef, secureReload, combatReload
local CreateResetButton

local function PlaceAtBottom(btn)
    btn:ClearAllPoints()
    btn:SetPoint("BOTTOMLEFT", sidebarRef, "BOTTOMLEFT", 0, 10)
    btn:SetPoint("BOTTOMRIGHT", sidebarRef, "BOTTOMRIGHT", 0, 10)
end

local function AttachSecureReload()
    if InCombatLockdown() then return end
    if not secureReload then
        secureReload = CreateFrame("Button", nil, sidebarRef, "InsecureActionButtonTemplate")
        StyleSidebarButton(secureReload, "Reload UI")
        secureReload:RegisterForClicks("AnyUp")
        secureReload:SetAttribute("useOnKeyDown", false)
        secureReload:SetAttribute("type", "macro")
        secureReload:SetAttribute("macrotext", "/reload")
    end
    secureReload:SetParent(sidebarRef)
    PlaceAtBottom(secureReload)
    secureReload:Show()
    combatReload:Hide()
end

local function DetachSecureReload()
    combatReload:Show()
    if not secureReload then return end
    secureReload:Hide()
    secureReload:ClearAllPoints()
    secureReload:SetParent(UIParent)
end

-------------------------------------------------------------------------------
--  Reset Defaults. Two clicks: the first turns the label into a red
--  "Click again to reset", which reverts after a few seconds.
-------------------------------------------------------------------------------
local CONFIRM_TIME = 4

CreateResetButton = function(sidebar)
    local btn = StyleSidebarButton(CreateFrame("Button", nil, sidebar), "Reset defaults")
    local armed, timer
    local function Disarm()
        armed = false
        if timer then timer:Cancel(); timer = nil end
        btn.label:SetText("Reset defaults")
        btn:SetSelected(false)
    end
    btn:SetScript("OnClick", function()
        if armed then
            Disarm()
            ns.ResetDefaults()
            return
        end
        armed = true
        btn.label:SetText("Click again to reset")
        btn.label:SetTextColor(1, 0.35, 0.35)
        timer = C_Timer.NewTimer(CONFIRM_TIME, Disarm)
    end)
    btn:HookScript("OnLeave", function() if armed then btn.label:SetTextColor(1, 0.35, 0.35) end end)
    btn:HookScript("OnHide", Disarm)
    return btn
end

local function CreateReloadButton(sidebar)
    sidebarRef = sidebar

    combatReload = StyleSidebarButton(CreateFrame("Button", nil, sidebar), "Reload UI")
    PlaceAtBottom(combatReload)
    combatReload:SetScript("OnClick", function()
        ns.Print("Cannot reload from this button during combat. Type /reload instead.")
    end)

    -- Reset Defaults sits right above it; the separator goes above both.
    local reset = CreateResetButton(sidebar)
    reset:SetPoint("BOTTOMLEFT", combatReload, "TOPLEFT")
    reset:SetPoint("BOTTOMRIGHT", combatReload, "TOPRIGHT")

    local line = W.Solid(sidebar, "ARTWORK", W.EDGE)
    line:SetPoint("BOTTOMLEFT", reset, "TOPLEFT", 12, 6)
    line:SetPoint("BOTTOMRIGHT", reset, "TOPRIGHT", -12, 6)
    line:SetHeight(1)

    local watcher = CreateFrame("Frame")
    watcher:RegisterEvent("PLAYER_REGEN_DISABLED")
    watcher:RegisterEvent("PLAYER_REGEN_ENABLED")
    watcher:SetScript("OnEvent", function(_, event)
        if event == "PLAYER_REGEN_DISABLED" then DetachSecureReload() else AttachSecureReload() end
    end)

    if InCombatLockdown() then DetachSecureReload() else AttachSecureReload() end
end

local function CreatePageFrame(name)
    local page = CreateFrame("Frame", nil, frame)
    page:SetPoint("TOPLEFT", frame, "TOPLEFT", SIDEBAR_W + PAD, -(TITLE_H + PAD))
    page:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -PAD, FOOTER_H)

    local header = page:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    header:SetPoint("TOPLEFT")
    header:SetText(name)
    header:SetTextColor(W.ACCENT[1], W.ACCENT[2], W.ACCENT[3])
    return page
end

-- Puts a settings page's content in a scroll frame under its title, with a
-- thin bar in the right margin, shown only while the content does not fit;
-- the wheel scrolls and the bar can be dragged. Returns the frame to build
-- the content on, PAGE_W wide; its height is set by the caller.
local function AddScrolling(page)
    local scroll = CreateFrame("ScrollFrame", nil, page)
    scroll:SetPoint("TOPLEFT", 0, -HEADER_H)
    scroll:SetPoint("BOTTOMRIGHT")
    local content = CreateFrame("Frame", nil, scroll)
    content:SetSize(PAGE_W, 1)
    scroll:SetScrollChild(content)

    local bar = CreateFrame("Button", nil, page)
    bar:SetWidth(9)
    bar:Hide()
    local thumb = W.Solid(bar, "ARTWORK", W.ACCENT)
    thumb:SetPoint("TOP")
    thumb:SetPoint("BOTTOM")
    thumb:SetWidth(3)
    thumb:SetAlpha(0.6)

    local function Range() return scroll:GetVerticalScrollRange() end
    local function PlaceBar()
        local range, viewH = Range(), scroll:GetHeight()
        bar:SetShown(range > 0.5)
        if range <= 0.5 then return end
        local barH = math.max(20, viewH * viewH / (viewH + range))
        bar:SetHeight(barH)
        bar:ClearAllPoints()
        -- Centered in the right margin (PAD).
        bar:SetPoint("TOPLEFT", scroll, "TOPRIGHT", PAD / 2 - 4, -(viewH - barH) * scroll:GetVerticalScroll() / range)
    end
    local function ScrollTo(v)
        scroll:SetVerticalScroll(math.max(0, math.min(Range(), v)))
        PlaceBar()
    end
    local function Refit() ScrollTo(scroll:GetVerticalScroll()) end

    scroll:EnableMouseWheel(true)
    scroll:SetScript("OnMouseWheel", function(_, delta)
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
    bar:SetScript("OnLeave", function() thumb:SetAlpha(0.6) end)
    return content
end

-- A checkbox on General for a Serene* addon, named after its tab. It
-- starts out as whether the addon is loaded and then shows the choice made
-- here; the choice turns the addon on or off for all characters, which the
-- client applies on the next load, and until then a note beside it says so.
-- The client's own enable state is not read back: it does not reliably
-- answer for this character. Returns the y below it.
local function CreateAddonToggle(page, module, x, y)
    local loaded = AddOns.IsAddOnLoaded(module.name) and true or false
    local wanted = loaded
    local box = W.Checkbox(page, {
        label = module.tab,
        tooltip = "Turns " .. module.title .. " on or off for all characters. Takes effect after Reload UI.",
        get = function() return wanted end,
        set = function(on)
            wanted = on
            if on then AddOns.EnableAddOn(module.name) else AddOns.DisableAddOn(module.name) end
            ns.RefreshOptions()
        end,
    })
    box:SetPoint("TOPLEFT", x, y)
    box:SetPoint("TOPRIGHT", -x, y)
    widgets[#widgets + 1] = box

    local note = box:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    note:SetPoint("LEFT", box.label, "RIGHT", 12, 0)
    note:SetTextColor(W.ACCENT[1], W.ACCENT[2], W.ACCENT[3])
    note:SetText("Reload UI to apply")
    local refresh = box.Refresh
    function box.Refresh()
        refresh()
        note:SetShown(wanted ~= loaded)
    end
    return y - box:GetHeight() - 2
end

-- A category: a thin frame with its heading inside, around the settings
-- that follow. Returns the group and the y for its first setting, which
-- goes GROUP_PAD in from the page's edges; CloseGroup sizes the frame.
local function OpenGroup(page, text, y)
    local group = CreateFrame("Frame", nil, page)
    group.top = y - SPACING
    group:SetPoint("TOPLEFT", 0, group.top)
    group:SetPoint("TOPRIGHT", 0, group.top)
    W.Border(group, W.EDGE)

    local heading = group:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    heading:SetPoint("TOPLEFT", GROUP_PAD, -GROUP_PAD)
    heading:SetText(text)
    heading:SetTextColor(W.ACCENT[1], W.ACCENT[2], W.ACCENT[3])
    return group, group.top - GROUP_PAD - heading:GetStringHeight() - 6
end

-- y is the bottom of the group's last setting. Returns the y below the frame.
local function CloseGroup(group, y)
    local bottom = y - GROUP_PAD / 2
    group:SetHeight(group.top - bottom)
    return bottom
end

-- General's list of Serene* addons under its own heading. Returns the y
-- below it.
local function CreateModuleList(page, y)
    local modules = Modules()
    if #modules == 0 then return y end
    local group
    group, y = OpenGroup(page, "Modules", y)
    for _, module in ipairs(modules) do
        y = CreateAddonToggle(page, module, GROUP_PAD, y)
    end
    return CloseGroup(group, y + 2)
end

-- A page registered with ns.RegisterPage builds its own content.
local function CreateCustomPage(def)
    local page = CreatePageFrame(def.name)
    def.build(page)
    page.contentHeight = page.contentHeight or 0
    page:Hide()
    return page
end

-- The section's settings with each category's gathered together, the
-- categories in the order they first appear. A font group is one row, at
-- its first setting, and its color goes with it.
local function SectionFeatures(section)
    local inGroup = {}
    for _, f in ipairs(ns.features) do
        if f.group and f.group.color then inGroup[f.group.color] = true end
    end
    local order, byCategory = {}, {}
    for _, f in ipairs(ns.features) do
        if f.section == section and not inGroup[f.key] and (not f.group or f == f.group.font) then
            local category = f.category or ""
            if not byCategory[category] then
                byCategory[category] = {}
                order[#order + 1] = category
            end
            table.insert(byCategory[category], f)
        end
    end
    local list = {}
    for _, category in ipairs(order) do
        for _, f in ipairs(byCategory[category]) do list[#list + 1] = f end
    end
    return list
end

local function CreatePage(section)
    local page = CreatePageFrame(section)
    local content = AddScrolling(page)

    -- gap: the space left under the last setting, which a group's frame
    -- takes back so it closes snugly below it.
    local y, gap, group = -(36 - HEADER_H), 0, nil
    for _, f in ipairs(SectionFeatures(section)) do
        if f.category ~= (group and group.category) then
            if group then y = CloseGroup(group, y + gap) end
            group = nil
            if f.category then
                group, y = OpenGroup(content, f.category, y)
                group.category = f.category
            end
        end
        local x = group and GROUP_PAD or 0
        local w
        if f.group then
            w = W.FontGroup(content, f.group)
        elseif f.type == "dropdown" then
            w = W.Dropdown(content, f)
        elseif f.type == "slider" then
            w = W.Slider(content, f)
        elseif f.type == "color" then
            w = W.ColorField(content, f)
        elseif f.type == "outline" then
            w = W.Outline(content, f)
        else
            w = W.Checkbox(content, f)
        end
        w:SetPoint("TOPLEFT", x, y)
        w:SetPoint("TOPRIGHT", -x, y)
        gap = f.type == "boolean" and 2 or SPACING
        y = y - w:GetHeight() - gap
        widgets[#widgets + 1] = w
        if f.note then
            -- Under a checkbox it lines up with the label.
            local indent = x + (f.type == "boolean" and 26 or 0)
            local note = content:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
            note:SetPoint("TOPLEFT", indent, y + 2)
            note:SetWidth(PAGE_W - indent - x)
            note:SetJustifyH("LEFT")
            note:SetText(f.note)
            gap = SPACING - 2
            y = y - note:GetStringHeight() - gap
        end
    end
    if group then y = CloseGroup(group, y + gap) end
    if section == "General" then y = CreateModuleList(content, y) end
    content:SetHeight(-y)
    page.contentHeight = HEADER_H - y
    page:Hide()
    return page
end

-- "Hold Shift to skip auto loot and auto quests." first, then the hints.
local function FooterText()
    local lines, skips = {}, ns.shiftSkips
    if #skips > 0 then
        local list = skips[#skips]
        if #skips > 1 then list = table.concat(skips, ", ", 1, #skips - 1) .. " and " .. list end
        lines[1] = "Hold Shift to skip " .. list .. "."
    end
    for _, hint in ipairs(ns.hints) do lines[#lines + 1] = hint end
    return table.concat(lines, "   ")
end

-- Child of the title bar and raised above it: as a sibling at the same level,
-- the mouse-enabled drag bar swallowed the clicks.
local function CreateCloseButton(titleBar)
    local close = CreateFrame("Button", nil, titleBar)
    close:SetFrameLevel(titleBar:GetFrameLevel() + 2)
    close:RegisterForClicks("LeftButtonUp")
    close:SetSize(24, 24)
    close:SetPoint("TOPRIGHT", -8, -8)
    local lines = {}
    for i, angle in ipairs({ 45, -45 }) do
        local t = close:CreateTexture(nil, "ARTWORK")
        t:SetColorTexture(1, 1, 1, 1)
        t:SetSize(14, 2)
        t:SetPoint("CENTER")
        t:SetRotation(math.rad(angle))
        t:SetVertexColor(W.DIM[1], W.DIM[2], W.DIM[3])
        lines[i] = t
    end
    close:SetScript("OnEnter", function() for _, t in ipairs(lines) do t:SetVertexColor(1, 0.4, 0.4) end end)
    close:SetScript("OnLeave", function() for _, t in ipairs(lines) do t:SetVertexColor(W.DIM[1], W.DIM[2], W.DIM[3]) end end)
    close:SetScript("OnClick", function() frame:Hide() end)
end

-- The height the pages want and the least the sidebar needs; set in Build.
local wantedH, sidebarH

-- As tall as the tallest page, but no taller than MAX_SCREEN of the screen
-- at the current scale: longer pages scroll. Never shorter than the sidebar.
local function FitHeight()
    local screenH = UIParent:GetHeight() * MAX_SCREEN / frame:GetScale()
    frame:SetHeight(math.max(sidebarH, math.min(wantedH, screenH)))
end

-- Size and position last for the session only; nothing is saved.
local function Center()
    frame:ClearAllPoints()
    frame:SetPoint("CENTER")
end

-------------------------------------------------------------------------------
--  Scale grip (bottom-right corner). Dragging scales the whole window -- the
--  pages have a fixed layout, so scaling keeps every control in place where
--  a free resize would clip them. The top-left corner stays put while
--  dragging; right-click resets size (75%) and position (centered).
-------------------------------------------------------------------------------
local DEFAULT_SCALE, MIN_SCALE, MAX_SCALE = 0.75, 0.5, 1.6

-- leftUI/topUI are UIParent units; SetPoint offsets are in the frame's own
-- (scaled) units, so they are divided by the scale being applied.
local function PinTopLeft(leftUI, topUI, scale)
    frame:ClearAllPoints()
    frame:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", leftUI / scale, topUI / scale)
end

local function CursorX()
    return GetCursorPosition() / UIParent:GetEffectiveScale()
end

local function CreateScaleGrip()
    local grip = CreateFrame("Button", nil, frame)
    grip:SetSize(16, 16)
    grip:SetPoint("BOTTOMRIGHT", -3, 3)
    grip:SetFrameLevel(frame:GetFrameLevel() + 10)
    grip:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up")
    grip:SetHighlightTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Highlight")
    grip:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Down")
    grip:RegisterForClicks("RightButtonUp")

    local leftUI, topUI, grabOffset
    local function Drag()
        local scale = (CursorX() - grabOffset - leftUI) / WIDTH
        scale = math.floor(math.min(MAX_SCALE, math.max(MIN_SCALE, scale)) * 100 + 0.5) / 100
        if scale ~= frame:GetScale() then
            frame:SetScale(scale)
            FitHeight()
            PinTopLeft(leftUI, topUI, scale)
        end
    end

    grip:SetScript("OnMouseDown", function(self, button)
        if button ~= "LeftButton" then return end
        W.ClosePopups()
        local s = frame:GetScale()
        leftUI, topUI = frame:GetLeft() * s, frame:GetTop() * s
        -- Where in the grip the cursor caught it, so the window does not jump.
        grabOffset = CursorX() - frame:GetRight() * s
        self:SetScript("OnUpdate", Drag)
    end)
    grip:SetScript("OnMouseUp", function(self, button)
        if button ~= "LeftButton" then return end
        self:SetScript("OnUpdate", nil)
    end)
    grip:SetScript("OnClick", function()  -- right-click: default size, centered
        frame:SetScale(DEFAULT_SCALE)
        FitHeight()
        Center()
    end)
    grip:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText("Right click to reset size and position", 1, 1, 1)
        GameTooltip:Show()
    end)
    grip:SetScript("OnLeave", GameTooltip_Hide)
end

local function Build()
    frame = CreateFrame("Frame", "SereneOptionsFrame", UIParent)
    frame:SetFrameStrata("DIALOG")
    frame:SetToplevel(true)
    frame:SetClampedToScreen(true)
    frame:EnableMouse(true)
    frame:SetMovable(true)
    tinsert(UISpecialFrames, "SereneOptionsFrame")  -- Escape closes it

    W.Solid(frame, "BACKGROUND", W.BG):SetAllPoints()
    W.Border(frame, W.EDGE)

    local titleBar = CreateFrame("Frame", nil, frame)
    titleBar:SetPoint("TOPLEFT")
    titleBar:SetPoint("TOPRIGHT")
    titleBar:SetHeight(TITLE_H)
    titleBar:EnableMouse(true)
    titleBar:RegisterForDrag("LeftButton")
    titleBar:SetScript("OnDragStart", function() frame:StartMoving() end)
    titleBar:SetScript("OnDragStop", function()
        frame:StopMovingOrSizing()
        frame:SetUserPlaced(false)  -- keep it out of the client's layout cache
    end)
    local titleLine = W.Solid(titleBar, "ARTWORK", W.EDGE)
    titleLine:SetPoint("BOTTOMLEFT", 1, 0)
    titleLine:SetPoint("BOTTOMRIGHT", -1, 0)
    titleLine:SetHeight(1)

    local icon = titleBar:CreateTexture(nil, "ARTWORK")
    icon:SetTexture("Interface\\Icons\\Spell_Nature_Tranquility")
    icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
    icon:SetSize(20, 20)
    icon:SetPoint("LEFT", 14, 0)

    local title = titleBar:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("LEFT", icon, "RIGHT", 8, 0)
    title:SetText("Serene")
    title:SetTextColor(W.ACCENT[1], W.ACCENT[2], W.ACCENT[3])

    local version = C_AddOns and C_AddOns.GetAddOnMetadata and C_AddOns.GetAddOnMetadata("Serene", "Version")
    if version then
        local v = titleBar:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
        v:SetPoint("BOTTOMLEFT", title, "BOTTOMRIGHT", 6, 1)
        v:SetText("v" .. version)
    end
    CreateCloseButton(titleBar)

    local sidebar = CreateFrame("Frame", nil, frame)
    sidebar:SetPoint("TOPLEFT", 1, -(TITLE_H + 1))
    sidebar:SetPoint("BOTTOMLEFT", 1, 1)
    sidebar:SetWidth(SIDEBAR_W - 1)
    W.Solid(sidebar, "BACKGROUND", W.PANEL):SetAllPoints()
    local tabList = CreateFrame("Frame", nil, sidebar)
    tabList:SetPoint("TOPLEFT", 0, -10)
    tabList:SetPoint("TOPRIGHT", 0, -10)
    tabList:SetHeight(1)

    CreateReloadButton(sidebar)

    -- Pages; the window wants to be as tall as the tallest page, and the
    -- sidebar needs room for its tabs plus the two buttons at the bottom.
    local names = TabNames()
    local pageDefs = {}
    for _, def in ipairs(ns.pages) do pageDefs[def.name] = def end
    sidebarH = TITLE_H + 10 + (#names + 2) * TAB_H + 40
    local tallest = 0
    for i, name in ipairs(names) do
        tabs[name] = CreateTab(tabList, name, i)
        if pageDefs[name] then
            pages[name] = CreateCustomPage(pageDefs[name])
        else
            pages[name] = CreatePage(name)
        end
        tallest = math.max(tallest, pages[name].contentHeight + PAD)
    end
    wantedH = math.max(sidebarH, TITLE_H + PAD + tallest + FOOTER_H)
    frame:SetWidth(WIDTH)

    local footer = frame:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    footer:SetPoint("BOTTOMLEFT", SIDEBAR_W + PAD, 10)
    footer:SetText(FooterText())

    CreateScaleGrip()
    frame:SetScale(DEFAULT_SCALE)
    FitHeight()

    -- Every session starts centered: no client layout cache.
    if frame.SetDontSavePosition then frame:SetDontSavePosition(true) end
    Center()

    frame:SetScript("OnShow", function()
        FitHeight()  -- the screen or UI scale may have changed
        ns.RefreshOptions()
        if SOUNDKIT and SOUNDKIT.IG_CHARACTER_INFO_OPEN then PlaySound(SOUNDKIT.IG_CHARACTER_INFO_OPEN) end
    end)
    frame:SetScript("OnHide", function()
        W.ClosePopups()
        if SOUNDKIT and SOUNDKIT.IG_CHARACTER_INFO_CLOSE then PlaySound(SOUNDKIT.IG_CHARACTER_INFO_CLOSE) end
    end)

    ShowPage(pages[SereneDB.optionsPage] and SereneDB.optionsPage or names[1])
    frame:Hide()
end

function ns.RefreshOptions()
    if not (frame and frame:IsShown()) then return end
    for _, w in ipairs(widgets) do w.Refresh() end
end

-- Called through ns.ToggleOptions in Serene, which loads this addon.
-- Combat: no opening, and an open window closes as combat starts.
function ns.ToggleOptionsWindow()
    if frame and frame:IsShown() then
        frame:Hide()
        return
    end
    if InCombatLockdown() then
        ns.Print("Cannot open options during combat.")
        return
    end
    if not frame then Build() end
    frame:Show()
end

-- PLAYER_REGEN_DISABLED runs before the lockdown starts, so Hide still works.
local combatCloser = CreateFrame("Frame")
combatCloser:RegisterEvent("PLAYER_REGEN_DISABLED")
combatCloser:SetScript("OnEvent", function()
    if frame and frame:IsShown() then
        frame:Hide()
        ns.Print("Options closed -- entering combat.")
    end
end)
