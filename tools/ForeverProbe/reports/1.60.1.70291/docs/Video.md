# Video

Namespace `C_VideoOptions`.

Environment=All, Predicates={}

## Functions

### C_VideoOptions.AreHighResTexturesAvailable

Returns:

- `areAvailable`: bool

### C_VideoOptions.GetCurrentGameWindowSize

Returns:

- `size`: vector2 (Vector2DMixin)

### C_VideoOptions.GetDefaultGameWindowSize

SecretArguments=AllowedWhenUntainted

Arguments:

- `monitor`: number

Returns:

- `size`: vector2 (Vector2DMixin)

### C_VideoOptions.GetGameWindowSizes

SecretArguments=AllowedWhenUntainted

Arguments:

- `monitor`: number
- `fullscreen`: bool

Returns:

- `sizes`: table<vector2>

### C_VideoOptions.GetGxAdapterInfo

Returns:

- `adapters`: table<GxAdapterInfoDetails>

### C_VideoOptions.IsLinearEnabledOnStart

Returns:

- `isEnabled`: bool

### C_VideoOptions.IsOutlineModeSupported

Returns:

- `isSupported`: bool

### C_VideoOptions.IsPBRWaterSupported

Returns:

- `isSupported`: bool

### C_VideoOptions.IsSecondaryLightingSupported

Returns:

- `isSupported`: bool

### C_VideoOptions.IsSpellVisualDensitySystemSupported

Returns:

- `isSupported`: bool

### C_VideoOptions.SetGameWindowSize

SecretArguments=AllowedWhenUntainted

Arguments:

- `x`: number
- `y`: number

## Events

### ADAPTER_LIST_CHANGED

SynchronousEvent=true

### DISPLAY_SIZE_CHANGED

SynchronousEvent=true

### GLUE_SCREENSHOT_FAILED

SynchronousEvent=true

### GLUE_SCREENSHOT_STARTED

SynchronousEvent=true

### GLUE_SCREENSHOT_SUCCEEDED

SynchronousEvent=true

### GX_RESTARTED

SynchronousEvent=true

### SCREENSHOT_FAILED

SynchronousEvent=true

### SCREENSHOT_STARTED

SynchronousEvent=true

### SCREENSHOT_SUCCEEDED

SynchronousEvent=true

## Tables

### GraphicsValidationResult

MaxValue=42, MinValue=0, NumValues=43

Fields:

- `Supported`: GraphicsValidationResult [= 0]
- `Illegal`: GraphicsValidationResult [= 1]
- `Unsupported`: GraphicsValidationResult [= 2]
- `Graphics`: GraphicsValidationResult [= 3]
- `DualCore`: GraphicsValidationResult [= 4]
- `QuadCore`: GraphicsValidationResult [= 5]
- `CpuMem_2`: GraphicsValidationResult [= 6]
- `CpuMem_4`: GraphicsValidationResult [= 7]
- `CpuMem_8`: GraphicsValidationResult [= 8]
- `Needs_5_0`: GraphicsValidationResult [= 9]
- `Needs_6_0`: GraphicsValidationResult [= 10]
- `NeedsRt`: GraphicsValidationResult [= 11]
- `NeedsDx12`: GraphicsValidationResult [= 12]
- `NeedsDx12Vrs2`: GraphicsValidationResult [= 13]
- `NeedsAppleGpu`: GraphicsValidationResult [= 14]
- `NeedsAmdGpu`: GraphicsValidationResult [= 15]
- `NeedsIntelGpu`: GraphicsValidationResult [= 16]
- `NeedsNvidiaGpu`: GraphicsValidationResult [= 17]
- `NeedsQualcommGpu`: GraphicsValidationResult [= 18]
- `NeedsMacOs_10_13`: GraphicsValidationResult [= 19]
- `NeedsMacOs_10_14`: GraphicsValidationResult [= 20]
- `NeedsMacOs_10_15`: GraphicsValidationResult [= 21]
- `NeedsMacOs_11_0`: GraphicsValidationResult [= 22]
- `NeedsMacOs_12_0`: GraphicsValidationResult [= 23]
- `NeedsMacOs_13_0`: GraphicsValidationResult [= 24]
- `NeedsWindows_10`: GraphicsValidationResult [= 25]
- `NeedsWindows_11`: GraphicsValidationResult [= 26]
- `MacOsUnsupported`: GraphicsValidationResult [= 27]
- `WindowsUnsupported`: GraphicsValidationResult [= 28]
- `LegacyUnsupported`: GraphicsValidationResult [= 29]
- `Dx11Unsupported`: GraphicsValidationResult [= 30]
- `Dx12Win7Unsupported`: GraphicsValidationResult [= 31]
- `RemoteDesktopUnsupported`: GraphicsValidationResult [= 32]
- `WineUnsupported`: GraphicsValidationResult [= 33]
- `NvapiWineUnsupported`: GraphicsValidationResult [= 34]
- `AppleGpuUnsupported`: GraphicsValidationResult [= 35]
- `AmdGpuUnsupported`: GraphicsValidationResult [= 36]
- `IntelGpuUnsupported`: GraphicsValidationResult [= 37]
- `NvidiaGpuUnsupported`: GraphicsValidationResult [= 38]
- `QualcommGpuUnsupported`: GraphicsValidationResult [= 39]
- `GpuDriver`: GraphicsValidationResult [= 40]
- `CompatMode`: GraphicsValidationResult [= 41]
- `Unknown`: GraphicsValidationResult [= 42]

### GxAdapterInfoDetails

Fields:

- `name`: string
- `isLowPower`: bool
- `isExternal`: bool
