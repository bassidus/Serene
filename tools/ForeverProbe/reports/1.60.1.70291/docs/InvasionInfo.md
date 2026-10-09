# InvasionInfo

Namespace `C_InvasionInfo`.

Environment=All, Predicates={}

## Functions

### C_InvasionInfo.AreInvasionsAvailable -- Returns true if invasions are active in the same physical area as the player.

Returns:

- `areInvasionsAvailable`: bool

### C_InvasionInfo.GetInvasionForUiMapID

SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

Returns:

- `invasionID`: number?

### C_InvasionInfo.GetInvasionInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `invasionID`: number

Returns:

- `invasionInfo`: InvasionMapInfo

### C_InvasionInfo.GetInvasionTimeLeft

SecretArguments=AllowedWhenUntainted

Arguments:

- `invasionID`: number

Returns:

- `timeLeftMinutes`: number?

## Tables

### InvasionMapInfo

Fields:

- `invasionID`: number
- `name`: string
- `position`: vector2 (Vector2DMixin)
- `atlasName`: textureAtlas
- `rewardQuestID`: number?
