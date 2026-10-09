# NamePlate

Namespace `C_NamePlate`.

Environment=All, Predicates={}

## Functions

### C_NamePlate.GetNamePlateForUnit

SecretArguments=AllowedWhenUntainted

Arguments:

- `unitToken`: UnitTokenNamePlate
- `includeForbidden`: bool [default=false]

Returns:

- `nameplate`: NamePlateFrame

### C_NamePlate.GetNamePlateSize

Returns:

- `width`: uiUnit
- `height`: uiUnit

### C_NamePlate.GetNamePlates

Returns:

- `nameplates`: table<NamePlateFrame>

### C_NamePlate.SetNamePlateSize

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `width`: uiUnit
- `height`: uiUnit
