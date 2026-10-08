-------------------------------------------------------------------------------
--  Options window -- a sidebar tab per feature section, each page stacking
--  a control per registered feature. At the top of the sidebar: the Modules
--  tab, listing every Serene* addon, loaded or not, with a checkbox to turn
--  it on or off. Built on first open; Ctrl + scroll scales it.
--  Position and scale are saved (SereneDB.optionsWindow); the page and
--  which groups are open last only until the UI reloads.
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
local TAB_TEXT_X = 9   -- a sidebar tab's text, in line with the buttons' edges
local DIVIDER_GAP = 6  -- above and below the line under the Modules tab
local BUTTON_H, BUTTON_GAP = 22, 6             -- Restore defaults and Reload UI
-- Restore defaults and Reload UI, and the gap above them.
local BOTTOM_H = 10 + 2 * BUTTON_H + BUTTON_GAP + 10
local GROUP_PAD = 12  -- inside a category's frame, around its heading and settings
local BLANK_ROW = 16  -- the empty row above a setting with space = true
local PAGE_W = WIDTH - PAGE_X - INSET - 2 * PAGE_PAD
-- Fields and sliders are as wide as one of a pair in a full-width category,
-- so a lone one lines up with the pairs around it.
W.CONTROL_W = (PAGE_W - 2 * GROUP_PAD - SPACING) / 2
local HEADER_H = 30   -- a settings page's title, which stays put while the rest scrolls
local MODULES = "Modules"  -- the page and tab of the addon list
local MAX_SCREEN = 0.45 -- the window's height at most at scale 1, as a share of the screen's

local frame, pagePanel
local widgets, pages, tabs = {}, {}, {}
-- "<section>/<category>" (or "/<sub>") = open, for groups clicked this session.
local opened = {}

local AddOns = C_AddOns

local GOLD, TAN, WHITE = W.GOLD, W.TAN, W.WHITE

-- The Serene* addons with a tab, found by the X-Serene-Section line in
-- their TOC, loaded or not; in tab order.
local function Modules()
    local list = {}
    for i = 1, AddOns.GetNumAddOns() do
        local name = AddOns.GetAddOnInfo(i)
        local section = AddOns.GetAddOnMetadata(name, "X-Serene-Section")
        if section then list[#list + 1] = { name = name, tab = section } end
    end
    table.sort(list, function(a, b) return a.tab < b.tab end)
    return list
end

-- The sections that have settings, in alphabetical order.
local function Sections()
    local seen, list = {}, {}
    for _, f in ipairs(ns.features) do
        if f.section and not seen[f.section] then
            seen[f.section] = true
            list[#list + 1] = f.section
        end
    end
    table.sort(list)
    return list
end

local function ShowPage(section)
    W.ClosePopups()
    for s, page in pairs(pages) do page:SetShown(s == section) end
    for s, tab in pairs(tabs) do tab:SetSelected(s == section) end
end

-- A sidebar tab: text in color (gold if not given), white with the quest
-- log's blue bar behind it while hovered or selected.
local function CreateTab(parent, section, color)
    local tab = CreateFrame("Button", nil, parent)
    tab:SetHeight(TAB_H)
    local hl = W.Highlight(tab)
    local text = tab:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    text:SetPoint("LEFT", TAB_TEXT_X, 0)
    text:SetText(section)

    local selected = false
    local function Paint(hover)
        local lit = selected or hover
        hl:SetShown(lit)
        local c = lit and WHITE or color or GOLD
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
-- closed = true), as a reset does.
local function CloseGroups()
    wipe(opened)
    for _, page in pairs(pages) do
        if page.Layout then page.Layout() end
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

    -- Restore defaults above it.
    local reset = CreateResetButton(sidebar)
    reset:SetPoint("BOTTOMLEFT", reload, "TOPLEFT", 0, BUTTON_GAP)
    reset:SetPoint("BOTTOMRIGHT", reload, "TOPRIGHT", 0, BUTTON_GAP)
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

-- Puts a settings page's content in a scroll frame under its title, with
-- the scroll bar in the right margin. Returns the frame to build the
-- content on, PAGE_W wide; its height is set by the caller.
local function AddScrolling(page)
    local scroll = CreateFrame("ScrollFrame", nil, page)
    scroll:SetPoint("TOPLEFT", 0, -HEADER_H)
    scroll:SetPoint("BOTTOMRIGHT")
    local content = CreateFrame("Frame", nil, scroll)
    content:SetSize(PAGE_W, 1)
    scroll:SetScrollChild(content)
    W.ScrollBar(scroll, PAGE_PAD, W.ScaleWindow)
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

-- A category: a thin frame with its heading inside, around the settings
-- that follow. The heading's row is a button running onToggle, with a plus
-- (closed) or minus (open) at its right; group.SetOpen(open) shows which.
local function CreateGroup(page, text, onToggle)
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
        return allOpen or opened[key] ~= false
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
        opened[key] = not Open()
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

-- The section's settings with each category's gathered together, the
-- categories in the order they first appear. A font group is one row, at
-- its first setting, and its color goes with it.
local function SectionFeatures(section)
    local inGroup = {}
    for _, f in ipairs(ns.features) do
        if f.group then
            if f.group.color then inGroup[f.group.color] = true end
        end
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
-- opened ("<section>/<category>" = true or false). Until
-- then a category is open, unless its first setting has closed = true. A
-- subgroup (settings with sub) is a smaller frame inside its category that
-- opens and closes the same way ("<section>/<category>/<sub>"). A change
-- lays the page out again.
local function CreatePage(section)
    local page = CreatePageFrame(section)
    local content = AddScrolling(page)
    local half = (PAGE_W - SPACING) / 2

    -- Two categories side by side open and close together.
    local list = SectionFeatures(section)
    local column, partner = Columns(list)

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
        local saved = opened[section .. "/" .. key]
        if saved == nil then return startsOpen[key] end
        return saved
    end

    local Layout
    local groups = {}  -- key -> its frame, made once

    local function Group(category, sub)
        local key = sub and category .. "/" .. sub or category
        if not groups[key] then
            groups[key] = CreateGroup(content, sub or category, function()
                local open = not Open(key)
                opened[section .. "/" .. key] = open
                if not sub and partner[category] then
                    opened[section .. "/" .. partner[category]] = open
                end
                W.ClosePopups()
                Layout()
            end)
            groups[key].category, groups[key].sub, groups[key].key = category, sub, key
        end
        return groups[key]
    end

    local made = {}  -- feature -> { control, note }, made once
    local function Made(f)
        if made[f] then return made[f] end
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
        elseif f.type == "button" then
            w = W.Button(content, f)
        elseif f.type == "text" then
            w = W.Text(content, f)
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
        -- one before it, and more of them stack under it there: row is that
        -- row's top, the left one's bottom and the right side's bottom so far.
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
                    local col, start = column[f.category], y
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
                    x, y = x + halfRow, row.right or row.top
                    if f.space and row.right then y = y - BLANK_ROW end
                elseif Beside(list[i + 1]) then
                    xr, row = xr + halfRow, { top = y }
                else
                    row = nil
                end
                w:ClearAllPoints()
                w:SetPoint("TOPLEFT", x, y)
                w:SetPoint("TOPRIGHT", -xr, y)
                gap = (f.type == "boolean" or f.type == "text") and 2 or SPACING
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
                    row.right, y = y, math.min(y, row.bottom)
                    if not Beside(list[i + 1]) then row = nil end
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

    -- The window is sized for the page with everything open.
    allOpen = true
    page.contentHeight = HEADER_H + Layout()
    allOpen = nil
    Layout()
    page.Layout = Layout
    page:Hide()
    return page
end

-- The sidebar's tabs: Modules, a line, then the settings tabs in alphabetical
-- order. Returns the height they take.
local function CreateMenu(parent)
    local function AddTab(name, y, color)
        local tab = CreateTab(parent, name, color)
        tab:SetPoint("TOPLEFT", 3, y)
        tab:SetPoint("TOPRIGHT", -3, y)
        tabs[name] = tab
        return y - TAB_H
    end

    local y = AddTab(MODULES, 0, ns.ACCENT) - DIVIDER_GAP
    local line = W.Solid(parent, "ARTWORK", TAN, 0.35)
    line:SetPoint("TOPLEFT", 12, y)
    line:SetPoint("TOPRIGHT", -12, y)
    line:SetHeight(1)
    y = y - 1 - DIVIDER_GAP

    for _, name in ipairs(Sections()) do
        y = AddTab(name, y)
        pages[name] = CreatePage(name)
    end
    return -y
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
-- checkboxes after it; Dark mode's only while its module is on.
local function CreateFooter()
    local footer = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    footer:SetPoint("LEFT", frame, "BOTTOMLEFT", PAGE_X + 6, INSET + FOOTER_H / 2)
    footer:SetText(FooterText())

    local prev = footer:GetText() ~= "" and footer
    for _, key in ipairs({ "minimapIcon", "darkMode" }) do
        local f = ns.featureByKey[key]
        if not f then break end
        local box = W.Checkbox(frame, f)
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

-- The height the pages want and the least the sidebar needs; set in Build.
local wantedH, sidebarH

-- As tall as the tallest page, but no taller than MAX_SCREEN of the screen
-- at scale 1: longer pages scroll. Counted at scale 1 so the height scales
-- with the rest of the window. Never shorter than the sidebar.
-- EXTRA_H on top gives the bottom of the page and the sidebar some air.
local EXTRA_H = 10
local function FitHeight()
    local screenH = UIParent:GetHeight() * MAX_SCREEN
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
    W.CloseButton(titleBar, frame)

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
    -- sidebar needs room for its tabs and the two buttons at the bottom.
    local menuH = CreateMenu(tabList)
    sidebarH = TITLE_H + 8 + menuH + BOTTOM_H + INSET
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

    ShowPage(MODULES)
    frame:Hide()
end

-- /serene reset (which clears the saved state): default size, centered,
-- every category closed.
ns.OnResetAll(function()
    if not frame then return end
    PlaceWindow()
    CloseGroups()
end)

local outside = {}  -- widgets on other addons' windows (W.AddOutside)

-- A widget another Serene addon put on its own window, refreshed with the
-- options while it shows.
function W.AddOutside(w) outside[#outside + 1] = w end

function ns.RefreshOptions()
    for _, w in ipairs(outside) do
        if w:IsVisible() then w.Refresh() end
    end
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
