# SimpleModelAPI

Environment=All, Predicates={}

## Functions

### AdvanceTime

### ClearFog

### ClearModel

### ClearTransform

### GetCameraDistance

Returns:

- `distance`: number

### GetCameraFacing

Returns:

- `radians`: number

### GetCameraPosition

Returns:

- `positionX`: number
- `positionY`: number
- `positionZ`: number

### GetCameraRoll

Returns:

- `radians`: number

### GetCameraTarget

Returns:

- `targetX`: number
- `targetY`: number
- `targetZ`: number

### GetDesaturation

Returns:

- `strength`: number

### GetFacing

Returns:

- `facing`: number

### GetFogColor

Returns:

- `colorR`: number
- `colorG`: number
- `colorB`: number
- `colorA`: number

### GetFogFar

Returns:

- `fogFar`: number

### GetFogNear

Returns:

- `fogNear`: number

### GetLight

Returns:

- `enabled`: bool
- `light`: ModelLight

### GetModelAlpha

Returns:

- `alpha`: number

### GetModelDrawLayer

Returns:

- `layer`: DrawLayer
- `sublayer`: number

### GetModelFileID

Returns:

- `modelFileID`: fileID

### GetModelScale

Returns:

- `scale`: number

### GetPaused

Returns:

- `paused`: bool

### GetPitch

Returns:

- `pitch`: number

### GetPosition

Returns:

- `positionX`: number
- `positionY`: number
- `positionZ`: number

### GetRoll

Returns:

- `roll`: number

### GetShadowEffect

Returns:

- `strength`: number

### GetViewInsets

Returns:

- `left`: uiUnit
- `right`: uiUnit
- `top`: uiUnit
- `bottom`: uiUnit

### GetViewTranslation

Returns:

- `x`: uiUnit
- `y`: uiUnit

### GetWorldScale

Returns:

- `worldScale`: number

### HasAttachmentPoints

Returns:

- `hasAttachmentPoints`: bool

### HasCustomCamera

Returns:

- `hasCustomCamera`: bool

### IsUsingModelCenterToTransform

Returns:

- `useCenter`: bool

### MakeCurrentCameraCustom

### ReplaceIconTexture

SecretArguments=AllowedWhenUntainted

Arguments:

- `asset`: FileAsset

### SetCamera

SecretArguments=AllowedWhenUntainted

Arguments:

- `cameraIndex`: number

### SetCameraDistance

SecretArguments=AllowedWhenUntainted

Arguments:

- `distance`: number

### SetCameraFacing

SecretArguments=AllowedWhenUntainted

Arguments:

- `radians`: number

### SetCameraPosition

SecretArguments=AllowedWhenUntainted

Arguments:

- `positionX`: number
- `positionY`: number
- `positionZ`: number

### SetCameraRoll

SecretArguments=AllowedWhenUntainted

Arguments:

- `radians`: number

### SetCameraTarget

SecretArguments=AllowedWhenUntainted

Arguments:

- `targetX`: number
- `targetY`: number
- `targetZ`: number

### SetCustomCamera

SecretArguments=AllowedWhenUntainted

Arguments:

- `cameraIndex`: number

### SetDesaturation

SecretArguments=AllowedWhenUntainted

Arguments:

- `strength`: number

### SetFacing

SecretArguments=AllowedWhenUntainted

Arguments:

- `facing`: number

### SetFogColor

SecretArguments=AllowedWhenUntainted

Arguments:

- `colorR`: number
- `colorG`: number
- `colorB`: number
- `a`: SingleColorValue?

### SetFogFar

SecretArguments=AllowedWhenUntainted

Arguments:

- `fogFar`: number

### SetFogNear

SecretArguments=AllowedWhenUntainted

Arguments:

- `fogNear`: number

### SetGlow

SecretArguments=AllowedWhenUntainted

Arguments:

- `glow`: number

### SetGradientMask

SecretArguments=AllowedWhenUntainted

Arguments:

- `grad0`: number
- `grad1`: number
- `grad2`: number
- `grad3`: number

### SetLight

SecretArguments=AllowedWhenUntainted

Arguments:

- `enabled`: bool
- `light`: ModelLight

### SetModel

SecretArguments=AllowedWhenUntainted

Arguments:

- `asset`: ModelAsset
- `noMip`: bool [default=false]

### SetModelAlpha

SecretArguments=AllowedWhenUntainted

Arguments:

- `alpha`: number

### SetModelDrawLayer

SecretArguments=AllowedWhenUntainted

Arguments:

- `layer`: DrawLayer

### SetModelScale

SecretArguments=AllowedWhenUntainted

Arguments:

- `scale`: number

### SetParticlesEnabled

SecretArguments=AllowedWhenUntainted

Arguments:

- `enabled`: bool

### SetPaused

SecretArguments=AllowedWhenUntainted

Arguments:

- `paused`: bool

### SetPitch

SecretArguments=AllowedWhenUntainted

Arguments:

- `pitch`: number

### SetPosition

SecretArguments=AllowedWhenUntainted

Arguments:

- `positionX`: number
- `positionY`: number
- `positionZ`: number

### SetRoll

SecretArguments=AllowedWhenUntainted

Arguments:

- `roll`: number

### SetSequence

SecretArguments=AllowedWhenUntainted

Arguments:

- `sequence`: number

### SetSequenceTime

SecretArguments=AllowedWhenUntainted

Arguments:

- `sequence`: number
- `timeOffset`: number

### SetShadowEffect

SecretArguments=AllowedWhenUntainted

Arguments:

- `strength`: number

### SetTransform

SecretArguments=AllowedWhenUntainted

Arguments:

- `translation`: vector3 (Vector3DMixin)?
- `rotation`: vector3 (Vector3DMixin)?
- `scale`: number?

### SetUseGBuffer

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `useGBuffer`: bool

### SetViewInsets

SecretArguments=AllowedWhenUntainted

Arguments:

- `left`: uiUnit
- `right`: uiUnit
- `top`: uiUnit
- `bottom`: uiUnit

### SetViewTranslation

SecretArguments=AllowedWhenUntainted

Arguments:

- `x`: uiUnit
- `y`: uiUnit

### TransformCameraSpaceToModelSpace

SecretArguments=AllowedWhenUntainted

Arguments:

- `cameraPosition`: vector3 (Vector3DMixin)

Returns:

- `modelPosition`: vector3 (Vector3DMixin)

### UseModelCenterToTransform

SecretArguments=AllowedWhenUntainted

Arguments:

- `useCenter`: bool
