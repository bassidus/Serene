# DurationTextBindingObjectAPI

Environment=All, ObjectType=Userdata, Predicates={}

## Functions

### Assign -- Copies another duration text binding and assigns it to this one.

SecretArguments=AllowedWhenUntainted

Arguments:

- `other`: DurationTextBinding

### CanFormatText -- Returns true if this binding has enough configuration to produce formatted text.

Returns:

- `canFormatText`: bool

### CanUpdateFontString -- Returns true if this binding has enough configuration to update its font string with formatted text.

Returns:

- `canUpdateText`: bool

### ClearTextColorCurve -- Clears the text color curve used by this binding.

### Copy -- Returns a copy of this duration text binding.

ReturnsNeverSecret=true

Returns:

- `copy`: DurationTextBinding

### Disable -- Disables automatic updates for this duration text binding.

### Enable -- Enables automatic updates for this duration text binding.

### GetDuration -- Returns the duration object used by this duration text binding.

Returns:

- `duration`: LuaDurationObject?

### GetExpiredText -- Returns the text shown when the duration has fully expired.

Returns:

- `text`: string?

### GetFontString -- Returns the font string updated by this duration text binding.

Returns:

- `fontString`: SimpleFontString?

### GetFormattedText -- Returns the text that would currently be assigned to the configured font string.

Returns:

- `text`: string [ConditionalSecret=true]

### GetFormattedTextColor -- Returns the text color that would currently be assigned to the configured font string.

MayReturnNothing=true

Returns:

- `color`: colorRGBA (ColorMixin) [ConditionalSecret=true]

### GetTextColorCurve -- Returns the text color curve used by this binding.

MayReturnNothing=true

Returns:

- `curve`: LuaColorCurveObject
- `property`: DurationTextBindingProperty

### GetTimeModifier -- Returns the time modifier used when sampling duration values for this binding.

Returns:

- `modifier`: DurationTimeModifier

### GetUpdateInterval -- Returns the minimum number of seconds between automatic text updates. A value of zero updates every game tick.

Returns:

- `updateInterval`: number

### GetZeroDurationText -- Returns the text shown when the duration is not configured, or represents a zero-duration time span.

Returns:

- `text`: string?

### HasSecretValues -- Returns true if the duration text binding has been configured with any secret values.

ReturnsNeverSecret=true

Returns:

- `hasSecretValues`: bool

### IsEnabled -- Returns true if this duration text binding updates its font string automatically.

Returns:

- `enabled`: bool

### SetDuration -- Configures the duration object used by this duration text binding.

SecretArguments=AllowedWhenUntainted

Arguments:

- `duration`: LuaDurationObject

### SetEnabled -- Configures whether this duration text binding updates its font string automatically.

SecretArguments=AllowedWhenUntainted

Arguments:

- `enabled`: bool

### SetExpiredText -- Configures the text shown when the duration has fully expired.

SecretArguments=AllowedWhenUntainted

Arguments:

- `text`: string?

### SetFontString -- Configures the font string updated by this duration text binding.

SecretArguments=AllowedWhenUntainted

Arguments:

- `fontString`: SimpleFontString

### SetFormatter -- Configures the text format used by this duration text binding to display the remaining duration using the supplied formatter.

SecretArguments=AllowedWhenUntainted

Arguments:

- `formatter`: NumericFormatter

### SetTextColorCurve -- Configures this duration text binding to adjust fontstring text color by evaluating a duration property through a curve.

SecretArguments=AllowedWhenUntainted

Arguments:

- `curve`: LuaColorCurveObject
- `property`: DurationTextBindingProperty

### SetTextFormat -- Configures the text format used by this duration text binding. The format string may contain '{}' placeholders, each of which is substituted by the corresponding component in the supplied array.

SecretArguments=AllowedWhenUntainted

Arguments:

- `formatString`: stringView
- `components`: table<DurationTextBindingFormatComponent>

### SetTimeModifier -- Configures the time modifier used when sampling duration values for this binding.

SecretArguments=AllowedWhenUntainted

Arguments:

- `modifier`: DurationTimeModifier

### SetToDefaults -- Resets this duration text binding to its default state, clearing the configured font string, duration, format, formatter, and fallback text.

### SetUpdateInterval -- Configures the minimum number of seconds between automatic text updates. A value of zero updates every game tick.

SecretArguments=AllowedWhenUntainted

Arguments:

- `updateInterval`: number

### SetZeroDurationText -- Configures the text shown when the duration is not configured, or represents a zero-duration time span.

SecretArguments=AllowedWhenUntainted

Arguments:

- `text`: string?

### UpdateFontString -- Immediately updates the configured font string from the current duration state.
