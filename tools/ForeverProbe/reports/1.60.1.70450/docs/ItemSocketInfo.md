# ItemSocketInfo

Namespace `C_ItemSocketInfo`.

Environment=All, Predicates={}

## Functions

### C_ItemSocketInfo.AcceptSockets

### C_ItemSocketInfo.ClickSocketButton

SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex

### C_ItemSocketInfo.CloseSocketInfo

### C_ItemSocketInfo.CompleteSocketing

### C_ItemSocketInfo.GetCurrUIType

Returns:

- `uiType`: ItemSocketInfoUIType

### C_ItemSocketInfo.GetExistingSocketInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex

Returns:

- `name`: string?
- `icon`: fileID?
- `gemMatchesSocket`: bool

### C_ItemSocketInfo.GetExistingSocketLink

SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex

Returns:

- `existingSocketLink`: string?

### C_ItemSocketInfo.GetNewSocketInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex

Returns:

- `name`: string?
- `icon`: fileID?
- `gemMatchesSocket`: bool

### C_ItemSocketInfo.GetNewSocketLink

SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex

Returns:

- `newSocketLink`: string?

### C_ItemSocketInfo.GetNumSockets

Returns:

- `numSockets`: number

### C_ItemSocketInfo.GetSocketItemBoundTradeable

Returns:

- `socketItemTradeable`: bool

### C_ItemSocketInfo.GetSocketItemInfo

Returns:

- `name`: string?
- `icon`: fileID?
- `quality`: ItemQuality

### C_ItemSocketInfo.GetSocketItemRefundable

Returns:

- `socketItemRefundable`: bool

### C_ItemSocketInfo.GetSocketTypes

SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex

Returns:

- `socketType`: string?

### C_ItemSocketInfo.HasBoundGemProposed

Returns:

- `hasBoundGemProposed`: bool

### C_ItemSocketInfo.IsArtifactRelicItem

SecretArguments=AllowedWhenUntainted

Arguments:

- `info`: ItemInfo

Returns:

- `isArtifactRelicItem`: bool

## Events

### SOCKET_INFO_ACCEPT

SynchronousEvent=true

### SOCKET_INFO_BIND_CONFIRM

SynchronousEvent=true

### SOCKET_INFO_CLOSE

SynchronousEvent=true

### SOCKET_INFO_FAILURE

SynchronousEvent=true

### SOCKET_INFO_REFUNDABLE_CONFIRM

SynchronousEvent=true

### SOCKET_INFO_SUCCESS

SynchronousEvent=true

### SOCKET_INFO_UI_EVENT_REGISTRATION_UPDATE

SynchronousEvent=true

Payload:

- `uiType`: ItemSocketInfoUIType

### SOCKET_INFO_UPDATE

SynchronousEvent=true

## Tables

### ItemSocketInfoUIType

MaxValue=0, MinValue=0, NumValues=1

Fields:

- `Default`: ItemSocketInfoUIType [= 0]

### SocketInfo

Fields:

- `name`: string?
- `icon`: fileID?
- `gemMatchesSocket`: bool

### SocketItemInfo

Fields:

- `name`: string?
- `icon`: fileID?
- `quality`: ItemQuality
