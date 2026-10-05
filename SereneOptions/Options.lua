-------------------------------------------------------------------------------
--  Options window -- a sidebar tab per feature section, each page stacking
--  a control per registered feature, then the ns.RegisterPage pages. Tabs
--  of Serene* addons that are not loaded are listed too, with only their
--  Enable checkbox. Built on first open; position and scale last for the
--  session.
-------------------------------------------------------------------------------
local ns = Serene
local W = ns.Widgets

local WIDTH, SIDEBAR_W, TITLE_H, PAD, FOOTER_H = 640, 160, 40, 20, 26
local TAB_H, SPACING = 30, 10

local frame
local widgets, pages, tabs = {}, {}, {}

local AddOns = C_AddOns

-- The Serene* addons behind the tabs, found by the X-Serene-Section (a
-- settings tab) or X-Serene-Page (an ns.RegisterPage tab) line in their TOC,
-- loaded or not. Keyed by tab name.
local function Modules()
    local byTab = {}
    for i = 1, AddOns.GetNumAddOns() do
        local name = AddOns.GetAddOnInfo(i)
        local section = AddOns.GetAddOnMetadata(name, "X-Serene-Section")
        local page = AddOns.GetAddOnMetadata(name, "X-Serene-Page")
        if section or page then
            byTab[section or page] = {
                name = name,
                title = AddOns.GetAddOnMetadata(name, "Title") or name,
                isPage = not section,
            }
        end
    end
    return byTab
end

-- Settings tabs, General first and the rest alphabetical, then page tabs.
local function TabNames(modules)
    local sections, pageNames, seen = {}, {}, {}
    local function Add(list, name)
        if seen[name] then return end
        seen[name] = true
        list[#list + 1] = name
    end
    for _, f in ipairs(ns.features) do
        if f.section then Add(sections, f.section) end
    end
    for _, def in ipairs(ns.pages) do Add(pageNames, def.name) end
    for tab, m in pairs(modules) do Add(m.isPage and pageNames or sections, tab) end
    table.sort(sections, function(a, b)
        if (a == "General") ~= (b == "General") then return a == "General" end
        return a < b
    end)
    table.sort(pageNames)
    for _, name in ipairs(pageNames) do sections[#sections + 1] = name end
    return sections
end

local function ShowPage(section)
    W.CloseMenu()
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
    local btn = StyleSidebarButton(CreateFrame("Button", nil, sidebar), "Reset Defaults")
    local armed, timer
    local function Disarm()
        armed = false
        if timer then timer:Cancel(); timer = nil end
        btn.label:SetText("Reset Defaults")
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

-- The Enable checkbox at the top of a tab whose features come from their
-- own addon. It starts out as whether the addon is loaded and then shows
-- the choice made here; the choice turns the addon on or off for all
-- characters, which the client applies on the next load, and until then a
-- note beside it says so. The client's own enable state is not read back:
-- it does not reliably answer for this character. Returns the y below it.
local function CreateAddonToggle(page, module, y)
    local loaded = AddOns.IsAddOnLoaded(module.name) and true or false
    local wanted = loaded
    local box = W.Checkbox(page, {
        label = "Enable",
        tooltip = "Turns " .. module.title .. " on or off for all characters. Takes effect after Reload UI.",
        get = function() return wanted end,
        set = function(on)
            wanted = on
            if on then AddOns.EnableAddOn(module.name) else AddOns.DisableAddOn(module.name) end
            ns.RefreshOptions()
        end,
    })
    box:SetPoint("TOPLEFT", 0, y)
    box:SetPoint("TOPRIGHT", 0, y)
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
    return y - box:GetHeight() - SPACING
end

-- A page registered with ns.RegisterPage builds its own content, below the
-- Enable checkbox when it has one.
local function CreateCustomPage(def, module)
    local page = CreatePageFrame(def.name)
    local body, top = page, 0
    if module then
        top = CreateAddonToggle(page, module, -36) + 36
        body = CreateFrame("Frame", nil, page)
        body:SetPoint("TOPLEFT", 0, top)
        body:SetPoint("BOTTOMRIGHT")
    end
    def.build(body)
    page.contentHeight = (body.contentHeight or 0) - top
    page:Hide()
    return page
end

local function CreatePage(section, module)
    local page = CreatePageFrame(section)

    local y = -36
    if module then y = CreateAddonToggle(page, module, y) end
    for _, f in ipairs(ns.features) do
        if f.section == section then
            local w
            if f.type == "dropdown" then
                w = W.Dropdown(page, f)
            elseif f.type == "slider" then
                w = W.Slider(page, f)
            elseif f.type == "color" then
                w = W.Color(page, f)
            elseif f.type == "outline" then
                w = W.Outline(page, f)
            else
                w = W.Checkbox(page, f)
            end
            w:SetPoint("TOPLEFT", 0, y)
            w:SetPoint("TOPRIGHT", 0, y)
            y = y - w:GetHeight() - (f.type == "boolean" and 2 or SPACING)
            widgets[#widgets + 1] = w
            if f.note then
                -- Under a checkbox it lines up with the label.
                local indent = f.type == "boolean" and 26 or 0
                local note = page:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
                note:SetPoint("TOPLEFT", indent, y + 2)
                note:SetWidth(WIDTH - SIDEBAR_W - 2 * PAD - indent)
                note:SetJustifyH("LEFT")
                note:SetText(f.note)
                y = y - note:GetStringHeight() - SPACING + 2
            end
        end
    end
    page.contentHeight = -y
    page:Hide()
    return page
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
            PinTopLeft(leftUI, topUI, scale)
        end
    end

    grip:SetScript("OnMouseDown", function(self, button)
        if button ~= "LeftButton" then return end
        W.CloseMenu()
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

    -- Pages; the window is as tall as the tallest page, or as the sidebar
    -- needs for its tabs plus the Reload UI button at the bottom.
    local modules = Modules()
    local names = TabNames(modules)
    local pageDefs = {}
    for _, def in ipairs(ns.pages) do pageDefs[def.name] = def end
    local tallest = 10 + (#names + 2) * TAB_H + 40 - PAD - FOOTER_H
    for i, name in ipairs(names) do
        tabs[name] = CreateTab(tabList, name, i)
        if pageDefs[name] then
            pages[name] = CreateCustomPage(pageDefs[name], modules[name])
        else
            pages[name] = CreatePage(name, modules[name])
        end
        tallest = math.max(tallest, pages[name].contentHeight + PAD)
    end
    frame:SetSize(WIDTH, TITLE_H + PAD + tallest + FOOTER_H)

    local footer = frame:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    footer:SetPoint("BOTTOMLEFT", SIDEBAR_W + PAD, 10)
    footer:SetText(table.concat(ns.hints, "   "))

    CreateScaleGrip()
    frame:SetScale(DEFAULT_SCALE)

    -- Every session starts centered: no client layout cache.
    if frame.SetDontSavePosition then frame:SetDontSavePosition(true) end
    Center()

    frame:SetScript("OnShow", function()
        ns.RefreshOptions()
        if SOUNDKIT and SOUNDKIT.IG_CHARACTER_INFO_OPEN then PlaySound(SOUNDKIT.IG_CHARACTER_INFO_OPEN) end
    end)
    frame:SetScript("OnHide", function()
        W.CloseMenu()
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
