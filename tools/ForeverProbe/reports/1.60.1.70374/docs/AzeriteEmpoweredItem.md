# AzeriteEmpoweredItem

Namespace `C_AzeriteEmpoweredItem`.

Environment=All, Predicates={}

## Functions

### C_AzeriteEmpoweredItem.CanSelectPower

SecretArguments=AllowedWhenUntainted

Arguments:

- `azeriteEmpoweredItemLocation`: AzeriteEmpoweredItemLocation (ItemLocationMixin)
- `powerID`: number

Returns:

- `canSelect`: bool

### C_AzeriteEmpoweredItem.ConfirmAzeriteEmpoweredItemRespec

SecretArguments=AllowedWhenUntainted

Arguments:

- `azeriteEmpoweredItemLocation`: AzeriteEmpoweredItemLocation (ItemLocationMixin)

### C_AzeriteEmpoweredItem.GetAllTierInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `azeriteEmpoweredItemLocation`: AzeriteEmpoweredItemLocation (ItemLocationMixin)

Returns:

- `tierInfo`: table<AzeriteEmpoweredItemTierInfo>

### C_AzeriteEmpoweredItem.GetAllTierInfoByItemID

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo
- `classID`: number? -- Specify a class ID to get tier information about that class, otherwise uses the player's class if left nil

Returns:

- `tierInfo`: table<AzeriteEmpoweredItemTierInfo>

### C_AzeriteEmpoweredItem.GetAzeriteEmpoweredItemRespecCost

Returns:

- `cost`: number

### C_AzeriteEmpoweredItem.GetPowerInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `powerID`: number

Returns:

- `powerInfo`: AzeriteEmpoweredItemPowerInfo

### C_AzeriteEmpoweredItem.GetPowerText

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `azeriteEmpoweredItemLocation`: AzeriteEmpoweredItemLocation (ItemLocationMixin)
- `powerID`: number
- `level`: AzeritePowerLevel

Returns:

- `powerText`: AzeriteEmpoweredItemPowerText

### C_AzeriteEmpoweredItem.GetSpecsForPower

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `powerID`: number

Returns:

- `specInfo`: table<AzeriteSpecInfo>

### C_AzeriteEmpoweredItem.HasAnyUnselectedPowers

SecretArguments=AllowedWhenUntainted

Arguments:

- `azeriteEmpoweredItemLocation`: AzeriteEmpoweredItemLocation (ItemLocationMixin)

Returns:

- `hasAnyUnselectedPowers`: bool

### C_AzeriteEmpoweredItem.HasBeenViewed

SecretArguments=AllowedWhenUntainted

Arguments:

- `azeriteEmpoweredItemLocation`: AzeriteEmpoweredItemLocation (ItemLocationMixin)

Returns:

- `hasBeenViewed`: bool

### C_AzeriteEmpoweredItem.IsAzeriteEmpoweredItem

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemLocation`: ItemLocation (ItemLocationMixin)

Returns:

- `isAzeriteEmpoweredItem`: bool

### C_AzeriteEmpoweredItem.IsAzeriteEmpoweredItemByID

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

Returns:

- `isAzeriteEmpoweredItem`: bool

### C_AzeriteEmpoweredItem.IsAzeritePreviewSourceDisplayable

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo
- `classID`: number? -- Specify a class ID to determine if its displayable for that class, otherwise uses the player's class if left nil

Returns:

- `isAzeritePreviewSourceDisplayable`: bool

### C_AzeriteEmpoweredItem.IsHeartOfAzerothEquipped

Returns:

- `isHeartOfAzerothEquipped`: bool

### C_AzeriteEmpoweredItem.IsPowerAvailableForSpec

SecretArguments=AllowedWhenUntainted

Arguments:

- `powerID`: number
- `specID`: number

Returns:

- `isPowerAvailableForSpec`: bool

### C_AzeriteEmpoweredItem.IsPowerSelected

SecretArguments=AllowedWhenUntainted

Arguments:

- `azeriteEmpoweredItemLocation`: AzeriteEmpoweredItemLocation (ItemLocationMixin)
- `powerID`: number

Returns:

- `isSelected`: bool

### C_AzeriteEmpoweredItem.SelectPower

SecretArguments=AllowedWhenUntainted

Arguments:

- `azeriteEmpoweredItemLocation`: AzeriteEmpoweredItemLocation (ItemLocationMixin)
- `powerID`: number

Returns:

- `success`: bool

### C_AzeriteEmpoweredItem.SetHasBeenViewed

SecretArguments=AllowedWhenUntainted

Arguments:

- `azeriteEmpoweredItemLocation`: AzeriteEmpoweredItemLocation (ItemLocationMixin)

## Events

### AZERITE_EMPOWERED_ITEM_EQUIPPED_STATUS_CHANGED

SynchronousEvent=true

Payload:

- `isHeartEquipped`: bool

### AZERITE_EMPOWERED_ITEM_SELECTION_UPDATED

SynchronousEvent=true

Payload:

- `azeriteEmpoweredItemLocation`: AzeriteEmpoweredItemLocation (ItemLocationMixin)

## Tables

### AzeritePowerLevel

MaxValue=2, MinValue=0, NumValues=3

Fields:

- `Base`: AzeritePowerLevel [= 0]
- `Upgraded`: AzeritePowerLevel [= 1]
- `Downgraded`: AzeritePowerLevel [= 2]

### AzeriteEmpoweredItemPowerInfo

Fields:

- `azeritePowerID`: number
- `spellID`: number

### AzeriteEmpoweredItemPowerText

Fields:

- `name`: string
- `description`: string

### AzeriteEmpoweredItemTierInfo

Fields:

- `azeritePowerIDs`: table<number>
- `unlockLevel`: number

### AzeriteSpecInfo

Fields:

- `classID`: number
- `specID`: number
