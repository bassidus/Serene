# Build

Environment=All, Predicates={}

## Functions

### GetBuildInfo

Returns:

- `buildVersion`: cstring
- `buildNumber`: cstring
- `buildDate`: cstring
- `interfaceVersion`: number
- `localizedVersion`: cstring
- `buildInfo`: string

### GetBuildOption

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: cstring

Returns:

- `isSet`: bool?

### Is64BitClient

Returns:

- `is64Bit`: bool

### IsBetaBuild

Returns:

- `isBetaBuild`: bool

### IsDebugBuild

Returns:

- `isDebugBuild`: bool

### IsLinuxClient

Returns:

- `isLinux`: bool

### IsMacClient

Returns:

- `isMac`: bool

### IsPublicBuild

Returns:

- `isPublicBuild`: bool

### IsPublicTestClient -- Reflects the state of the OnlyBetaAndPTR TOC directive

Returns:

- `isPublicTestClient`: bool

### IsTestBuild

Returns:

- `isTestBuild`: bool

### IsWindowsClient

Returns:

- `isWindows`: bool

### SupportsClipCursor

Returns:

- `supportsClipCursor`: bool
