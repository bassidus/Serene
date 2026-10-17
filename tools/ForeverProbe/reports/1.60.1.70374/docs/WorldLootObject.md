# WorldLootObject

Namespace `C_WorldLootObject`.

Environment=All, Predicates={}

## Functions

### C_WorldLootObject.DoesSlotMatchInventoryType

SecretArguments=AllowedWhenUntainted

Arguments:

- `slot`: number
- `inventoryType`: InventoryType

Returns:

- `matches`: bool

### C_WorldLootObject.GetWorldLootObjectDistanceSquared

SecretArguments=AllowedWhenUntainted

Arguments:

- `unitToken`: UnitToken

Returns:

- `distanceSquared`: number?

### C_WorldLootObject.GetWorldLootObjectInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `unitToken`: UnitToken

Returns:

- `info`: WorldLootObjectInfo

### C_WorldLootObject.GetWorldLootObjectInfoByGUID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `objectGUID`: WOWGUID

Returns:

- `info`: WorldLootObjectInfo

### C_WorldLootObject.IsWorldLootObject

SecretArguments=AllowedWhenUntainted

Arguments:

- `unitToken`: UnitToken

Returns:

- `isWorldLootObject`: bool

### C_WorldLootObject.IsWorldLootObjectByGUID

SecretArguments=AllowedWhenUntainted

Arguments:

- `guid`: WOWGUID

Returns:

- `isWorldLootObject`: bool

### C_WorldLootObject.IsWorldLootObjectInRange

SecretArguments=AllowedWhenUntainted

Arguments:

- `unitToken`: UnitToken

Returns:

- `isWorldLootObjectInRange`: bool

### C_WorldLootObject.OnWorldLootObjectClick

SecretArguments=AllowedWhenUntainted

Arguments:

- `unitToken`: UnitToken
- `isLeftClick`: bool

## Events

### WORLD_LOOT_OBJECT_INFO_UPDATED

SynchronousEvent=true

Payload:

- `guid`: WOWGUID

## Tables

### WorldLootObjectInfo

Fields:

- `inventoryType`: InventoryType
- `atMaxQuality`: bool
- `isUpgrade`: bool
