# SimpleOffScreenFrameAPI

Environment=All, Predicates={}

## Functions

### ApplySnapshot

SecretArguments=AllowedWhenUntainted

Arguments:

- `texture`: SimpleTexture
- `snapshotID`: number

Returns:

- `success`: bool

### Flush

### GetMaxSnapshots

Returns:

- `maxSnapshots`: number

### IsSnapshotValid

SecretArguments=AllowedWhenUntainted

Arguments:

- `snapshotID`: number

Returns:

- `isValid`: bool

### SetMaxSnapshots

SecretArguments=AllowedWhenUntainted

Arguments:

- `maxSnapshots`: number

### TakeSnapshot

Returns:

- `snapshotID`: number?

### TestPrintToFile -- Unavailable in public builds

SecretArguments=AllowedWhenUntainted

Arguments:

- `snapshotID`: number
- `filename`: cstring

Returns:

- `success`: bool

### UsesNPOT

Returns:

- `usesNPOT`: bool?
