-------------------------------------------------------------------------------
--  Copy Chat -- "Copy chat" in a chat tab's right-click menu opens that
--  window's lines as plain text, to select and copy. A right click in the
--  window itself can do the same.
--
--  Chat windows take no clicks (they reach the world behind them), so the
--  click is read from the global mouse events. A held right button turns
--  the camera, and a click on a link opens its own menu; neither counts.
-------------------------------------------------------------------------------
local _, ns = ...

local Clean = ns.Clean

-- The window: a title row over the text panel, INSET in from its line.
local TITLE_H, INSET, PAD, BAR_MARGIN = 40, 12, 10, 14
local DEFAULT_W, DEFAULT_H, MIN_W, MIN_H = 460, 300, 320, 180

local frame, edit, ScrollTo  -- built on first use

local function Plain(text)
    return (text:gsub("|K.-|k", "???")  -- Battle.net names, protected
        :gsub("|T.-|t", ""):gsub("|A.-|a", "")
        :gsub("|H.-|h(.-)|h", "%1")
        :gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|cn.-:", ""):gsub("|r", ""))
end

local function ApplyFont()
    if not edit then return end
    ns.ApplyFont(edit, ns.FontState(ChatFontNormal), ns.Get("chatCopyFont"), ns.Get("chatCopyFontSize"),
        ns.Get("chatCopyOutline"))
end

-- Saved as the top left corner and the size, in UIParent units.
local function SaveWindow()
    SereneDB.chatCopyWindow = { left = frame:GetLeft(), top = frame:GetTop(),
        width = frame:GetWidth(), height = frame:GetHeight() }
end

-- Where it was saved, else the default size, centered.
local function PlaceWindow()
    local saved = SereneDB.chatCopyWindow
    frame:ClearAllPoints()
    if saved then
        frame:SetSize(saved.width, saved.height)
        frame:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", saved.left, saved.top)
    else
        frame:SetSize(DEFAULT_W, DEFAULT_H)
        frame:SetPoint("CENTER")
    end
end

local function StopMoving()
    frame:StopMovingOrSizing()
    frame:SetUserPlaced(false)  -- keep it out of the client's layout cache
    SaveWindow()
end

-- The look and the font settings come from the options window's widgets.
local function Build()
    if not ns.Widgets then C_AddOns.LoadAddOn("SereneOptions") end
    local W = ns.Widgets
    if not W then
        ns.Print("SereneOptions is not installed or is disabled.")
        return
    end

    frame = CreateFrame("Frame", "SereneChatCopy", UIParent)
    frame:SetFrameStrata("DIALOG")
    frame:SetToplevel(true)
    frame:SetClampedToScreen(true)
    frame:EnableMouse(true)
    frame:SetMovable(true)
    frame:SetResizable(true)
    frame:SetResizeBounds(MIN_W, MIN_H)
    frame:SetDontSavePosition(true)
    tinsert(UISpecialFrames, "SereneChatCopy")  -- Escape closes it
    W.Panel(frame, "WINDOW")

    local titleBar = CreateFrame("Frame", nil, frame)
    titleBar:SetPoint("TOPLEFT")
    titleBar:SetPoint("TOPRIGHT")
    titleBar:SetHeight(TITLE_H)
    titleBar:EnableMouse(true)
    titleBar:RegisterForDrag("LeftButton")
    titleBar:SetScript("OnDragStart", function() frame:StartMoving() end)
    titleBar:SetScript("OnDragStop", StopMoving)

    local icon = titleBar:CreateTexture(nil, "ARTWORK")
    icon:SetTexture(ns.LOGO)
    icon:SetSize(20, 20)
    icon:SetPoint("LEFT", INSET + 4, 0)
    local title = titleBar:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("LEFT", icon, "RIGHT", 8, 0)
    title:SetText("Copy chat")
    title:SetTextColor(ns.ACCENT[1], ns.ACCENT[2], ns.ACCENT[3])

    local close = W.CloseButton(titleBar, frame)
    local font = W.FontGroup(titleBar, ns.featureByKey.chatCopyFont.group)
    local fontButton = font:GetChildren()
    font:SetSize(fontButton:GetWidth(), fontButton:GetHeight())
    font:SetPoint("RIGHT", close, "LEFT", -2, 0)
    W.AddOutside(font)

    local panel = CreateFrame("Frame", nil, frame)
    panel:SetPoint("TOPLEFT", INSET, -TITLE_H)
    panel:SetPoint("BOTTOMRIGHT", -INSET, INSET)
    W.Panel(panel, "PANEL")

    local scroll = CreateFrame("ScrollFrame", nil, panel)
    scroll:SetPoint("TOPLEFT", PAD, -PAD)
    scroll:SetPoint("BOTTOMRIGHT", -BAR_MARGIN, PAD)
    ScrollTo = W.ScrollBar(scroll, BAR_MARGIN)

    edit = CreateFrame("EditBox", nil, scroll)
    edit:SetMultiLine(true)
    edit:SetAutoFocus(false)
    edit:SetMaxLetters(0)
    edit:SetMaxBytes(0)
    edit:SetFontObject(ChatFontNormal)
    edit:SetWidth(1)
    scroll:SetScrollChild(edit)
    scroll:HookScript("OnSizeChanged", function(_, w) edit:SetWidth(w) end)
    -- Below the last line is still the box.
    scroll:EnableMouse(true)
    scroll:SetScript("OnMouseDown", function() edit:SetFocus() end)
    -- With the box focused, Escape reaches it and not UISpecialFrames.
    edit:SetScript("OnEscapePressed", function() frame:Hide() end)
    edit:SetScript("OnCursorChanged", function(_, _, y, _, h)
        local top, at, view = -y, scroll:GetVerticalScroll(), scroll:GetHeight()
        if top < at then ScrollTo(top) elseif top + h > at + view then ScrollTo(top + h - view) end
    end)
    ApplyFont()

    local grip = CreateFrame("Button", nil, frame)
    grip:SetFrameLevel(panel:GetFrameLevel() + 2)
    grip:SetSize(16, 16)
    grip:SetPoint("BOTTOMRIGHT", -3, 3)
    grip:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up")
    grip:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Down")
    grip:SetHighlightTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Highlight", "ADD")
    grip:SetScript("OnMouseDown", function(_, button)
        if button == "LeftButton" then frame:StartSizing("BOTTOMRIGHT") end
    end)
    grip:SetScript("OnMouseUp", StopMoving)

    frame:SetScript("OnShow", function()
        font.Refresh()
        PlaySound(SOUNDKIT.IG_CHARACTER_INFO_OPEN)
    end)
    frame:SetScript("OnHide", function()
        W.ClosePopups()
        PlaySound(SOUNDKIT.IG_CHARACTER_INFO_CLOSE)
    end)
    PlaceWindow()
    frame:Hide()
end

local function Show(chatFrame)
    if not frame then Build() end
    if not frame then return end
    local lines = {}
    for i = 1, chatFrame:GetNumMessages() do
        local text = Clean((chatFrame:GetMessageInfo(i)))
        if text then lines[#lines + 1] = Plain(text) end
    end
    edit:SetText(table.concat(lines, "\n"))
    frame:Show()
    edit:SetFocus()
    C_Timer.After(0, function() ScrollTo(math.huge) end)
end

-- /serene reset: the default size, centered.
ns.OnResetAll(function()
    SereneDB.chatCopyWindow = nil
    if frame then PlaceWindow() end
end)

Menu.ModifyMenu("MENU_FCF_TAB", function(tab, root)
    root:CreateDivider()
    root:CreateButton("Copy chat", function() Show(_G["ChatFrame" .. tab:GetID()]) end)
end)

local CLICK_TIME = 0.3  -- longer is a camera turn

local pressed     -- chat frame and time of the right button going down over it
local linkClicked -- a link took the click

local function ChatFrameUnderMouse()
    local focus = GetMouseFoci()[1]
    if focus and focus ~= WorldFrame then return end  -- a window over the chat
    for _, name in ipairs(CHAT_FRAMES) do
        local frame = _G[name]
        if frame:IsVisible() and frame:IsMouseOver() then return frame end
    end
end

local hooked = {}  -- chat frame -> true

local function HookLinks()
    for _, name in ipairs(CHAT_FRAMES) do
        local frame = _G[name]
        if not hooked[frame] then
            hooked[frame] = true
            frame:HookScript("OnHyperlinkClick", function() linkClicked = true end)
        end
    end
end

local clicks = CreateFrame("Frame")
clicks:SetScript("OnEvent", function(_, event, button)
    if button ~= "RightButton" then return end
    if event == "GLOBAL_MOUSE_DOWN" then
        local frame = ChatFrameUnderMouse()
        pressed = frame and { frame = frame, time = GetTime() }
        linkClicked = nil
        return
    end
    local p = pressed
    pressed = nil
    if not p or GetTime() - p.time > CLICK_TIME or ChatFrameUnderMouse() ~= p.frame then return end
    -- The link's click comes after this event.
    C_Timer.After(0, function()
        if not linkClicked then Show(p.frame) end
    end)
end)

local function ApplyClick()
    if ns.Get("chatCopyClick") then
        HookLinks()
        clicks:RegisterEvent("GLOBAL_MOUSE_DOWN")
        clicks:RegisterEvent("GLOBAL_MOUSE_UP")
    else
        clicks:UnregisterAllEvents()
        pressed = nil
    end
end

hooksecurefunc("FCF_OpenTemporaryWindow", ApplyClick)

-- Placed on the window itself, not on an options page.
ns.RegisterFontSettings({
    prefix = "chatCopy", label = "Font", apply = ApplyFont,
    size = { 8, 24, 14 }, outline = "default", button = "Font settings",
    blizzard = function()
        local o = ns.FontState(ChatFontNormal)
        return ns.OutlineOf(o.flags, o.sx, o.sy)
    end,
})
ns.RegisterFeature({
    key = "chatCopyClick", label = "Right click to copy", section = "Chat", category = "Messages",
    apply = ApplyClick,
})
