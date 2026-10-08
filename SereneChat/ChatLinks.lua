-------------------------------------------------------------------------------
--  Chat Links -- web addresses in player chat as links; a click opens a box
--  to copy the address from. Its own file so the setting lists after Copy
--  Chat's.
-------------------------------------------------------------------------------
local _, ns = ...

local PLAYER_CHAT = {
    "CHAT_MSG_SAY", "CHAT_MSG_YELL", "CHAT_MSG_EMOTE", "CHAT_MSG_WHISPER", "CHAT_MSG_WHISPER_INFORM",
    "CHAT_MSG_BN_WHISPER", "CHAT_MSG_BN_WHISPER_INFORM", "CHAT_MSG_GUILD", "CHAT_MSG_OFFICER",
    "CHAT_MSG_PARTY", "CHAT_MSG_PARTY_LEADER", "CHAT_MSG_RAID", "CHAT_MSG_RAID_LEADER",
    "CHAT_MSG_RAID_WARNING", "CHAT_MSG_INSTANCE_CHAT", "CHAT_MSG_INSTANCE_CHAT_LEADER", "CHAT_MSG_CHANNEL",
}

-- After whitespace or at the start, so an address already made a link is
-- not matched again from its "www.".
local URLS = { "%f[%S]%a[%w+.-]+://%S+", "%f[%S]www%.[%w_-]+%.%a%a+%S*" }

local function Link(url)
    return "|cff149bfd|Haddon:sereneurl:" .. url .. "|h[" .. url .. "]|h|r"
end

local function Links(_, _, text, ...)
    if not ns.Get("chatLinks") or not (text:find("://", 1, true) or text:find("www.", 1, true)) then
        return false
    end
    for _, p in ipairs(URLS) do text = text:gsub(p, Link) end
    return false, text, ...
end

for _, event in ipairs(PLAYER_CHAT) do ChatFrameUtil.AddMessageEventFilter(event, Links) end

StaticPopupDialogs.SERENE_CHAT_URL = {
    text = "Ctrl+C copies the link.",
    button1 = CLOSE,
    hasEditBox = true,
    editBoxWidth = 350,
    OnShow = function(dialog, url)
        local box = dialog:GetEditBox()
        box:SetText(url)
        box:HighlightText()
        box:SetFocus()
    end,
    EditBoxOnEnterPressed = function() StaticPopup_Hide("SERENE_CHAT_URL") end,
    EditBoxOnEscapePressed = function() StaticPopup_Hide("SERENE_CHAT_URL") end,
    timeout = 0,
    whileDead = true,
    hideOnEscape = true,
}

EventRegistry:RegisterCallback("SetItemRef", function(_, link)
    local url = link:match("^addon:sereneurl:(.*)")
    if url then StaticPopup_Show("SERENE_CHAT_URL", nil, nil, url) end
end)

ns.RegisterFeature({
    key = "chatLinks", label = "Clickable web links", section = "Chat", category = "Messages",
})
