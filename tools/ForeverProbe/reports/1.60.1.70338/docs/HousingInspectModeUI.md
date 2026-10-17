# HousingInspectModeUI

Namespace `C_HousingInspectMode`.

Environment=All, Predicates={}

## Functions

### C_HousingInspectMode.EnterInspectMode -- Enters inspect mode, enabling decor inspection

### C_HousingInspectMode.ExitInspectMode -- Exits inspect mode, disabling decor inspection

### C_HousingInspectMode.GetHoveredDecorGUID -- Returns the GUID of the decor instance currently being hovered, if there is one

Returns:

- `decorGUID`: WOWGUID

### C_HousingInspectMode.IsHoveringDecor -- Returns true if a decor instance is currently being hovered in inspect mode

Returns:

- `isHoveringDecor`: bool

### C_HousingInspectMode.IsInInspectMode -- Returns true if the player is currently in inspect mode

Returns:

- `isInInspectMode`: bool

## Events

### HOUSING_INSPECT_MODE_DECOR_HOVERED_CHANGED

SynchronousEvent=true

### HOUSING_INSPECT_MODE_STATE_UPDATED

SynchronousEvent=true
