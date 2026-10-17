# EquipmentSet

Namespace `C_EquipmentSet`.

Environment=All, Predicates={}

## Functions

### C_EquipmentSet.AssignSpecToEquipmentSet

SecretArguments=AllowedWhenUntainted

Arguments:

- `equipmentSetID`: number
- `specIndex`: luaIndex

### C_EquipmentSet.CanUseEquipmentSets

Returns:

- `canUseEquipmentSets`: bool

### C_EquipmentSet.ClearIgnoredSlotsForSave

### C_EquipmentSet.CreateEquipmentSet

SecretArguments=AllowedWhenUntainted

Arguments:

- `equipmentSetName`: cstring
- `icon`: cstring?

### C_EquipmentSet.DeleteEquipmentSet

SecretArguments=AllowedWhenUntainted

Arguments:

- `equipmentSetID`: number

### C_EquipmentSet.EquipmentSetContainsLockedItems

SecretArguments=AllowedWhenUntainted

Arguments:

- `equipmentSetID`: number

Returns:

- `hasLockedItems`: bool

### C_EquipmentSet.GetEquipmentSetAssignedSpec

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `equipmentSetID`: number

Returns:

- `specIndex`: luaIndex

### C_EquipmentSet.GetEquipmentSetForSpec

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `specIndex`: luaIndex

Returns:

- `equipmentSetID`: number

### C_EquipmentSet.GetEquipmentSetID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `equipmentSetName`: cstring

Returns:

- `equipmentSetID`: number

### C_EquipmentSet.GetEquipmentSetIDs

Returns:

- `equipmentSetIDs`: table<number>

### C_EquipmentSet.GetEquipmentSetInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `equipmentSetID`: number

Returns:

- `name`: string
- `iconFileID`: number
- `setID`: number
- `isEquipped`: bool
- `numItems`: number
- `numEquipped`: number
- `numInInventory`: number
- `numLost`: number
- `numIgnored`: number

### C_EquipmentSet.GetIgnoredSlots

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `equipmentSetID`: number

Returns:

- `slotIgnored`: table<bool> [NilableContents=true]

### C_EquipmentSet.GetItemIDs

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `equipmentSetID`: number

Returns:

- `itemIDs`: table<number> [NilableContents=true]

### C_EquipmentSet.GetItemLocations

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `equipmentSetID`: number

Returns:

- `locations`: table<number> [NilableContents=true]

### C_EquipmentSet.GetNumEquipmentSets

Returns:

- `numEquipmentSets`: number

### C_EquipmentSet.IgnoreSlotForSave

SecretArguments=AllowedWhenUntainted

Arguments:

- `slot`: luaIndex

### C_EquipmentSet.IsSlotIgnoredForSave

SecretArguments=AllowedWhenUntainted

Arguments:

- `slot`: luaIndex

Returns:

- `isSlotIgnored`: bool

### C_EquipmentSet.ModifyEquipmentSet

SecretArguments=AllowedWhenUntainted

Arguments:

- `equipmentSetID`: number
- `newName`: cstring
- `newIcon`: cstring?

### C_EquipmentSet.PickupEquipmentSet

SecretArguments=AllowedWhenUntainted

Arguments:

- `equipmentSetID`: number

### C_EquipmentSet.SaveEquipmentSet

SecretArguments=AllowedWhenUntainted

Arguments:

- `equipmentSetID`: number
- `icon`: cstring?

### C_EquipmentSet.UnassignEquipmentSetSpec

SecretArguments=AllowedWhenUntainted

Arguments:

- `equipmentSetID`: number

### C_EquipmentSet.UnignoreSlotForSave

SecretArguments=AllowedWhenUntainted

Arguments:

- `slot`: luaIndex

### C_EquipmentSet.UseEquipmentSet

SecretArguments=AllowedWhenUntainted

Arguments:

- `equipmentSetID`: number

Returns:

- `setWasEquipped`: bool

## Events

### EQUIPMENT_SETS_CHANGED

SynchronousEvent=true

### EQUIPMENT_SWAP_FINISHED

SynchronousEvent=true

Payload:

- `result`: bool
- `setID`: number?

### EQUIPMENT_SWAP_PENDING

SynchronousEvent=true

### TRANSMOG_CUSTOM_SETS_CHANGED

SynchronousEvent=true
