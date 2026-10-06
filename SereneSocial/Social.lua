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
local function IsFriend(name, guid)
    name, guid = Clean(name), Clean(guid)
    local guild = ns.Enabled("socialGuildFriends")
    if guid and guid ~= "" then
        if C_FriendList.IsFriend(guid) or C_BattleNet.GetGameAccountInfoByGUID(guid) then return true end
        if guild and IsGuildMember(guid) then return true end
    end
    if not name or name == "" then return false end
    name = Ambiguate(name, "none")
    if C_FriendList.GetFriendInfo(name) then return true end
    for i = 1, BNGetNumFriends() do
        local account = C_BattleNet.GetFriendAccountInfo(i)
        local game = account and account.gameAccountInfo
        if game and game.characterName == name then return true end
    end
    return guild and IsInGuild() and C_GuildInfo.MemberExistsByName(name) or false
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
    StaticPopupSpecial_Hide(LFGInvitePopup)
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
    C_ChatInfo.SendChatMessage("<Serene> Can't invite you: " .. reason, "WHISPER", nil, name)
end

local function ReplyBNet(accountID, reason)
    if not CanReply(accountID) then return end
    C_BattleNet.SendWhisper(accountID, "<Serene> Can't invite you: " .. reason)
end

local function IsKeyword(text)
    text = Clean(text)
    return text and KEYWORDS[ns.Get("whisperInviteKeyword")][strtrim(text):lower()] or false
end

local function OnWhisper(text, sender, guid)
    sender = Clean(sender)
    if not sender or not IsKeyword(text) then return end
    -- Strangers get no answer when only friends are invited.
    if ns.Get("whisperInviteFrom") == "friends" and not IsFriend(sender, guid) then return end
    local reason = CannotInvite()
    if reason then return Reply(sender, reason) end
    C_PartyInfo.InviteUnit(sender)
    ns.Print("Invited " .. sender .. " (whispered the invite keyword).")
end

-- Battle.net whisper: the friend's WoW character gets the invite (they are
-- a friend by definition, so "friends only" is met).
local function OnBNetWhisper(text, accountID)
    accountID = Clean(accountID)
    if not accountID or not IsKeyword(text) then return end
    local index = BNGetFriendIndex(accountID)
    local account = index and C_BattleNet.GetFriendAccountInfo(index)
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
    C_BattleNet.InviteFriend(game.gameAccountID)
    ns.Print("Invited " .. (game.characterName or "your Battle.net friend") .. " (whispered the invite keyword).")
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
-- Count your guild as friends is at the end of ThankBuffs.lua, last on the page.
ns.RegisterFeature({
    key = "partyFromFriends", label = "Accept group invites from friends", section = SECTION, category = "Invites",
    apply = Apply,
    tooltip = "Only while you are not already in a group.",
})
ns.RegisterFeature({
    key = "blockPartyInvites", label = "Block group invites from strangers", section = SECTION, category = "Blocking",
    default = false, apply = Apply,
    tooltip = "Chat says who was declined.",
})
ns.RegisterFeature({
    key = "blockDuels", label = "Block duels from strangers", section = SECTION, category = "Blocking",
    default = false, apply = Apply,
})
ns.RegisterFeature({
    key = "blockSharedQuests", label = "Block quests shared by strangers", section = SECTION, category = "Blocking",
    default = false, apply = Apply,
})
ns.RegisterFeature({
    key = "whisperInvite", label = "Invite players who whisper a keyword", section = SECTION, category = "Invites",
    default = false, apply = Apply,
    tooltip = "Sends a group invite to whoever whispers you the keyword. If you can't invite (you are not the "
        .. "leader, or the group is full), they get a whisper back saying why.",
})
ns.RegisterFeature({
    key = "whisperInviteKeyword", label = "Keyword", section = SECTION, category = "Invites",
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
    type = "dropdown", beside = true,
    default = "anyone", requires = "whisperInvite",
    options = function()
        return {
            { value = "anyone",  label = "Anyone" },
            { value = "friends", label = "Friends only" },
        }
    end,
})
