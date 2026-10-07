-------------------------------------------------------------------------------
--  Copy Chat -- "Copy chat" in a chat tab's right-click menu opens that
--  window's lines as plain text, to select and copy. A right click in the
--  window itself does the same.
--
--  Chat windows take no clicks (they reach the world behind them), so the
--  click is read from the global mouse events. A held right button turns
--  the camera, and a click on a link opens its own menu; neither counts.
-------------------------------------------------------------------------------
local _, ns = ...

local Clean = ns.Clean

local frame, box  -- built on first use

local function Plain(text)
    return (text:gsub("|K.-|k", "???")  -- Battle.net names, protected
        :gsub("|T.-|t", ""):gsub("|A.-|a", "")
        :gsub("|H.-|h(.-)|h", "%1")
        :gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|cn.-:", ""):gsub("|r", ""))
end

local function Build()
    frame = CreateFrame("Frame", "SereneChatCopy", UIParent, "ButtonFrameTemplate")
    ButtonFrameTemplate_HidePortrait(frame)
    ButtonFrameTemplate_HideButtonBar(frame)
    frame.Inset:Hide()
    frame:SetTitle("Copy chat")
    frame:SetSize(700, 500)
    frame:SetPoint("CENTER")
    frame:SetToplevel(true)
    frame:EnableMouse(true)
    table.insert(UISpecialFrames, "SereneChatCopy")

    box = CreateFrame("Frame", nil, frame, "ScrollingEditBoxTemplate")
    box:SetPoint("TOPLEFT", 14, -30)
    box:SetPoint("BOTTOMRIGHT", -10, 10)
end

local function Show(chatFrame)
    if not frame then Build() end
    local lines = {}
    for i = 1, chatFrame:GetNumMessages() do
        local text = Clean((chatFrame:GetMessageInfo(i)))
        if text then lines[#lines + 1] = Plain(text) end
    end
    box:SetText(table.concat(lines, "\n"))
    frame:Show()
    box:SetFocus()
    C_Timer.After(0, function() box:GetScrollBox():ScrollToEnd() end)
end

Menu.ModifyMenu("MENU_FCF_TAB", function(tab, root)
    if not ns.Get("chatCopy") then return end
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
    if ns.Get("chatCopy") and ns.Get("chatCopyClick") then
        HookLinks()
        clicks:RegisterEvent("GLOBAL_MOUSE_DOWN")
        clicks:RegisterEvent("GLOBAL_MOUSE_UP")
    else
        clicks:UnregisterAllEvents()
        pressed = nil
    end
end

hooksecurefunc("FCF_OpenTemporaryWindow", ApplyClick)

ns.RegisterFeature({
    key = "chatCopy", label = "Copy chat in the tab menu", section = "Chat", category = "Messages",
    apply = ApplyClick,
})
ns.RegisterFeature({
    key = "chatCopyClick", label = "Right click in the chat copies too", section = "Chat", category = "Messages",
    beside = true, requires = "chatCopy", apply = ApplyClick,
})
