# HousingBasicModeUI

Namespace `C_HousingBasicMode`.

Environment=All, Predicates={}

## Functions

### C_HousingBasicMode.CancelActiveEditing -- Cancels all in-progress editing of the selected target, which will reset any unsaved changes and deselect the active target; Un-placed decor will be returned to the house chest

### C_HousingBasicMode.CommitDecorMovement -- Attempt to save the changes made to the currently selected decor instance

### C_HousingBasicMode.CommitHouseExteriorPosition -- Attempt to save the changes made to the House Exterior's position within the plot

### C_HousingBasicMode.FinishPlacingNewDecor

### C_HousingBasicMode.GetHoveredDecorInfo -- Returns info for the placed decor instance currently being hovered, if there is one

Returns:

- `info`: HousingDecorInstanceInfo?

### C_HousingBasicMode.GetSelectedDecorInfo -- Returns info for the decor instance that's currently selected, if there is one

Returns:

- `info`: HousingDecorInstanceInfo?

### C_HousingBasicMode.IsDecorSelected -- Returns true if a decor instance is currently selected and being dragged

Returns:

- `hasSelectedDecor`: bool

### C_HousingBasicMode.IsFreePlaceEnabled -- When free place is enabled, collision checks while dragging decor/the house exterior are ignored

Returns:

- `freePlaceEnabled`: bool

### C_HousingBasicMode.IsGridSnapEnabled

Returns:

- `isGridSnapEnabled`: bool

### C_HousingBasicMode.IsGridVisible

Returns:

- `gridVisible`: bool

### C_HousingBasicMode.IsHouseExteriorHovered -- Returns true if the house's exterior is currently being hovered

Returns:

- `isHouseExteriorHovered`: bool

### C_HousingBasicMode.IsHouseExteriorSelected -- Returns true if the house's exterior is currently selected and being moved

Returns:

- `isHouseExteriorSelected`: bool

### C_HousingBasicMode.IsHoveringDecor -- Returns true if a placed decor instance is currently being hovered

Returns:

- `isHoveringDecor`: bool

### C_HousingBasicMode.IsPlacingNewDecor

Returns:

- `hasPendingDecor`: bool

### C_HousingBasicMode.RemoveSelectedDecor -- Attempt to return the currently selected decor instance back to the house chest

### C_HousingBasicMode.RotateDecor -- Rotates the currently selected decor along a single axis; For wall decor, rotates such that the object stays flat against its current wall; For all other decor, rotates around the Z (vertical) axis

SecretArguments=AllowedWhenUntainted

Arguments:

- `rotDegrees`: number

### C_HousingBasicMode.RotateHouseExterior -- Rotates the House Exterior around the Z (vertical) axis

SecretArguments=AllowedWhenUntainted

Arguments:

- `rotDegrees`: number

### C_HousingBasicMode.SetFreePlaceEnabled -- Set whether free place is enabled; When free place is enabled, collision checks while dragging decor/the house exterior are ignored

SecretArguments=AllowedWhenUntainted

Arguments:

- `freePlaceEnabled`: bool

### C_HousingBasicMode.SetGridSnapEnabled

SecretArguments=AllowedWhenUntainted

Arguments:

- `isGridSnapEnabled`: bool

### C_HousingBasicMode.SetGridVisible

SecretArguments=AllowedWhenUntainted

Arguments:

- `gridVisible`: bool

### C_HousingBasicMode.StartPlacingNewDecor

SecretArguments=AllowedWhenUntainted

Arguments:

- `catalogEntryVariantID`: HousingCatalogEntryVariantID

### C_HousingBasicMode.StartPlacingPreviewDecor

SecretArguments=AllowedWhenUntainted

Arguments:

- `decorRecordID`: number
- `bundleCatalogShopProductID`: number?

## Events

### HOUSING_BASIC_MODE_HOVERED_TARGET_CHANGED

SynchronousEvent=true

Payload:

- `hasHoveredTarget`: bool
- `targetType`: HousingBasicModeTargetType

### HOUSING_BASIC_MODE_PLACEMENT_FLAGS_UPDATED

SynchronousEvent=true

Payload:

- `targetType`: HousingBasicModeTargetType
- `activeFlags`: HousingDecorPlacementRestriction

### HOUSING_BASIC_MODE_SELECTED_TARGET_CHANGED

SynchronousEvent=true

Payload:

- `hasSelectedTarget`: bool
- `targetType`: HousingBasicModeTargetType
- `isPreview`: bool

### HOUSING_DECOR_FREE_PLACE_STATUS_CHANGED

SynchronousEvent=true

Payload:

- `isFreePlaceEnabled`: bool

### HOUSING_DECOR_GRID_SNAP_OCCURRED

SynchronousEvent=true

### HOUSING_DECOR_GRID_SNAP_STATUS_CHANGED

SynchronousEvent=true

Payload:

- `isGridSnapEnabled`: bool

## Tables

### HousingBasicModeTargetType

MaxValue=2, MinValue=0, NumValues=3

Fields:

- `None`: HousingBasicModeTargetType [= 0]
- `Decor`: HousingBasicModeTargetType [= 1]
- `House`: HousingBasicModeTargetType [= 2]
