-------------------------------------------------------------------------------
--  Social -- invites from friends, invite on whisper, and declining duels,
--  invites and shared quests from strangers. Friends are your friends list,
--  Battle.net friends and, if set, your guild.
-------------------------------------------------------------------------------
local _, ns = ...

local SECTION = "Social"

local Clean = ns.Clean

-------------------------------------------------------------------------------
--  Friends
-------------------------------------------------------------------------------
local function InGuild(name)
    if not (IsInGuild and IsInGuild()) then return false end
    if C_GuildInfo and C_GuildInfo.MemberExistsByName then
        return C_GuildInfo.MemberExistsByName(name) and true or false
    end
    for i = 1, GetNumGuildMembers() do
        local member = GetGuildRosterInfo(i)
        if member and Ambiguate(member, "none") == name then return true end
    end
    return false
end

local function IsFriend(name, guid)
    name, guid = Clean(name), Clean(guid)
    local guild = ns.Enabled("socialGuildFriends")
    if guid and guid ~= "" then
        if C_FriendList and C_FriendList.IsFriend and C_FriendList.IsFriend(guid) then return true end
        if C_BattleNet and C_BattleNet.GetGameAccountInfoByGUID
            and C_BattleNet.GetGameAccountInfoByGUID(guid) then return true end
        if guild and IsGuildMember and IsGuildMember(guid) then return true end
    end
    if not name or name == "" then return false end
    name = Ambiguate(name, "none")
    if C_FriendList and C_FriendList.GetFriendInfo and C_FriendList.GetFriendInfo(name) then return true end
    if BNGetNumFriends and C_BattleNet and C_BattleNet.GetFriendAccountInfo then
        for i = 1, BNGetNumFriends() do
            local account = C_BattleNet.GetFriendAccountInfo(i)
            local game = account and account.gameAccountInfo
            if game and game.characterName == name then return true end
        end
    end
    return guild and InGuild(name)
end

-- Quests.lua (SereneQuests) asks before accepting a quest: one shared by a
-- stranger is not. Set on Serene so other addons can reach it.
function Serene.BlockedQuestShare()
    if not ns.Enabled("blockSharedQuests") then return false end
    if not Clean(UnitIsPlayer("questnpc")) then return false end
    return not IsFriend(UnitName("questnpc"), UnitGUID("questnpc"))
end

-------------------------------------------------------------------------------
--  Popups -- closed a frame later, after Blizzard has shown them.
-------------------------------------------------------------------------------
local function HideInvite()
    StaticPopup_Hide("PARTY_INVITE")
    if LFGInvitePopup and StaticPopupSpecial_Hide then StaticPopupSpecial_Hide(LFGInvitePopup) end
end
local function HideDuel() StaticPopup_Hide("DUEL_REQUESTED") end

-------------------------------------------------------------------------------
--  Whisper invites
-------------------------------------------------------------------------------
local KEYWORDS = {
    inv    = { inv = true },
    invite = { invite = true },
    both   = { inv = true, invite = true },
}

-- nil when an invite can go out, else the reason (sent back to the whisperer).
local function CannotInvite()
    if not IsInGroup() then return nil end
    if not (UnitIsGroupLeader("player") or UnitIsGroupAssistant("player")) then
        return "I'm in a group and not the leader."
    end
    if GetNumGroupMembers() >= (IsInRaid() and 40 or 5) then return "the group is full." end
end

-- Auto replies, at most one per person every 10 seconds.
local REPLY_GAP = 10
local replied = {}

local function CanReply(key)
    local now = GetTime()
    if replied[key] and now - replied[key] < REPLY_GAP then return false end
    replied[key] = now
    return true
end

local function Reply(name, reason)
    if not CanReply(name) then return end
    local msg = "<Serene> Can't invite you: " .. reason
    if C_ChatInfo and C_ChatInfo.SendChatMessage then
        C_ChatInfo.SendChatMessage(msg, "WHISPER", nil, name)
    else
        SendChatMessage(msg, "WHISPER", nil, name)
    end
end

local function ReplyBNet(accountID, reason)
    if not CanReply(accountID) then return end
    local msg = "<Serene> Can't invite you: " .. reason
    local send = (C_BattleNet and C_BattleNet.SendWhisper) or BNSendWhisper
    if send then send(accountID, msg) end
end

local function IsKeyword(text)
    text = Clean(text)
    if type(text) ~= "string" then return false end
    local words = KEYWORDS[ns.Get("whisperInviteKeyword")] or KEYWORDS.both
    return words[strtrim(text):lower()] or false
end

local function Invite(name)
    if C_PartyInfo and C_PartyInfo.InviteUnit then
        C_PartyInfo.InviteUnit(name)
    else
        InviteUnit(name)
    end
    ns.Print("Invited " .. name .. " (whispered the invite keyword).")
end

-- Character whisper. The name comes as Name-Realm; on your own realm the
-- plain name is used, as Blizzard's own invite does.
local function OnWhisper(text, sender, guid)
    sender = Clean(sender)
    if not sender or not IsKeyword(text) then return end
    -- Strangers get no answer when only friends are invited.
    if ns.Get("whisperInviteFrom") == "friends" and not IsFriend(sender, guid) then return end
    local reason = CannotInvite()
    if reason then return Reply(sender, reason) end
    local name, realm = strsplit("-", sender, 2)
    local myRealm = GetNormalizedRealmName and GetNormalizedRealmName()
    if realm and myRealm and realm == myRealm then sender = name end
    Invite(sender)
end

-- Battle.net whisper: the friend's WoW character gets the invite (they are
-- a friend by definition, so "friends only" is met).
local function OnBNetWhisper(text, accountID)
    accountID = Clean(accountID)
    if not accountID or not IsKeyword(text) then return end
    local index = BNGetFriendIndex and BNGetFriendIndex(accountID)
    local account = index and C_BattleNet and C_BattleNet.GetFriendAccountInfo(index)
    local game = account and account.gameAccountInfo
    if not (game and game.isOnline and game.clientProgram == BNET_CLIENT_WOW) then return end
    -- No cross-faction groups: say why instead of sending an invite that fails.
    local myFaction = UnitFactionGroup("player")
    if game.factionName and myFaction and game.factionName ~= myFaction then
        ns.Print((game.characterName or "Your Battle.net friend") .. " whispered the invite keyword, but is on "
            .. game.factionName .. ": cross-faction groups are not possible.")
        return ReplyBNet(accountID, "you're on " .. game.factionName .. " and I'm on " .. myFaction .. ".")
    end
    local reason = CannotInvite()
    if reason then return ReplyBNet(accountID, reason) end
    local invite = (C_BattleNet and C_BattleNet.InviteFriend) or BNInviteFriend
    if invite and game.gameAccountID then
        invite(game.gameAccountID)
        ns.Print("Invited " .. (game.characterName or "your Battle.net friend") .. " (whispered the invite keyword).")
    elseif game.characterName then
        local name = game.characterName
        if game.realmName and game.realmName ~= "" and game.realmName ~= GetRealmName() then
            name = name .. "-" .. game.realmName:gsub("%s", "")
        end
        Invite(name)
    end
end

-------------------------------------------------------------------------------
--  Events
-------------------------------------------------------------------------------
local f = CreateFrame("Frame")
local hideAfterJoin = false

f:SetScript("OnEvent", function(self, event, ...)
    if event == "PARTY_INVITE_REQUEST" then
        local name, _, _, _, _, _, guid = ...
        if IsFriend(name, guid) then
            if ns.Enabled("partyFromFriends") and not IsInGroup() then
                AcceptGroup()
                -- The popup goes once the group exists; closing it earlier declines.
                hideAfterJoin = true
                self:RegisterEvent("GROUP_ROSTER_UPDATE")
            end
        elseif ns.Enabled("blockPartyInvites") then
            DeclineGroup()
            C_Timer.After(0, HideInvite)
            local who = Clean(name)
            if who then ns.Print("Declined a group invite from " .. who .. ".") end
        end

    elseif event == "GROUP_ROSTER_UPDATE" then
        self:UnregisterEvent("GROUP_ROSTER_UPDATE")
        if hideAfterJoin then
            hideAfterJoin = false
            HideInvite()
        end

    elseif event == "DUEL_REQUESTED" then
        local name = ...
        if not IsFriend(name) then
            CancelDuel()
            C_Timer.After(0, HideDuel)
            local who = Clean(name)
            if who then ns.Print("Declined a duel from " .. who .. ".") end
        end

    elseif event == "QUEST_DETAIL" then
        if ns.BlockedQuestShare() then
            local who = Clean(UnitName("questnpc"))
            DeclineQuest()
            if who then ns.Print("Declined a quest shared by " .. who .. ".") end
        end

    elseif event == "CHAT_MSG_WHISPER" then
        local text, sender = ...
        OnWhisper(text, sender, (select(12, ...)))

    elseif event == "CHAT_MSG_BN_WHISPER" then
        local text = ...
        OnBNetWhisper(text, (select(13, ...)))
    end
end)

local function Apply()
    local function Want(event, on)
        if on then f:RegisterEvent(event) else f:UnregisterEvent(event) end
    end
    Want("PARTY_INVITE_REQUEST", ns.Enabled("partyFromFriends") or ns.Enabled("blockPartyInvites"))
    Want("DUEL_REQUESTED", ns.Enabled("blockDuels"))
    Want("QUEST_DETAIL", ns.Enabled("blockSharedQuests"))
    Want("CHAT_MSG_WHISPER", ns.Enabled("whisperInvite"))
    Want("CHAT_MSG_BN_WHISPER", ns.Enabled("whisperInvite"))
end

-------------------------------------------------------------------------------
--  Settings
-------------------------------------------------------------------------------
-- First and under no heading: it decides who is a friend for the whole page.
ns.RegisterFeature({
    key = "socialGuildFriends", label = "Count your guild as friends", section = SECTION,
    default = false, apply = Apply,
    tooltip = "Friends are your friends list and Battle.net friends. With this on, your guild counts too, for every "
        .. "setting on this page.",
})
ns.RegisterFeature({
    key = "partyFromFriends", label = "Accept group invites from friends", section = SECTION, category = "Invites",
    default = false, apply = Apply,
    tooltip = "Joins at once when a friend invites you, as long as you are not already in a group.",
})
ns.RegisterFeature({
    key = "blockPartyInvites", label = "Block group invites from strangers", section = SECTION, category = "Blocking",
    default = false, apply = Apply,
    tooltip = "Declines group invites from anyone who is not a friend. Chat says who was declined.",
})
ns.RegisterFeature({
    key = "blockDuels", label = "Block duels from strangers", section = SECTION, category = "Blocking",
    default = false, apply = Apply,
    tooltip = "Declines duels from anyone who is not a friend. Chat says who was declined.",
})
ns.RegisterFeature({
    key = "blockSharedQuests", label = "Block quests shared by strangers", section = SECTION, category = "Blocking",
    default = false, apply = Apply,
    tooltip = "Declines quests shared by anyone who is not a friend. Chat says who was declined.",
})
ns.RegisterFeature({
    key = "whisperInvite", label = "Invite players who whisper a keyword", section = SECTION, category = "Invites",
    default = false, apply = Apply,
    tooltip = "Sends a group invite to whoever whispers you the keyword. If you can't invite (you are not the "
        .. "leader, or the group is full), they get a whisper back saying why.",
})
ns.RegisterFeature({
    key = "whisperInviteKeyword", label = "Keyword", section = SECTION, category = "Invites",
    tooltip = "The word to whisper. Upper or lower case does not matter.",
    type = "dropdown", default = "both",
    requires = "whisperInvite",
    options = function()
        return {
            { value = "inv",    label = "inv" },
            { value = "invite", label = "invite" },
            { value = "both",   label = "inv or invite" },
        }
    end,
})
ns.RegisterFeature({
    key = "whisperInviteFrom", label = "Who gets invited", section = SECTION, category = "Invites",
    type = "dropdown",
    default = "anyone", requires = "whisperInvite",
    options = function()
        return {
            { value = "anyone",  label = "Anyone" },
            { value = "friends", label = "Friends only" },
        }
    end,
})
