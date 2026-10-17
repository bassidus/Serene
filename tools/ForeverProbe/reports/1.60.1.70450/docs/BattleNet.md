# BattleNet

Namespace `C_BattleNet`.

Environment=All, Predicates={}

## Functions

### C_BattleNet.AreFriendTagsEnabled

Returns:

- `areFriendTagsEnabled`: bool

### C_BattleNet.AreHighResTexturesInstalled

Returns:

- `installed`: bool

### C_BattleNet.AreRealIDFriendsEnabled

Returns:

- `areRealIDFriendsEnabled`: bool

### C_BattleNet.AreTitleFriendCustomNamesEnabled

Returns:

- `areTitleFriendCustomNamesEnabled`: bool

### C_BattleNet.AreTitleFriendsEnabled

Returns:

- `areTitleFriendsEnabled`: bool

### C_BattleNet.BNCheckBattleTagInviteToRecentAlly

SecretArguments=AllowedWhenUntainted

Arguments:

- `recentAllyGUID`: WOWGUID

### C_BattleNet.BNCheckTitleFriendInviteToUnit

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

### C_BattleNet.CanToggleHighResTexturesWithoutClientReload

Returns:

- `canToggle`: bool

### C_BattleNet.GetAccountInfoByGUID

SecretArguments=AllowedWhenUntainted

Arguments:

- `guid`: WOWGUID

Returns:

- `accountInfo`: BNetAccountInfo?

### C_BattleNet.GetAccountInfoByID

SecretArguments=AllowedWhenUntainted

Arguments:

- `id`: number
- `wowAccountGUID`: WOWGUID?

Returns:

- `accountInfo`: BNetAccountInfo?

### C_BattleNet.GetCustomTitleFriendName

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `id`: number

Returns:

- `customName`: string

### C_BattleNet.GetFriendAccountInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `friendIndex`: luaIndex
- `wowAccountGUID`: WOWGUID?

Returns:

- `accountInfo`: BNetAccountInfo?

### C_BattleNet.GetFriendGameAccountInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `friendIndex`: luaIndex
- `accountIndex`: luaIndex

Returns:

- `gameAccountInfo`: BNetGameAccountInfo?

### C_BattleNet.GetFriendInviteInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `inviteIndex`: luaIndex

Returns:

- `inviteInfo`: BNetFriendInviteInfo?

### C_BattleNet.GetFriendLevelFromInviteText

SecretArguments=AllowedWhenUntainted

Arguments:

- `inviteText`: cstring

Returns:

- `friendLevel`: BattleNetFriendLevel

### C_BattleNet.GetFriendNumGameAccounts

SecretArguments=AllowedWhenUntainted

Arguments:

- `friendIndex`: luaIndex

Returns:

- `numGameAccounts`: number

### C_BattleNet.GetGameAccountInfoByGUID

SecretArguments=AllowedWhenUntainted

Arguments:

- `guid`: WOWGUID

Returns:

- `gameAccountInfo`: BNetGameAccountInfo?

### C_BattleNet.GetGameAccountInfoByID

SecretArguments=AllowedWhenUntainted

Arguments:

- `id`: number

Returns:

- `gameAccountInfo`: BNetGameAccountInfo?

### C_BattleNet.InstallHighResTextures

HasRestrictions=true

### C_BattleNet.InviteFriend

SecretArguments=AllowedWhenUntainted

Arguments:

- `gameAccountID`: number

### C_BattleNet.IsBattleNetFriendsListEnabled

Returns:

- `isBattleNetFriendsListEnabled`: bool

### C_BattleNet.IsBattleNetFriendsListSupported

Returns:

- `isBattleNetFriendsListSupported`: bool

### C_BattleNet.IsFriendTagSupportedForCurrentGameType

SecretArguments=AllowedWhenUntainted

Arguments:

- `friendTag`: BattleNetFriendTag

Returns:

- `isFriendTagSupportedForCurrentGameType`: bool

### C_BattleNet.SearchFriends

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `searchInfo`: AuroraFriendsSearchInfo

Returns:

- `friendsData`: table<luaIndex>

### C_BattleNet.SendGameData

SecretArguments=AllowedWhenUntainted

Arguments:

- `gameAccountID`: number
- `prefix`: stringView
- `data`: stringView

Returns:

- `result`: SendAddonMessageResult

### C_BattleNet.SendTitleFriendInviteByName

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: cstring

### C_BattleNet.SendVerifiedBattleNetFriendInvite

### C_BattleNet.SendWhisper

HasRestrictions=true, RestrictedForMacroChatMessages=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `bnetAccountID`: number
- `text`: stringView

Returns:

- `success`: bool

### C_BattleNet.SetAFK

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `isAFK`: bool [default=true]

### C_BattleNet.SetAppearOffline

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `isAppearOffline`: bool [default=true]

### C_BattleNet.SetBlocked

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `bnetAccountID`: number
- `block`: bool

### C_BattleNet.SetCustomMessage

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `text`: cstring

Returns:

- `success`: bool

### C_BattleNet.SetCustomTitleFriendName

SecretArguments=AllowedWhenUntainted

Arguments:

- `id`: number
- `customName`: cstring

### C_BattleNet.SetDND

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `isDND`: bool [default=true]

### C_BattleNet.SetFriendTags

SecretArguments=AllowedWhenUntainted

Arguments:

- `id`: number
- `friendTags`: table<BattleNetFriendTag>

## Tables

### AuroraFriendsSearchInfo

Fields:

- `searchText`: string
- `isOnline`: bool
- `isOffline`: bool
- `isDND`: bool
- `isAFK`: bool
- `isInQueue`: bool
- `isAvailableForQueue`: bool
- `tags`: table<BattleNetFriendTag>

### BNetAccountInfo

Fields:

- `bnetAccountID`: number
- `accountName`: string
- `battleTag`: string
- `isFriend`: bool
- `isBattleTagFriend`: bool
- `friendLevel`: BattleNetFriendLevel?
- `lastOnlineTime`: number
- `isAFK`: bool
- `isDND`: bool
- `isFavorite`: bool
- `friendTags`: table<BattleNetFriendTag>
- `appearOffline`: bool
- `customMessage`: string
- `customMessageTime`: number
- `note`: string
- `rafLinkType`: RafLinkType
- `gameAccountInfo`: BNetGameAccountInfo

### BNetFriendInviteInfo

Fields:

- `inviteID`: number
- `accountName`: kstringAuroraName
- `creationTimestamp`: number
- `friendLevel`: BattleNetFriendLevel?

### BNetGameAccountInfo

Fields:

- `gameAccountID`: number
- `clientProgram`: string
- `isOnline`: bool
- `isGameBusy`: bool
- `isGameAFK`: bool
- `isAppearOffline`: bool
- `wowProjectID`: number?
- `characterName`: string?
- `realmName`: string?
- `realmDisplayName`: string?
- `realmID`: number?
- `factionName`: string?
- `raceName`: string?
- `classID`: number?
- `className`: string?
- `classFilename`: cstring?
- `areaName`: string?
- `characterLevel`: number?
- `richPresence`: string?
- `playerGuid`: WOWGUID?
- `canSummon`: bool
- `hasFocus`: bool
- `regionID`: number
- `isInCurrentRegion`: bool
- `timerunningSeasonID`: number?
