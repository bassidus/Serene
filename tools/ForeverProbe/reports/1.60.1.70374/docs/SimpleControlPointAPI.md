# SimpleControlPointAPI

Environment=All, Predicates={}

## Functions

### GetOffset

Returns:

- `offsetX`: uiUnit
- `offsetY`: uiUnit

### GetOrder

Returns:

- `order`: number

### SetOffset

SecretArguments=AllowedWhenUntainted

Arguments:

- `offsetX`: uiUnit
- `offsetY`: uiUnit

### SetOrder

SecretArguments=AllowedWhenUntainted

Arguments:

- `order`: number

### SetParent

CheckAllowChangeParent=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `parent`: SimplePathAnim
- `order`: number?
