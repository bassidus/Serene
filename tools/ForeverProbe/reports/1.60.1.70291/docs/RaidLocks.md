# RaidLocks

Namespace `C_RaidLocks`.

Environment=All, Predicates={}

## Functions

### C_RaidLocks.GetRedirectedDifficultyID

SecretArguments=AllowedWhenUntainted

Arguments:

- `mapID`: number
- `difficultyID`: number

Returns:

- `redirectedDifficultyID`: number

### C_RaidLocks.IsEncounterComplete

SecretArguments=AllowedWhenUntainted

Arguments:

- `mapID`: number
- `encounterID`: number
- `difficultyID`: number?

Returns:

- `encounterIsComplete`: bool

### C_RaidLocks.IsRaidLockExtendFeatureEnabled

Returns:

- `raidLockExtendFeatureEnabled`: bool

### C_RaidLocks.IsRaidLockExtendFeatureSupported

Returns:

- `raidLockExtendFeatureSupported`: bool
