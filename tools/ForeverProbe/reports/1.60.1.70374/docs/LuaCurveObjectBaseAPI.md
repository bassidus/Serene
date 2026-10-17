# LuaCurveObjectBaseAPI

Environment=All, ObjectType=Userdata, Predicates={}

## Functions

### GetType -- Returns the configured type of the curve.

Returns:

- `curveType`: LuaCurveType

### HasSecretValues -- Returns true if the curve has been configured with any secret values. Curves with secret values always produce secret results when evaluated.

ReturnsNeverSecret=true

Returns:

- `hasSecretValues`: bool

### SetType -- Changes the evaluation type of the curve.

SecretArguments=AllowedWhenUntainted

Arguments:

- `type`: LuaCurveType
