# LossOfControl

Namespace `C_LossOfControl`.

Environment=All, Predicates={}

## Functions

### C_LossOfControl.GetActiveLossOfControlData

SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex

Returns:

- `event`: LossOfControlData?

### C_LossOfControl.GetActiveLossOfControlDataByUnit

SecretArguments=AllowedWhenUntainted, SecretWhenLossOfControlInfoRestricted=true

Arguments:

- `unitToken`: UnitToken
- `index`: luaIndex

Returns:

- `event`: LossOfControlData?

### C_LossOfControl.GetActiveLossOfControlDataCount

Returns:

- `count`: number

### C_LossOfControl.GetActiveLossOfControlDataCountByUnit

SecretArguments=AllowedWhenUntainted

Arguments:

- `unitToken`: UnitToken

Returns:

- `count`: number

### C_LossOfControl.GetActiveLossOfControlDuration

SecretArguments=AllowedWhenUntainted

Arguments:

- `unitToken`: UnitToken
- `index`: luaIndex

Returns:

- `duration`: LuaDurationObject?

## Events

### LOSS_OF_CONTROL_ADDED

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant
- `effectIndex`: luaIndex

### LOSS_OF_CONTROL_COMMENTATOR_ADDED

SynchronousEvent=true

Payload:

- `victim`: WOWGUID
- `effectIndex`: luaIndex

### LOSS_OF_CONTROL_COMMENTATOR_UPDATE

SynchronousEvent=true, UniqueEvent=true

Payload:

- `victim`: WOWGUID

### LOSS_OF_CONTROL_UPDATE

SynchronousEvent=true, UniqueEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### PLAYER_CONTROL_GAINED

SynchronousEvent=true

### PLAYER_CONTROL_LOST

SynchronousEvent=true

## Tables

### LossOfControlData

Fields:

- `locType`: cstring
- `spellID`: number
- `displayText`: cstring
- `iconTexture`: number
- `startTime`: number?
- `timeRemaining`: number?
- `duration`: number?
- `lockoutSchool`: number
- `priority`: number [NeverSecret=true]
- `displayType`: number [NeverSecret=true]
- `auraInstanceID`: number?
