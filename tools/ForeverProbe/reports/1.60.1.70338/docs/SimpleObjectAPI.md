# SimpleObjectAPI

Environment=All, Predicates={}

## Functions

### ClearParentKey

### GetDebugName

ConstSecretAccessor=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `preferParentKey`: bool [default=false]

Returns:

- `debugName`: string

### GetParent

SecretReturnsForAspect={1=1}

Returns:

- `parent`: CScriptObject

### GetParentKey

Returns:

- `parentKey`: cstring

### SetParentKey

SecretArguments=AllowedWhenUntainted

Arguments:

- `parentKey`: cstring
- `clearOtherKeys`: bool [default=false]
