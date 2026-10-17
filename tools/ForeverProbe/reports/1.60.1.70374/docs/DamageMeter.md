# DamageMeter

Namespace `C_DamageMeter`.

Environment=All, Predicates={}

## Functions

### C_DamageMeter.GetAvailableCombatSessions -- Returns a list of combat sessions currently being tracked.

Returns:

- `availableSessions`: table<DamageMeterAvailableCombatSession>

### C_DamageMeter.GetCombatSessionFromID -- Returns the data for the player's combat session with the specified ID.

SecretArguments=AllowedWhenUntainted, SecretWhenInCombat=true

Arguments:

- `sessionID`: number
- `type`: DamageMeterType

Returns:

- `session`: DamageMeterCombatSession

### C_DamageMeter.GetCombatSessionFromType -- Returns the data for the player's current combat session.

SecretArguments=AllowedWhenUntainted, SecretWhenInCombat=true

Arguments:

- `sessionType`: DamageMeterSessionType
- `type`: DamageMeterType

Returns:

- `session`: DamageMeterCombatSession

### C_DamageMeter.GetCombatSessionSourceFromID -- Returns the data for a single source (unit) in the player's current combat session with the specified ID.

SecretArguments=AllowedWhenUntainted, SecretWhenInCombat=true

Arguments:

- `sessionID`: number
- `type`: DamageMeterType
- `sourceGUID`: WOWGUID?
- `sourceCreatureID`: number?

Returns:

- `sessionSource`: DamageMeterCombatSessionSource

### C_DamageMeter.GetCombatSessionSourceFromType -- Returns the data for a single source (unit) in the player's current combat session.

SecretArguments=AllowedWhenUntainted, SecretWhenInCombat=true

Arguments:

- `sessionType`: DamageMeterSessionType
- `type`: DamageMeterType
- `sourceGUID`: WOWGUID?
- `sourceCreatureID`: number?

Returns:

- `sessionSource`: DamageMeterCombatSessionSource

### C_DamageMeter.GetSessionDurationSeconds -- Returns the amount of time a combat session has lasted

SecretArguments=AllowedWhenUntainted

Arguments:

- `sessionType`: DamageMeterSessionType

Returns:

- `durationSeconds`: number?

### C_DamageMeter.IsDamageMeterAvailable -- Returns whether the player can enable and use the Damage Meter.

Returns:

- `isAvailable`: bool
- `failureReason`: string

### C_DamageMeter.ResetAllCombatSessions -- Clears the data for all the player's combat sessions.

## Events

### DAMAGE_METER_COMBAT_SESSION_UPDATED

UniqueEvent=true

Payload:

- `type`: DamageMeterType
- `sessionID`: number

### DAMAGE_METER_CURRENT_SESSION_UPDATED

UniqueEvent=true

### DAMAGE_METER_RESET

UniqueEvent=true

## Tables

### DamageMeterAvailableCombatSession -- Data for a combat session currently being tracked.

Fields:

- `sessionID`: number
- `name`: cstring
- `durationSeconds`: number?

### DamageMeterCombatSession -- Aggregated data for all sources (units) in a damage meter combat session.

Fields:

- `combatSources`: table<DamageMeterCombatSource>
- `maxAmount`: number [default=0]
- `totalAmount`: number [default=0]
- `durationSeconds`: number?

### DamageMeterCombatSessionSource -- Data for a single source (unit) in a combat session.

Fields:

- `combatSpells`: table<DamageMeterCombatSpell>
- `maxAmount`: number [default=0]
- `totalAmount`: number [default=0]

### DamageMeterCombatSource -- Aggregated data for a single source (unit) in a damage meter combat session.

Fields:

- `sourceGUID`: WOWGUID? [ConditionalSecret=true]
- `sourceCreatureID`: number?
- `name`: cstring [ConditionalSecret=true]
- `classFilename`: cstring [NeverSecret=true]
- `specIconID`: fileID [NeverSecret=true]
- `totalAmount`: number
- `amountPerSecond`: number
- `isLocalPlayer`: bool [NeverSecret=true]
- `deathRecapID`: number [NeverSecret=true]
- `deathTimeSeconds`: number
- `classification`: cstring [NeverSecret=true]
- `sourceDisplayType`: DamageMeterSourceDisplayType
- `factionGroup`: cstring?

### DamageMeterCombatSpell -- Aggregated data for all spells of the same ID cast by a single source (unit) in a combat session.

Fields:

- `spellID`: number
- `totalAmount`: number
- `amountPerSecond`: number
- `creatureName`: cstring
- `overkillAmount`: number
- `isAvoidable`: bool
- `isDeadly`: bool
- `combatSpellDetails`: DamageMeterCombatSpellUnitDetails

### DamageMeterCombatSpellUnitDetails -- Amount for a single target for all casts of the same spellID by a single source (unit) in a combat session.

Fields:

- `unitName`: cstring
- `unitClassFilename`: cstring [NeverSecret=true]
- `classification`: cstring [NeverSecret=true]
- `isPet`: bool
- `isMob`: bool
- `amount`: number
- `specIconID`: fileID [NeverSecret=true]
