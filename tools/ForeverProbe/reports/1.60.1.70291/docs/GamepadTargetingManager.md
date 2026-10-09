# GamepadTargetingManager

Namespace `C_GamepadTargeting`.

Environment=All, Predicates={}

## Functions

### C_GamepadTargeting.Disable

Returns:

- `targetAlreadySelected`: bool

### C_GamepadTargeting.Enable

### C_GamepadTargeting.HasReticleHoverTarget

Returns:

- `hasReticleHoverTarget`: bool

### C_GamepadTargeting.SetFilter

SecretArguments=AllowedWhenUntainted

Arguments:

- `filter`: GamepadTargetingFilters

## Tables

### GamepadTargetingFilters

MaxValue=2, MinValue=0, NumValues=3

Fields:

- `Hostile`: GamepadTargetingFilters [= 0]
- `Friendly`: GamepadTargetingFilters [= 1]
- `All`: GamepadTargetingFilters [= 2]
