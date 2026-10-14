-------------------------------------------------------------------------------
--  Chat Messages -- names as "Name (30)", the level colored against yours,
--  white channel names with or without their number ("[2] [T] Name:", "[Gen]
--  Name:"), times (gray or not), shorter loot, XP, skill and speech lines, and
--  clickable web links.
--
--  Blizzard runs the message and sender name filters in a securecall, so
--  whatever fits there goes there: levels, links and the loot, XP and skill
--  lines, which are the message text alone. Channel names, "says:" and the
--  time are added to the text after the filters, so those rewrite the whole line
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
--  Loot and XP lines, built from Blizzard's own strings (ns.FormatPattern).
-------------------------------------------------------------------------------

-- event -> { { pattern, short }, ... }. A string that another one's pattern
-- would also match (a longer form, "You automatically passed" against
-- "%s passed") comes first.
local SHORT = {
    CHAT_MSG_LOOT = {
        { LOOT_ITEM_SELF_MULTIPLE,        "+%2 %1" },
        { LOOT_ITEM_SELF,                 "+1 %1" },
        { LOOT_ITEM_PUSHED_SELF_MULTIPLE, "+%2 %1" },
        { LOOT_ITEM_PUSHED_SELF,          "+1 %1" },
        { LOOT_ITEM_CREATED_SELF_MULTIPLE, "+%2 %1" },
        { LOOT_ITEM_CREATED_SELF,         "+1 %1" },
        { LOOT_ITEM_MULTIPLE,             "%1: +%3 %2" },
        { LOOT_ITEM,                      "%1: +1 %2" },
        -- Group loot rolls. Blizzard's [Loot] link in front (loot history)
        -- is left out; the history is still on its own window.
        { LOOT_ROLL_NEED,                 "%2: Need %3" },
        { LOOT_ROLL_GREED,                "%2: Greed %3" },
        { LOOT_ROLL_DISENCHANT,           "%1: Disenchant %2" },
        { LOOT_ROLL_NEED_SELF,            "You: Need %2" },
        { LOOT_ROLL_GREED_SELF,           "You: Greed %2" },
        { LOOT_ROLL_DISENCHANT_SELF,      "You: Disenchant %2" },
        { LOOT_ROLL_PASSED_SELF_AUTO,     "You: Pass %2 (can't loot)" },
        { LOOT_ROLL_PASSED_AUTO,          "%1: Pass %2 (can't loot)" },
        { LOOT_ROLL_PASSED_AUTO_FEMALE,   "%1: Pass %2 (can't loot)" },
        { LOOT_ROLL_ALL_PASSED,           "Everyone passed %2" },
        { LOOT_ROLL_PASSED_SELF,          "You: Pass %2" },
        { LOOT_ROLL_PASSED,               "%2: Pass %3" },
        { LOOT_ROLL_ROLLED_NEED,          "%4: %2 (Need) %3" },
        { LOOT_ROLL_ROLLED_GREED,         "%4: %2 (Greed) %3" },
        { LOOT_ROLL_ROLLED_TRANSMOG,      "%4: %2 (Transmog) %3" },
        { LOOT_ROLL_ROLLED_DE,            "%3: %1 (Disenchant) %2" },
        { LOOT_ROLL_ROLLED_NEED_ROLE_BONUS, "%3: %1 (Need + role) %2" },
        { LOOT_ROLL_LOST_ROLL,            "You: %3 (%2) %4" },
        { LOOT_ROLL_YOU_WON_NO_SPAM_NEED_OFF_SPEC, "You won %3 (Need %2, off-spec)" },
        { LOOT_ROLL_YOU_WON_NO_SPAM_NEED, "You won %3 (Need %2)" },
        { LOOT_ROLL_YOU_WON_NO_SPAM_GREED, "You won %3 (Greed %2)" },
        { LOOT_ROLL_YOU_WON_NO_SPAM_DE,   "You won %3 (Disenchant %2)" },
        { LOOT_ROLL_YOU_WON_NO_SPAM_TRANSMOG, "You won %3 (Transmog %2)" },
        { LOOT_ROLL_WON_NO_SPAM_NEED_OFF_SPEC, "%2 won %4 (Need %3, off-spec)" },
        { LOOT_ROLL_WON_NO_SPAM_NEED,     "%2 won %4 (Need %3)" },
        { LOOT_ROLL_WON_NO_SPAM_GREED,    "%2 won %4 (Greed %3)" },
        { LOOT_ROLL_WON_NO_SPAM_DE,       "%2 won %4 (Disenchant %3)" },
        { LOOT_ROLL_WON_NO_SPAM_TRANSMOGRIFICATION, "%2 won %4 (Transmog %3)" },
        { LOOT_ROLL_YOU_WON,              "You won %2" },
        { LOOT_ROLL_WON,                  "%2 won %3" },
        { LOOT_ROLL_STARTED,              "Roll: %2" },
    },
    CHAT_MSG_MONEY = {
        { YOU_LOOT_MONEY,   "+%1" },
        { LOOT_MONEY_SPLIT, "+%1" },
    },
    CHAT_MSG_CURRENCY = {
        { CURRENCY_GAINED_MULTIPLE, "+%2 %1" },
        { CURRENCY_GAINED,          "+1 %1" },
    },
    -- "(+10 exp Rested bonus)" -> "(+10 Rested)", "(+5 group bonus)" ->
    -- "(+5 group)". EXHAUSTION2 and 5 read the same as 1 and 4.
    CHAT_MSG_COMBAT_XP_GAIN = {
        { COMBATLOG_XPGAIN_EXHAUSTION1_GROUP,         "+%2 XP: %1 (%3 %4, +%5 group)" },
        { COMBATLOG_XPGAIN_EXHAUSTION1_RAID,          "+%2 XP: %1 (%3 %4, -%5 raid)" },
        { COMBATLOG_XPGAIN_EXHAUSTION4_GROUP,         "+%2 XP: %1 (%3 %4, +%5 group)" },
        { COMBATLOG_XPGAIN_EXHAUSTION4_RAID,          "+%2 XP: %1 (%3 %4, -%5 raid)" },
        { COMBATLOG_XPGAIN_EXHAUSTION1,               "+%2 XP: %1 (%3 %4)" },
        { COMBATLOG_XPGAIN_EXHAUSTION4,               "+%2 XP: %1 (%3 %4)" },
        { COMBATLOG_XPGAIN_FIRSTPERSON_GROUP,         "+%2 XP: %1 (+%3 group)" },
        { COMBATLOG_XPGAIN_FIRSTPERSON_RAID,          "+%2 XP: %1 (-%3 raid)" },
        { COMBATLOG_XPGAIN_FIRSTPERSON,               "+%2 XP: %1" },
        { COMBATLOG_XPGAIN_QUEST,                     "+%1 XP (%2 %3)" },
        { COMBATLOG_XPGAIN_FIRSTPERSON_UNNAMED_GROUP, "+%1 XP (+%2 group)" },
        { COMBATLOG_XPGAIN_FIRSTPERSON_UNNAMED_RAID,  "+%1 XP (-%2 raid)" },
        { COMBATLOG_XPGAIN_FIRSTPERSON_UNNAMED,       "+%1 XP" },
    },
    CHAT_MSG_SYSTEM = {
        { ERR_QUEST_REWARD_EXP_I,   "+%1 XP" },
        { ERR_QUEST_REWARD_MONEY_S, "+%1" },
        { ERR_ZONE_EXPLORED_XP,     "+%2 XP - Discovered %1" },
        { ERR_QUEST_ACCEPTED_S,     "+Quest: %1" },
        -- Learning
        { ERR_LEARN_SPELL_S,         "+Spell: %1" },
        { ERR_LEARN_ABILITY_S,       "+Ability: %1" },
        { ERR_LEARN_PASSIVE_S,       "+Passive: %1" },
        { ERR_LEARN_RECIPE_S,        "+Recipe: %1" },
        { ERR_LEARN_MOUNT_S,         "+Mount: %1" },
        { ERR_LEARN_COMPANION_S,     "+Pet: %1" },
        { ERR_LEARN_TOY_S,           "+Toy: %1" },
        { ERR_LEARN_TRANSMOG_S,      "+Appearance: %1" },
        { ERR_PET_LEARN_SPELL_S,     "+Pet spell: %1" },
        { ERR_PET_LEARN_ABILITY_S,   "+Pet ability: %1" },
        { ERR_SPELL_UNLEARNED_S,     "-Spell: %1" },
        { ERR_PET_SPELL_UNLEARNED_S, "-Pet spell: %1" },
        { ERR_PROFICIENCY_GAINED_S,  "+Proficiency: %1" },
        -- Rest
        { ERR_EXHAUSTION_WELLRESTED, "+Well rested" },
        { ERR_EXHAUSTION_RESTED,     "+Rested" },
        { ERR_EXHAUSTION_NORMAL,     "-Rested" },
        { ERR_EXHAUSTION_TIRED,      "+Tired" },
        { ERR_EXHAUSTION_EXHAUSTED,  "+Exhausted" },
        -- Friends and group
        { ERR_FRIEND_ONLINE_SS,      "+|Hplayer:%1|h[%2]|h online" },
        { ERR_FRIEND_OFFLINE_S,      "-%1 offline" },
        { ERR_JOINED_GROUP_S,        "+%1 (party)" },
        { ERR_LEFT_GROUP_S,          "-%1 (party)" },
        { ERR_RAID_MEMBER_ADDED_S,   "+%1 (raid)" },
        { ERR_RAID_MEMBER_REMOVED_S, "-%1 (raid)" },
        { ERR_LEFT_GROUP_YOU,        "-Group" },
    },
    -- rest: whatever follows the string stays (%3), e.g. " (+10.0 Rested bonus)".
    CHAT_MSG_COMBAT_FACTION_CHANGE = {
        { FACTION_STANDING_INCREASED,                 "+%2 %1 reputation%3", rest = true },
        { FACTION_STANDING_DECREASED,                 "-%2 %1 reputation%3", rest = true },
        { FACTION_STANDING_INCREASED_ACCOUNT_WIDE,    "+%2 %1 reputation (account)%3", rest = true },
        { FACTION_STANDING_DECREASED_ACCOUNT_WIDE,    "-%2 %1 reputation (account)%3", rest = true },
        { FACTION_STANDING_INCREASED_GENERIC,         "+%1 reputation" },
        { FACTION_STANDING_DECREASED_GENERIC,         "-%1 reputation" },
    },
    -- One line per point gained.
    CHAT_MSG_SKILL = {
        { SKILL_RANK_UP, "+1 %1 (%2)" },
    },
}

-- A quest's "X completed." and the XP line that comes right after it become
-- one line, "+70 XP - X completed". The completed line is held back a
-- moment for its XP; a quest that gives none gets the line back as it was.
-- Filters run once per chat window, so each window holds its own.
local COMPLETED = ns.FormatPattern(ERR_QUEST_COMPLETE_S)
local QUEST_XP = ns.FormatPattern(ERR_QUEST_REWARD_EXP_I)
local XP_WAIT = 0.5
local held = {}  -- [chat frame] = { text =, title =, timer = }

local function Release(frame)
    local h = held[frame]
    held[frame] = nil
    h.timer:Cancel()
    local c = ChatTypeInfo.SYSTEM
    frame:AddMessage(h.text, c.r, c.g, c.b)
end

-- true to drop the line, or the line to show instead; nil leaves it alone.
local function QuestLine(frame, text)
    local title = text:match(COMPLETED)
    if title then
        if held[frame] then Release(frame) end
        held[frame] = { text = text, title = title,
                        timer = C_Timer.NewTimer(XP_WAIT, function() Release(frame) end) }
        return true
    end
    local h = held[frame]
    local xp = h and text:match(QUEST_XP)
    if xp then
        h.timer:Cancel()
        held[frame] = nil
        return "+" .. xp .. " XP - " .. h.title .. " completed"
    end
end

-- The bonus a reputation line can end with, shorter: "(+10.0 Rested bonus)"
-- becomes "(+10 rested)".
local BONUS = {
    { FACTION_STANDING_INCREASED_REST_PART,  "rested" },
    { FACTION_STANDING_INCREASED_REFER_PART, "RAF" },
    { FACTION_STANDING_INCREASED_ACH_PART,   "bonus" },
}
for _, b in ipairs(BONUS) do b[1] = ns.FormatPattern(b[1]):sub(2, -2) end  -- anywhere in the line

local function ShortBonus(text)
    for _, b in ipairs(BONUS) do
        text = text:gsub(b[1], function(n) return "(+" .. n:gsub("%.0$", "") .. " " .. b[2] .. ")" end)
    end
    return text
end

-- A gain's + in green and a loss's - in red (the palette's Green and Red),
-- with a space after it like the whisper arrows: at the start of the line, right after a name ("Name: +[Item]") and before
-- a number in a bonus ("(+10 rested)", ", -5 raid"). A dash between words
-- ("+70 XP - Quest completed") stays as it is.
local SIGN = { ["+"] = "|cff40d940+|r ", ["-"] = "|cffff4d1a-|r " }
local function Signs(text)
    text = text:gsub("^[%+%-]", SIGN, 1)
    text = text:gsub("(: )([%+%-])", function(before, sign) return before .. SIGN[sign] end, 1)
    return (text:gsub("([%(,] ?)([%+%-])(%d)", function(before, sign, digit) return before .. SIGN[sign] .. digit end))
end

local function ShortText(frame, event, text, ...)
    if not ns.Get("chatShortText") then return false end
    if event == "CHAT_MSG_SYSTEM" then
        local quest = QuestLine(frame, text)
        if quest == true then return true end
        if quest then return false, Signs(quest), ... end
    end
    for _, p in ipairs(SHORT[event]) do
        local short, n = text:gsub(p[1], p[2], 1)
        if n > 0 then
            if p.rest then short = ShortBonus(short) end
            return false, Signs(short), ...
        end
    end
    return false
end

for event, list in pairs(SHORT) do
    for _, p in ipairs(list) do
        p[1] = ns.FormatPattern(p[1])
        if p.rest then p[1] = p[1]:sub(1, -2) .. "(.*)$" end
    end
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
--  Guild, party and raid have no number: "[G]" or "[Guild]", "[PL]". A
--  joined, left or changed notice keeps Blizzard's channel as it is, zone
--  and all: "Changed Channel: [1. General - Elwynn Forest]". The
--  channel shows in white, whatever its own color. The time goes first on
--  every line, Blizzard's own (chat lines only) turned off.
-------------------------------------------------------------------------------
local CHANNEL = "(|Hchannel:[^|]+|h)%[([^%]]+)%](|h)( ?)"
-- A notice ends with its channel; a chat line has the sender after it.
local NOTICE = CHANNEL .. "$"
-- A player's or a Battle.net friend's (|HBNplayer) name link.
local PLAYER = "(|H%a-player.-|h)%[([^%[%]]-)%](|h)"

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

local Escape = ns.EscapePattern

-- The text after the name in say, yell and whisper lines (" says: "), right
-- after the player link; an NPC's name is no link and stays as it is. A
-- whisper (Battle.net ones too) also gets "< " in front: "< Name: text".
local SPEECH = {}
for _, key in ipairs({ "CHAT_SAY_GET", "CHAT_YELL_GET", "CHAT_WHISPER_GET" }) do
    SPEECH[#SPEECH + 1] = { "|h" .. Escape(_G[key]:match("^%%s(.+)$")), whisper = key == "CHAT_WHISPER_GET" }
end
-- "To Name: text", a whisper you sent, becomes "> Name: text".
local WHISPER_TO = "^" .. Escape(CHAT_WHISPER_INFORM_GET:match("^(.-)%%s")) .. "(|H)"
-- Both arrows in Serene's orange.
local ARROW_COLOR = "|cff" .. ns.RGBToHex(unpack(ns.ACCENT))
local SENT, RECEIVED = ARROW_COLOR .. ">|r ", ARROW_COLOR .. "<|r "

local function ShortLine(text)
    if not text:find(NOTICE) then text = text:gsub(CHANNEL, ShortChannel, 1) end
    text = text:gsub(PLAYER, "%1%2%3", 1)
    if ns.Get("chatShortText") then
        local sent
        text, sent = text:gsub(WHISPER_TO, SENT .. "%1", 1)
        if sent == 0 then
            for _, p in ipairs(SPEECH) do
                local n
                text, n = text:gsub(p[1], "|h: ", 1)
                if n > 0 then
                    if p.whisper then text = RECEIVED .. text end
                    break
                end
            end
        end
    end
    local time = ns.Get("chatTimestamps")
    if time ~= "off" then
        time = date(time)
        if ns.Get("chatTimeColor") then time = "|cff808080" .. time .. "|r" end
        text = time .. " " .. text
    end
    return text
end

ns.EachChatWindow(function(frame)
    local add = frame.AddMessage
    frame.AddMessage = function(self, text, ...)
        local clean = Clean(text)
        if type(clean) == "string" then text = ShortLine(clean) end
        return add(self, text, ...)
    end
end)

-- Blizzard's own time would come on top of this one.
local function ApplyTimestamps()
    SetCVar("showTimestamps", "none")
end

-- The options' examples are at 14:05:32.
local EXAMPLE_TIME = time({ year = 2000, month = 1, day = 1, hour = 14, min = 5, sec = 32 })

ns.RegisterFeature({
    key = "chatChannelNames", label = "Channel format", section = SECTION, category = CATEGORY,
    type = "dropdown", default = "word",
    -- The examples follow "Time format" and "Hide channel numbers". Only
    -- "none" with both off has nothing to show.
    options = function()
        local fmt, numbers = ns.Get("chatTimestamps"), not ns.Get("chatHideChannelNumbers")
        local function Example(style, channel)
            local parts = {}
            if fmt ~= "off" then parts[#parts + 1] = date(fmt, EXAMPLE_TIME) end
            local tag = Tag(style, numbers, channel)
            if tag ~= "" then parts[#parts + 1] = tag end
            return { value = style, label = #parts == 0 and "None" or table.concat(parts, " ") }
        end
        return {
            Example("full",   "2. Trade - City"),
            Example("word",   "1. General - City"),
            Example("letter", "2. Trade - City"),
            Example("none",   "2. Trade - City"),
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
    tooltip = "[2] [T] Name: becomes [T] Name:",
    default = false,
})
ns.RegisterFeature({
    key = "chatTimeColor", label = "Color timestamps", section = SECTION, category = CATEGORY,
    tooltip = "Timestamps in gray.",
    beside = true,
})
ns.RegisterFeature({
    key = "chatLevels", label = "Show player levels", section = SECTION, category = CATEGORY,
    tooltip = "Name (30), the level colored by difficulty.",
})
-- Copy Chat's, here for its place on the page.
ns.RegisterFeature({
    key = "chatCopyClick", label = "Right click to copy", section = SECTION, category = CATEGORY,
    tooltip = "Right click a chat window to copy its text.",
    beside = true, apply = function() ns.ApplyChatCopyClick() end,
})
ns.RegisterFeature({
    key = "chatShortText", label = "Shorter messages", section = SECTION, category = CATEGORY,
    tooltip = "Shorter loot, XP, rep, quest, skill, group and chat lines.",
})
ns.RegisterFeature({
    key = "chatLinks", label = "Clickable web links", section = SECTION, category = CATEGORY,
    tooltip = "Click a web address to copy it.",
    beside = true,
})
