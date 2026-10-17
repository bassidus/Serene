# Transmogrify

Namespace `C_Transmog`.

Environment=All, Predicates={}

## Functions

### C_Transmog.CanHaveSecondaryAppearanceForSlotID

SecretArguments=AllowedWhenUntainted

Arguments:

- `slotID`: luaIndex

Returns:

- `canHaveSecondaryAppearance`: bool

### C_Transmog.ExtractTransmogIDList

SecretArguments=AllowedWhenUntainted

Arguments:

- `input`: cstring

Returns:

- `transmogIDList`: table<number>

### C_Transmog.GetAllSetAppearancesByID

SecretArguments=AllowedWhenUntainted

Arguments:

- `setID`: number

Returns:

- `setItems`: table<TransmogSetItemInfo>?

### C_Transmog.GetItemIDForSource

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemModifiedAppearanceID`: number

Returns:

- `itemID`: number?

### C_Transmog.GetSlotForInventoryType

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `inventoryType`: luaIndex

Returns:

- `slot`: luaIndex

### C_Transmog.GetSlotVisualInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `transmogLocation`: TransmogLocation (TransmogLocationMixin)

Returns:

- `slotVisualInfo`: TransmogSlotVisualInfo

### C_Transmog.IsAtTransmogNPC

Returns:

- `isAtNPC`: bool

## Events

### TRANSMOG_COLLECTION_CAMERA_UPDATE

SynchronousEvent=true

### TRANSMOG_COLLECTION_ITEM_FAVORITE_UPDATE

SynchronousEvent=true

Payload:

- `itemAppearanceID`: number
- `isFavorite`: bool

### TRANSMOG_COLLECTION_ITEM_UPDATE

UniqueEvent=true

### TRANSMOG_COLLECTION_SOURCE_ADDED

SynchronousEvent=true

Payload:

- `itemModifiedAppearanceID`: number

### TRANSMOG_COLLECTION_SOURCE_REMOVED

SynchronousEvent=true

Payload:

- `itemModifiedAppearanceID`: number

### TRANSMOG_COLLECTION_UPDATED

SynchronousEvent=true, UniqueEvent=true

Payload:

- `collectionIndex`: luaIndex?
- `modID`: number?
- `itemAppearanceID`: number?
- `reason`: cstring?

### TRANSMOG_COSMETIC_COLLECTION_SOURCE_ADDED

SynchronousEvent=true

Payload:

- `itemModifiedAppearanceID`: number

### TRANSMOG_SEARCH_UPDATED

SynchronousEvent=true

Payload:

- `searchType`: TransmogSearchType
- `collectionType`: TransmogCollectionType?

### TRANSMOG_SETS_UPDATE_FAVORITE

SynchronousEvent=true

### TRANSMOG_SOURCE_COLLECTABILITY_UPDATE

SynchronousEvent=true

Payload:

- `itemModifiedAppearanceID`: number
- `collectable`: bool

### TRANSMOGRIFY_CLOSE

SynchronousEvent=true

### TRANSMOGRIFY_ITEM_UPDATE

UniqueEvent=true

### TRANSMOGRIFY_OPEN

SynchronousEvent=true

### TRANSMOGRIFY_SUCCESS

SynchronousEvent=true

Payload:

- `transmogLocation`: TransmogLocation (TransmogLocationMixin)

### TRANSMOGRIFY_UPDATE

SynchronousEvent=true

Payload:

- `transmogLocation`: TransmogLocation (TransmogLocationMixin)?
- `action`: cstring?

## Tables

### TransmogPendingType

MaxValue=3, MinValue=0, NumValues=4

Fields:

- `Apply`: TransmogPendingType [= 0]
- `Revert`: TransmogPendingType [= 1]
- `ToggleOn`: TransmogPendingType [= 2]
- `ToggleOff`: TransmogPendingType [= 3]

### TransmogApplyWarningInfo

Fields:

- `itemLink`: string
- `text`: string

### TransmogSetItemInfo

Fields:

- `itemID`: number
- `itemModifiedAppearanceID`: number
- `invSlot`: number
- `invType`: string

### TransmogSlotInfo

Fields:

- `isTransmogrified`: bool
- `hasPending`: bool
- `isPendingCollected`: bool
- `canTransmogrify`: bool
- `cannotTransmogrifyReason`: number
- `hasUndo`: bool
- `isHideVisual`: bool
- `texture`: fileID?

### TransmogSlotVisualInfo

Fields:

- `baseSourceID`: number
- `baseVisualID`: number
- `appliedSourceID`: number
- `appliedVisualID`: number
- `pendingSourceID`: number
- `pendingVisualID`: number
- `hasUndo`: bool
- `isHideVisual`: bool
- `itemSubclass`: number
