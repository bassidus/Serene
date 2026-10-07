-------------------------------------------------------------------------------
--  Copy Chat -- "Copy chat" in a chat tab's right-click menu opens that
--  window's lines as plain text, to select and copy.
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

ns.RegisterFeature({
    key = "chatCopy", label = "Copy chat in the tab menu", section = "Chat", category = "Messages",
})
