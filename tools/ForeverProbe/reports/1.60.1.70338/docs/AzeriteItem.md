# AzeriteItem

Namespace `C_AzeriteItem`.

Environment=All, Predicates={}

## Functions

### C_AzeriteItem.FindActiveAzeriteItem

MayReturnNothing=true

Returns:

- `activeAzeriteItemLocation`: AzeriteItemLocation (ItemLocationMixin)

### C_AzeriteItem.GetAzeriteItemXPInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `azeriteItemLocation`: AzeriteItemLocation (ItemLocationMixin)

Returns:

- `xp`: number
- `totalLevelXP`: number

### C_AzeriteItem.GetPowerLevel

SecretArguments=AllowedWhenUntainted

Arguments:

- `azeriteItemLocation`: AzeriteItemLocation (ItemLocationMixin)

Returns:

- `powerLevel`: number

### C_AzeriteItem.GetUnlimitedPowerLevel

SecretArguments=AllowedWhenUntainted

Arguments:

- `azeriteItemLocation`: AzeriteItemLocation (ItemLocationMixin)

Returns:

- `powerLevel`: number

### C_AzeriteItem.HasActiveAzeriteItem

Returns:

- `hasActiveAzeriteItem`: bool

### C_AzeriteItem.IsAzeriteItem

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemLocation`: ItemLocation (ItemLocationMixin)

Returns:

- `isAzeriteItem`: bool

### C_AzeriteItem.IsAzeriteItemAtMaxLevel

Returns:

- `isAtMax`: bool

### C_AzeriteItem.IsAzeriteItemByID

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

Returns:

- `isAzeriteItem`: bool

### C_AzeriteItem.IsAzeriteItemEnabled

SecretArguments=AllowedWhenUntainted

Arguments:

- `azeriteItemLocation`: AzeriteItemLocation (ItemLocationMixin)

Returns:

- `isEnabled`: bool

### C_AzeriteItem.IsUnlimitedLevelingUnlocked

Returns:

- `isUnlimitedLevelingUnlocked`: bool

## Events

### AZERITE_ITEM_ENABLED_STATE_CHANGED

SynchronousEvent=true

Payload:

- `enabled`: bool

### AZERITE_ITEM_EXPERIENCE_CHANGED

SynchronousEvent=true

Payload:

- `azeriteItemLocation`: AzeriteItemLocation (ItemLocationMixin)
- `oldExperienceAmount`: number
- `newExperienceAmount`: number

### AZERITE_ITEM_POWER_LEVEL_CHANGED

SynchronousEvent=true

Payload:

- `azeriteItemLocation`: AzeriteItemLocation (ItemLocationMixin)
- `oldPowerLevel`: number
- `newPowerLevel`: number
- `unlockedEmpoweredItemsInfo`: table<UnlockedAzeriteEmpoweredItems>
- `azeriteItemID`: number

## Tables

### UnlockedAzeriteEmpoweredItems

Fields:

- `unlockedItem`: AzeriteEmpoweredItemLocation (ItemLocationMixin)
- `tierIndex`: luaIndex
