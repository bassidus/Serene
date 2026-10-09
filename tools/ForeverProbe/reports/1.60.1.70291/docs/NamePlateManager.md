# NamePlateManager

Namespace `C_NamePlateManager`.

Environment=All, Predicates={}

## Functions

### C_NamePlateManager.GetNamePlateHitTestInsets -- Returns the values used to adjust the hit testing area for nameplates.

SecretArguments=AllowedWhenUntainted

Arguments:

- `type`: NamePlateType

Returns:

- `left`: uiUnit
- `right`: uiUnit
- `top`: uiUnit
- `bottom`: uiUnit

### C_NamePlateManager.IsNamePlateUnitBehindCamera -- Returns whether the unit to which the nameplate is attached is behind the player's camera.

SecretArguments=AllowedWhenUntainted

Arguments:

- `unitToken`: UnitTokenNamePlate

Returns:

- `isBehindCamera`: bool

### C_NamePlateManager.SetNamePlateHitTestInsets -- Provide values to adjust the hit testing area for nameplates. Positive values will decrease the hit test area, negative values will increase it. Note that all hit testing is clamped to the bounds of the nameplate and can not be moved outside it.

HasRestrictions=true, SecretArguments=NotAllowed

Arguments:

- `type`: NamePlateType
- `left`: uiUnit
- `right`: uiUnit
- `top`: uiUnit
- `bottom`: uiUnit

### C_NamePlateManager.SetNamePlateSimplified -- Set whether the nameplate attached to a unit is considered simplified, which can change the way it's displayed.

SecretArguments=AllowedWhenUntainted

Arguments:

- `unitToken`: UnitTokenNamePlate
- `isSimplified`: bool

## Events

### FORBIDDEN_NAME_PLATE_CREATED

SynchronousEvent=true

Payload:

- `namePlateFrame`: NamePlateFrame

### FORBIDDEN_NAME_PLATE_UNIT_ADDED

SynchronousEvent=true

Payload:

- `unitToken`: UnitTokenType

### FORBIDDEN_NAME_PLATE_UNIT_REMOVED

SynchronousEvent=true

Payload:

- `unitToken`: UnitTokenType

### NAME_PLATE_CREATED

SynchronousEvent=true

Payload:

- `namePlateFrame`: NamePlateFrame

### NAME_PLATE_UNIT_ADDED

SynchronousEvent=true

Payload:

- `unitToken`: UnitTokenType

### NAME_PLATE_UNIT_BEHIND_CAMERA_CHANGED

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant
- `isBehindCamera`: bool

### NAME_PLATE_UNIT_REMOVED

SynchronousEvent=true

Payload:

- `unitToken`: UnitTokenType
