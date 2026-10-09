# LuaColorCurveObjectAPI

Environment=All, ObjectType=Userdata, Predicates={}

## Functions

### AddPoint -- Adds a single point to the curve.

SecretArguments=AllowedWhenUntainted

Arguments:

- `x`: number
- `y`: colorRGBA (ColorMixin)

### ClearPoints -- Removes all points from the curve. Evaluating an empty curve always yields a zero value.

### Copy -- Returns a new copy of this curve.

ReturnsNeverSecret=true

Returns:

- `curve`: LuaColorCurveObject

### Evaluate -- Returns a calculated color value from the configured curve points.

ConstSecretAccessor=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `x`: number

Returns:

- `y`: colorRGBA (ColorMixin)

### EvaluateUnpacked -- Returns an unpacked calculated color value from the configured curve points.

ConstSecretAccessor=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `x`: number

Returns:

- `yR`: number
- `yG`: number
- `yB`: number
- `yA`: number

### GetPoint -- Returns the vector for an individual point index on the curve.

ConstSecretAccessor=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex

Returns:

- `point`: LuaColorCurvePoint?

### GetPointCount -- Returns the total number of points on the curve.

Returns:

- `count`: size

### GetPoints -- Returns the vectors for all points on the curve.

Returns:

- `point`: table<LuaColorCurvePoint>

### RemovePoint -- Removes a single point from the curve. Raises an error if the supplied point index is out of range.

SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex

### SetPoints -- Replaces all points on the curve.

SecretArguments=AllowedWhenUntainted

Arguments:

- `point`: table<LuaColorCurvePoint>

### SetToDefaults -- Resets all state on the curve, and clears the secret values flag.

## Tables

### LuaColorCurvePoint

Fields:

- `x`: number
- `y`: colorRGBA (ColorMixin)
