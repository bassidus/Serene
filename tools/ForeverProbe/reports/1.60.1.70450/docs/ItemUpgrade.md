# ItemUpgrade

Namespace `C_ItemUpgrade`.

Environment=All, Predicates={}

## Functions

### C_ItemUpgrade.CanUpgradeItem

SecretArguments=AllowedWhenUntainted

Arguments:

- `baseItem`: ItemLocation (ItemLocationMixin)

Returns:

- `isValid`: bool

### C_ItemUpgrade.ClearItemUpgrade

### C_ItemUpgrade.CloseItemUpgrade

### C_ItemUpgrade.GetHighWatermarkForItem

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo -- Item ID, Link, or Name

Returns:

- `characterHighWatermark`: number
- `accountHighWatermark`: number

### C_ItemUpgrade.GetHighWatermarkForSlot

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `itemRedundancySlot`: number -- Must be an Enum.ItemRedundancySlot value

Returns:

- `characterHighWatermark`: number
- `accountHighWatermark`: number

### C_ItemUpgrade.GetHighWatermarkSlotForItem

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo -- Item ID, Link, or Name

Returns:

- `itemRedundancySlot`: number -- Enum.ItemRedundancySlot value

### C_ItemUpgrade.GetItemHyperlink

MayReturnNothing=true

Returns:

- `link`: cstring

### C_ItemUpgrade.GetItemUpgradeCurrentLevel

MayReturnNothing=true

Returns:

- `itemLevel`: number
- `isPvpItemLevel`: bool

### C_ItemUpgrade.GetItemUpgradeEffect

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `effectIndex`: number
- `numUpgradeLevels`: number?

Returns:

- `outBaseEffect`: string
- `outUpgradedEffect`: string

### C_ItemUpgrade.GetItemUpgradeItemInfo

MayReturnNothing=true

Returns:

- `itemInfo`: ItemUpgradeItemInfo

### C_ItemUpgrade.GetItemUpgradePvpItemLevelDeltaValues

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `numUpgradeLevels`: number

Returns:

- `currentPvPItemLevel`: number
- `upgradedPvPItemLevel`: number

### C_ItemUpgrade.GetNumItemUpgradeEffects

Returns:

- `numItemUpgradeEffects`: number

### C_ItemUpgrade.IsItemBound

Returns:

- `isBound`: bool

### C_ItemUpgrade.SetItemUpgradeFromCursorItem

### C_ItemUpgrade.SetItemUpgradeFromLocation

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemToSet`: ItemLocation (ItemLocationMixin)

### C_ItemUpgrade.UpgradeItem

SecretArguments=AllowedWhenUntainted

Arguments:

- `numUpgrades`: number [default=1]

## Events

### ITEM_UPGRADE_FAILED

SynchronousEvent=true

### ITEM_UPGRADE_MASTER_SET_ITEM

SynchronousEvent=true

### ITEM_UPGRADE_MASTER_UPDATE

SynchronousEvent=true

## Tables

### ItemUpgradeCostDiscountInfo

Fields:

- `isDiscounted`: bool
- `discountHighWatermark`: number
- `isPartialTwoHandDiscount`: bool
- `isAccountWideDiscount`: bool
- `doesCurrentCharacterMeetHighWatermark`: bool -- Reflects whether current character meets discount's high watermark, even if discount itself is account-wide

### ItemUpgradeCurrencyCost

Fields:

- `cost`: number
- `currencyID`: number
- `discountInfo`: ItemUpgradeCostDiscountInfo

### ItemUpgradeItemCost

Fields:

- `cost`: number
- `itemID`: number
- `discountInfo`: ItemUpgradeCostDiscountInfo

### ItemUpgradeItemInfo

Fields:

- `iconID`: number
- `name`: string
- `itemUpgradeable`: bool
- `displayQuality`: number
- `highWatermarkSlot`: number
- `currUpgrade`: number
- `maxUpgrade`: number
- `minItemLevel`: number
- `maxItemLevel`: number
- `upgradeLevelInfos`: table<ItemUpgradeLevelInfo>
- `customUpgradeString`: string?
- `upgradeCostTypesForSeason`: table<ItemUpgradeSeasonalCostType>

### ItemUpgradeLevelInfo

Fields:

- `upgradeLevel`: number
- `displayQuality`: number
- `itemLevelIncrement`: number
- `levelStats`: table<ItemUpgradeStat>
- `currencyCostsToUpgrade`: table<ItemUpgradeCurrencyCost>
- `itemCostsToUpgrade`: table<ItemUpgradeItemCost>
- `moneyCost`: WOWMONEY?
- `failureMessage`: string?

### ItemUpgradeSeasonalCostType -- Costs are made up of either an Item OR a Currency, so either itemID or currencyID will be nil

Fields:

- `itemID`: number?
- `currencyID`: number?
- `orderIndex`: number
- `sourceString`: string?

### ItemUpgradeStat

Fields:

- `displayString`: string
- `statValue`: number
- `active`: bool
