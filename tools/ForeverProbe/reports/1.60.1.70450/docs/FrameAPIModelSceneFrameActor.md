# FrameAPIModelSceneFrameActor

Environment=All, Predicates={}

## Functions

### AttachToMount

SecretArguments=AllowedWhenUntainted

Arguments:

- `rider`: ModelSceneFrameActor
- `animation`: AnimationDataEnum
- `spellKitVisualID`: number?

Returns:

- `success`: bool

### CalculateMountScale

SecretArguments=AllowedWhenUntainted

Arguments:

- `rider`: ModelSceneFrameActor

Returns:

- `scale`: number

### DetachFromMount

SecretArguments=AllowedWhenUntainted

Arguments:

- `rider`: ModelSceneFrameActor

Returns:

- `success`: bool

### Dress

### DressPlayerSlot

SecretArguments=AllowedWhenUntainted

Arguments:

- `invSlot`: luaIndex

### GetAutoDress

Returns:

- `autoDress`: bool

### GetItemTransmogInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `inventorySlots`: number

Returns:

- `itemTransmogInfo`: ItemTransmogInfo (ItemTransmogInfoMixin)?

### GetItemTransmogInfoList

Returns:

- `infoList`: table<ItemTransmogInfo>

### GetObeyHideInTransmogFlag

Returns:

- `obey`: bool

### GetPaused

Returns:

- `paused`: bool
- `globalPaused`: bool

### GetSheathed

Returns:

- `sheathed`: bool

### GetUseTransmogChoices

Returns:

- `use`: bool

### GetUseTransmogSkin

Returns:

- `use`: bool

### IsGeoReady

Returns:

- `isReady`: bool

### IsSlotAllowed

SecretArguments=AllowedWhenUntainted

Arguments:

- `inventorySlots`: number

Returns:

- `allowed`: bool

### IsSlotVisible

SecretArguments=AllowedWhenUntainted

Arguments:

- `inventorySlots`: number

Returns:

- `visible`: bool

### ReleaseFrontEndCharacterDisplays

Returns:

- `success`: bool

### ResetNextHandSlot

### SetAutoDress

SecretArguments=AllowedWhenUntainted

Arguments:

- `autoDress`: bool

### SetFrontEndLobbyModelFromDefaultCharacterDisplay

SecretArguments=AllowedWhenUntainted

Arguments:

- `characterIndex`: number

Returns:

- `success`: bool

### SetItemTransmogInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `transmogInfo`: ItemTransmogInfo (ItemTransmogInfoMixin)
- `inventorySlots`: number?
- `ignoreChildItems`: bool [default=false]

Returns:

- `result`: ItemTryOnReason

### SetModelByHyperlink

SecretArguments=AllowedWhenUntainted

Arguments:

- `link`: cstring

Returns:

- `success`: bool

### SetObeyHideInTransmogFlag

SecretArguments=AllowedWhenUntainted

Arguments:

- `obey`: bool

### SetPaused

SecretArguments=AllowedWhenUntainted

Arguments:

- `paused`: bool
- `affectsGlobalPause`: bool [default=true]

### SetSheathed

SecretArguments=AllowedWhenUntainted

Arguments:

- `sheathed`: bool
- `hidden`: bool [default=false]

### SetSheathedCategory

SecretArguments=AllowedWhenUntainted

Arguments:

- `inventorySlots`: number
- `category`: TransmogOutfitSlotOptionSheatheCategory

### SetUseTransmogChoices

SecretArguments=AllowedWhenUntainted

Arguments:

- `use`: bool

### SetUseTransmogSkin

SecretArguments=AllowedWhenUntainted

Arguments:

- `use`: bool

### Undress

SecretArguments=AllowedWhenUntainted

Arguments:

- `includeWeapons`: bool [default=true]

### UndressSlot

SecretArguments=AllowedWhenUntainted

Arguments:

- `inventorySlots`: number

### UseUnitSheatheCategory

SecretArguments=AllowedWhenUntainted

Arguments:

- `useCategory`: bool
