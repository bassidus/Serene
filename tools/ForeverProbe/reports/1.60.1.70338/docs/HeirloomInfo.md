# HeirloomInfo

Namespace `C_HeirloomInfo`.

Environment=All, Predicates={}

## Functions

### C_HeirloomInfo.AreAllCollectionFiltersChecked

Returns:

- `areAllCollectionFiltersChecked`: bool

### C_HeirloomInfo.AreAllSourceFiltersChecked

Returns:

- `areAllSourceFiltersChecked`: bool

### C_HeirloomInfo.HeirloomsAvailable

Returns:

- `areHeirloomsAvailable`: bool

### C_HeirloomInfo.IsHeirloomSourceValid

SecretArguments=AllowedWhenUntainted

Arguments:

- `source`: luaIndex

Returns:

- `isHeirloomSourceValid`: bool

### C_HeirloomInfo.IsUsingDefaultFilters

Returns:

- `isUsingDefaultFilters`: bool

### C_HeirloomInfo.SetAllCollectionFilters

SecretArguments=AllowedWhenUntainted

Arguments:

- `checked`: bool

### C_HeirloomInfo.SetAllSourceFilters

SecretArguments=AllowedWhenUntainted

Arguments:

- `checked`: bool

### C_HeirloomInfo.SetDefaultFilters

## Events

### HEIRLOOM_UPGRADE_TARGETING_CHANGED

SynchronousEvent=true

Payload:

- `pendingHeirloomUpgradeSpellcast`: bool

### HEIRLOOMS_UPDATED

SynchronousEvent=true, UniqueEvent=true

Payload:

- `itemID`: number?
- `updateReason`: cstring?
- `hideUntilLearned`: bool?
