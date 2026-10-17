# SimpleAnimPathAPI

Environment=All, Predicates={}

## Functions

### CreateControlPoint

SecretArguments=NotAllowed

Arguments:

- `name`: cstring?
- `templateName`: cstring?
- `order`: number?

Returns:

- `point`: SimpleControlPoint

### GetControlPoints

Returns:

- `points`: SimpleControlPoint [StrideIndex=1]

### GetCurveType

Returns:

- `curveType`: CurveType

### GetMaxControlPointOrder

Returns:

- `maxOrder`: number

### SetCurveType

SecretArguments=AllowedWhenUntainted

Arguments:

- `curveType`: CurveType
