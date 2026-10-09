# Title

Environment=All, Predicates={}

## Functions

### GetCurrentTitle

Returns:

- `result`: number

### GetNumTitles

Returns:

- `result`: number

### GetTitleName

SecretArguments=AllowedWhenUntainted

Arguments:

- `titleMaskID`: number

Returns:

- `titleString`: string
- `playerTitle`: bool

### IsTitleKnown

SecretArguments=AllowedWhenUntainted

Arguments:

- `titleMaskID`: number

Returns:

- `result`: bool

### SetCurrentTitle

SecretArguments=AllowedWhenUntainted

Arguments:

- `titleMaskID`: number
