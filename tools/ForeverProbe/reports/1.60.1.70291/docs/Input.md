# Input

Environment=All, Predicates={1={Documentation={1=Requires that all mouse foci are not forbidden, hidden from the global environment, fully locked down, script inaccessible, or protected frames (while in combat)}, FailureMode=ReturnNothing, Name=MouseFocusValidForLimitedInput, Type=Precondition}, 2={FailureMode=Error, Name=RequiresLimitedInput, Type=Precondition}}

## Functions

### GetCursorDelta

Returns:

- `deltaX`: number
- `deltaY`: number

### GetCursorPosition

Returns:

- `posX`: number
- `posY`: number

### GetMouseButtonClicked

Returns:

- `buttonName`: cstring

### GetMouseButtonName

SecretArguments=AllowedWhenUntainted

Arguments:

- `button`: mouseButton

Returns:

- `buttonName`: cstring

### GetMouseFoci

Returns:

- `region`: table<ScriptRegion>

### GetStringFromModifiers

SecretArguments=AllowedWhenUntainted

Arguments:

- `modifiers`: number

Returns:

- `modifierString`: string

### IsAltKeyDown

Returns:

- `down`: bool

### IsControlKeyDown

Returns:

- `down`: bool

### IsKeyDown

SecretArguments=AllowedWhenUntainted

Arguments:

- `keyOrMouseName`: cstring
- `excludeBindingState`: bool [default=false]

Returns:

- `down`: bool?

### IsLeftAltKeyDown

Returns:

- `down`: bool

### IsLeftControlKeyDown

Returns:

- `down`: bool

### IsLeftMetaKeyDown

Returns:

- `down`: bool

### IsLeftShiftKeyDown

Returns:

- `down`: bool

### IsMetaKeyDown

Returns:

- `down`: bool

### IsModifierKeyDown

Returns:

- `down`: bool

### IsMouseButtonDown

SecretArguments=AllowedWhenUntainted

Arguments:

- `button`: mouseButton?

Returns:

- `down`: bool

### IsRightAltKeyDown

Returns:

- `down`: bool

### IsRightControlKeyDown

Returns:

- `down`: bool

### IsRightMetaKeyDown

Returns:

- `down`: bool

### IsRightShiftKeyDown

Returns:

- `down`: bool

### IsShiftKeyDown

Returns:

- `down`: bool

### IsUsingGamepad

Returns:

- `down`: bool

### IsUsingMouse

Returns:

- `down`: bool

### MakeModifiers

Returns:

- `modifiers`: number

### SetCursorPosition -- Insecure code can only call this once in response to gamepad input hardware events.

RequiresLimitedInput=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `xPosition`: uiUnit
- `yPosition`: uiUnit

### SimulateMouseClick -- Effectively the same as SimulateMouseDown plus SimulateMouseUp and consumes limited input for both.

MouseFocusValidForLimitedInput=true, RequiresLimitedInput=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `button`: mouseButton

### SimulateMouseDown -- Insecure code can only call this once in response to gamepad input hardware events.

MouseFocusValidForLimitedInput=true, RequiresLimitedInput=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `button`: mouseButton

### SimulateMouseUp -- Insecure code can only call this once in response to gamepad input hardware events.

MouseFocusValidForLimitedInput=true, RequiresLimitedInput=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `button`: mouseButton

### SimulateMouseWheel -- Insecure code can only call this once in response to gamepad input hardware events.

MouseFocusValidForLimitedInput=true, RequiresLimitedInput=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `delta`: number

## Events

### INPUT_DEVICE_INTERFACE_TRANSITION

SynchronousEvent=true

Payload:

- `newMode`: InputDeviceInterfaceType
- `oldMode`: InputDeviceInterfaceType
