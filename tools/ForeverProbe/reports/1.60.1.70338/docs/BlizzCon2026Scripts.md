# BlizzCon2026Scripts

Namespace `C_BlizzCon2026`.

Environment=All, Predicates={}

## Functions

### C_BlizzCon2026.GetExperience

Returns:

- `experience`: Bc26Experience

### C_BlizzCon2026.IsActive

Returns:

- `isActive`: bool

### C_BlizzCon2026.IsColdSwapFeatureEnabled

Returns:

- `isEnabled`: bool

### C_BlizzCon2026.SetExperience

SecretArguments=AllowedWhenUntainted

Arguments:

- `experience`: Bc26Experience

## Events

### BC_26_COLD_SWAP_FEATURE_ENABLED_CHANGED

UniqueEvent=true

Payload:

- `newEnabled`: bool
- `oldEnabled`: bool

### BC_26_EXPERIENCE_CHANGED

UniqueEvent=true

Payload:

- `newExperience`: Bc26Experience
- `oldExperience`: Bc26Experience

## Tables

### Bc26Experience

MaxValue=1, MinValue=0, NumValues=2

Fields:

- `Skyborne`: Bc26Experience [= 0]
- `Dungeon`: Bc26Experience [= 1]
