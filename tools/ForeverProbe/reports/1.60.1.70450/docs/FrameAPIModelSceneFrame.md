# FrameAPIModelSceneFrame

Environment=All, Predicates={}

## Functions

### ClearFog

### CreateActor

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: cstring
- `template`: cstring

### GetActorAtIndex

SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex

### GetAllowOverlappedModels

Returns:

- `allowOverlappedModels`: bool

### GetCameraFarClip

Returns:

- `farClip`: number

### GetCameraFieldOfView -- Field of view in radians

Returns:

- `fov`: number

### GetCameraForward

Returns:

- `forwardX`: number
- `forwardY`: number
- `forwardZ`: number

### GetCameraNearClip

Returns:

- `nearClip`: number

### GetCameraPosition

Returns:

- `positionX`: number
- `positionY`: number
- `positionZ`: number

### GetCameraRight

Returns:

- `rightX`: number
- `rightY`: number
- `rightZ`: number

### GetCameraUp

Returns:

- `upX`: number
- `upY`: number
- `upZ`: number

### GetDrawLayer

Returns:

- `layer`: DrawLayer
- `sublevel`: number

### GetFogColor

Returns:

- `colorR`: number
- `colorG`: number
- `colorB`: number

### GetFogFar

Returns:

- `far`: number

### GetFogNear

Returns:

- `near`: number

### GetLightAmbientColor

Returns:

- `colorR`: number
- `colorG`: number
- `colorB`: number

### GetLightDiffuseColor

Returns:

- `colorR`: number
- `colorG`: number
- `colorB`: number

### GetLightDirection

Returns:

- `directionX`: number
- `directionY`: number
- `directionZ`: number

### GetLightPosition

Returns:

- `positionX`: number
- `positionY`: number
- `positionZ`: number

### GetLightType

Returns:

- `lightType`: ModelLightType?

### GetNumActors

Returns:

- `numActors`: number

### GetViewInsets

Returns:

- `insets`: uiRect

### GetViewTranslation

Returns:

- `translationX`: number
- `translationY`: number

### IsLightVisible

Returns:

- `isVisible`: bool

### Project3DPointTo2D

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `pointX`: number
- `pointY`: number
- `pointZ`: number

Returns:

- `point2DX`: number
- `point2DY`: number
- `depth`: number

### SetAllowOverlappedModels

SecretArguments=AllowedWhenUntainted

Arguments:

- `allowOverlappedModels`: bool

### SetCameraFarClip

SecretArguments=AllowedWhenUntainted

Arguments:

- `farClip`: number

### SetCameraFieldOfView -- Field of view in radians

SecretArguments=AllowedWhenUntainted

Arguments:

- `fov`: number

### SetCameraNearClip

SecretArguments=AllowedWhenUntainted

Arguments:

- `nearClip`: number

### SetCameraOrientationByAxisVectors

SecretArguments=AllowedWhenUntainted

Arguments:

- `forwardX`: number
- `forwardY`: number
- `forwardZ`: number
- `rightX`: number
- `rightY`: number
- `rightZ`: number
- `upX`: number
- `upY`: number
- `upZ`: number

### SetCameraOrientationByYawPitchRoll

SecretArguments=AllowedWhenUntainted

Arguments:

- `yaw`: number
- `pitch`: number
- `roll`: number

### SetCameraPosition

SecretArguments=AllowedWhenUntainted

Arguments:

- `positionX`: number
- `positionY`: number
- `positionZ`: number

### SetDesaturation

SecretArguments=AllowedWhenUntainted

Arguments:

- `strength`: number

### SetDrawLayer

SecretArguments=AllowedWhenUntainted

Arguments:

- `layer`: DrawLayer

### SetFogColor

SecretArguments=AllowedWhenUntainted

Arguments:

- `colorR`: number
- `colorG`: number
- `colorB`: number

### SetFogFar

SecretArguments=AllowedWhenUntainted

Arguments:

- `far`: number

### SetFogNear

SecretArguments=AllowedWhenUntainted

Arguments:

- `near`: number

### SetLightAmbientColor

SecretArguments=AllowedWhenUntainted

Arguments:

- `colorR`: number
- `colorG`: number
- `colorB`: number

### SetLightDiffuseColor

SecretArguments=AllowedWhenUntainted

Arguments:

- `colorR`: number
- `colorG`: number
- `colorB`: number

### SetLightDirection

SecretArguments=AllowedWhenUntainted

Arguments:

- `directionX`: number
- `directionY`: number
- `directionZ`: number

### SetLightPosition

SecretArguments=AllowedWhenUntainted

Arguments:

- `positionX`: number
- `positionY`: number
- `positionZ`: number

### SetLightType

SecretArguments=AllowedWhenUntainted

Arguments:

- `lightType`: ModelLightType

### SetLightVisible

SecretArguments=AllowedWhenUntainted

Arguments:

- `visible`: bool [default=false]

### SetPaused

SecretArguments=AllowedWhenUntainted

Arguments:

- `paused`: bool
- `affectsGlobalPause`: bool [default=true]

### SetViewInsets

SecretArguments=AllowedWhenUntainted

Arguments:

- `insets`: uiRect

### SetViewTranslation

SecretArguments=AllowedWhenUntainted

Arguments:

- `translationX`: number
- `translationY`: number

### TakeActor
