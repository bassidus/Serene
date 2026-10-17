# GuildInfo

Namespace `C_GuildInfo`.

Environment=All, Predicates={}

## Functions

### C_GuildInfo.AreGuildEventsEnabled

Returns:

- `enabled`: bool

### C_GuildInfo.CanEditOfficerNote

Returns:

- `canEditOfficerNote`: bool

### C_GuildInfo.CanSpeakInGuildChat

Returns:

- `canSpeakInGuildChat`: bool

### C_GuildInfo.CanViewOfficerNote

Returns:

- `canViewOfficerNote`: bool

### C_GuildInfo.Demote

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: cstring

### C_GuildInfo.Disband

### C_GuildInfo.GetGuildNewsInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex

Returns:

- `newsInfo`: GuildNewsInfo

### C_GuildInfo.GetGuildRankOrder

SecretArguments=AllowedWhenUntainted

Arguments:

- `guid`: WOWGUID

Returns:

- `rankOrder`: luaIndex

### C_GuildInfo.GetGuildTabardInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken?

Returns:

- `tabardInfo`: GuildTabardInfo?

### C_GuildInfo.GetInfoText

HasRestrictions=true

Returns:

- `infoText`: string

### C_GuildInfo.GetMOTD

HasRestrictions=true

Returns:

- `motd`: string

### C_GuildInfo.GetPreferredPlaySettings

Returns:

- `loaded`: bool
- `preferredLocaleID`: number
- `preferredDatacenterLocalityID`: number
- `lastPreferredLocaleChangeDate`: time_t
- `lastPreferredDatacenterLocalityChangeDate`: time_t
- `changeCooldownDays`: number

### C_GuildInfo.GetPreferredPlaySettingsFeatures

Returns:

- `canChangeLocale`: bool
- `canChangeDatacenterLocality`: bool

### C_GuildInfo.GuildControlGetRankFlags

SecretArguments=AllowedWhenUntainted

Arguments:

- `rankOrder`: luaIndex

Returns:

- `permissions`: table<bool>

### C_GuildInfo.GuildRoster

### C_GuildInfo.Invite

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: cstring

### C_GuildInfo.IsDiscordStreamSeparate

Returns:

- `separateStream`: bool

### C_GuildInfo.IsEncounterGuildNewsEnabled

Returns:

- `enabled`: bool

### C_GuildInfo.IsGuildOfficer

Returns:

- `isOfficer`: bool

### C_GuildInfo.IsGuildRankAssignmentAllowed

SecretArguments=AllowedWhenUntainted

Arguments:

- `guid`: WOWGUID
- `rankOrder`: luaIndex

Returns:

- `isGuildRankAssignmentAllowed`: bool

### C_GuildInfo.IsGuildReputationEnabled

Returns:

- `enabled`: bool

### C_GuildInfo.Leave

### C_GuildInfo.MemberExistsByName

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: cstring

Returns:

- `exists`: bool

### C_GuildInfo.Promote

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: cstring

### C_GuildInfo.QueryGuildMemberRecipes

SecretArguments=AllowedWhenUntainted

Arguments:

- `guildMemberGUID`: WOWGUID
- `skillLineID`: number

### C_GuildInfo.QueryGuildMembersForRecipe

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `skillLineID`: number
- `recipeSpellID`: number
- `recipeLevel`: luaIndex?

Returns:

- `updatedRecipeSpellID`: number

### C_GuildInfo.RemoveFromGuild

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `guid`: WOWGUID

### C_GuildInfo.RequestGuildRename

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `desiredName`: cstring

### C_GuildInfo.RequestGuildRenameRefund

HasRestrictions=true

### C_GuildInfo.RequestPreferredPlaySettings

Returns:

- `startedSuccessfully`: bool

### C_GuildInfo.RequestRenameNameCheck

SecretArguments=AllowedWhenUntainted

Arguments:

- `desiredName`: cstring

### C_GuildInfo.RequestRenameStatus

Returns:

- `ableToRequest`: bool

### C_GuildInfo.SetGuildRankOrder

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `guid`: WOWGUID
- `rankOrder`: luaIndex

### C_GuildInfo.SetInfoText

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `infoText`: cstring

### C_GuildInfo.SetLeader

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: cstring

### C_GuildInfo.SetMOTD

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `motd`: cstring

### C_GuildInfo.SetNote

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `guid`: WOWGUID
- `note`: cstring
- `isPublic`: bool

### C_GuildInfo.SetPreferredPlaySettings

SecretArguments=AllowedWhenUntainted

Arguments:

- `preferredLocaleID`: number [default=0]
- `preferredDatacenterLocalityID`: number [default=0]

Returns:

- `startedSuccessfully`: bool

### C_GuildInfo.Uninvite

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: cstring

## Events

### CLOSE_TABARD_FRAME

SynchronousEvent=true

### DISABLE_DECLINE_GUILD_INVITE

SynchronousEvent=true

### ENABLE_DECLINE_GUILD_INVITE

SynchronousEvent=true

### GUILD_CHALLENGE_COMPLETED

SynchronousEvent=true

Payload:

- `challengeType`: number
- `currentCount`: number
- `maxCount`: number
- `goldAwarded`: number

### GUILD_CHALLENGE_UPDATED

SynchronousEvent=true

### GUILD_EVENT_LOG_UPDATE

SynchronousEvent=true

### GUILD_INVITE_CANCEL

SynchronousEvent=true

### GUILD_INVITE_REQUEST

SynchronousEvent=true

Payload:

- `inviter`: cstring
- `guildName`: cstring
- `guildAchievementPoints`: number
- `oldGuildName`: cstring
- `isNewGuild`: bool?
- `tabardInfo`: GuildTabardInfo?

### GUILD_MOTD

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `motdText`: cstring

### GUILD_NEWS_UPDATE

UniqueEvent=true

### GUILD_PARTY_STATE_UPDATED

SynchronousEvent=true

Payload:

- `inGuildParty`: bool

### GUILD_PREFERRED_PLAY_SETTINGS_UPDATED

SynchronousEvent=true

Payload:

- `status`: PreferredPlaySettingsStatus
- `preferredLocaleID`: number
- `preferredDatacenterLocalityID`: number
- `lastPreferredLocaleChangeDate`: time_t
- `lastPreferredDatacenterLocalityChangeDate`: time_t

### GUILD_RANKS_UPDATE

SynchronousEvent=true

### GUILD_RANKS_UPDATE_ACTIVE_PLAYER

SynchronousEvent=true

### GUILD_RECIPE_KNOWN_BY_MEMBERS

SynchronousEvent=true

### GUILD_REGISTRAR_CLOSED

SynchronousEvent=true

### GUILD_REGISTRAR_SHOW

SynchronousEvent=true

### GUILD_RENAME_NAME_CHECK

SynchronousEvent=true

Payload:

- `desiredName`: cstring
- `status`: GuildErrorType
- `nameErrorToken`: cstring?

### GUILD_RENAME_REFUND_RESULT

SynchronousEvent=true

Payload:

- `guildName`: cstring
- `status`: GuildErrorType

### GUILD_RENAME_REQUIRED

SynchronousEvent=true

Payload:

- `flagSet`: bool

### GUILD_RENAME_STATUS_UPDATE

SynchronousEvent=true

Payload:

- `status`: GuildRenameStatus

### GUILD_REWARDS_LIST

SynchronousEvent=true

### GUILD_REWARDS_LIST_UPDATE

UniqueEvent=true

### GUILD_ROSTER_UPDATE

SynchronousEvent=true

Payload:

- `canRequestRosterUpdate`: bool

### GUILD_TRADESKILL_UPDATE

SynchronousEvent=true

### GUILDTABARD_UPDATE

SynchronousEvent=true

### OPEN_TABARD_FRAME

SynchronousEvent=true

### PLAYER_GUILD_UPDATE

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### REQUESTED_GUILD_RENAME_RESULT

SynchronousEvent=true

Payload:

- `newName`: cstring
- `status`: GuildErrorType

### REQUIRED_GUILD_RENAME_RESULT

SynchronousEvent=true

Payload:

- `success`: bool

### TABARD_CANSAVE_CHANGED

SynchronousEvent=true

### TABARD_SAVE_PENDING

SynchronousEvent=true

### UNIT_GUILD_LEVEL

SynchronousEvent=true

Payload:

- `newLevel`: number

## Tables

### GuildNewsInfo

Fields:

- `isSticky`: bool
- `isHeader`: bool
- `newsType`: number
- `whoText`: string?
- `whatText`: string?
- `newsDataID`: number
- `data`: table<number>
- `weekday`: number
- `day`: number
- `month`: number
- `year`: number
- `guildMembersPresent`: number

### GuildRenameStatus

Fields:

- `isNameChangeEnabled`: bool
- `isPlayerGuildMaster`: bool
- `refundEligibleEndTime`: time_t
- `nextRenameTime`: time_t
- `renamePrice`: WOWMONEY
- `refundAmount`: WOWMONEY
- `currentGuildMoney`: WOWMONEY
- `result`: GuildErrorType
- `oldGuildName`: cstring
- `reservedName`: cstring
- `reservedNameExpirationTime`: time_t
