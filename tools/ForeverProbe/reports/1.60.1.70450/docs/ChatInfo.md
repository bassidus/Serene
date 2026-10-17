# ChatInfo

Namespace `C_ChatInfo`.

Environment=All, Predicates={}

## Functions

### C_ChatInfo.AreOutgoingAddonChatMessagesRestricted -- Returns false if addons are allowed to send outgoing chat messages. This is controlled on a realm-by-realm basis (tournament realms allow it), and the ability for addons to receive comms is controlled separately.

Returns:

- `isRestricted`: bool

### C_ChatInfo.CanPlayerSpeakLanguage

SecretArguments=AllowedWhenUntainted

Arguments:

- `languageId`: number

Returns:

- `canSpeakLanguage`: bool

### C_ChatInfo.CancelEmote

### C_ChatInfo.DropCautionaryChatMessage

SecretArguments=AllowedWhenUntainted

Arguments:

- `confirmNumber`: number

### C_ChatInfo.GetChannelInfoFromIdentifier

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `channelIdentifier`: cstring

Returns:

- `info`: ChatChannelInfo?

### C_ChatInfo.GetChannelRosterInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `channelIndex`: luaIndex
- `rosterIndex`: luaIndex

Returns:

- `name`: string
- `owner`: bool
- `moderator`: bool
- `guid`: WOWGUID

### C_ChatInfo.GetChannelRuleset

SecretArguments=AllowedWhenUntainted

Arguments:

- `channelIndex`: luaIndex

Returns:

- `ruleset`: ChatChannelRuleset

### C_ChatInfo.GetChannelRulesetForChannelID

SecretArguments=AllowedWhenUntainted

Arguments:

- `channelID`: number

Returns:

- `ruleset`: ChatChannelRuleset

### C_ChatInfo.GetChannelShortcut

SecretArguments=AllowedWhenUntainted

Arguments:

- `channelIndex`: luaIndex

Returns:

- `shortcut`: cstring

### C_ChatInfo.GetChannelShortcutForChannelID

SecretArguments=AllowedWhenUntainted

Arguments:

- `channelID`: number

Returns:

- `shortcut`: cstring

### C_ChatInfo.GetChatLineSenderGUID

SecretArguments=AllowedWhenUntainted, SecretInChatMessagingLockdown=true

Arguments:

- `chatLine`: number

Returns:

- `guid`: WOWGUID

### C_ChatInfo.GetChatLineSenderName

SecretArguments=AllowedWhenUntainted, SecretInChatMessagingLockdown=true

Arguments:

- `chatLine`: number

Returns:

- `name`: string

### C_ChatInfo.GetChatLineText

SecretArguments=AllowedWhenUntainted, SecretInChatMessagingLockdown=true

Arguments:

- `chatLine`: number

Returns:

- `text`: string

### C_ChatInfo.GetChatTypeName

SecretArguments=AllowedWhenUntainted

Arguments:

- `typeID`: number

Returns:

- `name`: string?

### C_ChatInfo.GetClubStreamIDs

SecretArguments=AllowedWhenUntainted

Arguments:

- `clubID`: ClubId

Returns:

- `ids`: table<ClubStreamId>

### C_ChatInfo.GetColorForChatType

SecretArguments=AllowedWhenUntainted

Arguments:

- `chatType`: cstring

Returns:

- `color`: colorRGB (ColorMixin)?

### C_ChatInfo.GetGeneralChannelID

Returns:

- `channelID`: number

### C_ChatInfo.GetGeneralChannelLocalID

Returns:

- `localID`: number?

### C_ChatInfo.GetMentorChannelID

Returns:

- `channelID`: number

### C_ChatInfo.GetNumActiveChannels

Returns:

- `numChannels`: number

### C_ChatInfo.GetNumReservedChatWindows

Returns:

- `numReserved`: number

### C_ChatInfo.GetRegisteredAddonMessagePrefixes

Returns:

- `registeredPrefixes`: table<cstring>

### C_ChatInfo.InChatMessagingLockdown -- Returns true if API security restrictions regarding chat messaging are in effect.

Returns:

- `isRestricted`: bool

### C_ChatInfo.IsAddonMessagePrefixRegistered

SecretArguments=AllowedWhenUntainted

Arguments:

- `prefix`: cstring

Returns:

- `isRegistered`: bool

### C_ChatInfo.IsChannelRegional

SecretArguments=AllowedWhenUntainted

Arguments:

- `channelIndex`: luaIndex

Returns:

- `isRegional`: bool

### C_ChatInfo.IsChannelRegionalForChannelID

SecretArguments=AllowedWhenUntainted

Arguments:

- `channelID`: number

Returns:

- `isRegional`: bool

### C_ChatInfo.IsChatLineCensored

SecretArguments=AllowedWhenUntainted

Arguments:

- `chatLine`: number

Returns:

- `isCensored`: bool

### C_ChatInfo.IsLoggingChat

Returns:

- `enabled`: bool

### C_ChatInfo.IsLoggingCombat

Returns:

- `enabled`: bool
- `advanced`: bool

### C_ChatInfo.IsPartyChannelType

SecretArguments=AllowedWhenUntainted

Arguments:

- `channelType`: ChatChannelType

Returns:

- `isPartyChannelType`: bool

### C_ChatInfo.IsRegionalServiceAvailable

Returns:

- `available`: bool

### C_ChatInfo.IsTimerunningPlayer

SecretArguments=AllowedWhenTainted

Arguments:

- `playerGUID`: WOWGUID

Returns:

- `isTimerunning`: bool

### C_ChatInfo.IsValidChatLine

SecretArguments=AllowedWhenUntainted

Arguments:

- `chatLine`: number?

Returns:

- `isValid`: bool

### C_ChatInfo.IsValidCombatFilterName

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: cstring

Returns:

- `isApproved`: bool

### C_ChatInfo.PerformEmote

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `emoteName`: cstring
- `targetName`: cstring?
- `suppressMoveError`: bool [default=false]

Returns:

- `success`: bool

### C_ChatInfo.RegisterAddonMessagePrefix -- Registers interest in addon messages with this prefix, cannot be an empty string.

SecretArguments=AllowedWhenUntainted

Arguments:

- `prefix`: cstring

Returns:

- `result`: RegisterAddonMessagePrefixResult

### C_ChatInfo.ReplaceIconAndGroupExpressions

SecretArguments=AllowedWhenTainted

Arguments:

- `input`: string
- `noIconReplacement`: bool? [NeverSecret=true]
- `noGroupReplacement`: bool? [NeverSecret=true]

Returns:

- `output`: string

### C_ChatInfo.RequestCanLocalWhisperTarget

SecretArguments=AllowedWhenUntainted

Arguments:

- `whisperTarget`: WOWGUID

### C_ChatInfo.ResetDefaultZoneChannels

### C_ChatInfo.SendAddonMessage -- Sends a text payload to other clients specified by chatChannel and target which are registered to listen for prefix.

SecretArguments=NotAllowed

Arguments:

- `prefix`: cstring
- `message`: cstring
- `chatType`: cstring? -- ChatType, defaults to SLASH_CMD_PARTY.
- `target`: cstring? -- Only applies for targeted channels

Returns:

- `result`: SendAddonMessageResult

### C_ChatInfo.SendAddonMessageLogged -- Sends a text payload to other clients specified by chatChannel and target which are registered to listen for prefix. Intended for plain text payloads; logged and throttled.

SecretArguments=NotAllowed

Arguments:

- `prefix`: cstring
- `message`: cstring
- `chatType`: cstring? -- ChatType, defaults to SLASH_CMD_PARTY.
- `target`: cstring? -- Only applies for targeted channels

Returns:

- `result`: SendAddonMessageResult?

### C_ChatInfo.SendCautionaryChatMessage

SecretArguments=AllowedWhenUntainted

Arguments:

- `confirmNumber`: number

### C_ChatInfo.SendChatMessage

HasRestrictions=true, RestrictedForMacroChatMessages=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `message`: cstring
- `chatType`: SendChatMessageType? -- Chat type string ('SAY', 'EMOTE', etc.). Defaults to 'SAY' if not specified.
- `languageID`: number? -- Language to send the message in.
- `target`: cstring? -- Name of the player to send a message to. Only applies to chat types that support targeted messages.

### C_ChatInfo.SwapChatChannelsByChannelIndex

SecretArguments=AllowedWhenUntainted

Arguments:

- `firstChannelIndex`: luaIndex
- `secondChannelIndex`: luaIndex

### C_ChatInfo.UncensorChatLine

SecretArguments=AllowedWhenUntainted

Arguments:

- `chatLine`: number

## Events

### ALTERNATIVE_DEFAULT_LANGUAGE_CHANGED

SynchronousEvent=true

### BN_CHAT_MSG_ADDON

SynchronousEvent=true

Payload:

- `prefix`: cstring
- `text`: cstring
- `channel`: cstring
- `senderID`: number

### CAN_LOCAL_WHISPER_TARGET_RESPONSE

UniqueEvent=true

Payload:

- `whisperTarget`: WOWGUID
- `status`: ChatWhisperTargetStatus

### CAN_PLAYER_SPEAK_LANGUAGE_CHANGED

UniqueEvent=true

Payload:

- `languageId`: number
- `canSpeakLanguage`: bool

### CAUTIONARY_CHANNEL_MESSAGE

SynchronousEvent=true

Payload:

- `confirmNumber`: number

### CAUTIONARY_CHAT_MESSAGE

SynchronousEvent=true

Payload:

- `chatLineID`: number
- `confirmNumber`: number

### CHANNEL_COUNT_UPDATE

SynchronousEvent=true

Payload:

- `displayIndex`: number
- `count`: number

### CHANNEL_FLAGS_UPDATED

SynchronousEvent=true

Payload:

- `displayIndex`: number

### CHANNEL_INVITE_REQUEST

SynchronousEvent=true

Payload:

- `channelID`: cstring
- `name`: cstring

### CHANNEL_LEFT

SynchronousEvent=true

Payload:

- `chatChannelID`: number
- `name`: cstring

### CHANNEL_PASSWORD_REQUEST

SynchronousEvent=true

Payload:

- `channelID`: cstring

### CHANNEL_ROSTER_UPDATE

SynchronousEvent=true

Payload:

- `displayIndex`: number
- `count`: number

### CHANNEL_UI_UPDATE

SynchronousEvent=true

### CHAT_COMBAT_MSG_ARENA_POINTS_GAIN

SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_LOGGING_CHANGED

SynchronousEvent=true

Payload:

- `whichLog`: number
- `isEnabled`: bool

### CHAT_MSG_ACHIEVEMENT

SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_ADDON

SynchronousEvent=true

Payload:

- `prefix`: cstring
- `text`: cstring
- `channel`: cstring
- `sender`: cstring
- `target`: cstring
- `zoneChannelID`: number
- `localID`: number
- `name`: cstring
- `instanceID`: number

### CHAT_MSG_ADDON_LOGGED

SynchronousEvent=true

Payload:

- `prefix`: cstring
- `text`: cstring
- `channel`: cstring
- `sender`: cstring
- `target`: cstring
- `zoneChannelID`: number
- `localID`: number
- `name`: cstring
- `instanceID`: number

### CHAT_MSG_AFK

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_BG_SYSTEM_ALLIANCE

SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_BG_SYSTEM_HORDE

SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_BG_SYSTEM_NEUTRAL

SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_BN

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_BN_INLINE_TOAST_ALERT

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_BN_INLINE_TOAST_BROADCAST

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_BN_INLINE_TOAST_BROADCAST_INFORM

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_BN_INLINE_TOAST_CONVERSATION

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_BN_WHISPER

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_BN_WHISPER_INFORM

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_BN_WHISPER_PLAYER_OFFLINE

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_CHANNEL

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_CHANNEL_JOIN

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_CHANNEL_LEAVE

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_CHANNEL_LEAVE_PREVENTED

SynchronousEvent=true

Payload:

- `channelName`: cstring

### CHAT_MSG_CHANNEL_LIST

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_CHANNEL_NOTICE

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_CHANNEL_NOTICE_USER

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_COLLECTED_APPEARANCE

SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_COMBAT_FACTION_CHANGE

SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_COMBAT_HONOR_GAIN

SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_COMBAT_MISC_INFO

SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_COMBAT_XP_GAIN

SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_COMMUNITIES_CHANNEL

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_CURRENCY

SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_DND

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_EMOTE

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_FILTERED

SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_GUILD

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_GUILD_ACHIEVEMENT

SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_GUILD_DISCORD

SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_GUILD_ITEM_LOOTED

SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_IGNORED

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_INSTANCE_CHAT

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_INSTANCE_CHAT_LEADER

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_LOOT

SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_MONEY

SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_MONSTER_EMOTE

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_MONSTER_PARTY

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_MONSTER_SAY

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_MONSTER_WHISPER

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_MONSTER_YELL

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_OFFICER

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_OPENING

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_PARTY

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_PARTY_LEADER

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_PET_BATTLE_COMBAT_LOG

SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_PET_BATTLE_INFO

SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_PET_INFO

SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_PING

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_RAID

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_RAID_BOSS_EMOTE

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_RAID_BOSS_WHISPER

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_RAID_LEADER

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_RAID_WARNING

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_RESTRICTED

SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_SAY

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_SKILL

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_SYSTEM

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_TARGETICONS

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_TEXT_EMOTE

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_TRADESKILLS

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_VOICE_TEXT

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_WHISPER

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_WHISPER_INFORM

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_MSG_YELL

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### CHAT_REGIONAL_SEND_FAILED

SynchronousEvent=true

### CHAT_REGIONAL_STATUS_CHANGED

SynchronousEvent=true

Payload:

- `isServiceAvailable`: bool

### CHAT_SERVER_DISCONNECTED

SynchronousEvent=true

Payload:

- `isInitialMessage`: bool?

### CHAT_SERVER_RECONNECTED

SynchronousEvent=true

### CLEAR_BOSS_EMOTES

SynchronousEvent=true

### DAILY_RESET_INSTANCE_WELCOME

SynchronousEvent=true

Payload:

- `mapname`: cstring
- `timeLeft`: number

### INSTANCE_RESET_WARNING

SynchronousEvent=true

Payload:

- `warningMessage`: cstring
- `timeLeft`: number

### LANGUAGE_LIST_CHANGED

SynchronousEvent=true

### NOTIFY_CHAT_SUPPRESSED

SynchronousEvent=true

### QUEST_BOSS_EMOTE

SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `displayTime`: number
- `enableBossEmoteWarningSound`: bool

### RAID_BOSS_EMOTE

SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `displayTime`: number
- `enableBossEmoteWarningSound`: bool

### RAID_BOSS_WHISPER

SynchronousEvent=true

Payload:

- `text`: cstring
- `playerName`: cstring
- `displayTime`: number
- `enableBossEmoteWarningSound`: bool

### RAID_INSTANCE_WELCOME

SynchronousEvent=true

Payload:

- `mapname`: cstring
- `timeLeft`: number
- `locked`: number
- `extended`: number

### UPDATE_CHAT_COLOR

SynchronousEvent=true

Payload:

- `name`: cstring
- `r`: number
- `g`: number
- `b`: number

### UPDATE_CHAT_COLOR_NAME_BY_CLASS

SynchronousEvent=true

Payload:

- `name`: cstring
- `colorNameByClass`: bool

### UPDATE_CHAT_WINDOWS

SynchronousEvent=true

### UPDATE_FLOATING_CHAT_WINDOWS

SynchronousEvent=true

## Tables

### ChatMessageEventParams

Fields:

- `text`: cstring
- `playerName`: cstring
- `languageName`: cstring [NeverSecret=true]
- `channelName`: cstring [NeverSecret=true]
- `playerName2`: cstring
- `specialFlags`: cstring [NeverSecret=true]
- `zoneChannelID`: number [NeverSecret=true]
- `channelIndex`: number [NeverSecret=true]
- `channelBaseName`: cstring [NeverSecret=true]
- `languageID`: number [NeverSecret=true]
- `lineID`: number [NeverSecret=true]
- `guid`: WOWGUID
- `bnSenderID`: number
- `isMobile`: bool [NeverSecret=true]
- `isSubtitle`: bool [NeverSecret=true]
- `hideSenderInLetterbox`: bool [NeverSecret=true]
- `suppressRaidIcons`: bool [NeverSecret=true]
- `discordInfo`: DiscordChatInfo

### SendChatMessageParams

Fields:

- `message`: cstring
- `chatType`: SendChatMessageType? -- Chat type string ('SAY', 'EMOTE', etc.). Defaults to 'SAY' if not specified.
- `languageID`: number? -- Language to send the message in.
- `target`: cstring? -- Name of the player to send a message to. Only applies to chat types that support targeted messages.
