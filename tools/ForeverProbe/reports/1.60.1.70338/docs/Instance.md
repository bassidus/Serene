# Instance

Environment=All, Predicates={}

## Functions

### CanChangePlayerDifficulty

MayReturnNothing=true

Returns:

- `canChange`: bool
- `notOnCooldown`: bool

### CanMapChangeDifficulty

SecretArguments=AllowedWhenUntainted

Arguments:

- `mapID`: number?

Returns:

- `canChange`: bool

### CanShowResetInstances

Returns:

- `result`: bool

### GetBaseDifficultyID

SecretArguments=AllowedWhenUntainted

Arguments:

- `difficultyID`: number

Returns:

- `baseDifficultyID`: number

### GetDifficultyInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `difficultyID`: number

Returns:

- `name`: cstring
- `instanceType`: cstring
- `isHeroic`: bool
- `isChallengeMode`: bool
- `displayHeroic`: bool
- `displayMythic`: bool
- `toggleDifficultyID`: number?
- `isLFR`: bool
- `minPlayers`: number?
- `maxPlayers`: number?
- `isUserSelectable`: bool

### GetDungeonDifficultyID

Returns:

- `result`: number

### GetInstanceBootTimeRemaining

Returns:

- `result`: number

### GetInstanceInfo

Returns:

- `name`: cstring
- `instanceType`: cstring
- `difficultyID`: number
- `difficultyName`: cstring
- `maxPlayers`: number
- `dynamicDifficulty`: number
- `isDynamic`: bool?
- `instanceID`: number
- `instanceGroupSize`: number
- `lfgDungeonID`: number?
- `hasWorldTier`: bool [default=false]

### GetInstanceLockTimeRemaining

Returns:

- `timeLeft`: number
- `extending`: bool
- `encountersTotal`: number
- `encountersCompleted`: number

### GetInstanceLockTimeRemainingEncounter

SecretArguments=AllowedWhenUntainted

Arguments:

- `encounterIndex`: luaIndex

Returns:

- `encounterName`: cstring
- `texture`: cstring
- `isKilled`: bool
- `ineligible`: bool

### GetLegacyRaidDifficultyID

Returns:

- `result`: number?

### GetRaidDifficultyID

Returns:

- `result`: number?

### IsInInstance

Returns:

- `isInInstance`: bool
- `instanceType`: cstring

### IsLegacyDifficulty

SecretArguments=AllowedWhenUntainted

Arguments:

- `difficultyID`: number

Returns:

- `result`: bool?

### ResetInstances

### SetDungeonDifficultyID

SecretArguments=AllowedWhenUntainted

Arguments:

- `difficultyID`: number

### SetLegacyRaidDifficultyID

SecretArguments=AllowedWhenUntainted

Arguments:

- `difficultyID`: number
- `force`: bool [default=false]

### SetRaidDifficultyID

SecretArguments=AllowedWhenUntainted

Arguments:

- `difficultyID`: number
- `force`: bool [default=false]

## Tables

### DifficultyInfo

Fields:

- `name`: cstring
- `instanceType`: cstring
- `isHeroic`: bool
- `isChallengeMode`: bool
- `displayHeroic`: bool
- `displayMythic`: bool
- `toggleDifficultyID`: number?
- `isLFR`: bool
- `minPlayers`: number?
- `maxPlayers`: number?
- `isUserSelectable`: bool

### DungeonEncounterInfo

Fields:

- `encounterName`: cstring
- `texture`: cstring
- `isKilled`: bool
- `ineligible`: bool

### InstanceInfo

Fields:

- `name`: cstring
- `instanceType`: cstring
- `difficultyID`: number
- `difficultyName`: cstring
- `maxPlayers`: number
- `dynamicDifficulty`: number
- `isDynamic`: bool?
- `instanceID`: number
- `instanceGroupSize`: number
- `lfgDungeonID`: number?
- `hasWorldTier`: bool [default=false]
