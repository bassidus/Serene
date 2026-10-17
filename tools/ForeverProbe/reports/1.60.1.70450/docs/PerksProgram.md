# PerksProgram

Namespace `C_PerksProgram`.

Environment=All, Predicates={}

## Functions

### C_PerksProgram.ClearFrozenPerksVendorItem

### C_PerksProgram.CloseInteraction

### C_PerksProgram.GetAvailableCategoryIDs

Returns:

- `categoryIDs`: table<number>

### C_PerksProgram.GetAvailableVendorItemIDs

Returns:

- `vendorItemIDs`: table<number>

### C_PerksProgram.GetCategoryInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `categoryID`: number

Returns:

- `categoryInfo`: PerksVendorCategoryInfo

### C_PerksProgram.GetCurrencyAmount

Returns:

- `currencyAmount`: number

### C_PerksProgram.GetDraggedPerksVendorItem

Returns:

- `perksVendorItemID`: number

### C_PerksProgram.GetFrozenPerksVendorItemInfo

MayReturnNothing=true

Returns:

- `vendorItemInfo`: PerksVendorItemInfo

### C_PerksProgram.GetPendingChestRewards

Returns:

- `pendingRewards`: table<PerksProgramPendingChestRewards>

### C_PerksProgram.GetPerksProgramItemDisplayInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `id`: number

Returns:

- `item`: PerksProgramItemDisplayInfo

### C_PerksProgram.GetTimeRemaining

SecretArguments=AllowedWhenUntainted

Arguments:

- `vendorItemID`: number

Returns:

- `timeRemaining`: time_t

### C_PerksProgram.GetVendorItemInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `vendorItemID`: number

Returns:

- `vendorItemInfo`: PerksVendorItemInfo

### C_PerksProgram.GetVendorItemInfoRefundTimeLeft

SecretArguments=AllowedWhenUntainted

Arguments:

- `vendorItemID`: number

Returns:

- `refundTimeRemaining`: time_t

### C_PerksProgram.IsAttackAnimToggleEnabled

Returns:

- `isAttackAnimToggleEnabled`: bool

### C_PerksProgram.IsFrozenPerksVendorItem

SecretArguments=AllowedWhenUntainted

Arguments:

- `perksVendorItemID`: number

Returns:

- `isFrozen`: bool

### C_PerksProgram.IsMountSpecialAnimToggleEnabled

Returns:

- `isMountSpecialAnimToggleEnabled`: bool

### C_PerksProgram.ItemSelectedTelemetry

SecretArguments=AllowedWhenUntainted

Arguments:

- `perksVendorItemID`: number

### C_PerksProgram.PickupPerksVendorItem

SecretArguments=AllowedWhenUntainted

Arguments:

- `perksVendorItemID`: number

### C_PerksProgram.RequestCartCheckout

SecretArguments=AllowedWhenUntainted

Arguments:

- `perksVendorItemIDs`: table<number>

### C_PerksProgram.RequestPendingChestRewards

### C_PerksProgram.RequestPurchase

SecretArguments=AllowedWhenUntainted

Arguments:

- `perksVendorItemID`: number

### C_PerksProgram.RequestRefund

SecretArguments=AllowedWhenUntainted

Arguments:

- `perksVendorItemID`: number

### C_PerksProgram.ResetHeldItemDragAndDrop

### C_PerksProgram.SetFrozenPerksVendorItem

## Events

### CHEST_REWARDS_UPDATED_FROM_SERVER

SynchronousEvent=true

### PERKS_PROGRAM_ADD_PENDING_SHOP_ITEM

SynchronousEvent=true

Payload:

- `vendorItemID`: number

### PERKS_PROGRAM_CLOSE

SynchronousEvent=true

### PERKS_PROGRAM_CURRENCY_AWARDED

SynchronousEvent=true

Payload:

- `value`: number

### PERKS_PROGRAM_CURRENCY_REFRESH

SynchronousEvent=true

Payload:

- `oldValue`: number
- `newValue`: number

### PERKS_PROGRAM_DATA_REFRESH

SynchronousEvent=true

### PERKS_PROGRAM_DATA_SPECIFIC_ITEM_REFRESH

SynchronousEvent=true

Payload:

- `vendorItemID`: number

### PERKS_PROGRAM_DISABLED

SynchronousEvent=true

### PERKS_PROGRAM_OPEN

SynchronousEvent=true

### PERKS_PROGRAM_PURCHASE_CART_SUCCESS

SynchronousEvent=true

Payload:

- `vendorItemIDs`: table<number>

### PERKS_PROGRAM_PURCHASE_SUCCESS

SynchronousEvent=true

Payload:

- `vendorItemID`: number

### PERKS_PROGRAM_REFUND_SUCCESS

SynchronousEvent=true

Payload:

- `vendorItemID`: number

### PERKS_PROGRAM_REMOVE_PENDING_SHOP_ITEM

SynchronousEvent=true

Payload:

- `vendorItemID`: number

### PERKS_PROGRAM_RESULT_ERROR

SynchronousEvent=true

### PERKS_PROGRAM_SET_FROZEN_ITEM

SynchronousEvent=true

Payload:

- `vendorItemID`: number

## Tables

### PerksProgramItemDisplayInfo

Fields:

- `overrideModelSceneID`: number?
- `creatureDisplayInfoID`: number?
- `mainHandItemModifiedAppearanceID`: number?
- `offHandItemModifiedAppearanceID`: number?

### PerksProgramPendingChestRewards

Fields:

- `rewardTypeID`: number
- `perksVendorItemID`: number?
- `rewardAmount`: number
- `monthRewarded`: string?
- `activityMonthID`: number
- `thresholdOrderIndex`: number

### PerksVendorCategoryInfo

Fields:

- `ID`: number
- `displayName`: cstring
- `defaultUIModelSceneID`: number

### PerksVendorItemInfo

Fields:

- `name`: string
- `perksVendorCategoryID`: number
- `description`: string
- `timeRemaining`: time_t
- `purchased`: bool
- `refundable`: bool
- `subItemsLoaded`: bool
- `isPurchasePending`: bool
- `doesNotExpire`: bool
- `price`: number
- `originalPrice`: number?
- `showSaleBanner`: bool
- `perksVendorItemID`: number
- `itemID`: number
- `iconTexture`: string
- `mountID`: number
- `mountTypeName`: string
- `speciesID`: number
- `transmogSetID`: number
- `itemModifiedAppearanceID`: number
- `subItems`: table<PerksVendorSubItemInfo>
- `uiGroupInfo`: PerksVendorItemUIGroupInfo?
- `invType`: string
- `quality`: ItemQuality

### PerksVendorItemUIGroupInfo

Fields:

- `ID`: number
- `name`: cstring
- `priority`: number

### PerksVendorSubItemInfo

Fields:

- `name`: string
- `itemID`: number
- `itemModifiedAppearanceID`: number
- `invType`: string
- `quality`: ItemQuality
