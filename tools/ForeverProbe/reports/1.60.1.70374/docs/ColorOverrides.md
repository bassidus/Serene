# ColorOverrides

Namespace `C_ColorOverrides`.

Environment=All, Predicates={}

## Functions

### C_ColorOverrides.ClearColorOverrides

### C_ColorOverrides.GetColorForQuality

SecretArguments=AllowedWhenUntainted

Arguments:

- `quality`: ItemQuality

Returns:

- `color`: colorRGBA (ColorMixin)

### C_ColorOverrides.GetColorOverrideInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `overrideType`: ColorOverride

Returns:

- `overrideInfo`: ColorOverrideInfo?

### C_ColorOverrides.GetDefaultColorForQuality

SecretArguments=AllowedWhenUntainted

Arguments:

- `quality`: ItemQuality

Returns:

- `color`: colorRGBA (ColorMixin)

### C_ColorOverrides.RemoveColorOverride

SecretArguments=AllowedWhenUntainted

Arguments:

- `overrideType`: ColorOverride

### C_ColorOverrides.SetColorOverride

SecretArguments=AllowedWhenUntainted

Arguments:

- `overrideType`: ColorOverride
- `color`: colorRGBA (ColorMixin)

## Events

### COLOR_OVERRIDE_UPDATED

SynchronousEvent=true

Payload:

- `overrideType`: ColorOverride

### COLOR_OVERRIDES_RESET

SynchronousEvent=true

## Tables

### ColorOverrideInfo

Fields:

- `overrideType`: ColorOverride
- `overrideColor`: colorRGB (ColorMixin)
- `overrideColorString`: string
