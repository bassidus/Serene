# HousingCleanupModeUI

Namespace `C_HousingCleanupMode`.

Environment=All, Predicates={}

## Functions

### C_HousingCleanupMode.GetHoveredDecorInfo

Returns:

- `info`: HousingDecorInstanceInfo?

### C_HousingCleanupMode.IsHoveringDecor

Returns:

- `isHoveringDecor`: bool

### C_HousingCleanupMode.RemoveSelectedDecor

## Events

### HOUSING_CLEANUP_MODE_HOVERED_TARGET_CHANGED

SynchronousEvent=true

Payload:

- `hasHoveredTarget`: bool
- `targetType`: HousingCleanupModeTargetType

### HOUSING_CLEANUP_MODE_TARGET_SELECTED

SynchronousEvent=true

## Tables

### HousingCleanupModeTargetType

MaxValue=2, MinValue=0, NumValues=3

Fields:

- `None`: HousingCleanupModeTargetType [= 0]
- `Decor`: HousingCleanupModeTargetType [= 1]
- `HouseExterior`: HousingCleanupModeTargetType [= 2]
