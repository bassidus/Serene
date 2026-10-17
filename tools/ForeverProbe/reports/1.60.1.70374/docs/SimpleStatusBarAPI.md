# SimpleStatusBarAPI

Environment=All, Predicates={}

## Functions

### GetFillStyle

Returns:

- `fillStyle`: StatusBarFillStyle

### GetInterpolatedValue -- Returns the current interpolated value displayed by the bar.

SecretReturnsForAspect={1=16384}

Returns:

- `value`: number

### GetMinMaxValues

SecretReturnsForAspect={1=16384}

Returns:

- `minValue`: number
- `maxValue`: number

### GetOrientation

Returns:

- `orientation`: Orientation

### GetRenderMode

Returns:

- `renderMode`: StatusBarRenderMode

### GetReverseFill

Returns:

- `isReverseFill`: bool

### GetRotatesTexture

Returns:

- `rotatesTexture`: bool

### GetStatusBarColor

SecretReturnsForAspect={1=2048, 2=128}

Returns:

- `colorR`: number
- `colorG`: number
- `colorB`: number
- `colorA`: number

### GetStatusBarDesaturation

SecretReturnsForAspect={1=4096}

Returns:

- `desaturation`: normalizedValue

### GetStatusBarTexture

Returns:

- `texture`: SimpleTexture

### GetTimerDuration

Returns:

- `duration`: LuaDurationObject

### GetValue

SecretReturnsForAspect={1=16384}

Returns:

- `value`: number

### IsInterpolating -- Returns true if the status bar is currently interpolating toward a target value.

SecretReturnsForAspect={1=16384}

Returns:

- `isInterpolating`: bool

### IsStatusBarDesaturated

RequiresStatusBarDesaturationAccess=true, SecretReturnsForAspect={1=4096}

Returns:

- `desaturated`: bool

### SetColorFill

SecretArguments=AllowedWhenUntainted

Arguments:

- `colorR`: number
- `colorG`: number
- `colorB`: number
- `a`: SingleColorValue?

### SetFillStyle

SecretArguments=AllowedWhenUntainted

Arguments:

- `fillStyle`: StatusBarFillStyle

### SetMinMaxValues

SecretArguments=AllowedWhenTainted, SecretArgumentsAddAspect={1=16384}

Arguments:

- `minValue`: number
- `maxValue`: number
- `interpolation`: StatusBarInterpolation [default=Immediate, NeverSecret=true]

### SetOrientation

SecretArguments=AllowedWhenUntainted

Arguments:

- `orientation`: Orientation

### SetRenderMode

SecretArguments=AllowedWhenUntainted

Arguments:

- `renderMode`: StatusBarRenderMode

### SetReverseFill

SecretArguments=AllowedWhenUntainted

Arguments:

- `isReverseFill`: bool

### SetRotatesTexture

SecretArguments=AllowedWhenUntainted

Arguments:

- `rotatesTexture`: bool

### SetStatusBarColor

SecretArguments=AllowedWhenTainted, SecretArgumentsAddAspect={1=2048, 2=128}

Arguments:

- `colorR`: number
- `colorG`: number
- `colorB`: number
- `a`: SingleColorValue?

### SetStatusBarDesaturated

SecretArguments=AllowedWhenTainted, SecretArgumentsAddAspect={1=4096}

Arguments:

- `desaturated`: bool [default=false]

### SetStatusBarDesaturation

SecretArguments=AllowedWhenTainted, SecretArgumentsAddAspect={1=4096}

Arguments:

- `desaturation`: normalizedValue

### SetStatusBarTexture

CheckAllowChangeParent=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `asset`: TextureAsset

Returns:

- `success`: bool

### SetTimerDuration

SecretArguments=AllowedWhenUntainted

Arguments:

- `duration`: LuaDurationObject
- `interpolation`: StatusBarInterpolation [default=Immediate]
- `direction`: StatusBarTimerDirection [default=ElapsedTime]

### SetToTargetValue -- Immediately finishes any interpolation of the bar and snaps it to the target value.

### SetValue

SecretArguments=AllowedWhenTainted, SecretArgumentsAddAspect={1=16384}

Arguments:

- `value`: number
- `interpolation`: StatusBarInterpolation [default=Immediate, NeverSecret=true]
