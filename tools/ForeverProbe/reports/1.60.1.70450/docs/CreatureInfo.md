# CreatureInfo

Namespace `C_CreatureInfo`.

Environment=All, Predicates={}

## Functions

### C_CreatureInfo.GetClassInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `classID`: number

Returns:

- `classInfo`: ClassInfo?

### C_CreatureInfo.GetCreatureFamilyIDs

Returns:

- `creatureFamilyIDs`: table<number>

### C_CreatureInfo.GetCreatureFamilyInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `creatureFamilyID`: number

Returns:

- `creatureFamilyInfo`: CreatureFamilyInfo?

### C_CreatureInfo.GetCreatureID

SecretArguments=AllowedWhenUntainted

Arguments:

- `creatureGUID`: WOWGUID

Returns:

- `creatureID`: number?

### C_CreatureInfo.GetCreatureTypeIDs

Returns:

- `creatureTypeIDs`: table<number>

### C_CreatureInfo.GetCreatureTypeInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `creatureTypeID`: number

Returns:

- `creatureTypeInfo`: CreatureTypeInfo?

### C_CreatureInfo.GetFactionInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `raceID`: number

Returns:

- `factionInfo`: FactionInfo?

### C_CreatureInfo.GetRaceInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `raceID`: number

Returns:

- `raceInfo`: RaceInfo?

## Tables

### ClassInfo

Fields:

- `className`: string
- `classFile`: string
- `classID`: number

### CreatureFamilyInfo

Fields:

- `id`: number
- `name`: cstring
- `iconFile`: fileID?

### CreatureTypeInfo

Fields:

- `id`: number
- `name`: cstring

### FactionInfo

Fields:

- `name`: cstring
- `groupTag`: cstring

### RaceInfo

Fields:

- `raceName`: string
- `clientFileString`: string
- `raceID`: number
