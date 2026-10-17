# HousingDecorUI

Namespace `C_HousingDecor`.

Environment=All, Predicates={}

## Functions

### C_HousingDecor.AnyDecorPlacedInRoom -- Returns true if any decor objects are placed in a given room

SecretArguments=AllowedWhenUntainted

Arguments:

- `roomGUID`: WOWGUID

Returns:

- `isPlaced`: bool

### C_HousingDecor.CancelActiveEditing -- Cancels all in-progress editing of the selected target, which will reset any unsaved changes and deselect the active target

### C_HousingDecor.CommitDecorMovement -- Attempt to save the changes made to the currently selected decor instance

### C_HousingDecor.EnterPreviewState

### C_HousingDecor.ExitPreviewState

### C_HousingDecor.GetAllMaxPlacementBudgets -- Returns the interior and exterior max decor placement budgets for the current owned house interior or plot; Can be increased via house level

Returns:

- `interiorMaxBudgets`: table<number>? [KeyType=HousingBudgetType] -- Map of budget type to max budget amount; Will be nil if not in an owned House or Plot
- `exteriorMaxBudgets`: table<number>? [KeyType=HousingBudgetType] -- Map of budget type to max budget amount; Will be nil if not in an owned House or Plot

### C_HousingDecor.GetAllPlacedDecor -- Placed Decor List APIs currently restricted due to being potentially very expensive operations, may be reworked & opened up in the future

HasRestrictions=true

Returns:

- `placedDecor`: table<HousingDecorInstanceListEntry>

### C_HousingDecor.GetAllSpentPlacementBudgets -- Returns how much of the interior and exterior placement budgets for the current owned house interior or plot's decor budget have been spent

Returns:

- `interiorSpentBudgets`: table<number>? [KeyType=HousingBudgetType] -- Map of budget type to spent budget amount; Will be nil if not in an owned House or Plot
- `exteriorSpentBudgets`: table<number>? [KeyType=HousingBudgetType] -- Map of budget type to spent budget amount; Will be nil if not in an owned House or Plot

### C_HousingDecor.GetDecorAssignedPetName -- Returns pet name for the placed decor instance associated with the passed Decor GUID, if there is one

SecretArguments=AllowedWhenUntainted

Arguments:

- `decorGUID`: WOWGUID

Returns:

- `name`: string?

### C_HousingDecor.GetDecorCanAttachPet

SecretArguments=AllowedWhenUntainted

Arguments:

- `decorID`: number

Returns:

- `canAttachPet`: bool

### C_HousingDecor.GetDecorHyperlink

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `decorID`: number

Returns:

- `hyperLink`: string

### C_HousingDecor.GetDecorIcon

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `decorID`: number

Returns:

- `icon`: fileID

### C_HousingDecor.GetDecorInstanceInfoForGUID -- Returns info for the placed decor instance associated with the passed Decor GUID, if there is one

SecretArguments=AllowedWhenUntainted

Arguments:

- `decorGUID`: WOWGUID

Returns:

- `info`: HousingDecorInstanceInfo?

### C_HousingDecor.GetDecorName

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `decorID`: number

Returns:

- `name`: string

### C_HousingDecor.GetHoveredDecorInfo -- Returns info for the placed decor instance currently being hovered, if there is one

Returns:

- `info`: HousingDecorInstanceInfo?

### C_HousingDecor.GetMaxPetPlacementBudget -- Returns the max pet decor placement budget for the current owned house interior or plot

Returns:

- `maxBudget`: number? -- Will be nil if not in an owned House or Plot

### C_HousingDecor.GetMaxPlacementBudget -- Returns the max decor placement budget for the current owned house interior or plot; Can be increased via house level

Returns:

- `maxBudget`: number? -- Will be nil if not in an owned House or Plot

### C_HousingDecor.GetNumDecorPlaced -- Returns the number of individual decor objects placed in the current house or plot; This is NOT the value used in placement budget calculations, see GetSpentPlacementBudget for that

Returns:

- `numPlaced`: number

### C_HousingDecor.GetNumPreviewDecor

Returns:

- `numDecor`: number

### C_HousingDecor.GetSelectedDecorInfo -- Returns info for the placed decor instance that's currently selected, if there is one

Returns:

- `info`: HousingDecorInstanceInfo?

### C_HousingDecor.GetSpentPetPlacementBudget -- Returns how much of the current owned house interior or plot's pet decor placement budget has been spent

Returns:

- `totalCost`: number? -- Will be nil if not in an owned House or Plot

### C_HousingDecor.GetSpentPlacementBudget -- Returns how much of the current owned house interior or plot's decor placement budget has been spent; Different kinds of decor take up different budget amounts, so this value isn't an individual decor count, see GetNumDecorPlaced for that

Returns:

- `totalCost`: number? -- Will be nil if not in an owned House or Plot

### C_HousingDecor.HasMaxPlacementBudget -- Returns whether there's a max decor placement budget available and active for the current player, in the current house interior or plot

Returns:

- `hasMaxBudget`: bool

### C_HousingDecor.IsDecorSelected -- Returns true if a placed decor instance is currently selected

Returns:

- `hasSelectedDecor`: bool

### C_HousingDecor.IsGridVisible

Returns:

- `gridVisible`: bool

### C_HousingDecor.IsHouseExteriorDoorHovered -- Returns true if the entry door of the house's exterior is currently being hovered

Returns:

- `isHouseExteriorDoorHovered`: bool

### C_HousingDecor.IsHouseExteriorHovered -- Returns true if the house's exterior is currently being hovered

Returns:

- `isHouseExteriorHovered`: bool

### C_HousingDecor.IsHoveringDecor -- Returns true if a placed decor instance is currently being hovered

Returns:

- `isHoveringDecor`: bool

### C_HousingDecor.IsModeDisabledForPreviewState

SecretArguments=AllowedWhenUntainted

Arguments:

- `mode`: HouseEditorMode

Returns:

- `isModeDisabled`: bool

### C_HousingDecor.IsPreviewState

Returns:

- `isPreviewState`: bool

### C_HousingDecor.RemovePlacedDecorEntry -- Placed Decor List APIs currently restricted due to being potentially very expensive operations, may be reworked & opened up in the future

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `decorGUID`: WOWGUID

### C_HousingDecor.RemoveSelectedDecor -- Attempt to return the currently selected decor instance back to the house chest

### C_HousingDecor.SetGridVisible

SecretArguments=AllowedWhenUntainted

Arguments:

- `gridVisible`: bool

### C_HousingDecor.SetPlacedDecorEntryHovered -- Placed Decor List APIs currently restricted due to being potentially very expensive operations, may be reworked & opened up in the future

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `decorGUID`: WOWGUID
- `hovered`: bool

### C_HousingDecor.SetPlacedDecorEntrySelected -- Placed Decor List APIs currently restricted due to being potentially very expensive operations, may be reworked & opened up in the future

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `decorGUID`: WOWGUID
- `selected`: bool

## Events

### HOUSE_DECOR_ADDED_TO_CHEST

SynchronousEvent=true

Payload:

- `decorGUID`: WOWGUID
- `decorID`: number

### HOUSE_EXTERIOR_POSITION_FAILURE

SynchronousEvent=true

Payload:

- `housingResult`: HousingResult

### HOUSE_EXTERIOR_POSITION_SUCCESS

SynchronousEvent=true

### HOUSING_DECOR_GRID_VISIBILITY_STATUS_CHANGED

SynchronousEvent=true

Payload:

- `isGridVisible`: bool

### HOUSING_DECOR_PLACE_FAILURE

SynchronousEvent=true

Payload:

- `housingResult`: HousingResult

### HOUSING_DECOR_PLACE_SUCCESS

SynchronousEvent=true

Payload:

- `decorGUID`: WOWGUID
- `size`: HousingCatalogEntrySize
- `isNew`: bool -- Will be true if the decor is newly placed from storage, false if it was already placed and just moved
- `isPreview`: bool

### HOUSING_DECOR_PREVIEW_STATE_CHANGED

SynchronousEvent=true

Payload:

- `isPreviewState`: bool

### HOUSING_DECOR_REMOVED

SynchronousEvent=true

Payload:

- `decorGUID`: WOWGUID

### HOUSING_DECOR_SELECT_RESPONSE

SynchronousEvent=true

Payload:

- `result`: HousingResult

### HOUSING_NEW_DECOR_PLACE_COMPLETE

SynchronousEvent=true

Payload:

- `decorGUID`: WOWGUID

### HOUSING_NUM_DECOR_PLACED_CHANGED

SynchronousEvent=true

## Tables

### LightRadiusIndicatorType

MaxValue=2, MinValue=0, NumValues=3

Fields:

- `Always`: LightRadiusIndicatorType [= 0]
- `Overlap`: LightRadiusIndicatorType [= 1]
- `Never`: LightRadiusIndicatorType [= 2]

### HousingDecorInstanceListEntry -- Smaller structs with the minimum fields from HousingDecorInstanceInfo needed to identify/display a slim list of placed decor

Fields:

- `decorGUID`: WOWGUID
- `name`: cstring
