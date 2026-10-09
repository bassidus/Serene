# FrameAPIDressUpModel

Environment=All, Predicates={}

## Functions

### Dress

### GetAutoDress

Returns:

- `enabled`: bool

### GetItemTransmogInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `inventorySlot`: luaIndex

Returns:

- `itemTransmogInfo`: ItemTransmogInfo (ItemTransmogInfoMixin)

### GetItemTransmogInfoList

Returns:

- `infoList`: table<ItemTransmogInfo>

### GetObeyHideInTransmogFlag

Returns:

- `enabled`: bool

### GetSheathed

Returns:

- `sheathed`: bool

### GetUseTransmogChoices

Returns:

- `enabled`: bool

### GetUseTransmogSkin

Returns:

- `enabled`: bool

### IsGeoReady

Returns:

- `ready`: bool

### IsSlotAllowed

SecretArguments=AllowedWhenUntainted

Arguments:

- `slot`: luaIndex

Returns:

- `allowed`: bool

### IsSlotVisible

SecretArguments=AllowedWhenUntainted

Arguments:

- `slot`: luaIndex

Returns:

- `visible`: bool

### SetAutoDress

SecretArguments=AllowedWhenUntainted

Arguments:

- `enabled`: bool [default=false]

### SetItemTransmogInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemTransmogInfo`: ItemTransmogInfo (ItemTransmogInfoMixin)
- `inventorySlot`: luaIndex?
- `ignoreChildItems`: bool [default=false]

Returns:

- `result`: ItemTryOnReason

### SetObeyHideInTransmogFlag

SecretArguments=AllowedWhenUntainted

Arguments:

- `enabled`: bool [default=false]

### SetSheathed

SecretArguments=AllowedWhenUntainted

Arguments:

- `sheathed`: bool [default=false]
- `hideWeapons`: bool [default=false]

### SetUseTransmogChoices

SecretArguments=AllowedWhenUntainted

Arguments:

- `enabled`: bool [default=false]

### SetUseTransmogSkin

SecretArguments=AllowedWhenUntainted

Arguments:

- `enabled`: bool [default=false]

### TryOn

SecretArguments=AllowedWhenUntainted

Arguments:

- `linkOrItemModifiedAppearanceID`: IDOrLink
- `handSlotName`: cstring?
- `spellEnchantID`: number?

Returns:

- `result`: ItemTryOnReason?

### Undress

### UndressSlot

SecretArguments=AllowedWhenUntainted

Arguments:

- `inventorySlot`: luaIndex
