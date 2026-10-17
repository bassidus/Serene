# AutoComplete

Namespace `C_AutoComplete`.

Environment=All, Predicates={}

## Functions

### C_AutoComplete.GetAutoCompletePresenceID

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: cstring

Returns:

- `presenceID`: number?

### C_AutoComplete.GetAutoCompleteRealms

Returns:

- `realms`: table<string>

### C_AutoComplete.GetAutoCompleteResults

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: cstring
- `numResults`: number
- `cursorPosition`: number
- `allowFullMatch`: bool
- `includeFlags`: number
- `excludeFlags`: number

Returns:

- `results`: table<AutoCompleteResult>

### C_AutoComplete.IsRecognizedName

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: cstring
- `includeFlags`: number
- `excludeFlags`: number

Returns:

- `isRecognizedName`: bool

## Tables

### AutoCompleteResult

Fields:

- `name`: string
- `priority`: AutoCompletePriority
- `bnetID`: number
