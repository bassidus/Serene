# Container

Namespace `C_Container`.

Environment=All, Predicates={}

## Functions

### C_Container.CalculateTotalNumberOfFreeBagSlots

Returns:

- `totalFreeSlots`: number

### C_Container.ContainerIDToInventoryID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `containerID`: BagIndex

Returns:

- `inventoryID`: luaIndex

### C_Container.ContainerRefundItemPurchase

SecretArguments=AllowedWhenUntainted

Arguments:

- `containerIndex`: BagIndex
- `slotIndex`: luaIndex
- `isEquipped`: bool [default=false]

### C_Container.GetBackpackAutosortDisabled

Returns:

- `isDisabled`: bool

### C_Container.GetBackpackSellJunkDisabled

Returns:

- `isDisabled`: bool

### C_Container.GetBagName

SecretArguments=AllowedWhenUntainted

Arguments:

- `bagIndex`: BagIndex

Returns:

- `name`: cstring

### C_Container.GetBagSlotFlag

SecretArguments=AllowedWhenUntainted

Arguments:

- `bagIndex`: BagIndex
- `flag`: BagSlotFlags

Returns:

- `isSet`: bool

### C_Container.GetBankAutosortDisabled

Returns:

- `isDisabled`: bool

### C_Container.GetContainerFreeSlots

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `containerIndex`: BagIndex

Returns:

- `freeSlots`: table<luaIndex>

### C_Container.GetContainerItemCooldown

SecretArguments=AllowedWhenUntainted

Arguments:

- `containerIndex`: BagIndex
- `slotIndex`: luaIndex

Returns:

- `startTime`: number
- `duration`: number
- `enable`: number

### C_Container.GetContainerItemDurability

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `containerIndex`: BagIndex
- `slotIndex`: luaIndex

Returns:

- `durability`: number
- `maxDurability`: number

### C_Container.GetContainerItemEquipmentSetInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `containerIndex`: BagIndex
- `slotIndex`: luaIndex

Returns:

- `inSet`: bool
- `setList`: string

### C_Container.GetContainerItemID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `containerIndex`: BagIndex
- `slotIndex`: luaIndex

Returns:

- `containerID`: number

### C_Container.GetContainerItemInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `containerIndex`: BagIndex
- `slotIndex`: luaIndex

Returns:

- `containerInfo`: ContainerItemInfo

### C_Container.GetContainerItemLink

SecretArguments=AllowedWhenUntainted

Arguments:

- `containerIndex`: BagIndex
- `slotIndex`: luaIndex

Returns:

- `itemLink`: cstring

### C_Container.GetContainerItemPurchaseCurrency

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `containerIndex`: BagIndex
- `slotIndex`: luaIndex
- `itemIndex`: luaIndex
- `isEquipped`: bool

Returns:

- `currencyInfo`: ItemPurchaseCurrency

### C_Container.GetContainerItemPurchaseInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `containerIndex`: BagIndex
- `slotIndex`: luaIndex
- `isEquipped`: bool

Returns:

- `info`: ItemPurchaseInfo

### C_Container.GetContainerItemPurchaseItem

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `containerIndex`: BagIndex
- `slotIndex`: luaIndex
- `itemIndex`: luaIndex
- `isEquipped`: bool

Returns:

- `itemInfo`: ItemPurchaseItem

### C_Container.GetContainerItemQuestInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `containerIndex`: BagIndex
- `slotIndex`: luaIndex

Returns:

- `questInfo`: ItemQuestInfo

### C_Container.GetContainerNumFreeSlots

SecretArguments=AllowedWhenUntainted

Arguments:

- `bagIndex`: BagIndex

Returns:

- `numFreeSlots`: number
- `bagFamily`: number?

### C_Container.GetContainerNumSlots

SecretArguments=AllowedWhenUntainted

Arguments:

- `containerIndex`: BagIndex

Returns:

- `numSlots`: number

### C_Container.GetInsertItemsLeftToRight

Returns:

- `isEnabled`: bool

### C_Container.GetItemCooldown

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `itemID`: number

Returns:

- `startTime`: number
- `duration`: number
- `enable`: number

### C_Container.GetMaxArenaCurrency

Returns:

- `maxCurrency`: number

### C_Container.GetSortBagsRightToLeft

Returns:

- `isEnabled`: bool

### C_Container.HasContainerItem

SecretArguments=AllowedWhenUntainted

Arguments:

- `containerIndex`: BagIndex
- `slotIndex`: luaIndex

Returns:

- `hasItem`: bool

### C_Container.IsBattlePayItem

SecretArguments=AllowedWhenUntainted

Arguments:

- `containerIndex`: BagIndex
- `slotIndex`: luaIndex

Returns:

- `isBattlePayItem`: bool

### C_Container.IsContainerFiltered

SecretArguments=AllowedWhenUntainted

Arguments:

- `containerIndex`: BagIndex

Returns:

- `isFiltered`: bool

### C_Container.PickupContainerItem

SecretArguments=AllowedWhenUntainted

Arguments:

- `containerIndex`: BagIndex
- `slotIndex`: luaIndex

### C_Container.PlayerHasHearthstone

Returns:

- `itemID`: number?

### C_Container.SetBackpackAutosortDisabled

SecretArguments=AllowedWhenUntainted

Arguments:

- `disable`: bool

### C_Container.SetBackpackSellJunkDisabled

SecretArguments=AllowedWhenUntainted

Arguments:

- `disable`: bool

### C_Container.SetBagPortraitTexture

SecretArguments=AllowedWhenUntainted

Arguments:

- `texture`: SimpleTexture
- `bagIndex`: BagIndex

### C_Container.SetBagSlotFlag

SecretArguments=AllowedWhenUntainted

Arguments:

- `bagIndex`: BagIndex
- `flag`: BagSlotFlags
- `isSet`: bool

### C_Container.SetBankAutosortDisabled

SecretArguments=AllowedWhenUntainted

Arguments:

- `disable`: bool

### C_Container.SetInsertItemsLeftToRight

SecretArguments=AllowedWhenUntainted

Arguments:

- `enable`: bool

### C_Container.SetItemSearch

SecretArguments=AllowedWhenUntainted

Arguments:

- `searchString`: cstring

### C_Container.SetSortBagsRightToLeft

SecretArguments=AllowedWhenUntainted

Arguments:

- `enable`: bool

### C_Container.ShowContainerSellCursor

SecretArguments=AllowedWhenUntainted

Arguments:

- `containerIndex`: BagIndex
- `slotIndex`: luaIndex

### C_Container.SocketContainerItem

SecretArguments=AllowedWhenUntainted

Arguments:

- `containerIndex`: BagIndex
- `slotIndex`: luaIndex

Returns:

- `success`: bool

### C_Container.SortAccountBankBags

### C_Container.SortBags

### C_Container.SortBank

SecretArguments=AllowedWhenUntainted

Arguments:

- `bankType`: BankType

### C_Container.SortBankBags

### C_Container.SplitContainerItem

SecretArguments=AllowedWhenUntainted

Arguments:

- `containerIndex`: BagIndex
- `slotIndex`: luaIndex
- `amount`: number

### C_Container.UseContainerItem

SecretArguments=AllowedWhenUntainted

Arguments:

- `containerIndex`: BagIndex
- `slotIndex`: luaIndex
- `unitToken`: UnitToken?
- `bankType`: BankType?
- `reagentBankOpen`: bool [default=false]

### C_Container.UseHearthstone

Returns:

- `used`: bool

## Events

### BAG_CLOSED

SynchronousEvent=true

Payload:

- `bagID`: BagIndex

### BAG_CONTAINER_UPDATE

SynchronousEvent=true

### BAG_NEW_ITEMS_UPDATED

SynchronousEvent=true

### BAG_OPEN

SynchronousEvent=true

Payload:

- `bagID`: number

### BAG_OVERFLOW_WITH_FULL_INVENTORY

SynchronousEvent=true

### BAG_SLOT_FLAGS_UPDATED

SynchronousEvent=true

Payload:

- `slot`: number

### BAG_UPDATE

SynchronousEvent=true

Payload:

- `bagID`: BagIndex

### BAG_UPDATE_COOLDOWN

UniqueEvent=true

### BAG_UPDATE_DELAYED

UniqueEvent=true

### EQUIP_BIND_REFUNDABLE_CONFIRM

SynchronousEvent=true

Payload:

- `slot`: number
- `itemLocation`: ItemLocation (ItemLocationMixin)

### EQUIP_BIND_TRADEABLE_CONFIRM

SynchronousEvent=true

Payload:

- `slot`: number
- `itemLocation`: ItemLocation (ItemLocationMixin)

### EXPAND_BAG_BAR_CHANGED

SynchronousEvent=true

Payload:

- `expandBagBar`: bool

### INVENTORY_SEARCH_UPDATE

SynchronousEvent=true

### ITEM_LOCK_CHANGED

SynchronousEvent=true

Payload:

- `bagOrSlotIndex`: BagIndex
- `slotIndex`: luaIndex?

### ITEM_LOCKED

SynchronousEvent=true

Payload:

- `bagOrSlotIndex`: BagIndex
- `slotIndex`: luaIndex?

### ITEM_UNLOCKED

SynchronousEvent=true

Payload:

- `bagOrSlotIndex`: BagIndex
- `slotIndex`: luaIndex?

### USE_COMBINED_BAGS_CHANGED

SynchronousEvent=true

Payload:

- `useCombinedBags`: bool

## Tables

### ContainerItemInfo

Fields:

- `iconFileID`: fileID
- `stackCount`: number
- `isLocked`: bool
- `quality`: ItemQuality?
- `isReadable`: bool
- `hasLoot`: bool
- `hyperlink`: string
- `isFiltered`: bool
- `hasNoValue`: bool
- `itemID`: number
- `isBound`: bool
- `itemName`: string

### ItemPurchaseCurrency

Fields:

- `iconFileID`: number?
- `currencyCount`: number
- `name`: cstring

### ItemPurchaseInfo

Fields:

- `money`: WOWMONEY
- `itemCount`: number
- `refundSeconds`: time_t
- `currencyCount`: number
- `hasEnchants`: bool

### ItemPurchaseItem

Fields:

- `iconFileID`: number?
- `itemCount`: number
- `hyperlink`: string

### ItemQuestInfo

Fields:

- `isQuestItem`: bool
- `questID`: number?
- `isActive`: bool
