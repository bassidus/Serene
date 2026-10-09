# Client

Environment=All, Predicates={}

## Functions

### FlashClientIcon

SecretArguments=AllowedWhenUntainted

Arguments:

- `briefly`: bool [default=false]

### GetBillingTimeRested

Returns:

- `billingTimeRested`: number

### GetFileIDFromPath

SecretArguments=AllowedWhenUntainted

Arguments:

- `filePath`: cstring

Returns:

- `fileID`: fileID

### GetFramerate

Returns:

- `framerate`: number

### IsCpuBound

Returns:

- `isCpuBound`: bool?

### PlatformIsHandheld

Returns:

- `isHandheld`: bool

### ReportBug

SecretArguments=AllowedWhenUntainted

Arguments:

- `description`: cstring

### ReportSuggestion

SecretArguments=AllowedWhenUntainted

Arguments:

- `description`: cstring

### RestartGx

### Screenshot

### UIReload

### UpdateWindow
