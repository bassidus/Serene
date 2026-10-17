# CatalogShop

Namespace `C_CatalogShop`.

Environment=All, Predicates={}

## Functions

### C_CatalogShop.BulkPurchaseProducts

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `productIDs`: table<number>

Returns:

- `canPurchaseProducts`: bool

### C_CatalogShop.BulkRefundDecors

SecretArguments=AllowedWhenUntainted

Arguments:

- `decorGUIDs`: table<WOWGUID>

### C_CatalogShop.CloseCatalogShopInteraction

### C_CatalogShop.ConfirmHousingPurchase

SecretArguments=AllowedWhenUntainted

Arguments:

- `productIDs`: table<number>

### C_CatalogShop.FindBestCurrencyProductForNeededAmount

SecretArguments=AllowedWhenUntainted

Arguments:

- `vcCurrencyCode`: string
- `amountNeeded`: number

Returns:

- `vcProductID`: number?

### C_CatalogShop.GetAvailableCategoryIDs

Returns:

- `categoryIDs`: table<number>

### C_CatalogShop.GetAvailableTransmogRaceInfos

Returns:

- `raceIDs`: table<AvailableRaceInfo>

### C_CatalogShop.GetCatalogShopProductDisplayInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `catalogShopProductID`: number

Returns:

- `item`: CatalogShopProductDisplayInfo

### C_CatalogShop.GetCategoryInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `categoryID`: number

Returns:

- `categoryInfo`: CatalogShopCategoryInfo

### C_CatalogShop.GetCategorySectionInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `categoryID`: number
- `sectionID`: number

Returns:

- `sectionInfo`: CatalogShopSectionInfo

### C_CatalogShop.GetFailureInfo

Returns:

- `errorResultEnum`: StoreError?
- `errorResultRaw`: number?

### C_CatalogShop.GetFirstCategoryByProductID

SecretArguments=AllowedWhenUntainted

Arguments:

- `productID`: number

Returns:

- `categoryInfo`: CatalogShopCategoryInfo?

### C_CatalogShop.GetNewProducts

Returns:

- `newProducts`: table<number>

### C_CatalogShop.GetProductAvailabilityTimeRemainingSecs

SecretArguments=AllowedWhenUntainted

Arguments:

- `catalogShopProductID`: number

Returns:

- `timeRemainingSecs`: number?

### C_CatalogShop.GetProductIDsForBundle

SecretArguments=AllowedWhenUntainted

Arguments:

- `bundleProductID`: number

Returns:

- `childIDs`: table<CatalogShopBundleChildInfo>

### C_CatalogShop.GetProductIDsForCategory

SecretArguments=AllowedWhenUntainted

Arguments:

- `categoryID`: number

Returns:

- `productIDs`: table<number>

### C_CatalogShop.GetProductIDsForCategorySection

SecretArguments=AllowedWhenUntainted

Arguments:

- `categoryID`: number
- `sectionID`: number

Returns:

- `productIDs`: table<number>

### C_CatalogShop.GetProductInfo

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `productID`: number

Returns:

- `productInfo`: CatalogShopProductInfo?

### C_CatalogShop.GetProductSortOrder

SecretArguments=AllowedWhenUntainted

Arguments:

- `categoryID`: number
- `sectionID`: number
- `productID`: number

Returns:

- `sortOrder`: number?

### C_CatalogShop.GetRefundableDecors

SecretArguments=AllowedWhenUntainted

Arguments:

- `productIdFilterOpt`: number?

Returns:

- `refundableDecorInfos`: table<RefundableDecorInfo>
- `minTimeRemainingSeconds`: time_t

### C_CatalogShop.GetSectionIDsForCategory

SecretArguments=AllowedWhenUntainted

Arguments:

- `categoryID`: number

Returns:

- `sectionIDs`: table<number>

### C_CatalogShop.GetSpellVisualInfoForMount

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellVisualID`: number

Returns:

- `spellVisualInfo`: CatalogShopSpellVisualInfo

### C_CatalogShop.GetVCProductInfos

Returns:

- `vcProductInfos`: table<CatalogShopVCProductInfo>

### C_CatalogShop.GetVirtualCurrencyBalance

SecretArguments=AllowedWhenUntainted

Arguments:

- `currencyCode`: string

Returns:

- `balance`: string?

### C_CatalogShop.HasNewProducts

Returns:

- `hasNewProducts`: bool

### C_CatalogShop.IsProductIncludedInAnyBundle

SecretArguments=AllowedWhenUntainted

Arguments:

- `productID`: number

Returns:

- `isIncludedInAnyBundle`: bool

### C_CatalogShop.IsShop2Enabled

Returns:

- `value`: bool?

### C_CatalogShop.OnLegalDisclaimerClicked

SecretArguments=AllowedWhenUntainted

Arguments:

- `catalogShopProductID`: number

### C_CatalogShop.OnLegalPersonalizedOptOutClicked

### C_CatalogShop.OpenCatalogShopInteractionFromHouse

Returns:

- `shoppingSessionUUIDStr`: string

### C_CatalogShop.OpenCatalogShopInteractionFromShop

Returns:

- `shoppingSessionUUIDStr`: string

### C_CatalogShop.ProductDisplayedTelemetry

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `categoryId`: number
- `sectionId`: number
- `catalogShopProductID`: number

### C_CatalogShop.ProductSelectedTelemetry

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `categoryId`: number
- `sectionId`: number
- `catalogShopProductID`: number
- `wasCodeSelection`: bool

### C_CatalogShop.PurchaseProduct

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `productID`: number

Returns:

- `canPurchase`: bool

### C_CatalogShop.RefreshRefundableDecors

### C_CatalogShop.RefreshVirtualCurrencyBalance

SecretArguments=AllowedWhenUntainted

Arguments:

- `currencyCode`: string

### C_CatalogShop.ShouldShowHousingWarning

Returns:

- `shouldShowHousingWarning`: bool

### C_CatalogShop.StartHousingVCPurchaseConfirmation

SecretArguments=AllowedWhenUntainted

Arguments:

- `productID`: number

## Events

### BULK_PURCHASE_RESULT_RECEIVED

SynchronousEvent=true

Payload:

- `result`: BulkPurchaseResult
- `productResults`: table<BulkPurchaseIndividualProductResult>
- `bestTopUpProductID`: number?
- `totalCost`: number?

### BULK_REFUND_RESULT_RECEIVED

SynchronousEvent=true

Payload:

- `result`: BulkRefundResult

### CATALOG_SHOP_ADD_PENDING_PRODUCT

SynchronousEvent=true

Payload:

- `productID`: number

### CATALOG_SHOP_DATA_REFRESH

SynchronousEvent=true

Payload:

- `shoppingSessionUUIDStr`: string?

### CATALOG_SHOP_DISABLED

SynchronousEvent=true

### CATALOG_SHOP_FETCH_FAILURE

SynchronousEvent=true

Payload:

- `shoppingSessionUUIDStr`: string?

### CATALOG_SHOP_FETCH_SUCCESS

SynchronousEvent=true

Payload:

- `shoppingSessionUUIDStr`: string?

### CATALOG_SHOP_OPEN_SIMPLE_CHECKOUT

SynchronousEvent=true

Payload:

- `checkoutID`: number

### CATALOG_SHOP_PURCHASE_SUCCESS

SynchronousEvent=true

Payload:

- `productID`: number

### CATALOG_SHOP_REBUILD_SCROLL_BOX

SynchronousEvent=true

### CATALOG_SHOP_REFUNDABLE_DECORS_UPDATED

SynchronousEvent=true

### CATALOG_SHOP_REMOVE_PENDING_PRODUCT

SynchronousEvent=true

Payload:

- `productID`: number

### CATALOG_SHOP_RESULT_ERROR

SynchronousEvent=true

### CATALOG_SHOP_SPECIFIC_PRODUCT_REFRESH

SynchronousEvent=true

Payload:

- `productID`: number

### CATALOG_SHOP_VIRTUAL_CURRENCY_BALANCE_UPDATE

SynchronousEvent=true

Payload:

- `currencyCode`: string
- `balance`: string

### CATALOG_SHOP_VIRTUAL_CURRENCY_BALANCE_UPDATE_FAILURE

SynchronousEvent=true

Payload:

- `currencyCode`: string

### SET_SEEN_PRODUCTS

SynchronousEvent=true

Payload:

- `productIds`: table<number>

### SHOW_NEW_PRODUCT_NOTIFICATION

SynchronousEvent=true

## Tables

### AvailableRaceInfo

Fields:

- `raceID`: number
- `displayName`: string

### BulkPurchaseIndividualProductResult

Fields:

- `recordId`: number
- `parentProductId`: number?
- `entitlementId`: string
- `externalTransactionId`: string
- `status`: SimpleOrderStatus

### CatalogShopBundleChildInfo

Fields:

- `childProductID`: number
- `displayOrder`: number
- `quantityInBundle`: number

### CatalogShopCategoryInfo

Fields:

- `ID`: number
- `displayName`: string
- `iconTexture`: string
- `linkTag`: string
- `isDisabled`: bool
- `showPersistentRefundButton`: bool

### CatalogShopProductDisplayInfo

Fields:

- `defaultPreviewModelSceneID`: number
- `defaultCardModelSceneID`: number
- `defaultWideCardModelSceneID`: number
- `itemID`: number
- `overridePreviewModelSceneID`: number?
- `overrideCardModelSceneID`: number?
- `overrideWideCardModelSceneID`: number?
- `creatureDisplayInfoIDs`: table<number>
- `spellVisualIDs`: table<number>
- `mainHandItemModifiedAppearanceID`: number?
- `offHandItemModifiedAppearanceID`: number?
- `itemModifiedAppearanceIDs`: table<number>
- `iconFileDataID`: number?
- `iconTextureKit`: textureKit?
- `productType`: string?
- `itemDescription`: string?
- `hasUnknownLicense`: bool
- `productPMTURL`: string?
- `additionalProductPMTURLs`: table<string>
- `otherProductImageAtlasName`: string?
- `otherProductGameTitleBaseTag`: string?
- `otherProductGameType`: string?
- `customLoopingSoundStart`: number?
- `customLoopingSoundMiddle`: number?
- `customLoopingSoundEnd`: number?
- `specialActorID_1`: string?
- `specialActorID_2`: string?
- `specialActorID_3`: string?
- `specialActorID_4`: string?
- `specialActorID_5`: string?
- `gameFlavorID`: number?
- `decorFileDataID`: number?
- `quantity`: number?
- `houseTextureAtlas`: textureAtlas?

### CatalogShopProductInfo

Fields:

- `catalogShopProductID`: number
- `name`: string
- `type`: string?
- `description`: string
- `iconTexture`: string
- `isFullyOwned`: bool
- `isPurchasePending`: bool
- `refundable`: bool
- `price`: string
- `originalPrice`: string
- `discountPercentage`: number
- `itemID`: number
- `mountID`: number
- `mountTypeName`: string
- `speciesID`: number
- `transmogSetID`: number
- `itemModifiedAppearanceID`: number
- `subItems`: table<CatalogShopSubItemInfo>
- `subItemsLoaded`: bool
- `backgroundTexture`: string
- `foregroundTexture`: string?
- `smallCardBGTexture`: string?
- `smallCardFGTexture`: string?
- `wideCardBGTexture`: string?
- `wideCardFGTexture`: string?
- `previewIconTexture`: string?
- `optionalWideCardBackgroundTexture`: string?
- `isBundle`: bool
- `bundleChildrenSize`: number
- `licenseTermType`: number
- `licenseTermDuration`: number
- `virtualCurrencies`: table<CatalogShopVirtualCurrency>
- `isHidden`: bool
- `isMystery`: bool
- `hasPendingOrders`: bool
- `numBundleDetailCards`: number
- `isDynamicallyDiscounted`: bool
- `shouldShowOriginalPrice`: bool
- `wideCardBGOverrideProductURL`: string?
- `previewBGOverrideProductURL`: string?
- `previewSmallBGOverrideProductURL`: string?
- `decorQuantity`: DecorQuantity?
- `isVCProduct`: bool
- `containsHousingItem`: bool
- `deferredGameTimeDays`: number

### CatalogShopSectionInfo

Fields:

- `ID`: number
- `displayName`: string
- `parentCatalogShopCategoryInfoID`: number?
- `cardType`: string?
- `scrollGridSize`: number?
- `shouldShowRecommendationOptOutDisclaimer`: bool

### CatalogShopSpellVisualInfo

Fields:

- `animID`: number?
- `spellVisualKitID`: number?

### CatalogShopSubItemInfo

Fields:

- `name`: string
- `itemID`: number
- `itemAppearanceID`: number
- `invType`: string
- `quality`: ItemQuality

### CatalogShopVCProductInfo

Fields:

- `vcProductID`: number

### CatalogShopVirtualCurrency

Fields:

- `amount`: number
- `currencyCode`: string

### DecorQuantity

Fields:

- `placedQuantity`: number
- `storedQuantity`: number

### RefundableDecorInfo

Fields:

- `decorGUID`: WOWGUID
- `timeRemainingSeconds`: time_t
- `name`: string
- `price`: string
