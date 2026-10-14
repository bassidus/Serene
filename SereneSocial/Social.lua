-------------------------------------------------------------------------------
--  Social -- accepting group invites, inviting on a whispered keyword and
--  declining duels, each for friends, your guild, both, anyone or no one.
--  Friends are your friends list and Battle.net friends.
-------------------------------------------------------------------------------
local _, ns = ...

local SECTION = "Social"

local Clean = ns.Clean

-------------------------------------------------------------------------------
--  Friends
-------------------------------------------------------------------------------
local function IsGuildMate(name, guid)
    if guid and guid ~= "" and IsGuildMember(guid) then return true end
    return name and name ~= "" and IsInGuild() and C_GuildInfo.MemberExistsByName(Ambiguate(name, "none")) or false
end

local function IsFriend(name, guid)
    if guid and guid ~= "" and (C_FriendList.IsFriend(guid) or C_BattleNet.GetGameAccountInfoByGUID(guid)) then
        return true
    end
    if not name or name == "" then return false end
    name = Ambiguate(name, "none")
    if C_FriendList.GetFriendInfo(name) then return true end
    for i = 1, BNGetNumFriends() do
        local account = C_BattleNet.GetFriendAccountInfo(i)
        local game = account and account.gameAccountInfo
        if game and game.characterName == name then return true end
    end
    return false
end

-- Whether a setting's choice ("friends", "guild", "friendsGuild" = both,
-- "anyone", "none") lets this player in.
local function Allowed(key, name, guid)
    local who = ns.Get(key)
    if who == "anyone" then return true end
    if who == "none" then return false end
    name, guid = Clean(name), Clean(guid)
    if who ~= "guild" and IsFriend(name, guid) then return true end
    return who ~= "friends" and IsGuildMate(name, guid)
end

-------------------------------------------------------------------------------
--  Popups
-------------------------------------------------------------------------------
local function HideInvite()
    StaticPopup_Hide("PARTY_INVITE")
    StaticPopupSpecial_Hide(LFGInvitePopup)
end
-- Closed a frame later, after Blizzard has shown it.
local function HideDuel() StaticPopup_Hide("DUEL_REQUESTED") end

-------------------------------------------------------------------------------
--  Whisper invites
-------------------------------------------------------------------------------
local KEYWORDS = { inv = true, invite = true }

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
    for k, t in pairs(replied) do
        if now - t >= REPLY_GAP then replied[k] = nil end
    end
    replied[key] = now
    return true
end

local function Reply(name, reason)
    if not CanReply(name) then return end
    C_ChatInfo.SendChatMessage("<Serene> Can't invite you: " .. reason, "WHISPER", nil, name)
end

local function ReplyBNet(accountID, reason)
    if not CanReply(accountID) then return end
    C_BattleNet.SendWhisper(accountID, "<Serene> Can't invite you: " .. reason)
end

local function IsKeyword(text)
    text = Clean(text)
    return text and KEYWORDS[strtrim(text):lower()] or false
end

local function OnWhisper(text, sender, guid)
    sender = Clean(sender)
    if not sender or not IsKeyword(text) then return end
    -- Those not let in get no answer.
    if not Allowed("whisperInviteFrom", sender, guid) then return end
    local reason = CannotInvite()
    if reason then return Reply(sender, reason) end
    C_PartyInfo.InviteUnit(sender)
    ns.Print("Invited " .. sender .. " (whispered the invite keyword).")
end

-- Battle.net whisper: the friend's WoW character gets the invite. They are
-- a friend by definition; with "guild" their character must be in yours.
local function OnBNetWhisper(text, accountID)
    accountID = Clean(accountID)
    if not accountID or not IsKeyword(text) then return end
    local index = BNGetFriendIndex(accountID)
    local account = index and C_BattleNet.GetFriendAccountInfo(index)
    local game = account and account.gameAccountInfo
    if not (game and game.isOnline and game.clientProgram == BNET_CLIENT_WOW) then return end
    if not Allowed("whisperInviteFrom", game.characterName) then return end
    -- No cross-faction groups: say why instead of sending an invite that fails.
    local myFaction = UnitFactionGroup("player")
    if game.factionName and game.factionName ~= myFaction then
        ns.Print((game.characterName or "Your Battle.net friend") .. " whispered the invite keyword, but is on "
            .. game.factionName .. ": cross-faction groups are not possible.")
        return ReplyBNet(accountID, "you're on " .. game.factionName .. " and I'm on " .. myFaction .. ".")
    end
    local reason = CannotInvite()
    if reason then return ReplyBNet(accountID, reason) end
    C_BattleNet.InviteFriend(game.gameAccountID)
    ns.Print("Invited " .. (game.characterName or "your Battle.net friend") .. " (whispered the invite keyword).")
end

-------------------------------------------------------------------------------
--  Events
-------------------------------------------------------------------------------
local f = CreateFrame("Frame")

f:SetScript("OnEvent", function(self, event, ...)
    if event == "PARTY_INVITE_REQUEST" then
        local name, _, _, _, _, _, guid = ...
        if Allowed("partyInviteFrom", name, guid) and not IsInGroup() then
            AcceptGroup()
            -- The popup goes once the group exists; closing it earlier declines.
            self:RegisterEvent("GROUP_ROSTER_UPDATE")
        end

    elseif event == "GROUP_ROSTER_UPDATE" then
        self:UnregisterEvent("GROUP_ROSTER_UPDATE")
        HideInvite()

    elseif event == "DUEL_REQUESTED" then
        local name = ...
        if not Allowed("duelsFrom", name) then
            CancelDuel()
            C_Timer.After(0, HideDuel)
            local who = Clean(name)
            if who then ns.Print("Declined a duel from " .. who .. ".") end
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
    Want("PARTY_INVITE_REQUEST", ns.Get("partyInviteFrom") ~= "none")
    Want("DUEL_REQUESTED", ns.Get("duelsFrom") ~= "anyone")
    Want("CHAT_MSG_WHISPER", ns.Get("whisperInviteFrom") ~= "none")
    Want("CHAT_MSG_BN_WHISPER", ns.Get("whisperInviteFrom") ~= "none")
end

-------------------------------------------------------------------------------
--  Settings
-------------------------------------------------------------------------------
local function Who()
    return {
        { value = "friends",      label = "Friends" },
        { value = "guild",        label = "Guild" },
        { value = "friendsGuild", label = "Friends & guild" },
        { value = "anyone",       label = "Anyone" },
        { value = "none",         label = "None" },
    }
end

ns.RegisterFeature({
    key = "partyInviteFrom", label = "Auto accept group invites from", section = SECTION, category = "Automation",
    type = "dropdown", inline = true, default = "friendsGuild", options = Who, apply = Apply,
})
ns.RegisterFeature({
    key = "whisperInviteFrom", label = "Keyword inv / invite from", section = SECTION, category = "Automation",
    type = "dropdown", inline = true, default = "friendsGuild", options = Who, apply = Apply,
})
ns.RegisterFeature({
    key = "duelsFrom", label = "Allow duels from", section = SECTION, category = "Automation",
    tooltip = "Duels from anyone else are declined.",
    type = "dropdown", inline = true, default = "anyone", options = Who, apply = Apply,
})
