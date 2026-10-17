# CurveUtil

Namespace `C_CurveUtil`.

Environment=All, Predicates={}

## Functions

### C_CurveUtil.CreateColorCurve -- Returns a new color curve object with no assigned points.

Returns:

- `curve`: LuaColorCurveObject

### C_CurveUtil.CreateCurve -- Returns a new curve object with no assigned points.

Returns:

- `curve`: LuaCurveObject

### C_CurveUtil.EvaluateColorFromBoolean -- Evaluates a potentially-secret boolean value and returns a color.

SecretArguments=AllowedWhenTainted

Arguments:

- `boolean`: bool
- `valueIfTrue`: colorRGBA (ColorMixin)
- `valueIfFalse`: colorRGBA (ColorMixin)

Returns:

- `value`: colorRGBA (ColorMixin)

### C_CurveUtil.EvaluateColorValueFromBoolean -- Evaluates a potentially-secret boolean value and returns a single color component (eg. alpha).

SecretArguments=AllowedWhenTainted

Arguments:

- `boolean`: bool
- `valueIfTrue`: SingleColorValue
- `valueIfFalse`: SingleColorValue

Returns:

- `value`: SingleColorValue

### C_CurveUtil.EvaluateGameCurve

SecretArguments=AllowedWhenUntainted

Arguments:

- `curveID`: number
- `x`: number

Returns:

- `y`: number
