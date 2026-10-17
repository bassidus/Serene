# LuaCurveObjectAPI

Environment=All, ObjectType=Userdata, Predicates={}

## Functions

### AddPoint -- Adds a single point to the curve.

SecretArguments=AllowedWhenUntainted

Arguments:

- `pointX`: number
- `pointY`: number

### ClearPoints -- Removes all points from the curve. Evaluating an empty curve always yields a zero value.

### Copy -- Returns a new copy of this curve.

ReturnsNeverSecret=true

Returns:

- `curve`: LuaCurveObject

### Evaluate -- Returns a calculated 'y' value from the configured curve points.

ConstSecretAccessor=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `x`: number

Returns:

- `y`: number

### GetPoint -- Returns the vector for an individual point index on the curve.

ConstSecretAccessor=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex

Returns:

- `point`: vector2 (Vector2DMixin)?

### GetPointCount -- Returns the total number of points on the curve.

Returns:

- `count`: size

### GetPoints -- Returns the vectors for all points on the curve.

Returns:

- `point`: table<vector2>

### RemovePoint -- Removes a single point from the curve. Raises an error if the supplied point index is out of range.

SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex

### SetPoints -- Replaces all points on the curve.

SecretArguments=AllowedWhenUntainted

Arguments:

- `point`: table<vector2>

### SetToDefaults -- Resets all state on the curve, and clears the secret values flag.
