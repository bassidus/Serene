# ToyBoxInfo

Namespace `C_ToyBoxInfo`.

Environment=All, Predicates={}

## Functions

### C_ToyBoxInfo.ClearFanfare

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemID`: number

### C_ToyBoxInfo.HasAnyToy

Returns:

- `hasToy`: bool

### C_ToyBoxInfo.IsToySourceValid

SecretArguments=AllowedWhenUntainted

Arguments:

- `source`: luaIndex

Returns:

- `isToySourceValid`: bool

### C_ToyBoxInfo.IsUsingDefaultFilters

Returns:

- `isUsingDefaultFilters`: bool

### C_ToyBoxInfo.NeedsFanfare

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemID`: number

Returns:

- `needsFanfare`: bool

### C_ToyBoxInfo.SetDefaultFilters

## Events

### NEW_TOY_ADDED

SynchronousEvent=true

Payload:

- `itemID`: number

### TOYS_UPDATED

SynchronousEvent=true, UniqueEvent=true

Payload:

- `itemID`: number?
- `isNew`: bool?
- `hasFanfare`: bool?
