-------------------------------------------------------------------------------
--  Chat Messages -- levels after names, short channel names ("[2] [Name]:"
--  or "T. Name:"), shorter loot, XP and speech lines, and clickable web
--  links.
--
--  Blizzard runs the message and sender name filters in a securecall, so
--  whatever fits there goes there: levels, links and the loot and XP lines,
--  which are the message text alone. Channel names and "says:" are added to
--  the text after the filters, so those two rewrite the whole line in each
--  chat window's AddMessage. That wrapper is the one place a Blizzard method
--  is replaced; it is put on only once one of the two settings is on.
-------------------------------------------------------------------------------
local _, ns = ...

local SECTION, CATEGORY = "Chat", "Messages"

local Clean = ns.Clean

-------------------------------------------------------------------------------
--  Levels
-------------------------------------------------------------------------------
ChatFrameUtil.AddSenderNameFilter(function(_, name, ...)
    if not ns.Get("chatLevels") then return end
    local guid = Clean(select(12, ...))
    if not guid or not guid:find("^Player%-") then return end
    local level = Clean(select(8, GetPlayerInfoByGUID(guid)))
    if level and level > 0 then return name .. " (" .. level .. ")" end
end)

-------------------------------------------------------------------------------
--  Loot and XP lines, built from Blizzard's own strings: %s and %d become
--  captures, numbered as in the string.
-------------------------------------------------------------------------------
local function Pattern(fmt)
    local p = fmt:gsub("[%^%$%(%)%%%.%[%]%*%+%-%?]", "%%%0")
    p = p:gsub("%%%%s", "(.-)"):gsub("%%%%d", "(%%d+)")
    return "^" .. p .. "$"
end

-- event -> { { pattern, short }, ... }; the longer forms come first.
local SHORT = {
    CHAT_MSG_LOOT = {
        { LOOT_ITEM_SELF_MULTIPLE,        "+ %1x%2" },
        { LOOT_ITEM_SELF,                 "+ %1" },
        { LOOT_ITEM_PUSHED_SELF_MULTIPLE, "+ %1x%2" },
        { LOOT_ITEM_PUSHED_SELF,          "+ %1" },
        { LOOT_ITEM_MULTIPLE,             "%1: + %2x%3" },
        { LOOT_ITEM,                      "%1: + %2" },
    },
    CHAT_MSG_MONEY = {
        { YOU_LOOT_MONEY,   "+ %1" },
        { LOOT_MONEY_SPLIT, "+ %1" },
    },
    CHAT_MSG_CURRENCY = {
        { CURRENCY_GAINED_MULTIPLE, "+ %1x%2" },
        { CURRENCY_GAINED,          "+ %1" },
    },
    CHAT_MSG_COMBAT_XP_GAIN = {
        { COMBATLOG_XPGAIN_EXHAUSTION1,         "+%2 XP: %1 (%3 %4)" },
        { COMBATLOG_XPGAIN_FIRSTPERSON,         "+%2 XP: %1" },
        { COMBATLOG_XPGAIN_QUEST,               "+%1 XP (%2 %3)" },
        { COMBATLOG_XPGAIN_FIRSTPERSON_UNNAMED, "+%1 XP" },
    },
    CHAT_MSG_SYSTEM = {
        { ERR_QUEST_REWARD_EXP_I,   "+%1 XP" },
        { ERR_QUEST_REWARD_MONEY_S, "+ %1" },
    },
}

local function ShortText(_, event, text, ...)
    if not ns.Get("chatShortText") then return false end
    for _, p in ipairs(SHORT[event]) do
        local short, n = text:gsub(p[1], p[2], 1)
        if n > 0 then return false, short, ... end
    end
    return false
end

for event, list in pairs(SHORT) do
    for _, p in ipairs(list) do p[1] = Pattern(p[1]) end
    ChatFrameUtil.AddMessageEventFilter(event, ShortText)
end

-------------------------------------------------------------------------------
--  Web links: a click opens a box to copy the address from.
-------------------------------------------------------------------------------
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

-------------------------------------------------------------------------------
--  Whole lines: channel names in one of two styles, and "[Name] says:" ->
--  "[Name]:".
--    number: "[2. Trade - City] [Name]:" -> "[2] [Name]:", "[Party Leader]" -> "[PL]"
--    letter: "[2. Trade - City] [Name]:" -> "T. Name:", "[Party Leader]" -> "PL."
-------------------------------------------------------------------------------
local CHANNEL = "(|Hchannel:[^|]+|h)%[([^%]]+)%](|h)"
local PLAYER = "(|Hplayer[^|]-|h)%[([^%[%]]-)%](|h)"

-- Numbered channels by their name without number and zone; any other keeps
-- its number.
local CHANNEL_LETTER = {
    General = "W", Trade = "T", LocalDefense = "LD", WorldDefense = "WD",
    LookingForGroup = "LFG", Services = "S", NewcomerChat = "NC",
}

local GROUP_LETTER = {
    Guild = "G", Officer = "O", Party = "P", ["Party Leader"] = "PL",
    Raid = "R", ["Raid Leader"] = "RL", Instance = "I", ["Instance Leader"] = "IL",
}

local function ShortChannel(open, name, close)
    local index, base = name:match("^(%d+)%. (.+)$")
    if ns.Get("chatChannelStyle") == "number" then
        return open .. "[" .. (index or GROUP_LETTER[name] or name) .. "]" .. close
    end
    local short
    if index then
        short = CHANNEL_LETTER[base:gsub(" %- .*", "")] or index
    else
        short = GROUP_LETTER[name] or name
    end
    return open .. short .. "." .. close
end

-- The text after the name in say, yell and whisper lines (" says: "), right
-- after the player link; an NPC's name is no link and stays as it is.
local SPEECH = {}
for _, key in ipairs({ "CHAT_SAY_GET", "CHAT_YELL_GET", "CHAT_WHISPER_GET" }) do
    local tail = _G[key]:match("^%%s(.+)$")
    SPEECH[#SPEECH + 1] = "|h" .. tail:gsub("[%^%$%(%)%%%.%[%]%*%+%-%?]", "%%%0")
end

local function ShortLine(text)
    local style = ns.Get("chatChannelStyle")
    if style ~= "off" then text = text:gsub(CHANNEL, ShortChannel, 1) end
    if style == "letter" then text = text:gsub(PLAYER, "%1%2%3", 1) end
    if ns.Get("chatShortText") then
        for _, p in ipairs(SPEECH) do
            local n
            text, n = text:gsub(p, "|h: ", 1)
            if n > 0 then break end
        end
    end
    return text
end

local original = {}  -- chat frame -> its own AddMessage

local function Wrap(frame)
    if original[frame] then return end
    local add = frame.AddMessage
    original[frame] = add
    frame.AddMessage = function(self, text, ...)
        local clean = Clean(text)
        if type(clean) == "string" then text = ShortLine(clean) end
        return add(self, text, ...)
    end
end

local function ApplyLines()
    if ns.Get("chatChannelStyle") ~= "off" or ns.Get("chatShortText") then ChatFrameUtil.ForEachChatFrame(Wrap) end
end

hooksecurefunc("FCF_OpenTemporaryWindow", ApplyLines)

ns.RegisterFeature({
    key = "chatLevels", label = "Level after names", section = SECTION, category = CATEGORY,
})
ns.RegisterFeature({
    key = "chatLinks", label = "Clickable web links", section = SECTION, category = CATEGORY,
    beside = true,
})
ns.RegisterFeature({
    key = "chatShortText", label = "Shorter loot, XP and speech", section = SECTION, category = CATEGORY,
    apply = ApplyLines,
})
ns.RegisterFeature({
    key = "chatChannelStyle", label = "Short channel names", section = SECTION, category = CATEGORY,
    type = "dropdown", inline = true, default = "number", apply = ApplyLines,
    options = function()
        return {
            { value = "off",    label = "Off" },
            { value = "number", label = "[2] [Name]:" },
            { value = "letter", label = "T. Name:" },
        }
    end,
})
