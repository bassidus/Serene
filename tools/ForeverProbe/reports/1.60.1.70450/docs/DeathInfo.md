# DeathInfo

Namespace `C_DeathInfo`.

Environment=All, Predicates={}

## Functions

### C_DeathInfo.GetCorpseMapPosition

SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

Returns:

- `position`: vector2 (Vector2DMixin)?

### C_DeathInfo.GetDeathReleasePosition

SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

Returns:

- `position`: vector2 (Vector2DMixin)?

### C_DeathInfo.GetGraveyardsForMap

SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

Returns:

- `graveyards`: table<GraveyardMapInfo>

### C_DeathInfo.GetSelfResurrectOptions

MayReturnNothing=true

Returns:

- `options`: table<SelfResurrectOption>

### C_DeathInfo.UseSelfResurrectOption

SecretArguments=AllowedWhenUntainted

Arguments:

- `optionType`: SelfResurrectOptionType
- `id`: number

## Events

### AREA_SPIRIT_HEALER_IN_RANGE

SynchronousEvent=true

### AREA_SPIRIT_HEALER_OUT_OF_RANGE

SynchronousEvent=true

### CEMETERY_PREFERENCE_UPDATED

SynchronousEvent=true

### CONFIRM_XP_LOSS

SynchronousEvent=true

### CORPSE_IN_INSTANCE

SynchronousEvent=true

### CORPSE_IN_RANGE

SynchronousEvent=true

### CORPSE_OUT_OF_RANGE

SynchronousEvent=true

### PLAYER_ALIVE

SynchronousEvent=true

### PLAYER_DEAD

SynchronousEvent=true

### PLAYER_SKINNED

SynchronousEvent=true

Payload:

- `hasFreeRepop`: number

### PLAYER_UNGHOST

SynchronousEvent=true

### REQUEST_CEMETERY_LIST_RESPONSE

SynchronousEvent=true

Payload:

- `isGossipTriggered`: bool

### RESURRECT_REQUEST

SynchronousEvent=true

Payload:

- `inviter`: cstring

### SELF_RES_SPELL_CHANGED

SynchronousEvent=true

## Tables

### SelfResurrectOptionType

MaxValue=1, MinValue=0, NumValues=2

Fields:

- `Spell`: SelfResurrectOptionType [= 0]
- `Item`: SelfResurrectOptionType [= 1]

### GraveyardMapInfo

Fields:

- `areaPoiID`: number
- `position`: vector2 (Vector2DMixin)
- `name`: cstring
- `textureIndex`: number
- `graveyardID`: number
- `isGraveyardSelectable`: bool

### SelfResurrectOption

Fields:

- `name`: string
- `optionType`: SelfResurrectOptionType
- `id`: number
- `canUse`: bool
- `isLimited`: bool
- `priority`: number
