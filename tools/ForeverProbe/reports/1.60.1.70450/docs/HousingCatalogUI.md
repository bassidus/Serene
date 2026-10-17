# HousingCatalogUI

Namespace `C_HousingCatalog`.

Environment=All, Predicates={}

## Functions

### C_HousingCatalog.CreateCatalogSearcher -- Creates a new instance of a HousingCatalog searcher; This can be used to asynchronously search/filter the HousingCatalog without affecting/being restricted by the filter state of other Housing Catalog UI displays

Returns:

- `searcher`: HousingCatalogSearcher

### C_HousingCatalog.DeletePreviewCartDecor

SecretArguments=AllowedWhenUntainted

Arguments:

- `decorGUID`: WOWGUID

### C_HousingCatalog.DestroyEntry -- Attempt to delete the entry from storage

SecretArguments=AllowedWhenUntainted

Arguments:

- `entryVariantID`: HousingCatalogEntryVariantID
- `destroyAll`: bool -- If true, deletes all entries within the stack; If false, will only delete one

### C_HousingCatalog.GetAllFilterTagGroups

Returns:

- `filterTagGroups`: table<HousingCatalogFilterTagGroupInfo>

### C_HousingCatalog.GetAllVariantInfosForEntry -- Returns variant info for all variants of a given catalog entry; Variants represent different visual modifications of the same base entry (ex: dyed versions)

SecretArguments=AllowedWhenUntainted

Arguments:

- `entryID`: HousingCatalogEntryID

Returns:

- `variantInfos`: table<HousingCatalogEntryVariantInfo>

### C_HousingCatalog.GetBundleInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `bundleCatalogShopProductID`: number

Returns:

- `bundleInfo`: HousingBundleInfo?

### C_HousingCatalog.GetCartSizeLimit

Returns:

- `cartSizeLimit`: number

### C_HousingCatalog.GetCatalogCategoryAndSubcategoryNames -- If found, returns the names of the parent category and the specified subcategory

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `subcategoryID`: number

Returns:

- `categoryName`: string
- `subcategoryName`: string

### C_HousingCatalog.GetCatalogCategoryInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `categoryID`: number

Returns:

- `info`: HousingCatalogCategoryInfo?

### C_HousingCatalog.GetCatalogEntryInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `entryID`: HousingCatalogEntryID

Returns:

- `info`: HousingCatalogEntryInfo?

### C_HousingCatalog.GetCatalogEntryInfoByItem

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo -- ItemID, name, or link of an item that grants/corresponds to a particular type of housing catalog object (ex: decor)

Returns:

- `info`: HousingCatalogEntryInfo?

### C_HousingCatalog.GetCatalogEntryInfoByRecordID

SecretArguments=AllowedWhenUntainted

Arguments:

- `entryType`: HousingCatalogEntryType
- `recordID`: number

Returns:

- `info`: HousingCatalogEntryInfo?

### C_HousingCatalog.GetCatalogEntryRefundTimeStampByRecordID

SecretArguments=AllowedWhenUntainted

Arguments:

- `entryType`: HousingCatalogEntryType
- `recordID`: number

Returns:

- `refundTimeStamp`: time_t?

### C_HousingCatalog.GetCatalogEntryVariantInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `entryVariantID`: HousingCatalogEntryVariantID

Returns:

- `info`: HousingCatalogEntryVariantInfo?

### C_HousingCatalog.GetCatalogSubcategoryInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `subcategoryID`: number

Returns:

- `info`: HousingCatalogSubcategoryInfo?

### C_HousingCatalog.GetDecorMaxOwnedCount -- Returns the maximum total number of decor that can be in storage/in the house chest; Note that not all decor entries in storage count towards this limit (see GetDecorTotalOwnedCount)

Returns:

- `maxOwnedCount`: number

### C_HousingCatalog.GetDecorTotalOwnedCount

Returns:

- `totalOwnedCount`: number -- The total number of owned decor in storage, including both exempt and non-exempt decor
- `exemptDecorCount`: number -- The number of decor that do not count against the max storage limit

### C_HousingCatalog.GetDestroyableInstanceCount -- Returns the number of instances that can be to be destroyed in storage; These instances count towards the max storage limit

SecretArguments=AllowedWhenUntainted

Arguments:

- `entryVariantID`: HousingCatalogEntryVariantID

Returns:

- `destroyableInstanceCount`: number

### C_HousingCatalog.GetFeaturedBundles

Returns:

- `bundleInfos`: table<HousingBundleInfo>

### C_HousingCatalog.GetFeaturedSmallProducts

Returns:

- `infos`: table<HousingFeaturedSmallProductInfo>

### C_HousingCatalog.GetMarketInfoForDecor -- Returns market info for a specific decor. This is decor-only for now but should be extended to support entry type and recordID generically

SecretArguments=AllowedWhenUntainted

Arguments:

- `decorID`: number

Returns:

- `marketInfo`: HousingMarketInfo?

### C_HousingCatalog.HasFeaturedEntries

Returns:

- `hasEntries`: bool

### C_HousingCatalog.HousingMarketActionAddToCart

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `productID`: number
- `withPreview`: bool

### C_HousingCatalog.HousingMarketActionClearCart

HasRestrictions=true

### C_HousingCatalog.HousingMarketActionRemoveFromCart

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `productID`: number

### C_HousingCatalog.HousingMarketActionViewBundle

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `productID`: number

### C_HousingCatalog.HousingMarketActionViewInStore

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `productID`: number

### C_HousingCatalog.IsPreviewCartItemShown

SecretArguments=AllowedWhenUntainted

Arguments:

- `decorGUID`: WOWGUID

Returns:

- `isShown`: bool

### C_HousingCatalog.PromotePreviewDecor

SecretArguments=AllowedWhenUntainted

Arguments:

- `decorID`: number
- `previewDecorGUID`: WOWGUID

Returns:

- `success`: bool

### C_HousingCatalog.RequestHousingMarketInfoRefresh

### C_HousingCatalog.RequestHousingMarketRefundInfo

### C_HousingCatalog.SearchCatalogCategories

SecretArguments=AllowedWhenUntainted

Arguments:

- `searchParams`: HousingCategorySearchInfo

Returns:

- `categoryIDs`: table<number>

### C_HousingCatalog.SearchCatalogSubcategories

SecretArguments=AllowedWhenUntainted

Arguments:

- `searchParams`: HousingCategorySearchInfo

Returns:

- `subcategoryIDs`: table<number>

### C_HousingCatalog.SetPreviewCartItemShown

SecretArguments=AllowedWhenUntainted

Arguments:

- `decorGUID`: WOWGUID
- `shown`: bool

## Events

### HOUSING_CATALOG_CATEGORY_UPDATED

UniqueEvent=true

Payload:

- `categoryID`: number

### HOUSING_CATALOG_SUBCATEGORY_UPDATED

UniqueEvent=true

Payload:

- `subcategoryID`: number

### HOUSING_DECOR_ADD_TO_PREVIEW_LIST

SynchronousEvent=true

Payload:

- `previewItemData`: HousingPreviewItemData

### HOUSING_DECOR_PREVIEW_LIST_REMOVE_FROM_WORLD

SynchronousEvent=true

Payload:

- `decorGUID`: WOWGUID

### HOUSING_DECOR_PREVIEW_LIST_UPDATED

SynchronousEvent=true

### HOUSING_REFUND_LIST_UPDATED

SynchronousEvent=true

### HOUSING_STORAGE_ENTRY_UPDATED

UniqueEvent=true

Payload:

- `entryVariantID`: HousingCatalogEntryVariantID

### HOUSING_STORAGE_UPDATED

UniqueEvent=true

## Tables

### HousingBundleDecorEntryInfo

Fields:

- `decorID`: number
- `quantity`: number

### HousingBundleInfo

Fields:

- `productID`: number
- `price`: number
- `originalPrice`: number?
- `nonDecorProducts`: table<number>
- `decorEntries`: table<HousingBundleDecorEntryInfo>
- `canPreview`: bool [default=true] -- Bundles containing non-decor items cannot be previewed

### HousingCatalogCategoryInfo

Fields:

- `ID`: number
- `orderIndex`: number
- `name`: cstring?
- `icon`: textureAtlas?
- `subcategoryIDs`: table<number>
- `anyStoredEntries`: bool -- True if the player owns anything that falls under this category

### HousingCatalogEntryInfo -- Base information about an object in the Catalog; For info for a specific owned stack of this object, see HousingCatalogEntryVariantInfo

Fields:

- `recordID`: number
- `entryType`: HousingCatalogEntryType
- `itemID`: number?
- `name`: cstring
- `asset`: ModelAsset? -- 3D model asset for displaying in the UI; May be nil if the entry doesn't have a model, or has one that isn't supported by UI model scenes
- `iconTexture`: FileAsset? -- Entry icon in the form of a texture file; Catalog entries should have either this OR an iconAtlas set
- `iconAtlas`: textureAtlas? -- Entry icon in the form a texture atlas element; Catalog entries should have either this OR an iconTexture set
- `uiModelSceneID`: number? -- Specific UI model scene ID to use when previewing this entry's 3D model; If not set, the default catalog model scene is used
- `categoryIDs`: table<number>
- `subcategoryIDs`: table<number>
- `dataTagsByID`: LuaValueVariant -- Simple localized 'tag' strings that are primarily used for things like categorization and filtering
- `size`: HousingCatalogEntrySize
- `placementCost`: number -- How much of the applicable budget placing this entry would cost (if any)
- `totalNumStored`: number -- The total number of instances of this entry that exist in storage across all variants; Does not include unredeemed instances (see remainingRedeemable)
- `remainingRedeemable`: number -- The number of unredeemed instances of this entry that exist in storage; Some auto-awarded housing objects are granted in this 'lazily-instantiated' way, and will be 'redeemed' on first being placed
- `totalNumPlaced`: number -- The total number of instances of this entry that have been placed across all of the player's houses and plots, across all variants
- `destroyableInstanceCount`: number -- The number of instances that can be destroyed for this entry.
- `isUniqueTrophy`: bool -- This decor is flagged to display as a unique trophy item.
- `isAllowedOutdoors`: bool -- True if this entry is something that is allowed to be placed outside, within a plot
- `isAllowedIndoors`: bool -- True if this entry is something that is allowed to be placed indoors, within a house interior
- `canCustomize`: bool -- True if this entry is something that can be customized; Kinds of customization vary depending on the entry type
- `isPrefab`: bool
- `quality`: ItemQuality?
- `firstAcquisitionBonus`: number -- House XP that can be gained upon acquiring this entry for the first time
- `sourceText`: cstring -- Describes specific sources this entry may be gained from; Faction-specific sources may or may not be included based on the current player's faction

### HousingCatalogEntryVariantInfo -- Represents a single stack of instances of an object in the Catalog, that are all of a specific variation; For example, a stack of undyed chairs, or blue-dyed tables

Fields:

- `entryVariantID`: HousingCatalogEntryVariantID
- `numStored`: number -- The number of instances of this specific variant that exist in storage
- `dyeSlots`: table<HousingDecorDyeSlot> -- Dye slot information for this variant; Empty for entries that can't be dyed

### HousingCatalogSubcategoryInfo

Fields:

- `ID`: number
- `orderIndex`: number
- `parentCategoryID`: number
- `name`: cstring?
- `icon`: textureAtlas?
- `anyStoredEntries`: bool -- True if the player owns anything that falls under this subcategory

### HousingCategorySearchInfo

Fields:

- `withStoredEntriesOnly`: bool [default=false] -- If true, search will only return categories/subcategories that the player has something stored under
- `includeFeaturedCategory`: bool [default=false]
- `editorModeContext`: HouseEditorMode? -- If set, will restrict results to only categories associated with/used by this Editor Mode

### HousingFeaturedSmallProductInfo

Fields:

- `entryVariantID`: HousingCatalogEntryVariantID?
- `productID`: number
- `price`: number
- `originalPrice`: number?
- `canPreview`: bool

### HousingMarketInfo

Fields:

- `price`: number
- `productID`: number
- `bundleIDs`: table<number>

### HousingPreviewItemData

Fields:

- `decorGUID`: WOWGUID?
- `productID`: number?
- `bundleCatalogShopProductID`: number?
- `isBundleParent`: bool
- `isBundleChild`: bool
- `id`: number
- `decorID`: number
- `name`: string
- `icon`: number
- `price`: number
- `salePrice`: number?
