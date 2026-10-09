# HousingExpertModeUI

Namespace `C_HousingExpertMode`.

Environment=All, Predicates={}

## Functions

### C_HousingExpertMode.CancelActiveEditing -- Cancels all in-progress editing of the selected target, which will reset any unsaved changes and deselect the active target; Will not reset any already-applied changes

### C_HousingExpertMode.CommitDecorMovement -- Attempt to save the changes made to the currently selected decor instance

### C_HousingExpertMode.CommitHouseExteriorPosition -- Attempt to save the changes made to the House Exterior's position within the plot

### C_HousingExpertMode.GetHoveredDecorInfo -- Returns info for the placed decor instance currently being hovered, if there is one

Returns:

- `info`: HousingDecorInstanceInfo?

### C_HousingExpertMode.GetPrecisionSubmode -- Returns the currently active Expert submode, if there is one

Returns:

- `activeSubMode`: HousingPrecisionSubmode?

### C_HousingExpertMode.GetPrecisionSubmodeRestriction -- Returns the type of restriction currently active on the submode; Will return HousingExpertSubmodeRestriction:None if submode is not currently restricted

SecretArguments=AllowedWhenUntainted

Arguments:

- `subMode`: HousingPrecisionSubmode

Returns:

- `restriction`: HousingExpertSubmodeRestriction

### C_HousingExpertMode.GetSelectedDecorInfo -- Returns info for the placed decor instance that's currently selected, if there is one

Returns:

- `info`: HousingDecorInstanceInfo?

### C_HousingExpertMode.IsDecorSelected -- Returns true if a placed decor instance is currently selected

Returns:

- `hasSelectedDecor`: bool

### C_HousingExpertMode.IsGridVisible

Returns:

- `gridVisible`: bool

### C_HousingExpertMode.IsHouseExteriorHovered -- Returns true if the house's exterior is currently being hovered

Returns:

- `isHouseExteriorHovered`: bool

### C_HousingExpertMode.IsHouseExteriorSelected -- Returns true if the house's exterior is currently selected

Returns:

- `isHouseExteriorSelected`: bool

### C_HousingExpertMode.IsHoveringDecor -- Returns true if a placed decor instance is currently being hovered

Returns:

- `isHoveringDecor`: bool

### C_HousingExpertMode.RemoveSelectedDecor -- Attempt to return the currently selected decor instance back to the house chest

### C_HousingExpertMode.ResetPrecisionChanges -- Reset the selected target's transform back to default values; This is NOT an undo, meaning it will completely reset the transform value to default, NOT just recently-made changes

SecretArguments=AllowedWhenUntainted

Arguments:

- `activeSubmodeOnly`: bool -- If true, only transform values associated with the currently active submode with be reset (ex: in Scale submode, only target's scale will be reset); If false, all transform values will be reset

### C_HousingExpertMode.SelectNextRotationAxis -- In the rotation submode, swaps the selected axis to the next available one, in order of X -> Y -> Z (wrapping back around to X again, etc); If no axis is selected, selects the first available one, also in that order

### C_HousingExpertMode.SetGridVisible

SecretArguments=AllowedWhenUntainted

Arguments:

- `gridVisible`: bool

### C_HousingExpertMode.SetPrecisionIncrementingActive -- Sets a specific type of incremental change active or inactive; Whilever that type is active and target stays selected, incremental changes of that type will continue to be made every frame

SecretArguments=AllowedWhenUntainted

Arguments:

- `incrementType`: HousingIncrementType
- `active`: bool

### C_HousingExpertMode.SetPrecisionSubmode -- Activate a specific Expert submode

SecretArguments=AllowedWhenUntainted

Arguments:

- `subMode`: HousingPrecisionSubmode

## Events

### HOUSING_DECOR_PRECISION_MANIPULATION_EVENT

SynchronousEvent=true

Payload:

- `event`: TransformManipulatorEvent

### HOUSING_DECOR_PRECISION_MANIPULATION_STATUS_CHANGED

SynchronousEvent=true

Payload:

- `isManipulatingSelection`: bool

### HOUSING_DECOR_PRECISION_SUBMODE_CHANGED

SynchronousEvent=true

Payload:

- `activeSubmode`: HousingPrecisionSubmode?

### HOUSING_EXPERT_MODE_HOVERED_TARGET_CHANGED

SynchronousEvent=true

Payload:

- `hasHoveredTarget`: bool
- `targetType`: HousingExpertModeTargetType

### HOUSING_EXPERT_MODE_PLACEMENT_FLAGS_UPDATED

SynchronousEvent=true

Payload:

- `targetType`: HousingExpertModeTargetType
- `activeFlags`: HousingDecorPlacementRestriction

### HOUSING_EXPERT_MODE_SELECTED_TARGET_CHANGED

SynchronousEvent=true

Payload:

- `hasSelectedTarget`: bool
- `targetType`: HousingExpertModeTargetType

## Tables

### HousingExpertModeTargetType

MaxValue=2, MinValue=0, NumValues=3

Fields:

- `None`: HousingExpertModeTargetType [= 0]
- `Decor`: HousingExpertModeTargetType [= 1]
- `House`: HousingExpertModeTargetType [= 2]

### HousingExpertSubmodeRestriction

MaxValue=3, MinValue=0, NumValues=4

Fields:

- `None`: HousingExpertSubmodeRestriction [= 0]
- `NotInExpertMode`: HousingExpertSubmodeRestriction [= 1]
- `NoHouseExteriorScale`: HousingExpertSubmodeRestriction [= 2]
- `NoWMOScale`: HousingExpertSubmodeRestriction [= 3]

### HousingIncrementType

MaxValue=512, MinValue=1, NumValues=10

Fields:

- `Left`: HousingIncrementType [= 1]
- `Right`: HousingIncrementType [= 2]
- `Forward`: HousingIncrementType [= 4]
- `Back`: HousingIncrementType [= 8]
- `Up`: HousingIncrementType [= 16]
- `Down`: HousingIncrementType [= 32]
- `RotateLeft`: HousingIncrementType [= 64]
- `RotateRight`: HousingIncrementType [= 128]
- `ScaleUp`: HousingIncrementType [= 256]
- `ScaleDown`: HousingIncrementType [= 512]

### HousingPrecisionSubmode

MaxValue=2, MinValue=0, NumValues=3

Fields:

- `Translate`: HousingPrecisionSubmode [= 0]
- `Rotate`: HousingPrecisionSubmode [= 1]
- `Scale`: HousingPrecisionSubmode [= 2]
