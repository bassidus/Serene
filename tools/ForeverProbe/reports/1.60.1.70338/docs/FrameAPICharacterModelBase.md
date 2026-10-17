# FrameAPICharacterModelBase

Environment=All, Predicates={}

## Functions

### ApplySpellVisualKit

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellVisualKitID`: number
- `oneShot`: bool [default=false]

### CanSetUnit

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

### FreezeAnimation

SecretArguments=AllowedWhenUntainted

Arguments:

- `anim`: AnimationDataEnum
- `variation`: number
- `frame`: number

### GetDisplayInfo

Returns:

- `displayID`: number

### GetDoBlend

Returns:

- `doBlend`: bool

### GetKeepModelOnHide

Returns:

- `keepModelOnHide`: bool

### HasAnimation

SecretArguments=AllowedWhenUntainted

Arguments:

- `anim`: AnimationDataEnum

Returns:

- `hasAnimation`: bool

### PlayAnimKit

SecretArguments=AllowedWhenUntainted

Arguments:

- `animKit`: number
- `loop`: bool [default=false]

### RefreshCamera

### RefreshUnit

### SetAnimation

SecretArguments=AllowedWhenUntainted

Arguments:

- `anim`: AnimationDataEnum
- `variation`: number?

### SetBarberShopAlternateForm

### SetCamDistanceScale

SecretArguments=AllowedWhenUntainted

Arguments:

- `scale`: number

### SetCreature

SecretArguments=AllowedWhenUntainted

Arguments:

- `creatureID`: number
- `displayID`: number [default=0]

### SetDisplayInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `displayID`: number
- `mountDisplayID`: number?

### SetDoBlend

SecretArguments=AllowedWhenUntainted

Arguments:

- `doBlend`: bool [default=false]

### SetItem

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemID`: number
- `appearanceModID`: number?
- `itemVisualID`: number?

### SetItemAppearance

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemAppearanceID`: number
- `itemVisualID`: number?
- `itemSubclass`: ItemWeaponSubclass?

### SetKeepModelOnHide

SecretArguments=AllowedWhenUntainted

Arguments:

- `keepModelOnHide`: bool

### SetPortraitZoom

SecretArguments=AllowedWhenUntainted

Arguments:

- `zoom`: number

### SetRotation

SecretArguments=AllowedWhenUntainted

Arguments:

- `radians`: number
- `animate`: bool [default=true]

### SetUnit

RequiresDeclassifiedUnitIdentity=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken
- `blend`: bool [default=true]
- `useNativeForm`: bool?

Returns:

- `success`: bool

### StopAnimKit

### ZeroCachedCenterXY
