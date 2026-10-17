# FrameAPIModelSceneFrameActorBase

Environment=All, Predicates={}

## Functions

### ClearModel

### GetActiveBoundingBox

Returns:

- `boxBottom`: vector3 (Vector3DMixin)
- `boxTop`: vector3 (Vector3DMixin)

### GetAlpha

SecretReturnsForAspect={1=128}

Returns:

- `alpha`: number

### GetAnimation

Returns:

- `animation`: AnimationDataEnum

### GetAnimationBlendOperation

Returns:

- `blendOp`: ModelBlendOperation

### GetAnimationVariation

Returns:

- `variation`: number

### GetDesaturation

Returns:

- `strength`: number

### GetMaxBoundingBox

Returns:

- `boxBottom`: vector3 (Vector3DMixin)
- `boxTop`: vector3 (Vector3DMixin)

### GetModelFileID

Returns:

- `file`: fileID

### GetModelPath

Returns:

- `path`: string

### GetModelUnitGUID

Returns:

- `guid`: WOWGUID

### GetParticleOverrideScale

Returns:

- `scale`: number?

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

### GetScale

Returns:

- `scale`: number

### GetSpellVisualKit

Returns:

- `spellVisualKitID`: number

### GetYaw

Returns:

- `yaw`: number

### Hide

### IsLoaded

Returns:

- `isLoaded`: bool

### IsPreferringModelCollisionBounds

Returns:

- `preferringCollisionBounds`: bool

### IsShown

Returns:

- `isShown`: bool

### IsUsingCenterForOrigin

Returns:

- `x`: bool
- `y`: bool
- `z`: bool

### IsVisible

Returns:

- `isVisible`: bool

### PlayAnimationKit

SecretArguments=AllowedWhenUntainted

Arguments:

- `animationKit`: number
- `isLooping`: bool [default=false]

### SetAlpha

SecretArguments=AllowedWhenUntainted, SecretArgumentsAddAspect={1=128}

Arguments:

- `alpha`: number

### SetAnimation

SecretArguments=AllowedWhenUntainted

Arguments:

- `animation`: AnimationDataEnum
- `variation`: number?
- `animSpeed`: number [default=1]
- `animOffsetSeconds`: number [default=0]

### SetAnimationBlendOperation

SecretArguments=AllowedWhenUntainted

Arguments:

- `blendOp`: ModelBlendOperation

### SetDesaturation

SecretArguments=AllowedWhenUntainted

Arguments:

- `strength`: number

### SetGradientMask

SecretArguments=AllowedWhenUntainted

Arguments:

- `gradientIndex0`: number
- `gradientIndex1`: number
- `gradientIndex2`: number
- `gradientIndex3`: number

### SetGradientMaskWithDyes

SecretArguments=AllowedWhenUntainted

Arguments:

- `grad0DyeColorID`: number?
- `grad1DyeColorID`: number?
- `grad2DyeColorID`: number?

### SetModelByCreatureDisplayID

SecretArguments=AllowedWhenUntainted

Arguments:

- `creatureDisplayID`: number
- `useActivePlayerCustomizations`: bool [default=false]

Returns:

- `success`: bool

### SetModelByFileID

SecretArguments=AllowedWhenUntainted

Arguments:

- `asset`: FileAsset
- `useMips`: bool [default=false]

Returns:

- `success`: bool

### SetModelByPath

SecretArguments=AllowedWhenUntainted

Arguments:

- `asset`: FileAsset
- `useMips`: bool [default=false]

Returns:

- `success`: bool

### SetModelByUnit

RequiresDeclassifiedUnitIdentity=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken
- `sheatheWeapons`: bool [default=false]
- `autoDress`: bool [default=true]
- `hideWeapons`: bool [default=false]
- `usePlayerNativeForm`: bool [default=true]
- `holdBowString`: bool [default=false]
- `customRaceID`: number?

Returns:

- `success`: bool

### SetModelByUnitCreatureDisplayID

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `success`: bool

### SetParticleOverrideScale

SecretArguments=AllowedWhenUntainted

Arguments:

- `scale`: number?

### SetPitch

SecretArguments=AllowedWhenUntainted

Arguments:

- `pitch`: number

### SetPlayerModelFromGlues

SecretArguments=AllowedWhenUntainted

Arguments:

- `characterIndex`: number?
- `sheatheWeapons`: bool [default=false]
- `autoDress`: bool [default=true]
- `hideWeapons`: bool [default=false]
- `usePlayerNativeForm`: bool [default=true]
- `customRaceID`: number?

Returns:

- `success`: bool

### SetPosition

SecretArguments=AllowedWhenUntainted

Arguments:

- `positionX`: number
- `positionY`: number
- `positionZ`: number

### SetPreferModelCollisionBounds -- If true, will try to use the collision bounds of models for sizing and centering. Will fall back to default model bounds if set to False, or if collision bounds are unavailable.

SecretArguments=AllowedWhenUntainted

Arguments:

- `preferCollisionBounds`: bool

### SetRoll

SecretArguments=AllowedWhenUntainted

Arguments:

- `roll`: number

### SetScale

SecretArguments=AllowedWhenUntainted

Arguments:

- `scale`: number

### SetShown

SecretArguments=AllowedWhenUntainted

Arguments:

- `show`: bool [default=false]

### SetSpellVisualKit

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellVisualKitID`: number [default=0]
- `oneShot`: bool [default=false]

### SetUseCenterForOrigin

SecretArguments=AllowedWhenUntainted

Arguments:

- `x`: bool [default=false]
- `y`: bool [default=false]
- `z`: bool [default=false]

### SetYaw

SecretArguments=AllowedWhenUntainted

Arguments:

- `yaw`: number

### Show

### StopAnimationKit

### TryOn

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemLinkOrItemModifiedAppearanceID`: cstring
- `handSlotName`: cstring?
- `spellEnchantmentID`: number [default=0]

Returns:

- `reason`: ItemTryOnReason?
