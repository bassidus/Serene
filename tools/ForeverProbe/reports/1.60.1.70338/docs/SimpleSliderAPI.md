# SimpleSliderAPI

Environment=All, Predicates={}

## Functions

### Disable

### Enable

### GetMinMaxValues

Returns:

- `minValue`: number
- `maxValue`: number

### GetObeyStepOnDrag

Returns:

- `isObeyStepOnDrag`: bool

### GetOrientation

Returns:

- `orientation`: Orientation

### GetStepsPerPage

Returns:

- `stepsPerPage`: number

### GetThumbTexture

Returns:

- `texture`: SimpleTexture

### GetValue

Returns:

- `value`: number

### GetValueStep

Returns:

- `valueStep`: number

### IsDraggingThumb

Returns:

- `isDraggingThumb`: bool

### IsEnabled

Returns:

- `enabled`: bool

### SetEnabled

SecretArguments=AllowedWhenUntainted

Arguments:

- `enabled`: bool

### SetMinMaxValues

SecretArguments=AllowedWhenUntainted

Arguments:

- `minValue`: number
- `maxValue`: number

### SetObeyStepOnDrag

SecretArguments=AllowedWhenUntainted

Arguments:

- `obeyStepOnDrag`: bool

### SetOrientation

SecretArguments=AllowedWhenUntainted

Arguments:

- `orientation`: Orientation

### SetStepsPerPage

SecretArguments=AllowedWhenUntainted

Arguments:

- `stepsPerPage`: number

### SetThumbTexture

CheckAllowChangeParent=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `asset`: TextureAsset

### SetValue

SecretArguments=AllowedWhenUntainted

Arguments:

- `value`: number
- `treatAsMouseEvent`: bool [default=false]

### SetValueStep

SecretArguments=AllowedWhenUntainted

Arguments:

- `valueStep`: number
