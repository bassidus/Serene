# PlayerLocationInfo

Namespace `C_PlayerInfo`.

Environment=All, Predicates={}

## Functions

### C_PlayerInfo.GUIDIsPlayer

SecretArguments=AllowedWhenUntainted

Arguments:

- `guid`: WOWGUID

Returns:

- `isPlayer`: bool

### C_PlayerInfo.GetClass

SecretArguments=AllowedWhenUntainted

Arguments:

- `playerLocation`: PlayerLocation (PlayerLocationMixin)

Returns:

- `className`: cstring?
- `classFilename`: cstring?
- `classID`: number?

### C_PlayerInfo.GetName

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `playerLocation`: PlayerLocation (PlayerLocationMixin)

Returns:

- `name`: string

### C_PlayerInfo.GetRace

SecretArguments=AllowedWhenUntainted

Arguments:

- `playerLocation`: PlayerLocation (PlayerLocationMixin)

Returns:

- `raceID`: number?

### C_PlayerInfo.GetSex

SecretArguments=AllowedWhenUntainted

Arguments:

- `playerLocation`: PlayerLocation (PlayerLocationMixin)

Returns:

- `sex`: UnitSex?

### C_PlayerInfo.IsConnected

SecretArguments=AllowedWhenUntainted

Arguments:

- `playerLocation`: PlayerLocation (PlayerLocationMixin)?

Returns:

- `isConnected`: bool?

### C_PlayerInfo.UnitIsSameServer

SecretArguments=AllowedWhenUntainted

Arguments:

- `playerLocation`: PlayerLocation (PlayerLocationMixin)

Returns:

- `unitIsSameServer`: bool
