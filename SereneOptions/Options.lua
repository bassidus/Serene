-------------------------------------------------------------------------------
--  Options window -- a sidebar tab per feature section, each page stacking
--  a control per registered feature. At the bottom, with the buttons: the
--  Modules tab, listing every Serene* addon, loaded or not, with a checkbox
--  to turn it on or off. Built on first open; Ctrl + scroll scales it.
--  Position and scale are saved (SereneDB.optionsWindow).
-------------------------------------------------------------------------------
local ns = Serene
local W = ns.Widgets

-- The window: a title row, then the sidebar panel and the page panel side by
-- side, INSET in from its line; the footer row runs under the page panel.
local WIDTH, TITLE_H, INSET, FOOTER_H = 720, 40, 12, 30
local SIDEBAR_W, GAP = 172, 8                  -- the sidebar panel, and the gap after it
local PAGE_PAD, PAGE_TOP, PAGE_BOTTOM = 14, 12, 10  -- the page inside its panel
local PAGE_X = INSET + SIDEBAR_W + GAP         -- the page panel's left edge
local TAB_H, SPACING = 26, 10
local MENU_HEADING_H, MENU_GAP, MENU_INDENT = 22, 8, 22  -- the sidebar's group headings
local BUTTON_H, BUTTON_GAP = 22, 6             -- Restore defaults and Reload UI
-- Under the Modules tab: the gap, the line, Restore defaults and Reload UI.
local BOTTOM_H = 10 + 2 * BUTTON_H + BUTTON_GAP + 10 + 1 + 6
local GROUP_PAD = 12  -- inside a category's frame, around its heading and settings
local BLANK_ROW = 16  -- the empty row above a setting with space = true
local PAGE_W = WIDTH - PAGE_X - INSET - 2 * PAGE_PAD
-- Fields and sliders are as wide as one of a pair in a full-width category,
-- so a lone one lines up with the pairs around it.
W.CONTROL_W = (PAGE_W - 2 * GROUP_PAD - SPACING) / 2
local HEADER_H = 30   -- a settings page's title, which stays put while the rest scrolls
local VIEW_W = 160    -- the view dropdown beside the title
local SCROLL_STEP = 40
local MODULES = "Modules"  -- the page and tab of the addon list
local MAX_SCREEN = 0.45 -- the window's height at most, as a share of the screen's

local frame, pagePanel
local widgets, pages, tabs = {}, {}, {}

local AddOns = C_AddOns

local GOLD, TAN, WHITE = W.GOLD, W.TAN, W.WHITE

-- The sidebar's groups: a heading over its settings tabs, in this order.
-- Sections not listed here go under Other.
local MENU = {
    { "Interface", { "Action Bars", "Nameplates", "Unit frames", "Tooltip", "Move & Scale" } },
    { "Quality of life", { "General", "Quests", "Social" } },
}
local OTHER = "Other"

local menuPlace = {}  -- section -> its place in MENU, counting through the groups
do
    local n = 0
    for _, group in ipairs(MENU) do
        for _, name in ipairs(group[2]) do
            n = n + 1
            menuPlace[name] = n
        end
    end
end

-- Menu order, with the unlisted ones last and alphabetical.
local function TabOrder(a, b)
    local pa, pb = menuPlace[a] or math.huge, menuPlace[b] or math.huge
    if pa ~= pb then return pa < pb end
    return a < b
end

-- The Serene* addons with a tab, found by the X-Serene-Section line in
-- their TOC, loaded or not; in tab order.
local function Modules()
    local list = {}
    for i = 1, AddOns.GetNumAddOns() do
        local name = AddOns.GetAddOnInfo(i)
        local section = AddOns.GetAddOnMetadata(name, "X-Serene-Section")
        if section then list[#list + 1] = { name = name, tab = section } end
    end
    table.sort(list, function(a, b) return TabOrder(a.tab, b.tab) end)
    return list
end

-- The sidebar's groups holding the sections that have settings:
-- { { heading =, names = { section, ... } }, ... }, in menu order.
local function MenuGroups()
    local sections = {}
    for _, f in ipairs(ns.features) do
        if f.section then sections[f.section] = true end
    end
    local groups, other = {}, {}
    for _, group in ipairs(MENU) do
        local names = {}
        for _, name in ipairs(group[2]) do
            if sections[name] then names[#names + 1] = name end
        end
        if #names > 0 then groups[#groups + 1] = { heading = group[1], names = names } end
    end
    for name in pairs(sections) do
        if not menuPlace[name] then other[#other + 1] = name end
    end
    if #other > 0 then
        table.sort(other)
        groups[#groups + 1] = { heading = OTHER, names = other }
    end
    return groups
end

local function ShowPage(section)
    W.ClosePopups()
    for s, page in pairs(pages) do page:SetShown(s == section) end
    for s, tab in pairs(tabs) do tab:SetSelected(s == section) end
    SereneDB.optionsPage = section
end

-- A sidebar tab: gold text, white with the quest log's blue bar behind it
-- while hovered or selected.
local function CreateTab(parent, section)
    local tab = CreateFrame("Button", nil, parent)
    tab:SetHeight(TAB_H)
    local hl = W.Highlight(tab)
    local text = tab:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    text:SetPoint("LEFT", MENU_INDENT, 0)
    text:SetText(section)

    local selected = false
    local function Paint(hover)
        local lit = selected or hover
        hl:SetShown(lit)
        local c = lit and WHITE or GOLD
        text:SetTextColor(c[1], c[2], c[3])
    end
    function tab:SetSelected(on)
        selected = on
        Paint(false)
    end
    tab:SetScript("OnEnter", function() Paint(true) end)
    tab:SetScript("OnLeave", function() Paint(false) end)
    tab:SetScript("OnClick", function() ShowPage(section) end)
    Paint(false)
    return tab
end

-------------------------------------------------------------------------------
--  Restore defaults. Two clicks: the first turns the label into
--  "Click again to restore", which reverts after a few seconds.
-------------------------------------------------------------------------------
local CONFIRM_TIME = 4

-- Puts every group back as it starts (open unless its first setting has
-- closed = true), or with a section only that page's, as a reset does.
local function CloseGroups(section)
    for key in pairs(SereneDB.optionsOpen or {}) do
        if not section or key:sub(1, #section + 1) == section .. "/" then SereneDB.optionsOpen[key] = nil end
    end
    for name, page in pairs(pages) do
        if page.Layout and (not section or name == section) then page.Layout() end
    end
end

-- Makes btn ask for a second click before onConfirm runs. setArmed(on)
-- shows which state it is in. Returns a function telling whether it is armed.
local function TwoClick(btn, setArmed, onConfirm)
    local armed, timer
    local function Disarm()
        armed = false
        if timer then timer:Cancel(); timer = nil end
        setArmed(false)
    end
    btn:SetScript("OnClick", function()
        if armed then
            Disarm()
            onConfirm()
            return
        end
        armed = true
        setArmed(true)
        timer = C_Timer.NewTimer(CONFIRM_TIME, Disarm)
    end)
    btn:HookScript("OnHide", Disarm)
    Disarm()
    return function() return armed end
end

local ResetScale  -- set with the window's scaling, below

-- Armed, it reads "Click again to restore", white and lit. Puts the window's
-- size back too; it stays where it is.
local function CreateResetButton(sidebar)
    local btn = W.RedButton(CreateFrame("Button", nil, sidebar), "Restore defaults")
    TwoClick(btn, function(on)
        btn.SetLabel(on and "Click again to restore" or "Restore defaults")
        btn.SetLocked(on)
    end, function()
        ns.ResetDefaults()
        CloseGroups()
        ResetScale()
    end)
    return btn
end

-------------------------------------------------------------------------------
--  Reload UI button. The Forever client blocks ReloadUI() from addon code, so
--  the button is a secure macro button running /reload (the click itself is
--  the player's). The protected child makes the whole window protected, which
--  is fine: it is never open in combat (see ns.ToggleOptionsWindow).
-------------------------------------------------------------------------------
local function CreateReloadButton(sidebar)
    local reload = CreateFrame("Button", nil, sidebar, "InsecureActionButtonTemplate")
    W.RedButton(reload, "Reload UI")
    reload:RegisterForClicks("AnyUp")
    reload:SetAttribute("useOnKeyDown", false)
    reload:SetAttribute("type", "macro")
    reload:SetAttribute("macrotext", "/reload")
    reload:SetPoint("BOTTOMLEFT", 10, 10)
    reload:SetPoint("BOTTOMRIGHT", -10, 10)

    -- Above it, bottom up: Restore defaults, a line, and the Modules tab.
    local reset = CreateResetButton(sidebar)
    reset:SetPoint("BOTTOMLEFT", reload, "TOPLEFT", 0, BUTTON_GAP)
    reset:SetPoint("BOTTOMRIGHT", reload, "TOPRIGHT", 0, BUTTON_GAP)

    local line = W.Solid(sidebar, "ARTWORK", TAN, 0.35)
    line:SetPoint("BOTTOMLEFT", reset, "TOPLEFT", 2, 10)
    line:SetPoint("BOTTOMRIGHT", reset, "TOPRIGHT", -2, 10)
    line:SetHeight(1)

    local modules = CreateTab(sidebar, MODULES)
    modules:SetPoint("BOTTOMLEFT", 3, BOTTOM_H)
    modules:SetPoint("BOTTOMRIGHT", -3, BOTTOM_H)
    tabs[MODULES] = modules
end

local function CreatePageFrame(name)
    local page = CreateFrame("Frame", nil, pagePanel)
    page:SetPoint("TOPLEFT", PAGE_PAD, -PAGE_TOP)
    page:SetPoint("BOTTOMRIGHT", -PAGE_PAD, PAGE_BOTTOM)

    local header = page:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    header:SetPoint("TOPLEFT", 0, -3)
    header:SetText(name)
    page.header = header
    return page
end

-- "Restore page" at a settings page's top right: like Restore defaults, the
-- first click asks for a second, and only the page's own options go back.
local function CreatePageReset(page, section)
    local btn = W.RedButton(CreateFrame("Button", nil, page), "Restore page", { small = true, fit = true })
    btn:SetPoint("TOPRIGHT")
    TwoClick(btn, function(on)
        btn.SetLabel(on and "Click again to restore" or "Restore page")
        btn.SetLocked(on)
    end, function()
        ns.ResetDefaults(section)
        CloseGroups(section)
    end)
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
        -- Centered in the right margin (PAGE_PAD).
        bar:SetPoint("TOPLEFT", scroll, "TOPRIGHT", PAGE_PAD / 2 - 4, -(viewH - barH) * scroll:GetVerticalScroll() / range)
    end
    local function ScrollTo(v)
        scroll:SetVerticalScroll(math.max(0, math.min(Range(), v)))
        PlaceBar()
    end
    local function Refit() ScrollTo(scroll:GetVerticalScroll()) end

    scroll:EnableMouseWheel(true)
    scroll:SetScript("OnMouseWheel", function(_, delta)
        if IsControlKeyDown() then return W.ScaleWindow(delta) end
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
    return content
end

-- A checkbox on the Modules page for a Serene* addon, named after its tab. It
-- starts out as whether the addon is loaded and then shows the choice made
-- here; the choice turns the addon on or off for all characters, which the
-- client applies on the next load, and until then a note beside it says so.
-- The client's own enable state is not read back: it does not reliably
-- answer for this character.
local function CreateAddonToggle(page, module)
    local loaded = AddOns.IsAddOnLoaded(module.name) and true or false
    local wanted = loaded
    local box = W.Checkbox(page, {
        label = module.tab,
        get = function() return wanted end,
        set = function(on)
            wanted = on
            if on then AddOns.EnableAddOn(module.name) else AddOns.DisableAddOn(module.name) end
            ns.RefreshOptions()
        end,
    })
    widgets[#widgets + 1] = box

    local note = box:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    note:SetPoint("LEFT", box.label, "RIGHT", 12, 0)
    note:SetText("Reload UI to apply")
    local refresh = box.Refresh
    function box.Refresh()
        refresh()
        note:SetShown(wanted ~= loaded)
    end
    return box
end

local function Contains(list, value)
    for _, v in ipairs(list) do
        if v == value then return true end
    end
    return false
end

-- Whether a setting shows in a page's view (nil on a page without views).
local function InView(f, view)
    if f.view == nil then return true end
    if type(f.view) == "table" then return Contains(f.view, view) end
    return f.view == view
end

-- The help texts of a category's settings, for its "?", in registration
-- order, a color's specials as "Name: text" under its own. Each reads on its
-- own: the settings' labels are not repeated there. A position pair counts once.
-- With sub, the help of that subgroup; without, the category's own settings.
local function CategoryHelp(section, category, sub, view)
    local help = {}
    for _, f in ipairs(ns.features) do
        if f.section == section and f.category == category and f.sub == sub and (not f.pos or f == f.pos.x)
           and InView(f, view) then
            local lines = {}
            if f.tooltip then lines[1] = f.tooltip end
            for _, s in ipairs(f.specials or {}) do
                if s.tooltip then lines[#lines + 1] = s.label .. ": " .. s.tooltip end
            end
            if #lines > 0 then help[#help + 1] = table.concat(lines, "\n") end
        end
    end
    return help
end

-- A category: a thin frame with its heading inside, around the settings
-- that follow. The heading's row is a button running onToggle, with a plus
-- (closed) or minus (open) at its right; group.SetOpen(open) shows which.
-- With help (see CategoryHelp) a "?" sits left of the plus/minus.
local function CreateGroup(page, text, onToggle, help)
    local group = CreateFrame("Frame", nil, page)
    W.Panel(group, "GROUP")

    local heading = group:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    heading:SetPoint("TOPLEFT", GROUP_PAD, -GROUP_PAD)
    heading:SetText(text)
    group.headingH = heading:GetStringHeight()

    -- The quest log's plus/minus button at the right of the heading's row.
    local btn = CreateFrame("Button", nil, group)
    btn:SetPoint("TOPLEFT")
    btn:SetPoint("TOPRIGHT")
    btn:SetHeight(2 * GROUP_PAD + group.headingH)
    local sign = btn:CreateTexture(nil, "ARTWORK")
    sign:SetSize(16, 16)
    sign:SetPoint("RIGHT", -GROUP_PAD + 3, 0)
    local lit = btn:CreateTexture(nil, "HIGHLIGHT")
    lit:SetAllPoints(sign)
    lit:SetTexture("Interface\\Buttons\\UI-PlusButton-Hilight")
    lit:SetBlendMode("ADD")
    local function Paint(hover)
        local c = hover and WHITE or GOLD
        heading:SetTextColor(c[1], c[2], c[3])
    end
    btn:SetScript("OnClick", function() W.PlayClick(); onToggle() end)
    btn:SetScript("OnEnter", function() Paint(true) end)
    btn:SetScript("OnLeave", function() Paint(false) end)
    Paint(false)
    function group.SetOpen(open)
        sign:SetTexture(open and "Interface\\Buttons\\UI-MinusButton-Up" or "Interface\\Buttons\\UI-PlusButton-Up")
    end
    if help and #help > 0 then
        local q = W.Help(group, text, help)
        q:SetFrameLevel(btn:GetFrameLevel() + 1)  -- over the heading's row button
        q:SetPoint("RIGHT", sign, "LEFT", -4, 0)
    end
    return group
end

-- Puts a group's frame at y; left, right: its inset from the page's edges
-- (0 for full width). Returns the y for its first setting, which goes
-- GROUP_PAD in from the frame's edges; CloseGroup sizes the frame.
local function PlaceGroup(group, y, left, right)
    group.top, group.left, group.right = y - SPACING, left, right
    group:ClearAllPoints()
    group:SetPoint("TOPLEFT", left, group.top)
    group:SetPoint("TOPRIGHT", -right, group.top)
    return group.top - GROUP_PAD - group.headingH - 6
end

-- y is the bottom of the group's last setting. Returns the y below the frame.
local function CloseGroup(group, y)
    local bottom = y - GROUP_PAD / 2
    group:SetHeight(group.top - bottom)
    return bottom
end

-- The Modules page: a line on what the checkboxes do, then a group with one
-- per Serene* addon, which opens and closes like a settings page's.
local ADDONS = "Addons"
local function CreateModulesPage()
    local page = CreatePageFrame(MODULES)
    local content = AddScrolling(page)
    local top = -(36 - HEADER_H)
    local intro = content:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    intro:SetPoint("TOPLEFT", 0, top)
    intro:SetWidth(PAGE_W)
    intro:SetJustifyH("LEFT")
    intro:SetText("Turns each Serene module on or off for all your characters.")

    local boxes = {}
    for _, module in ipairs(Modules()) do
        boxes[#boxes + 1] = CreateAddonToggle(content, module)
    end

    local key = MODULES .. "/" .. ADDONS
    local allOpen  -- while measuring the page open
    local function Open()
        return allOpen or (SereneDB.optionsOpen or {})[key] ~= false
    end

    local group
    -- Returns the content's height.
    local function Layout()
        local open = Open()
        local y = PlaceGroup(group, top - intro:GetStringHeight() - SPACING, 0, 0)
        group.SetOpen(open)
        for _, box in ipairs(boxes) do
            box:SetShown(open)
            if open then
                box:ClearAllPoints()
                box:SetPoint("TOPLEFT", GROUP_PAD, y)
                box:SetPoint("TOPRIGHT", -GROUP_PAD, y)
                y = y - box:GetHeight() - 2
            end
        end
        -- Closed: the frame ends as far under the heading as it starts above it.
        y = CloseGroup(group, open and y + 2 or group.top - GROUP_PAD * 1.5 - group.headingH)
        content:SetHeight(-y)
        return -y
    end
    group = CreateGroup(content, ADDONS, function()
        SereneDB.optionsOpen = SereneDB.optionsOpen or {}
        SereneDB.optionsOpen[key] = not Open()
        W.ClosePopups()
        Layout()
    end)

    allOpen = true
    page.contentHeight = HEADER_H + Layout()
    allOpen = nil
    Layout()
    page.Layout = Layout
    page:Hide()
    return page
end

-- The section's settings in a view with each category's gathered together,
-- the categories in the page's order (ns.SetCategoryOrder), then in the
-- order they first appear. A font group is one row,
-- at its first setting, and its color and position go with it; a position
-- pair is one row, at its X.
local function SectionFeatures(section, view)
    local inGroup = {}
    for _, f in ipairs(ns.features) do
        if f.group then
            if f.group.color then inGroup[f.group.color] = true end
            if f.group.position then inGroup[f.group.position] = true end
        end
    end
    local order, byCategory = {}, {}
    for _, f in ipairs(ns.features) do
        if f.section == section and not inGroup[f.key] and (not f.group or f == f.group.font)
           and (not f.pos or f == f.pos.x) and InView(f, view) then
            local category = f.category or ""
            if not byCategory[category] then
                byCategory[category] = {}
                order[#order + 1] = category
            end
            table.insert(byCategory[category], f)
        end
    end
    local named = {}
    for i, category in ipairs(ns.categoryOrders[section] or {}) do named[category] = i end
    local seen = {}
    for i, category in ipairs(order) do seen[category] = i end
    table.sort(order, function(a, b)
        local na, nb = named[a] or math.huge, named[b] or math.huge
        if na ~= nb then return na < nb end
        return seen[a] < seen[b]
    end)
    local list = {}
    for _, category in ipairs(order) do
        for _, f in ipairs(byCategory[category]) do list[#list + 1] = f end
    end
    return list
end

-- A category whose first setting has beside = true goes to the right of the
-- one before it, the two at half width. Returns [category] = "left" | "right"
-- and [category] = the other category of its pair.
local function Columns(list)
    local column, partner, prev = {}, {}, nil
    for _, f in ipairs(list) do
        if f.category ~= prev then
            if f.beside and prev and f.category then
                column[prev], column[f.category] = "left", "right"
                partner[prev], partner[f.category] = f.category, prev
            end
            prev = f.category
        end
    end
    return column, partner
end

-- Each category opens and closes by its heading; the choice is kept in
-- SereneDB.optionsOpen ("<section>/<category>" = true or false). Until
-- then a category is open, unless its first setting has closed = true. A
-- subgroup (settings with sub) is a smaller frame inside its category that
-- opens and closes the same way ("<section>/<category>/<sub>"). A change
-- lays the page out again.
-- A page with views (ns.SetPageViews) has a dropdown beside its title and
-- lays out only the picked view's settings (SereneDB.optionsView); a
-- category is open or closed in every view alike.
local function CreatePage(section)
    local page = CreatePageFrame(section)
    CreatePageReset(page, section)
    local content = AddScrolling(page)
    local views = ns.pageViews[section]
    local half = (PAGE_W - SPACING) / 2

    local measuring  -- the view laid out while the page is measured
    local function View()
        if not views then return nil end
        if measuring then return measuring end
        local v = (SereneDB.optionsView or {})[section]
        return Contains(views, v) and v or views[1]
    end

    -- [view] = its settings and side-by-side categories, worked out once.
    -- Two categories side by side open and close together.
    local layouts = {}
    local column, partner  -- of the view being laid out
    local function ViewLayout(view)
        local k = view or ""
        if not layouts[k] then
            local list = SectionFeatures(section, view)
            local c, p = Columns(list)
            layouts[k] = { list = list, column = c, partner = p }
        end
        return layouts[k]
    end

    -- A category beside another in any view keeps its half of the row in a
    -- view where it stands alone, so the views look alike.
    local sides = views and {} or ViewLayout(nil).column
    for _, view in ipairs(views or {}) do
        for category, side in pairs(ViewLayout(view).column) do sides[category] = side end
    end

    -- From the first registered setting, which list may leave out (a font
    -- group's color shows in its editor).
    local startsOpen = {}
    for _, f in ipairs(ns.features) do
        if f.section == section and f.category then
            if startsOpen[f.category] == nil then startsOpen[f.category] = f.sub ~= nil or not f.closed end
            local key = f.sub and f.category .. "/" .. f.sub
            if key and startsOpen[key] == nil then startsOpen[key] = not f.closed end
        end
    end

    local allOpen  -- while measuring the page with every category open
    -- key: a category, or "<category>/<sub>" for a subgroup.
    local function Open(key)
        if allOpen then return true end
        local saved = (SereneDB.optionsOpen or {})[section .. "/" .. key]
        if saved == nil then return startsOpen[key] end
        return saved
    end

    local Layout
    local groups = {}  -- "<view>/<key>" -> its frame, made once

    local function Group(category, sub)
        local view = View()
        local key = sub and category .. "/" .. sub or category
        local id = (view or "") .. "/" .. key
        if not groups[id] then
            groups[id] = CreateGroup(content, sub or category, function()
                SereneDB.optionsOpen = SereneDB.optionsOpen or {}
                local open = not Open(key)
                SereneDB.optionsOpen[section .. "/" .. key] = open
                if not sub and partner[category] then
                    SereneDB.optionsOpen[section .. "/" .. partner[category]] = open
                end
                W.ClosePopups()
                Layout()
            end, CategoryHelp(section, category, sub, view))
            groups[id].category, groups[id].sub, groups[id].key = category, sub, key
        end
        return groups[id]
    end

    if views then
        local picker = W.Dropdown(page, {
            label = section, hideLabel = true,
            options = function()
                local list = {}
                for i, v in ipairs(views) do list[i] = { value = v, label = v } end
                return list
            end,
            get = View,
            set = function(v)
                SereneDB.optionsView = SereneDB.optionsView or {}
                SereneDB.optionsView[section] = v
                Layout()
                ns.RefreshOptions()
            end,
        })
        widgets[#widgets + 1] = picker
        picker:SetWidth(VIEW_W)
        -- The button, at the top of its 30-high holder, level with the title.
        picker:SetPoint("TOPLEFT", page.header, "RIGHT", 16, 12)
    end

    local made = {}  -- feature -> { control, note }, made once
    local function Made(f)
        if made[f] then return made[f] end
        local w
        if f.group then
            w = W.FontGroup(content, f.group)
        elseif f.pos then
            w = W.Position(content, f.pos)
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
        widgets[#widgets + 1] = w
        local note
        if f.note then
            note = content:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
            note:SetJustifyH("LEFT")
            note:SetText(f.note)
        end
        made[f] = { w, note }
        return made[f]
    end

    -- Returns the content's height.
    function Layout()
        local l = ViewLayout(View())
        local list = l.list
        column, partner = l.column, l.partner
        -- Other views' settings and frames stay hidden.
        for _, g in pairs(groups) do g:Hide() end
        for _, m in pairs(made) do
            m[1]:Hide()
            if m[2] then m[2]:Hide() end
        end
        -- gap: the space left under the last setting, which a group's frame
        -- takes back so it closes snugly below it.
        local y, gap, group, sub = -(36 - HEADER_H), 0, nil, nil
        local left  -- the left group of a pair, while the right one is laid out

        -- Returns the y the next group opens at: beside a left group, its top.
        local function Close()
            local bottom = CloseGroup(group, y + gap)
            local col = column[group.category]
            if col == "left" then
                left = group
                left.bottom = bottom
                return group.start
            elseif col == "right" and left then
                -- Both end at the lower one's bottom.
                bottom = math.min(bottom, left.bottom)
                left:SetHeight(left.top - bottom)
                group:SetHeight(group.top - bottom)
                left = nil
            end
            return bottom
        end

        -- The parent's frame ends GROUP_PAD under its last subgroup, as far
        -- as the subgroup is in from its sides.
        local function CloseSub()
            y, gap, sub = CloseGroup(sub, y + gap), -GROUP_PAD / 2, nil
        end

        -- A setting with beside (not a category's first) sits to the right of the
        -- one before it: row is that pair's top and the left one's bottom.
        local row
        local function Beside(f)
            return f and f.beside and group and f.category == group.category and f.sub == (sub and sub.sub)
        end

        for i, f in ipairs(list) do
            local right = row and Beside(f)
            if f.category ~= (group and group.category) or f.sub ~= (sub and sub.sub) then
                if sub then CloseSub() end
                right = false
            end
            if f.category ~= (group and group.category) then
                if group then y = Close() end
                group, right = nil, false
                if f.category then
                    local col, start = sides[f.category], y
                    group = Group(f.category)
                    group:Show()
                    y = PlaceGroup(group, y, col == "right" and half + SPACING or 0, col == "left" and half + SPACING or 0)
                    group.start = start
                    group.SetOpen(Open(f.category))
                    -- Closed: the frame ends as far under the heading as it starts above it.
                    if not Open(f.category) then y, gap = group.top - GROUP_PAD * 1.5 - group.headingH, 0 end
                end
            end
            if f.sub and not sub then
                local s = Group(f.category, f.sub)
                s:SetShown(Open(f.category))
                if Open(f.category) then
                    sub = s
                    y = PlaceGroup(sub, y + math.max(gap, 0), group.left + GROUP_PAD, group.right + GROUP_PAD)
                    sub.SetOpen(Open(sub.key))
                    if not Open(sub.key) then y, gap = sub.top - GROUP_PAD * 1.5 - sub.headingH, 0 end
                end
            end
            local w, note = unpack(Made(f))
            local shown = not group or Open(group.category) and (not f.sub or Open(f.category .. "/" .. f.sub))
            w:SetShown(shown)
            if note then note:SetShown(shown) end
            if shown then
                if f.space and not right then y = y - BLANK_ROW end
                local box = sub or group
                local x = box and box.left + GROUP_PAD or 0
                local xr = box and box.right + GROUP_PAD or 0
                local halfRow = (PAGE_W - x - xr + SPACING) / 2
                if right then
                    x, y = x + halfRow, row.top
                elseif Beside(list[i + 1]) then
                    xr, row = xr + halfRow, { top = y }
                else
                    row = nil
                end
                w:ClearAllPoints()
                w:SetPoint("TOPLEFT", x, y)
                w:SetPoint("TOPRIGHT", -xr, y)
                gap = f.type == "boolean" and 2 or SPACING
                y = y - w:GetHeight() - gap
                if note then
                    -- Under a checkbox it lines up with the label.
                    local indent = x + (f.type == "boolean" and 26 or 0)
                    note:ClearAllPoints()
                    note:SetPoint("TOPLEFT", indent, y + 2)
                    note:SetWidth(PAGE_W - indent - xr)
                    gap = SPACING - 2
                    y = y - note:GetStringHeight() - gap
                end
                if right then
                    y, row = math.min(y, row.bottom), nil
                elseif row then
                    row.bottom = y
                end
            end
        end
        if sub then CloseSub() end
        if group then y = Close() end
        content:SetHeight(-y)
        return -y
    end

    -- The window is sized for the page's tallest view with everything open.
    allOpen = true
    local tallest = 0
    for _, view in ipairs(views or { false }) do
        measuring = view or nil
        tallest = math.max(tallest, Layout())
    end
    measuring, allOpen = nil, nil
    page.contentHeight = HEADER_H + tallest
    Layout()
    page.Layout = Layout
    page:Hide()
    return page
end

-- The settings tabs under their group headings. Returns the first section
-- and the height they take.
local function CreateMenu(parent)
    local y, first = 0, nil
    for i, group in ipairs(MenuGroups()) do
        if i > 1 then y = y - MENU_GAP end
        local heading = parent:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        heading:SetPoint("BOTTOMLEFT", parent, "TOPLEFT", 12, y - MENU_HEADING_H + 5)
        heading:SetText(group.heading)
        heading:SetTextColor(TAN[1], TAN[2], TAN[3])
        y = y - MENU_HEADING_H
        for _, name in ipairs(group.names) do
            local tab = CreateTab(parent, name)
            tab:SetPoint("TOPLEFT", 3, y)
            tab:SetPoint("TOPRIGHT", -3, y)
            tabs[name] = tab
            pages[name] = CreatePage(name)
            first = first or name
            y = y - TAB_H
        end
    end
    return first, -y
end

-- "Hold Shift to skip auto loot and auto quests.", or "" with nothing to skip.
local function FooterText()
    local skips = ns.shiftSkips
    if #skips == 0 then return "" end
    local list = skips[#skips]
    if #skips > 1 then list = table.concat(skips, ", ", 1, #skips - 1) .. " and " .. list end
    return "Hold Shift to skip " .. list .. "."
end

-- The footer: the Shift line, then the minimap icon's and Dark mode's
-- checkboxes after it.
local function CreateFooter()
    local footer = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    footer:SetPoint("LEFT", frame, "BOTTOMLEFT", PAGE_X + 6, INSET + FOOTER_H / 2)
    footer:SetText(FooterText())

    local prev = footer:GetText() ~= "" and footer
    for _, key in ipairs({ "minimapIcon", "darkMode" }) do
        local box = W.Checkbox(frame, ns.featureByKey[key])
        box.label:SetFontObject("GameFontHighlightSmall")
        box:SetSize(26 + math.ceil(box.label:GetStringWidth()), 20)
        if prev then
            box:SetPoint("LEFT", prev, "RIGHT", 24, 0)
        else
            box:SetPoint("LEFT", frame, "BOTTOMLEFT", PAGE_X + 6, INSET + FOOTER_H / 2)
        end
        widgets[#widgets + 1] = box
        prev = box
    end
end

-- Child of the title bar and raised above it: as a sibling at the same level,
-- the mouse-enabled drag bar swallowed the clicks.
local function CreateCloseButton(titleBar)
    local close = CreateFrame("Button", nil, titleBar)
    close:SetFrameLevel(titleBar:GetFrameLevel() + 2)
    close:RegisterForClicks("LeftButtonUp")
    close:SetSize(32, 32)
    close:SetPoint("TOPRIGHT", -4, -4)
    close:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
    close:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
    close:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight", "ADD")
    close:SetScript("OnClick", function() frame:Hide() end)
end

-- The height the pages want and the least the sidebar needs; set in Build.
local wantedH, sidebarH

-- As tall as the tallest page, but no taller than MAX_SCREEN of the screen
-- at the current scale: longer pages scroll. Never shorter than the sidebar.
-- EXTRA_H on top gives the bottom of the page and the sidebar some air.
local EXTRA_H = 10
local function FitHeight()
    local screenH = UIParent:GetHeight() * MAX_SCREEN / frame:GetScale()
    frame:SetHeight(math.max(sidebarH, math.min(wantedH, screenH)) + EXTRA_H)
end

local function Center()
    frame:ClearAllPoints()
    frame:SetPoint("CENTER")
end

-------------------------------------------------------------------------------
--  Scaling: Ctrl + scroll anywhere on the window, in the steps Move & Scale
--  uses. The pages have a fixed layout, so scaling keeps every control in
--  place where a free resize would clip them. The top-left corner stays put.
-------------------------------------------------------------------------------
local DEFAULT_SCALE, MIN_SCALE, MAX_SCALE, SCALE_STEP = 1, 0.5, 1.6, 0.05

-- leftUI/topUI are UIParent units; SetPoint offsets are in the frame's own
-- (scaled) units, so they are divided by the scale being applied.
local function PinTopLeft(leftUI, topUI, scale)
    frame:ClearAllPoints()
    frame:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", leftUI / scale, topUI / scale)
end

-- Saved as the top left corner in UIParent units, and the scale.
local function SaveWindow()
    local s = frame:GetScale()
    SereneDB.optionsWindow = { left = frame:GetLeft() * s, top = frame:GetTop() * s, scale = s }
end

-- Where it was saved, else the default size, centered.
local function PlaceWindow()
    local saved = SereneDB.optionsWindow
    frame:SetScale(saved and saved.scale or DEFAULT_SCALE)
    FitHeight()
    if saved then PinTopLeft(saved.left, saved.top, saved.scale) else Center() end
end

local function SetWindowScale(scale)
    local s = frame:GetScale()
    local left, top = frame:GetLeft() * s, frame:GetTop() * s
    frame:SetScale(scale)
    FitHeight()
    PinTopLeft(left, top, scale)
    SaveWindow()
end

-- The default size, the top-left corner kept where it is.
function ResetScale() SetWindowScale(DEFAULT_SCALE) end

-- Also called by the controls that take the wheel themselves (the page's
-- scrolling, sliders) while Ctrl is down.
function W.ScaleWindow(delta)
    local scale = math.floor((frame:GetScale() + delta * SCALE_STEP) * 100 + 0.5) / 100
    scale = math.min(MAX_SCALE, math.max(MIN_SCALE, scale))
    if scale == frame:GetScale() then return end
    W.ClosePopups()
    SetWindowScale(scale)
    ns.FlashTip(frame, math.floor(scale * 100 + 0.5) .. "%")
end

local function Build()
    frame = CreateFrame("Frame", "SereneOptionsFrame", UIParent)
    frame:SetFrameStrata("DIALOG")
    frame:SetToplevel(true)
    frame:SetClampedToScreen(true)
    frame:EnableMouse(true)
    frame:SetMovable(true)
    -- Over the sidebar and the title the wheel would zoom the camera.
    frame:EnableMouseWheel(true)
    frame:SetScript("OnMouseWheel", function(_, delta)
        if IsControlKeyDown() then W.ScaleWindow(delta) end
    end)
    tinsert(UISpecialFrames, "SereneOptionsFrame")  -- Escape closes it

    W.Panel(frame, "WINDOW")

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
        SaveWindow()
    end)
    -- The banner's look: the logo, Serene in its orange, the version in tan.
    local icon = titleBar:CreateTexture(nil, "ARTWORK")
    icon:SetTexture(ns.LOGO)
    icon:SetSize(20, 20)
    icon:SetPoint("LEFT", INSET + 4, 0)

    local title = titleBar:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("LEFT", icon, "RIGHT", 8, 0)
    title:SetText("Serene")
    title:SetTextColor(ns.ACCENT[1], ns.ACCENT[2], ns.ACCENT[3])

    local version = titleBar:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    version:SetPoint("BOTTOMLEFT", title, "BOTTOMRIGHT", 6, 1)
    version:SetText("v" .. AddOns.GetAddOnMetadata("Serene", "Version"))
    version:SetTextColor(TAN[1], TAN[2], TAN[3])
    CreateCloseButton(titleBar)

    local sidebar = CreateFrame("Frame", nil, frame)
    sidebar:SetPoint("TOPLEFT", INSET, -TITLE_H)
    sidebar:SetPoint("BOTTOMLEFT", INSET, INSET)
    sidebar:SetWidth(SIDEBAR_W)
    W.Panel(sidebar, "PANEL")
    local tabList = CreateFrame("Frame", nil, sidebar)
    tabList:SetPoint("TOPLEFT", 0, -8)
    tabList:SetPoint("TOPRIGHT", 0, -8)
    tabList:SetHeight(1)

    pagePanel = CreateFrame("Frame", nil, frame)
    pagePanel:SetPoint("TOPLEFT", PAGE_X, -TITLE_H)
    pagePanel:SetPoint("BOTTOMRIGHT", -INSET, INSET + FOOTER_H)
    W.Panel(pagePanel, "PANEL")

    CreateReloadButton(sidebar)

    -- Pages; the window wants to be as tall as the tallest page, and the
    -- sidebar needs room for its tabs, the Modules tab, the line and the
    -- two buttons at the bottom.
    local first, menuH = CreateMenu(tabList)
    sidebarH = TITLE_H + 8 + menuH + 8 + TAB_H + BOTTOM_H + INSET
    pages[MODULES] = CreateModulesPage()
    local tallest = 0
    for _, page in pairs(pages) do tallest = math.max(tallest, page.contentHeight) end
    wantedH = math.max(sidebarH, TITLE_H + PAGE_TOP + tallest + PAGE_BOTTOM + FOOTER_H + INSET)
    frame:SetWidth(WIDTH)

    CreateFooter()

    -- Saved by us, not in the client's layout cache.
    frame:SetDontSavePosition(true)
    PlaceWindow()

    frame:SetScript("OnShow", function()
        FitHeight()  -- the screen or UI scale may have changed
        ns.RefreshOptions()
        PlaySound(SOUNDKIT.IG_CHARACTER_INFO_OPEN)
    end)
    frame:SetScript("OnHide", function()
        W.ClosePopups()
        PlaySound(SOUNDKIT.IG_CHARACTER_INFO_CLOSE)
    end)

    ShowPage(pages[SereneDB.optionsPage] and SereneDB.optionsPage or first or MODULES)
    frame:Hide()
end

-- /serene reset (which clears the saved state): default size, centered,
-- every category closed.
ns.OnResetAll(function()
    if not frame then return end
    PlaceWindow()
    CloseGroups()
end)

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

-- PLAYER_REGEN_DISABLED runs before the lockdown starts, so Hide still works
-- though the Reload UI button makes the window protected.
local combatCloser = CreateFrame("Frame")
combatCloser:RegisterEvent("PLAYER_REGEN_DISABLED")
combatCloser:SetScript("OnEvent", function()
    if frame and frame:IsShown() then
        frame:Hide()
        ns.Print("Options closed -- entering combat.")
    end
end)
