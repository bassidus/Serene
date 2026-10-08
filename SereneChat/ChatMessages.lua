-------------------------------------------------------------------------------
--  Chat Messages -- names as "Name (30)", the level colored against yours,
--  white channel names with or without their number ("[2] [T] Name:", "[Gen]
--  Name:"), gray times, shorter loot, XP and speech lines, and clickable web
--  links.
--
--  Blizzard runs the message and sender name filters in a securecall, so
--  whatever fits there goes there: levels, links and the loot and XP lines,
--  which are the message text alone. Channel names, "says:" and the time
--  are added to the text after the filters, so those rewrite the whole line
--  in each chat window's AddMessage. That wrapper is the one place a
--  Blizzard method is replaced.
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
    if not level or level <= 0 then return end
    local c = GetCreatureDifficultyColor(level)
    return name .. " (|cff" .. ns.RGBToHex(c.r, c.g, c.b) .. level .. "|r)"
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
--  Web links: a click opens Copy Chat's window on the address.
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

EventRegistry:RegisterCallback("SetItemRef", function(_, link)
    local url = link:match("^addon:sereneurl:(.*)")
    if url then ns.CopyText(url, true) end
end)

-------------------------------------------------------------------------------
--  Whole lines: channel names, the sender without brackets, and "[Name]
--  says:" -> "Name:". The channel is one of four styles, each with or
--  without its number:
--    full:   "[2. Trade - City] Name:" or "[Trade - City] Name:"
--    letter: "[2] [T] Name:"           or "[T] Name:"
--    word:   "[1] [Gen] Name:"         or "[Gen] Name:"
--    none:   "[2] Name:"               or "Name:"
--  Guild, party and raid have no number: "[G]" or "[Guild]", "[PL]". The
--  channel shows in white, whatever its own color. The time goes first on
--  every line, Blizzard's own (chat lines only) turned off.
-------------------------------------------------------------------------------
local CHANNEL = "(|Hchannel:[^|]+|h)%[([^%]]+)%](|h)( ?)"
local PLAYER = "(|Hplayer[^|]-|h)%[([^%[%]]-)%](|h)"

-- Numbered channels by their name without number and zone. A channel not
-- listed keeps its name as its word, and as its letter when no number shows.
local CHANNEL_LETTER = {
    General = "W", Trade = "T", LocalDefense = "LD", WorldDefense = "WD",
    LookingForGroup = "LFG", Services = "S", NewcomerChat = "NC",
}
local CHANNEL_WORD = {
    General = "Gen", LocalDefense = "Local", WorldDefense = "World",
    LookingForGroup = "LFG", NewcomerChat = "Newcomer",
}

local GROUP_LETTER = {
    Guild = "G", Officer = "O", Party = "P", ["Party Leader"] = "PL",
    Raid = "R", ["Raid Leader"] = "RL", Instance = "I", ["Instance Leader"] = "IL",
}
local GROUP_WORD = {
    ["Party Leader"] = "PL", ["Raid Leader"] = "RL", ["Instance Leader"] = "IL",
}

-- "" drops the channel and the space after it.
local function Tag(style, numbers, name)
    local index, base = name:match("^(%d+)%. (.+)$")
    if not index then
        if style == "full" then return "[" .. name .. "]" end
        return "[" .. ((style == "word" and GROUP_WORD or GROUP_LETTER)[name] or name) .. "]"
    end
    if style == "full" then return "[" .. (numbers and name or base) .. "]" end
    base = base:gsub(" %- .*", "")  -- "General - Undercity"
    local tag
    if style == "letter" then
        tag = CHANNEL_LETTER[base] or not numbers and base
    elseif style == "word" then
        tag = CHANNEL_WORD[base] or base
    end
    local number = numbers and "[" .. index .. "]"
    if number and tag then return number .. " [" .. tag .. "]" end
    return number or tag and "[" .. tag .. "]" or ""
end

local function ShortChannel(open, name, close, space)
    local tag = Tag(ns.Get("chatChannelNames"), not ns.Get("chatHideChannelNumbers"), name)
    if tag == "" then return "" end
    return open .. "|cffffffff" .. tag .. "|r" .. close .. space
end

-- The text after the name in say, yell and whisper lines (" says: "), right
-- after the player link; an NPC's name is no link and stays as it is.
local SPEECH = {}
for _, key in ipairs({ "CHAT_SAY_GET", "CHAT_YELL_GET", "CHAT_WHISPER_GET" }) do
    local tail = _G[key]:match("^%%s(.+)$")
    SPEECH[#SPEECH + 1] = "|h" .. tail:gsub("[%^%$%(%)%%%.%[%]%*%+%-%?]", "%%%0")
end

local function ShortLine(text)
    text = text:gsub(CHANNEL, ShortChannel, 1)
    text = text:gsub(PLAYER, "%1%2%3", 1)
    if ns.Get("chatShortText") then
        for _, p in ipairs(SPEECH) do
            local n
            text, n = text:gsub(p, "|h: ", 1)
            if n > 0 then break end
        end
    end
    local time = ns.Get("chatTimestamps")
    if time ~= "off" then text = "|cff808080" .. date(time) .. "|r " .. text end
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
    ChatFrameUtil.ForEachChatFrame(Wrap)
end

hooksecurefunc("FCF_OpenTemporaryWindow", ApplyLines)

-- Runs at login too, which is when the windows get their wrapper. Blizzard's
-- own time would come on top of this one.
local function ApplyTimestamps()
    SetCVar("showTimestamps", "none")
    ApplyLines()
end

-- The options' examples are at 14:05:32.
local EXAMPLE_TIME = time({ year = 2000, month = 1, day = 1, hour = 14, min = 5, sec = 32 })

ns.RegisterFeature({
    key = "chatChannelNames", label = "Channel format", section = SECTION, category = CATEGORY,
    type = "dropdown", default = "word",
    -- The examples follow "Time format" and "Hide channel numbers".
    options = function()
        local fmt, numbers = ns.Get("chatTimestamps"), not ns.Get("chatHideChannelNumbers")
        local function Example(style, word, channel)
            local parts = {}
            if fmt ~= "off" then parts[#parts + 1] = date(fmt, EXAMPLE_TIME) end
            local tag = Tag(style, numbers, channel)
            if tag ~= "" then parts[#parts + 1] = tag end
            return { value = style, label = #parts == 0 and word or word .. ": " .. table.concat(parts, " ") }
        end
        return {
            Example("full",   "Full",   "2. Trade - City"),
            Example("word",   "Word",   "1. General - City"),
            Example("letter", "Letter", "2. Trade - City"),
            Example("none",   "None",   "2. Trade - City"),
        }
    end,
})
ns.RegisterFeature({
    key = "chatTimestamps", label = "Time format", section = SECTION, category = CATEGORY,
    type = "dropdown", default = "%H:%M", beside = true, apply = ApplyTimestamps,
    options = function()
        local list = { { value = "off", label = "Off" } }
        for _, fmt in ipairs({ "%H:%M", "%H:%M:%S", "%I:%M", "%I:%M %p" }) do
            list[#list + 1] = { value = fmt, label = date(fmt, EXAMPLE_TIME) }
        end
        return list
    end,
})
ns.RegisterFeature({
    key = "chatHideChannelNumbers", label = "Hide channel numbers", section = SECTION, category = CATEGORY,
    default = false,
})
ns.RegisterFeature({
    key = "chatLevels", label = "Show player levels", section = SECTION, category = CATEGORY,
    space = true,
})
-- Copy Chat's, here for its place on the page.
ns.RegisterFeature({
    key = "chatCopyClick", label = "Right click to copy", section = SECTION, category = CATEGORY,
    beside = true, apply = function() ns.ApplyChatCopyClick() end,
})
ns.RegisterFeature({
    key = "chatShortText", label = "Shorter messages", section = SECTION, category = CATEGORY,
})
ns.RegisterFeature({
    key = "chatLinks", label = "Clickable web links", section = SECTION, category = CATEGORY,
    beside = true,
})
