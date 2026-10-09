# Item

Namespace `C_Item`.

Environment=All, Predicates={}

## Functions

### C_Item.ActionBindsItem

### C_Item.BindEnchant

### C_Item.CanBeRefunded

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemLocation`: ItemLocation (ItemLocationMixin)

Returns:

- `canBeRefunded`: bool

### C_Item.CanItemTransmogAppearance

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemLoc`: ItemLocation (ItemLocationMixin)

Returns:

- `canTransmog`: bool
- `errorCode`: TransmogOutfitSlotError

### C_Item.CanScrapItem

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemLoc`: ItemLocation (ItemLocationMixin)

Returns:

- `canBeScrapped`: bool

### C_Item.CanViewItemPowers

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemLoc`: ItemLocation (ItemLocationMixin)

Returns:

- `isItemViewable`: bool

### C_Item.ConfirmBindOnUse

### C_Item.ConfirmDeleteItem

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `itemGUID`: WOWGUID

### C_Item.ConfirmNoRefundOnUse

### C_Item.ConfirmOnUse

### C_Item.DeleteItem

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `itemGUID`: WOWGUID

### C_Item.DoesItemContainSpec

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo
- `classID`: number
- `specID`: number [default=0]

Returns:

- `result`: bool

### C_Item.DoesItemExist

SecretArguments=AllowedWhenUntainted

Arguments:

- `emptiableItemLocation`: EmptiableItemLocation (ItemLocationMixin)

Returns:

- `itemExists`: bool

### C_Item.DoesItemExistByID

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

Returns:

- `itemExists`: bool

### C_Item.DoesItemMatchBonusTreeReplacement

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemLoc`: ItemLocation (ItemLocationMixin)

Returns:

- `matchesBonusTree`: bool

### C_Item.DoesItemMatchSpellItemCondition

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemLoc`: ItemLocation (ItemLocationMixin)

Returns:

- `matches`: bool

### C_Item.DoesItemMatchTargetEnchantingSpell

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemLoc`: ItemLocation (ItemLocationMixin)

Returns:

- `matchesTargetEnchantingSpell`: bool

### C_Item.DoesItemMatchTrackJump

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemLoc`: ItemLocation (ItemLocationMixin)

Returns:

- `matchesTrackJump`: bool

### C_Item.DropItemOnUnit

SecretArguments=AllowedWhenUntainted

Arguments:

- `unitGUID`: UnitToken

### C_Item.EndBoundTradeable

SecretArguments=AllowedWhenUntainted

Arguments:

- `type`: cstring

### C_Item.EndRefund

SecretArguments=AllowedWhenUntainted

Arguments:

- `type`: number

### C_Item.EquipItemByName

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo
- `dstSlot`: luaIndex?

### C_Item.GetAppliedItemTransmogInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemLoc`: ItemLocation (ItemLocationMixin)

Returns:

- `info`: ItemTransmogInfo (ItemTransmogInfoMixin)?

### C_Item.GetBaseItemTransmogInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemLoc`: ItemLocation (ItemLocationMixin)

Returns:

- `info`: ItemTransmogInfo (ItemTransmogInfoMixin)?

### C_Item.GetCurrentItemLevel

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemLocation`: ItemLocation (ItemLocationMixin)

Returns:

- `currentItemLevel`: number?

### C_Item.GetCurrentItemTransmogInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemLoc`: ItemLocation (ItemLocationMixin)

Returns:

- `info`: ItemTransmogInfo (ItemTransmogInfoMixin)?

### C_Item.GetDelvePreviewItemLink

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemID`: number
- `context`: ItemCreationContext

Returns:

- `itemLink`: string?

### C_Item.GetDelvePreviewItemQuality

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemID`: number
- `context`: ItemCreationContext

Returns:

- `itemQuality`: ItemQuality

### C_Item.GetDetailedItemLevelInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

Returns:

- `actualItemLevel`: number
- `previewLevel`: bool
- `sparseItemLevel`: number

### C_Item.GetFirstTriggeredSpellForItem

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemID`: number
- `itemQuality`: number

Returns:

- `spellID`: number?

### C_Item.GetItemChildInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo
- `slotID`: luaIndex?

Returns:

- `result`: table<number>

### C_Item.GetItemClassInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemClassID`: number

Returns:

- `result`: cstring

### C_Item.GetItemConversionOutputIcon

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemLoc`: ItemLocation (ItemLocationMixin)

Returns:

- `icon`: fileID?

### C_Item.GetItemCooldown

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

Returns:

- `startTimeSeconds`: number
- `durationSeconds`: number
- `enableCooldownTimer`: bool

### C_Item.GetItemCount

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo
- `includeBank`: bool [default=false]
- `includeUses`: bool [default=false]
- `includeReagentBank`: bool [default=false]
- `includeAccountBank`: bool [default=false]

Returns:

- `count`: number

### C_Item.GetItemCreationContext

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

Returns:

- `itemID`: number
- `creationContext`: cstring

### C_Item.GetItemFamily

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

Returns:

- `result`: number?

### C_Item.GetItemGUID

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemLocation`: ItemLocation (ItemLocationMixin)

Returns:

- `itemGUID`: WOWGUID

### C_Item.GetItemGem

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `hyperlink`: cstring
- `index`: luaIndex

Returns:

- `gemName`: string
- `gemLink`: cstring

### C_Item.GetItemGemID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo
- `index`: luaIndex

Returns:

- `gemID`: number

### C_Item.GetItemID

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemLocation`: ItemLocation (ItemLocationMixin)

Returns:

- `itemID`: number

### C_Item.GetItemIDByGUID

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemGUID`: WOWGUID

Returns:

- `itemID`: number?

### C_Item.GetItemIDForItemInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

Returns:

- `itemID`: number

### C_Item.GetItemIcon

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemLocation`: ItemLocation (ItemLocationMixin)

Returns:

- `icon`: fileID?

### C_Item.GetItemIconByID

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

Returns:

- `icon`: fileID?

### C_Item.GetItemInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

Returns:

- `itemName`: cstring
- `itemLink`: cstring
- `itemQuality`: ItemQuality
- `itemLevel`: number
- `itemMinLevel`: number
- `itemType`: cstring
- `itemSubType`: cstring
- `itemStackCount`: number
- `itemEquipLoc`: cstring
- `itemTexture`: fileID
- `sellPrice`: number
- `classID`: number
- `subclassID`: number
- `bindType`: number
- `expansionID`: number
- `setID`: number?
- `isCraftingReagent`: bool
- `itemDescription`: cstring

### C_Item.GetItemInfoInstant

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

Returns:

- `itemID`: number
- `itemType`: cstring
- `itemSubType`: cstring
- `itemEquipLoc`: cstring
- `icon`: fileID
- `classID`: number
- `subClassID`: number

### C_Item.GetItemInventorySlotInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `inventorySlot`: InventoryType

Returns:

- `result`: cstring

### C_Item.GetItemInventorySlotKey

SecretArguments=AllowedWhenUntainted

Arguments:

- `inventorySlot`: InventoryType

Returns:

- `result`: cstring

### C_Item.GetItemInventoryType

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemLocation`: ItemLocation (ItemLocationMixin)

Returns:

- `inventoryType`: InventoryType?

### C_Item.GetItemInventoryTypeByID

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

Returns:

- `inventoryType`: InventoryType?

### C_Item.GetItemLearnTransmogSet

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

Returns:

- `setID`: number?

### C_Item.GetItemLink

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemLocation`: ItemLocation (ItemLocationMixin)

Returns:

- `itemLink`: string?

### C_Item.GetItemLinkByGUID

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemGUID`: WOWGUID

Returns:

- `itemLink`: string?

### C_Item.GetItemLocation

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemGUID`: WOWGUID

Returns:

- `itemLocation`: ItemLocation (ItemLocationMixin)?

### C_Item.GetItemMaxStackSize

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemLocation`: ItemLocation (ItemLocationMixin)

Returns:

- `stackSize`: number?

### C_Item.GetItemMaxStackSizeByID

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

Returns:

- `stackSize`: number?

### C_Item.GetItemName

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemLocation`: ItemLocation (ItemLocationMixin)

Returns:

- `itemName`: string?

### C_Item.GetItemNameByID

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

Returns:

- `itemName`: string?

### C_Item.GetItemNumAddedSockets

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

Returns:

- `socketCount`: number

### C_Item.GetItemNumSockets

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

Returns:

- `socketCount`: number

### C_Item.GetItemQuality

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemLocation`: ItemLocation (ItemLocationMixin)

Returns:

- `itemQuality`: ItemQuality?

### C_Item.GetItemQualityByID

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

Returns:

- `itemQuality`: ItemQuality?

### C_Item.GetItemQualityColor

SecretArguments=AllowedWhenUntainted

Arguments:

- `quality`: ItemQuality

Returns:

- `colorRGBR`: number
- `colorRGBG`: number
- `colorRGBB`: number
- `qualityString`: cstring

### C_Item.GetItemSetInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `setID`: number

Returns:

- `result`: cstring

### C_Item.GetItemSpecInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

Returns:

- `specTable`: table<number>

### C_Item.GetItemSpell

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

Returns:

- `spellName`: cstring
- `spellID`: number

### C_Item.GetItemStatDelta

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `itemLink1`: cstring
- `itemLink2`: cstring

Returns:

- `statTable`: LuaValueVariant

### C_Item.GetItemStats

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `itemLink`: cstring

Returns:

- `statTable`: LuaValueVariant

### C_Item.GetItemSubClassInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `itemClassID`: number
- `itemSubClassID`: number

Returns:

- `subClassName`: cstring
- `subClassUsesInvType`: bool

### C_Item.GetItemUniqueness

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

Returns:

- `limitCategory`: number
- `limitMax`: number

### C_Item.GetItemUniquenessByID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

Returns:

- `isUnique`: bool
- `limitCategoryName`: cstring?
- `limitCategoryCount`: number?
- `limitCategoryID`: number?

### C_Item.GetItemUpgradeInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

Returns:

- `itemUpgradeInfo`: ItemUpgradeInfo?

### C_Item.GetLimitedCurrencyItemInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

Returns:

- `name`: cstring
- `icon`: fileID
- `quantity`: number
- `maxQuantity`: number
- `totalEarned`: number

### C_Item.GetSetBonusesForSpecializationByItemID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `specID`: number
- `itemID`: number

Returns:

- `itemSetSpellIDs`: table<number>

### C_Item.GetStackCount

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemLocation`: ItemLocation (ItemLocationMixin)

Returns:

- `stackCount`: number

### C_Item.GetWeaponEnchantInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `weaponSlot`: WeaponSlot

Returns:

- `enchants`: table<WeaponEnchantInfo>

### C_Item.IsAnimaItemByID

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

Returns:

- `isAnimaItem`: bool

### C_Item.IsArtifactPowerItem

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

Returns:

- `result`: bool

### C_Item.IsBound

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemLocation`: ItemLocation (ItemLocationMixin)

Returns:

- `isBound`: bool

### C_Item.IsBoundToAccountUntilEquip -- You can use IsItemBindToAccountUntilEquip instead if the item is not in your inventory

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemLocation`: ItemLocation (ItemLocationMixin)

Returns:

- `isBoundToAccountUntilEquip`: bool

### C_Item.IsConsumableItem

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

Returns:

- `result`: bool

### C_Item.IsCorruptedItem

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

Returns:

- `result`: bool?

### C_Item.IsCosmeticItem

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

Returns:

- `result`: bool?

### C_Item.IsCurioItem -- Returns whether the item is a consumable curio that can be applied to a delves companion.

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

Returns:

- `result`: bool?

### C_Item.IsCurrentItem

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

Returns:

- `result`: bool

### C_Item.IsDecorItem -- Returns whether the item is a consumable decor item.

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

Returns:

- `isDecor`: bool?

### C_Item.IsDressableItemByID

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

Returns:

- `isDressableItem`: bool

### C_Item.IsEquippableItem

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

Returns:

- `result`: bool

### C_Item.IsEquippedItem

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

Returns:

- `result`: bool

### C_Item.IsEquippedItemType

SecretArguments=AllowedWhenUntainted

Arguments:

- `type`: cstring

Returns:

- `result`: bool

### C_Item.IsHarmfulItem

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

Returns:

- `result`: bool

### C_Item.IsHelpfulItem

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

Returns:

- `result`: bool

### C_Item.IsItemBindToAccount

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

Returns:

- `isItemBindToAccount`: bool

### C_Item.IsItemBindToAccountUntilEquip -- You can use IsBoundToAccountUntilEquip instead if the item exists in your inventory

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

Returns:

- `isItemBindToAccountUntilEquip`: bool

### C_Item.IsItemConduit

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemLoc`: ItemLocation (ItemLocationMixin)

Returns:

- `isConduit`: bool

### C_Item.IsItemConvertibleAndValidForPlayer

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemLoc`: ItemLocation (ItemLocationMixin)

Returns:

- `isItemConvertibleAndValidForPlayer`: bool

### C_Item.IsItemCorrupted

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemLoc`: ItemLocation (ItemLocationMixin)

Returns:

- `isCorrupted`: bool

### C_Item.IsItemCorruptionRelated

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemLoc`: ItemLocation (ItemLocationMixin)

Returns:

- `isCorruptionRelated`: bool

### C_Item.IsItemCorruptionResistant

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemLoc`: ItemLocation (ItemLocationMixin)

Returns:

- `isCorruptionResistant`: bool

### C_Item.IsItemDataCached

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemLocation`: ItemLocation (ItemLocationMixin)

Returns:

- `isCached`: bool

### C_Item.IsItemDataCachedByID

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

Returns:

- `isCached`: bool

### C_Item.IsItemGUIDInInventory

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemGUID`: WOWGUID

Returns:

- `valid`: bool

### C_Item.IsItemInRange

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo
- `targetToken`: cstring

Returns:

- `result`: bool?

### C_Item.IsItemKeystoneByID

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

Returns:

- `isKeystone`: bool

### C_Item.IsItemSpecificToPlayerClass

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

Returns:

- `isItemSpecificToPlayerClass`: bool

### C_Item.IsLocked

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemLocation`: ItemLocation (ItemLocationMixin)

Returns:

- `isLocked`: bool

### C_Item.IsRelicItem -- Returns whether the item is a consumable relic  that can be applied to an artifact weapon.

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

Returns:

- `result`: bool?

### C_Item.IsUsableItem

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

Returns:

- `usable`: bool
- `noMana`: bool

### C_Item.ItemHasRange

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

Returns:

- `result`: bool

### C_Item.LockItem

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemLocation`: ItemLocation (ItemLocationMixin)

### C_Item.LockItemByGUID

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemGUID`: WOWGUID

### C_Item.PickupItem

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

### C_Item.ReplaceEnchant

### C_Item.ReplaceTradeEnchant

### C_Item.ReplaceTradeskillEnchant

### C_Item.RequestLoadItemData

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemLocation`: ItemLocation (ItemLocationMixin)

### C_Item.RequestLoadItemDataByID

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

### C_Item.UnlockItem

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemLocation`: ItemLocation (ItemLocationMixin)

### C_Item.UnlockItemByGUID

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemGUID`: WOWGUID

### C_Item.UseItemByName

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo
- `target`: cstring?

## Events

### ACTION_WILL_BIND_ITEM

SynchronousEvent=true

### BIND_ENCHANT

SynchronousEvent=true

### CHARACTER_ITEM_FIXUP_NOTIFICATION

SynchronousEvent=true

Payload:

- `fixupVersion`: number

### CONFIRM_BEFORE_USE

SynchronousEvent=true

### CONVERT_TO_BIND_TO_ACCOUNT_CONFIRM

SynchronousEvent=true

### DELETE_ITEM_CONFIRM

SynchronousEvent=true

Payload:

- `itemName`: cstring
- `qualityID`: number
- `bonding`: number
- `questWarn`: number
- `itemGUID`: WOWGUID?

### END_BOUND_TRADEABLE

SynchronousEvent=true

Payload:

- `reason`: cstring

### GET_ITEM_INFO_RECEIVED

SynchronousEvent=true

Payload:

- `itemID`: number
- `success`: bool

### ITEM_CHANGED

SynchronousEvent=true

Payload:

- `previousHyperlink`: string
- `newHyperlink`: string

### ITEM_CONVERSION_DATA_READY

SynchronousEvent=true

Payload:

- `itemGUID`: WOWGUID

### ITEM_COUNT_CHANGED

UniqueEvent=true

Payload:

- `itemID`: number

### ITEM_DATA_LOAD_RESULT

SynchronousEvent=true

Payload:

- `itemID`: number
- `success`: bool

### MERCHANT_CONFIRM_TRADE_TIMER_REMOVAL

SynchronousEvent=true

Payload:

- `itemLink`: cstring

### REPLACE_ENCHANT

SynchronousEvent=true

Payload:

- `existingStr`: cstring
- `replacementStr`: cstring

### REPLACE_TRADESKILL_ENCHANT

SynchronousEvent=true

Payload:

- `existing`: cstring
- `replacement`: cstring

### TRADE_REPLACE_ENCHANT

SynchronousEvent=true

Payload:

- `existing`: cstring
- `replacement`: cstring

### USE_BIND_CONFIRM

SynchronousEvent=true

### USE_NO_REFUND_CONFIRM

SynchronousEvent=true

### WEAPON_ENCHANT_CHANGED

UniqueEvent=true

## Tables

### ItemInfoResult

Fields:

- `itemName`: cstring
- `itemLink`: cstring
- `itemQuality`: ItemQuality
- `itemLevel`: number
- `itemMinLevel`: number
- `itemType`: cstring
- `itemSubType`: cstring
- `itemStackCount`: number
- `itemEquipLoc`: cstring
- `itemTexture`: fileID
- `sellPrice`: number
- `classID`: number
- `subclassID`: number
- `bindType`: number
- `expansionID`: number
- `setID`: number?
- `isCraftingReagent`: bool
- `itemDescription`: cstring

### ItemUpgradeInfo

Fields:

- `currentLevel`: number
- `maxLevel`: number
- `maxItemLevel`: number
- `trackString`: cstring?
- `trackStringID`: number?

### WeaponEnchantInfo

Fields:

- `hasEnchant`: bool
- `enchantType`: ItemEnchantType
- `timeLeft`: number
- `charges`: number
- `enchantID`: number
- `enchantIconID`: number
