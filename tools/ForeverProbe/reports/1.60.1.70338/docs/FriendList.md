# FriendList

Namespace `C_FriendList`.

Environment=All, Predicates={1={FailureMode=ReturnNothing, Name=RequiresFriendList, Type=Precondition}}

## Functions

### C_FriendList.AddFriend

HasRestrictions=true, RequiresFriendList=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: cstring
- `notes`: cstring?

### C_FriendList.AddIgnore

RequiresFriendList=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: cstring

Returns:

- `added`: bool

### C_FriendList.AddOrDelIgnore

RequiresFriendList=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: cstring

### C_FriendList.AddOrRemoveFriend

HasRestrictions=true, RequiresFriendList=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: cstring
- `notes`: cstring

### C_FriendList.DelIgnore

RequiresFriendList=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: cstring

Returns:

- `removed`: bool

### C_FriendList.DelIgnoreByIndex

RequiresFriendList=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex

### C_FriendList.GetFriendInfo

MayReturnNothing=true, RequiresFriendList=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: cstring

Returns:

- `info`: FriendInfo

### C_FriendList.GetFriendInfoByIndex

MayReturnNothing=true, RequiresFriendList=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex

Returns:

- `info`: FriendInfo

### C_FriendList.GetIgnoreName

RequiresFriendList=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex

Returns:

- `name`: string?

### C_FriendList.GetNumFriends

RequiresFriendList=true

Returns:

- `numFriends`: number

### C_FriendList.GetNumIgnores

RequiresFriendList=true

Returns:

- `numIgnores`: number

### C_FriendList.GetNumOnlineFriends

RequiresFriendList=true

Returns:

- `numOnline`: number

### C_FriendList.GetNumWhoResults

RequiresFriendList=true

Returns:

- `numWhos`: number
- `totalNumWhos`: number

### C_FriendList.GetSelectedFriend

RequiresFriendList=true

Returns:

- `index`: luaIndex?

### C_FriendList.GetSelectedIgnore

RequiresFriendList=true

Returns:

- `index`: luaIndex?

### C_FriendList.GetWhoInfo

MayReturnNothing=true, RequiresFriendList=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex

Returns:

- `info`: WhoInfo

### C_FriendList.GetWhoRaceFilters

RequiresFriendList=true

Returns:

- `filters`: table<WhoFilter>

### C_FriendList.IsFriend

RequiresFriendList=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `guid`: WOWGUID

Returns:

- `isFriend`: bool

### C_FriendList.IsIgnored

RequiresFriendList=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `token`: cstring

Returns:

- `isIgnored`: bool

### C_FriendList.IsIgnoredByGuid

RequiresFriendList=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `guid`: WOWGUID

Returns:

- `isIgnored`: bool

### C_FriendList.IsLegacyFriendSystemEnabled

RequiresFriendList=true

Returns:

- `isLegacyFriendSystemEnabled`: bool

### C_FriendList.IsOnIgnoredList

RequiresFriendList=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `token`: cstring

Returns:

- `isIgnored`: bool

### C_FriendList.RemoveFriend

RequiresFriendList=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: cstring

Returns:

- `removed`: bool

### C_FriendList.RemoveFriendByIndex

RequiresFriendList=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex

### C_FriendList.SendWho

HasRestrictions=true, RequiresFriendList=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `filter`: cstring
- `origin`: number?
- `filters`: SendWhoFilters?

### C_FriendList.SetFriendNotes

RequiresFriendList=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: cstring
- `notes`: cstring

Returns:

- `found`: bool

### C_FriendList.SetFriendNotesByIndex

RequiresFriendList=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex
- `notes`: cstring

### C_FriendList.SetSelectedFriend

RequiresFriendList=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex

### C_FriendList.SetSelectedIgnore

RequiresFriendList=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex

### C_FriendList.SetWhoToUi

RequiresFriendList=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `whoToUi`: bool

### C_FriendList.ShowFriends

RequiresFriendList=true

### C_FriendList.SortWho

RequiresFriendList=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `sorting`: cstring
- `ascending`: bool?

## Events

### BATTLE_NET_FRIEND_TAG_ENABLED_STATUS_UPDATED

SynchronousEvent=true

### BATTLE_NET_TITLE_FRIEND_CUSTOM_NAME_ENABLED_STATUS_UPDATED

SynchronousEvent=true

### BN_BLOCK_FAILED_TOO_MANY

SynchronousEvent=true

Payload:

- `blockType`: cstring

### BN_BLOCK_LIST_UPDATED

SynchronousEvent=true

### BN_CHAT_WHISPER_UNDELIVERABLE

SynchronousEvent=true

Payload:

- `senderID`: number

### BN_CONNECTED

SynchronousEvent=true

Payload:

- `suppressNotification`: bool [default=false]

### BN_CUSTOM_MESSAGE_CHANGED

SynchronousEvent=true

Payload:

- `id`: number?

### BN_CUSTOM_MESSAGE_LOADED

SynchronousEvent=true

### BN_DISCONNECTED

SynchronousEvent=true

Payload:

- `result`: bool
- `suppressNotification`: bool [default=false]

### BN_FRIEND_ACCOUNT_OFFLINE

SynchronousEvent=true

Payload:

- `friendId`: number
- `isCompanionApp`: bool [default=false]

### BN_FRIEND_ACCOUNT_ONLINE

SynchronousEvent=true

Payload:

- `friendId`: number
- `isCompanionApp`: bool [default=false]

### BN_FRIEND_INFO_CHANGED

SynchronousEvent=true

Payload:

- `friendIndex`: luaIndex?

### BN_FRIEND_INVITE_ADDED

SynchronousEvent=true

Payload:

- `accountID`: number

### BN_FRIEND_INVITE_LIST_INITIALIZED

SynchronousEvent=true

Payload:

- `listSize`: number

### BN_FRIEND_INVITE_REMOVED

SynchronousEvent=true

### BN_FRIEND_LIST_SIZE_CHANGED

SynchronousEvent=true

Payload:

- `accountID`: number?

### BN_INFO_CHANGED

SynchronousEvent=true

### BN_REQUEST_FOF_SUCCEEDED

SynchronousEvent=true

### CONFIRM_BATTLE_NET_FRIEND_INVITE_SHOW

SynchronousEvent=true

Payload:

- `name`: cstring
- `friendLevel`: BattleNetFriendLevel

### FRIENDLIST_UPDATE

SynchronousEvent=true

### IGNORELIST_UPDATE

SynchronousEvent=true

### LEGACY_FRIEND_SYSTEM_STATUS_UPDATED

SynchronousEvent=true

### MUTELIST_UPDATE

SynchronousEvent=true

### NEW_MATCHMAKING_PARTY_INVITE

SynchronousEvent=true

### REJECTED_MATCHMAKING_PARTY_INVITE

SynchronousEvent=true

Payload:

- `name`: cstring

### SOCIAL_UI_FRIENDS_LIST_SYSTEM_STATUS_UPDATED

SynchronousEvent=true

### WHO_LIST_UPDATE

SynchronousEvent=true

## Tables

### FriendInfo

Fields:

- `connected`: bool
- `name`: string
- `className`: string?
- `area`: string?
- `notes`: string?
- `guid`: WOWGUID
- `level`: number
- `dnd`: bool
- `afk`: bool
- `rafLinkType`: RafLinkType

### SendWhoFilters

Fields:

- `classIDs`: table<number>
- `raceIDs`: table<number>
- `uiMapIDs`: table<number>

### WhoFilter

Fields:

- `name`: string
- `ID`: number

### WhoInfo

Fields:

- `fullName`: string
- `fullGuildName`: string
- `level`: number
- `raceStr`: string
- `classStr`: string
- `area`: string
- `filename`: string?
- `gender`: number
- `timerunningSeasonID`: number?
