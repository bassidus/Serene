# GamePad

Namespace `C_GamePad`.

Environment=All, Predicates={}

## Functions

### C_GamePad.AddSDLMapping

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `platform`: ClientPlatformType
- `mapping`: cstring

Returns:

- `success`: bool

### C_GamePad.ApplyConfigs

HasRestrictions=true

### C_GamePad.AxisIndexToConfigName

SecretArguments=AllowedWhenUntainted

Arguments:

- `axisIndex`: number

Returns:

- `configName`: cstring?

### C_GamePad.ButtonBindingToIndex

SecretArguments=AllowedWhenUntainted

Arguments:

- `bindingName`: cstring

Returns:

- `buttonIndex`: number?

### C_GamePad.ButtonIndexToBinding

SecretArguments=AllowedWhenUntainted

Arguments:

- `buttonIndex`: number

Returns:

- `bindingName`: cstring?

### C_GamePad.ButtonIndexToConfigName

SecretArguments=AllowedWhenUntainted

Arguments:

- `buttonIndex`: number

Returns:

- `configName`: cstring?

### C_GamePad.ClearLedColor

### C_GamePad.DeleteConfig

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `configID`: GamePadConfigID

### C_GamePad.GetActiveDeviceID

Returns:

- `deviceID`: number

### C_GamePad.GetAllConfigIDs

Returns:

- `configIDs`: table<GamePadConfigID>

### C_GamePad.GetAllDeviceIDs

Returns:

- `deviceIDs`: table<number>

### C_GamePad.GetAllowHoverEventsWithFreeLook

Returns:

- `enabled`: bool

### C_GamePad.GetCombinedDeviceID

Returns:

- `deviceID`: number

### C_GamePad.GetConfig

SecretArguments=AllowedWhenUntainted

Arguments:

- `configID`: GamePadConfigID

Returns:

- `config`: GamePadConfig?

### C_GamePad.GetDeviceMappedState

SecretArguments=AllowedWhenUntainted

Arguments:

- `deviceID`: number?

Returns:

- `state`: GamePadMappedState?

### C_GamePad.GetDeviceRawState

SecretArguments=AllowedWhenUntainted

Arguments:

- `deviceID`: number

Returns:

- `rawState`: GamePadRawState?

### C_GamePad.GetLedColor

Returns:

- `color`: colorRGB (ColorMixin)

### C_GamePad.GetPowerLevel

SecretArguments=AllowedWhenUntainted

Arguments:

- `deviceID`: number?

Returns:

- `powerLevel`: GamePadPowerLevel

### C_GamePad.IsEnabled

Returns:

- `enabled`: bool

### C_GamePad.SetAllowHoverEventsWithFreeLook

SecretArguments=AllowedWhenUntainted

Arguments:

- `enable`: bool

### C_GamePad.SetConfig

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `config`: GamePadConfig

### C_GamePad.SetLedColor

SecretArguments=AllowedWhenUntainted

Arguments:

- `color`: colorRGB (ColorMixin)

### C_GamePad.SetVibration

SecretArguments=AllowedWhenUntainted

Arguments:

- `vibrationType`: cstring
- `intensity`: number

### C_GamePad.StickIndexToConfigName

SecretArguments=AllowedWhenUntainted

Arguments:

- `stickIndex`: number

Returns:

- `configName`: cstring?

### C_GamePad.StopVibration

## Events

### GAME_PAD_ACTIVE_CHANGED

SynchronousEvent=true

Payload:

- `isActive`: bool

### GAME_PAD_ALLOW_HOVER_EVENTS_WITH_FREE_LOOK_CHANGED

SynchronousEvent=true

Payload:

- `enabled`: bool

### GAME_PAD_CONFIGS_CHANGED

SynchronousEvent=true

### GAME_PAD_CONNECTED

SynchronousEvent=true

### GAME_PAD_DISCONNECTED

SynchronousEvent=true

### GAME_PAD_POWER_CHANGED

SynchronousEvent=true

Payload:

- `powerLevel`: GamePadPowerLevel

## Tables

### GamePadAxisConfig

Fields:

- `axis`: string
- `shift`: number?
- `scale`: number?
- `deadzone`: number?
- `buttonThreshold`: number?
- `buttonPos`: string?
- `buttonNeg`: string?
- `comment`: string?

### GamePadConfig

Fields:

- `comment`: string?
- `name`: string?
- `configID`: GamePadConfigID
- `labelStyle`: string?
- `rawButtonMappings`: table<GamePadRawButtonMapping>
- `rawAxisMappings`: table<GamePadRawAxisMapping>
- `axisConfigs`: table<GamePadAxisConfig>
- `stickConfigs`: table<GamePadStickConfig>

### GamePadConfigID

Fields:

- `vendorID`: number?
- `productID`: number?

### GamePadMappedState

Fields:

- `name`: string
- `labelStyle`: string
- `buttonCount`: number
- `axisCount`: number
- `stickCount`: number
- `buttons`: table<bool>
- `axes`: table<number>
- `sticks`: table<GamePadStick>

### GamePadRawAxisMapping

Fields:

- `rawIndex`: number
- `axis`: string?
- `comment`: string?

### GamePadRawButtonMapping

Fields:

- `rawIndex`: number
- `button`: string?
- `axis`: string?
- `axisValue`: number?
- `comment`: string?

### GamePadRawState

Fields:

- `name`: string
- `vendorID`: number
- `productID`: number
- `rawButtonCount`: number
- `rawAxisCount`: number
- `rawButtons`: table<bool>
- `rawAxes`: table<number>

### GamePadStick

Fields:

- `x`: number
- `y`: number
- `len`: number

### GamePadStickConfig

Fields:

- `stick`: string
- `axisX`: string?
- `axisY`: string?
- `deadzone`: number?
- `deadzoneX`: number?
- `deadzoneY`: number?
- `comment`: string?
