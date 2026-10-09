# PingManager

Namespace `C_Ping`.

Environment=All, Predicates={}

## Functions

### C_Ping.GetCooldownInfo

Returns:

- `cooldownInfo`: PingCooldownInfo

### C_Ping.GetDefaultPingOptions

Returns:

- `pingTypes`: table<PingTypeInfo>

### C_Ping.GetTextureKitForType

SecretArguments=AllowedWhenUntainted

Arguments:

- `type`: PingSubjectType

Returns:

- `uiTextureKitID`: textureKit

### C_Ping.IsPingSystemEnabled

Returns:

- `isEnabled`: bool

### C_Ping.SendMacroPing

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `macroInfo`: PingMacroInfo

### C_Ping.TogglePingListener

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `down`: bool

## Events

### PING_SYSTEM_ERROR

SynchronousEvent=true

Payload:

- `error`: cstring

## Tables

### PingTypeInfo

Fields:

- `orderIndex`: number
- `type`: PingSubjectType
- `uiTextureKitID`: textureKit
