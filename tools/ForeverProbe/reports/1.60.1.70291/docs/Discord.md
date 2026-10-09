# Discord

Namespace `C_Discord`.

Environment=All, Predicates={}

## Functions

### C_Discord.Authorize

HasRestrictions=true

### C_Discord.GetDiscordChannelName

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `serverIndex`: luaIndex
- `channelIndex`: luaIndex

Returns:

- `name`: string

### C_Discord.GetDiscordUserID

HasRestrictions=true

Returns:

- `userID`: DiscordMemberOpaqueID

### C_Discord.GetDiscordUserName

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `userID`: DiscordMemberOpaqueID

Returns:

- `userName`: KStringDiscordUserName

### C_Discord.GetDisplayNameType

HasRestrictions=true

Returns:

- `type`: DiscordDisplayNameType

### C_Discord.GetGuildLinkStatus

HasRestrictions=true

Returns:

- `isFullyLinked`: bool
- `linkedChannelName`: string
- `linkedServerName`: string

### C_Discord.GetNumDiscordChannels

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `serverIndex`: luaIndex

Returns:

- `count`: number
- `valid`: bool

### C_Discord.GetNumDiscordServers

HasRestrictions=true

Returns:

- `count`: number

### C_Discord.GetServerLinkableChannels

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex

### C_Discord.GetServerName

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex

Returns:

- `name`: string

### C_Discord.GuildLink

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `serverIndex`: luaIndex
- `channelIndex`: luaIndex

### C_Discord.GuildUnlink

HasRestrictions=true

### C_Discord.IsEnabled

Returns:

- `enabled`: bool

### C_Discord.IsGuildChannelLinked

HasRestrictions=true

Returns:

- `isLinked`: bool

### C_Discord.IsGuildSettingSet

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `setting`: DiscordGuildSettings

Returns:

- `isSet`: bool

### C_Discord.IsUserOAuthed

HasRestrictions=true

Returns:

- `hasOAuth`: bool

### C_Discord.IsVoiceEnabled

Returns:

- `enabled`: bool

### C_Discord.RefreshAuth

HasRestrictions=true

### C_Discord.SetGuildSetting

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `setting`: DiscordGuildSettings
- `set`: bool

### C_Discord.UpdateDiscordServers

HasRestrictions=true

### C_Discord.UpdateGuildLobby

HasRestrictions=true

## Events

### DISCORD_GUILD_ACHIEVEMENT

SynchronousEvent=true

Payload:

- `achievementID`: number

### DISCORD_GUILD_LOBBY_UPDATE

SynchronousEvent=true

### DISCORD_GUILD_SETTINGS_UPDATE

SynchronousEvent=true

### DISCORD_LINK_UPDATE

SynchronousEvent=true

### DISCORD_SERVER_LIST_UPDATE

SynchronousEvent=true

### DISCORD_STATUS_UPDATE

SynchronousEvent=true
