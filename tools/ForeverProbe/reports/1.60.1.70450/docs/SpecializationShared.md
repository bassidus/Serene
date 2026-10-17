# SpecializationShared

Environment=All, Predicates={}

## Functions

### GetSpecializationInfoForClassID

SecretArguments=AllowedWhenUntainted

Arguments:

- `classID`: number
- `index`: luaIndex
- `gender`: UnitSex?

Returns:

- `id`: number
- `name`: cstring
- `description`: string
- `icon`: fileID
- `role`: cstring
- `recommended`: bool
- `allowedForBoost`: bool
- `masterySpell1`: number?
- `masterySpell2`: number?

### GetSpecializationInfoForSpecID

SecretArguments=AllowedWhenUntainted

Arguments:

- `specID`: number
- `gender`: UnitSex?

Returns:

- `id`: number
- `name`: cstring
- `description`: string
- `icon`: fileID
- `role`: cstring
- `recommended`: bool
- `allowedForBoost`: bool
- `masterySpell1`: number?
- `masterySpell2`: number?

### GetSpecializationNameForSpecID

SecretArguments=AllowedWhenUntainted

Arguments:

- `specID`: number
- `gender`: UnitSex?

Returns:

- `name`: cstring?

### GetSpecializationSystem

Returns:

- `system`: SpecializationSystem

### HasLootSpecializations

Returns:

- `hasLootSpecializations`: bool

## Tables

### SpecializationSystem

MaxValue=1, MinValue=0, NumValues=2

Fields:

- `TalentTab`: SpecializationSystem [= 0]
- `ChrSpecialization`: SpecializationSystem [= 1]

### SpecializationInfoResult

Fields:

- `id`: number
- `name`: cstring
- `description`: string
- `icon`: fileID
- `role`: cstring
- `recommended`: bool
- `allowedForBoost`: bool
- `masterySpell1`: number?
- `masterySpell2`: number?
