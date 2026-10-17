# TransmogrifyCollection

Namespace `C_TransmogCollection`.

Environment=All, Predicates={}

## Functions

### C_TransmogCollection.AccountCanCollectSource

SecretArguments=AllowedWhenUntainted

Arguments:

- `sourceID`: number

Returns:

- `hasItemData`: bool
- `canCollect`: bool

### C_TransmogCollection.AreAllCollectionTypeFiltersChecked

Returns:

- `areAllCollectionTypeFiltersChecked`: bool

### C_TransmogCollection.AreAllSourceTypeFiltersChecked

Returns:

- `areAllSourceTypeFiltersChecked`: bool

### C_TransmogCollection.CanAppearanceHaveIllusion

SecretArguments=AllowedWhenUntainted

Arguments:

- `appearanceID`: number

Returns:

- `canHaveIllusion`: bool

### C_TransmogCollection.ClearNewAppearance

SecretArguments=AllowedWhenUntainted

Arguments:

- `visualID`: number

### C_TransmogCollection.ClearSearch

SecretArguments=AllowedWhenUntainted

Arguments:

- `searchType`: TransmogSearchType

Returns:

- `completed`: bool

### C_TransmogCollection.DeleteCustomSet

SecretArguments=AllowedWhenUntainted

Arguments:

- `customSetID`: number

### C_TransmogCollection.EndSearch

### C_TransmogCollection.GetAllAppearanceSources

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemAppearanceID`: number

Returns:

- `itemModifiedAppearanceIDs`: table<number>

### C_TransmogCollection.GetAllFactionsShown

Returns:

- `shown`: bool

### C_TransmogCollection.GetAllRacesShown

Returns:

- `shown`: bool

### C_TransmogCollection.GetAppearanceCameraID

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemAppearanceID`: number
- `variation`: TransmogCameraVariation?

Returns:

- `cameraID`: number

### C_TransmogCollection.GetAppearanceCameraIDBySource

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemModifiedAppearanceID`: number
- `variation`: TransmogCameraVariation?

Returns:

- `cameraID`: number

### C_TransmogCollection.GetAppearanceInfoBySource

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `itemModifiedAppearanceID`: number

Returns:

- `info`: TransmogAppearanceInfoBySourceData

### C_TransmogCollection.GetAppearanceSourceDrops

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `itemModifiedAppearanceID`: number

Returns:

- `encounterInfo`: table<TransmogAppearanceJournalEncounterInfo>

### C_TransmogCollection.GetAppearanceSourceInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `itemModifiedAppearanceID`: number

Returns:

- `info`: TransmogAppearanceSourceInfoData

### C_TransmogCollection.GetAppearanceSources

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `appearanceID`: number
- `categoryType`: TransmogCollectionType?
- `transmogLocation`: TransmogLocation (TransmogLocationMixin)?

Returns:

- `sources`: table<AppearanceSourceInfo>

### C_TransmogCollection.GetArtifactAppearanceStrings

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `appearanceID`: number

Returns:

- `name`: cstring
- `hyperlink`: cstring

### C_TransmogCollection.GetCategoryAppearances

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `category`: TransmogCollectionType
- `transmogLocation`: TransmogLocation (TransmogLocationMixin)?
- `option`: TransmogOutfitSlotOption?

Returns:

- `appearances`: table<TransmogCategoryAppearanceInfo>

### C_TransmogCollection.GetCategoryCollectedCount

SecretArguments=AllowedWhenUntainted

Arguments:

- `category`: TransmogCollectionType

Returns:

- `count`: number

### C_TransmogCollection.GetCategoryForItem

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `itemModifiedAppearanceID`: number

Returns:

- `collectionCategory`: TransmogCollectionType

### C_TransmogCollection.GetCategoryInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `category`: TransmogCollectionType

Returns:

- `name`: cstring
- `isWeapon`: bool [default=false]
- `canHaveIllusions`: bool [default=false]
- `canMainHand`: bool [default=false]
- `canOffHand`: bool [default=false]
- `canRanged`: bool [default=false]

### C_TransmogCollection.GetCategoryTotal

SecretArguments=AllowedWhenUntainted

Arguments:

- `category`: TransmogCollectionType

Returns:

- `total`: number

### C_TransmogCollection.GetClassFilter

Returns:

- `classID`: number

### C_TransmogCollection.GetCollectedShown

Returns:

- `shown`: bool

### C_TransmogCollection.GetCustomSetHyperlinkFromItemTransmogInfoList

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `itemTransmogInfoList`: table<ItemTransmogInfo>

Returns:

- `hyperlink`: cstring

### C_TransmogCollection.GetCustomSetInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `customSetID`: number

Returns:

- `name`: cstring
- `icon`: fileID

### C_TransmogCollection.GetCustomSetItemTransmogInfoList

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `customSetID`: number

Returns:

- `list`: table<ItemTransmogInfo>

### C_TransmogCollection.GetCustomSets

Returns:

- `customSetID`: table<number>

### C_TransmogCollection.GetFallbackWeaponAppearance

Returns:

- `appearanceID`: number?

### C_TransmogCollection.GetFilteredCategoryCollectedCount

SecretArguments=AllowedWhenUntainted

Arguments:

- `category`: TransmogCollectionType

Returns:

- `count`: number

### C_TransmogCollection.GetFilteredCategoryTotal

SecretArguments=AllowedWhenUntainted

Arguments:

- `category`: TransmogCollectionType

Returns:

- `total`: number

### C_TransmogCollection.GetIllusionInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `illusionID`: number

Returns:

- `info`: TransmogIllusionInfo

### C_TransmogCollection.GetIllusionStrings

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `illusionID`: number

Returns:

- `name`: string
- `hyperlink`: string
- `sourceText`: string?

### C_TransmogCollection.GetIllusions

SecretArguments=AllowedWhenUntainted

Arguments:

- `category`: TransmogCollectionType?

Returns:

- `illusions`: table<TransmogIllusionInfo>

### C_TransmogCollection.GetInspectItemTransmogInfoList

MayReturnNothing=true

Returns:

- `list`: table<ItemTransmogInfo>

### C_TransmogCollection.GetIsAppearanceFavorite

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemAppearanceID`: number

Returns:

- `isFavorite`: bool

### C_TransmogCollection.GetItemInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

Returns:

- `itemAppearanceID`: number
- `itemModifiedAppearanceID`: number

### C_TransmogCollection.GetItemTransmogInfoListFromCustomSetHyperlink

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `hyperlink`: cstring

Returns:

- `list`: table<ItemTransmogInfo>

### C_TransmogCollection.GetLatestAppearance

MayReturnNothing=true

Returns:

- `visualID`: number
- `category`: TransmogCollectionType

### C_TransmogCollection.GetNumMaxCustomSets

Returns:

- `maxCustomSets`: number

### C_TransmogCollection.GetNumTransmogSources

Returns:

- `count`: number

### C_TransmogCollection.GetPairedArtifactAppearance

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `itemModifiedAppearanceID`: number

Returns:

- `pairedItemModifiedAppearanceID`: number

### C_TransmogCollection.GetSourceIcon

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `itemModifiedAppearanceID`: number

Returns:

- `icon`: fileID

### C_TransmogCollection.GetSourceInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `sourceID`: number

Returns:

- `sourceInfo`: AppearanceSourceInfo

### C_TransmogCollection.GetSourceItemID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `itemModifiedAppearanceID`: number

Returns:

- `itemID`: number

### C_TransmogCollection.GetSourceRequiredHoliday

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `itemModifiedAppearanceID`: number

Returns:

- `holidayName`: string

### C_TransmogCollection.GetUncollectedShown

Returns:

- `shown`: bool

### C_TransmogCollection.GetValidAppearanceSourcesForClass

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `appearanceID`: number
- `classID`: number
- `categoryType`: TransmogCollectionType?
- `transmogLocation`: TransmogLocation (TransmogLocationMixin)?

Returns:

- `sources`: table<AppearanceSourceInfo>

### C_TransmogCollection.HasAnyAppearance

Returns:

- `hasAnyAppearance`: bool

### C_TransmogCollection.HasFavorites

Returns:

- `hasFavorites`: bool

### C_TransmogCollection.IsAppearanceHiddenVisual

SecretArguments=AllowedWhenUntainted

Arguments:

- `appearanceID`: number

Returns:

- `isHiddenVisual`: bool

### C_TransmogCollection.IsCategoryValidForItem

SecretArguments=AllowedWhenUntainted

Arguments:

- `category`: TransmogCollectionType
- `itemInfo`: ItemInfo

Returns:

- `isValid`: bool

### C_TransmogCollection.IsNewAppearance

SecretArguments=AllowedWhenUntainted

Arguments:

- `visualID`: number

Returns:

- `isNew`: bool

### C_TransmogCollection.IsSearchDBLoading

Returns:

- `isLoading`: bool

### C_TransmogCollection.IsSearchInProgress

SecretArguments=AllowedWhenUntainted

Arguments:

- `searchType`: TransmogSearchType

Returns:

- `inProgress`: bool

### C_TransmogCollection.IsSourceTypeFilterChecked

SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex

Returns:

- `checked`: bool

### C_TransmogCollection.IsSpellItemEnchantmentHiddenVisual

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellItemEnchantmentID`: number

Returns:

- `isHiddenVisual`: bool

### C_TransmogCollection.IsUsingDefaultFilters

Returns:

- `isUsingDefaultFilters`: bool

### C_TransmogCollection.IsValidCustomSetName

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: cstring

Returns:

- `isApproved`: bool

### C_TransmogCollection.IsValidTransmogSource

SecretArguments=AllowedWhenUntainted

Arguments:

- `source`: TransmogSource

Returns:

- `valid`: bool

### C_TransmogCollection.ModifyCustomSet

SecretArguments=AllowedWhenUntainted

Arguments:

- `customSetID`: number
- `itemTransmogInfoList`: table<ItemTransmogInfo>

### C_TransmogCollection.NewCustomSet

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: cstring
- `icon`: fileID
- `itemTransmogInfoList`: table<ItemTransmogInfo>

Returns:

- `customSetID`: number?

### C_TransmogCollection.PlayerCanCollectSource

SecretArguments=AllowedWhenUntainted

Arguments:

- `sourceID`: number

Returns:

- `hasItemData`: bool
- `canCollect`: bool

### C_TransmogCollection.PlayerHasTransmog

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemID`: number
- `itemAppearanceModID`: number [default=0]

Returns:

- `hasTransmog`: bool

### C_TransmogCollection.PlayerHasTransmogByItemInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

Returns:

- `hasTransmog`: bool

### C_TransmogCollection.PlayerHasTransmogItemModifiedAppearance

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemModifiedAppearanceID`: number

Returns:

- `hasTransmog`: bool

### C_TransmogCollection.PlayerKnowsSource

SecretArguments=AllowedWhenUntainted

Arguments:

- `sourceID`: number

Returns:

- `isKnown`: bool

### C_TransmogCollection.RenameCustomSet

SecretArguments=AllowedWhenUntainted

Arguments:

- `customSetID`: number
- `name`: cstring

### C_TransmogCollection.SearchProgress

SecretArguments=AllowedWhenUntainted

Arguments:

- `searchType`: TransmogSearchType

Returns:

- `progress`: number

### C_TransmogCollection.SearchSize

SecretArguments=AllowedWhenUntainted

Arguments:

- `searchType`: TransmogSearchType

Returns:

- `size`: number

### C_TransmogCollection.SetAllCollectionTypeFilters

SecretArguments=AllowedWhenUntainted

Arguments:

- `checked`: bool

### C_TransmogCollection.SetAllFactionsShown

SecretArguments=AllowedWhenUntainted

Arguments:

- `shown`: bool

### C_TransmogCollection.SetAllRacesShown

SecretArguments=AllowedWhenUntainted

Arguments:

- `shown`: bool

### C_TransmogCollection.SetAllSourceTypeFilters

SecretArguments=AllowedWhenUntainted

Arguments:

- `checked`: bool

### C_TransmogCollection.SetClassFilter

SecretArguments=AllowedWhenUntainted

Arguments:

- `classID`: number

### C_TransmogCollection.SetCollectedShown

SecretArguments=AllowedWhenUntainted

Arguments:

- `shown`: bool

### C_TransmogCollection.SetDefaultFilters

### C_TransmogCollection.SetIsAppearanceFavorite

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemAppearanceID`: number
- `isFavorite`: bool

### C_TransmogCollection.SetSearch

SecretArguments=AllowedWhenUntainted

Arguments:

- `searchType`: TransmogSearchType
- `searchText`: string

Returns:

- `completed`: bool

### C_TransmogCollection.SetSearchAndFilterCategory

SecretArguments=AllowedWhenUntainted

Arguments:

- `category`: TransmogCollectionType

### C_TransmogCollection.SetSourceTypeFilter

SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex
- `checked`: bool

### C_TransmogCollection.SetUncollectedShown

SecretArguments=AllowedWhenUntainted

Arguments:

- `shown`: bool

### C_TransmogCollection.UpdateUsableAppearances

## Tables

### TransmogCameraVariation

MaxValue=1, MinValue=0, NumValues=3

Fields:

- `None`: TransmogCameraVariation [= 0]
- `RightShoulder`: TransmogCameraVariation [= 1]
- `CloakBackpack`: TransmogCameraVariation [= 1]

### TransmogAppearanceInfoBySourceData

Fields:

- `appearanceID`: number
- `appearanceIsCollected`: bool
- `sourceIsCollected`: bool
- `sourceIsCollectedPermanent`: bool
- `sourceIsCollectedConditional`: bool
- `meetsTransmogPlayerCondition`: bool
- `appearanceHasAnyNonLevelRequirements`: bool
- `appearanceMeetsNonLevelRequirements`: bool
- `appearanceIsUsable`: bool
- `appearanceNumSources`: number
- `sourceIsKnown`: bool
- `canDisplayOnPlayer`: bool
- `isAnySourceValidForPlayer`: bool

### TransmogAppearanceJournalEncounterInfo

Fields:

- `instance`: string
- `instanceType`: number
- `tiers`: table<string>
- `encounter`: string
- `difficulties`: table<string>

### TransmogAppearanceSourceInfoData

Fields:

- `category`: TransmogCollectionType
- `itemAppearanceID`: number
- `canHaveIllusion`: bool
- `icon`: fileID
- `isCollected`: bool
- `itemLink`: string
- `transmoglink`: string
- `sourceType`: luaIndex?
- `itemSubclass`: number
- `ignoreModelAttachmentChecksForIllusion`: bool

### TransmogCategoryAppearanceInfo

Fields:

- `visualID`: number
- `isCollected`: bool
- `isFavorite`: bool
- `isHideVisual`: bool
- `canDisplayOnPlayer`: bool
- `uiOrder`: number
- `exclusions`: number
- `isUsable`: bool
- `hasRequiredHoliday`: bool
- `hasActiveRequiredHoliday`: bool
- `minIlvl`: number
- `isValidForEquippedItem`: bool
- `alwaysShowItem`: bool? -- For internal testing only

### TransmogCategoryInfo

Fields:

- `name`: cstring
- `isWeapon`: bool [default=false]
- `canHaveIllusions`: bool [default=false]
- `canMainHand`: bool [default=false]
- `canOffHand`: bool [default=false]
- `canRanged`: bool [default=false]

### TransmogCustomSetInfo

Fields:

- `name`: cstring
- `icon`: fileID

### TransmogIllusionInfo

Fields:

- `visualID`: number
- `sourceID`: number
- `icon`: fileID
- `isCollected`: bool
- `isUsable`: bool
- `isHideVisual`: bool
