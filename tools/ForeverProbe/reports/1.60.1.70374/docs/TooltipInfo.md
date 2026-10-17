# TooltipInfo

Namespace `C_TooltipInfo`.

Environment=All, Predicates={}

## Functions

### C_TooltipInfo.GetAchievementByID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `achievementID`: number

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetAction

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `actionID`: luaIndex

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetArtifactItem

MayReturnNothing=true

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetArtifactPowerByID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `powerID`: number

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetAzeriteEssence

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `essenceID`: number
- `rank`: number?

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetAzeriteEssenceSlot

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `slot`: AzeriteEssenceSlot

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetAzeritePower

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `itemID`: number
- `itemLevel`: number
- `powerID`: number
- `owningItemLink`: cstring?

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetBackpackToken

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetBagItem

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `bagIndex`: BagIndex
- `slotIndex`: luaIndex

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetBagItemChild

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `bagIndex`: BagIndex
- `slotIndex`: luaIndex
- `equipSlotIndex`: luaIndex

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetBuybackItem

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetCompanionPet

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `petGUID`: WOWGUID

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetConduit

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `conduitID`: number
- `conduitRank`: number

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetCurrencyByID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `currencyID`: number
- `amount`: number?

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetCurrencyToken

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `tokenIndex`: luaIndex

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetEnhancedConduit

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `conduitID`: number
- `rank`: number

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetEquipmentSet

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `setID`: number

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetExistingSocketGem

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex
- `toDestroy`: bool?

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetGuildBankItem

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `tab`: luaIndex
- `slot`: luaIndex

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetHeirloomByItemID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `itemID`: number

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetHyperlink

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `hyperlink`: cstring
- `optionalArg1`: number?
- `optionalArg2`: number?
- `hideVendorPrice`: bool?

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetInboxItem

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `messageIndex`: luaIndex
- `attachmentIndex`: luaIndex?

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetInstanceLockEncountersComplete

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetInventoryItem

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken
- `slot`: luaIndex
- `hideUselessStats`: bool?

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetInventoryItemByID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `itemID`: number

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetItemByGUID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `guid`: WOWGUID

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetItemByID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `itemID`: number
- `quality`: number?
- `itemContext`: number?
- `treasureContextLevel`: number?

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetItemByItemModifiedAppearanceID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `itemModifiedAppearanceID`: number

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetItemInteractionItem

MayReturnNothing=true

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetItemKey

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `itemID`: number
- `itemLevel`: number
- `itemSuffix`: number
- `requiredLevel`: number?

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetLFGDungeonReward

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `dungeonID`: number
- `lootIndex`: luaIndex

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetLFGDungeonShortageReward

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `dungeonID`: number
- `shortageSeverity`: luaIndex
- `lootIndex`: luaIndex

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetLootCurrency

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `slot`: luaIndex

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetLootItem

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `slot`: luaIndex

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetLootRollItem

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `id`: number

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetMerchantCostItem

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `slot`: luaIndex
- `costIndex`: luaIndex

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetMerchantItem

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `slot`: luaIndex

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetMinimapMouseover

MayReturnNothing=true

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetMountBySpellID

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `spellID`: SpellIdentifier
- `checkIndoors`: bool? [NeverSecret=true]

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetOutfit

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `outfitID`: number

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetOwnedItemByID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `itemID`: number

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetPetAction

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `slot`: luaIndex

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetPossession

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `slot`: luaIndex

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetPvpBrawl

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `isSpecial`: bool?

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetPvpTalent

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `talentID`: number
- `isInspect`: bool?
- `groupIndex`: luaIndex?
- `talentIndex`: number?

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetQuestCurrency

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `type`: cstring
- `currencyIndex`: luaIndex

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetQuestItem

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `type`: cstring
- `itemIndex`: luaIndex
- `allowCollectionText`: bool?

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetQuestLogCurrency

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `type`: cstring
- `currencyIndex`: luaIndex
- `questID`: number?

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetQuestLogItem

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `type`: cstring
- `itemIndex`: luaIndex
- `questID`: number?
- `allowCollectionText`: bool?

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetQuestLogSpecialItem

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `questIndex`: luaIndex

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetQuestPartyProgress

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number
- `omitTitle`: bool?
- `ignoreActivePlayer`: bool?

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetRecipeRankInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `recipeID`: number
- `rank`: number

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetRecipeReagentItem

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `recipeSpellID`: number
- `dataSlotIndex`: luaIndex

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetRecipeResultItem

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `recipeID`: number
- `reagentInfos`: table<CraftingReagentInfo>?
- `recraftItemGUID`: WOWGUID?
- `recipeLevel`: luaIndex?
- `overrideQualityID`: number?

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetRecipeResultItemForOrder

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `recipeID`: number
- `reagentInfos`: table<CraftingReagentInfo>?
- `orderID`: BigUInteger?
- `recipeLevel`: luaIndex?
- `overrideQualityID`: number?

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetRuneforgeResultItem

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `itemGUID`: WOWGUID
- `itemLevel`: number
- `powerID`: number?
- `modifiers`: table<number>?

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetSendMailItem

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `attachmentIndex`: luaIndex?

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetShapeshift

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `slot`: luaIndex

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetSlottedKeystone

MayReturnNothing=true

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetSocketGem

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetSocketedItem

MayReturnNothing=true

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetSocketedRelic

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `slotIndex`: luaIndex

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetSpellBookItem

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `spellBookItemSlotIndex`: luaIndex
- `spellBookItemSpellBank`: SpellBookSpellBank

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetSpellByID

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `spellID`: SpellIdentifier
- `isPet`: bool? [NeverSecret=true]
- `showSubtext`: bool? [NeverSecret=true]
- `dontOverride`: bool? [NeverSecret=true]
- `difficultyID`: number? [NeverSecret=true]
- `isLink`: bool? [NeverSecret=true]

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetTalent

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `talentID`: number
- `isInspect`: bool?
- `groupIndex`: luaIndex?

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetTotem

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `slot`: luaIndex

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetToyByItemID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `itemID`: number

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetTradePlayerItem

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `slot`: luaIndex

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetTradeTargetItem

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `slot`: luaIndex

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetTrainerService

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `serviceIndex`: luaIndex

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetTraitEntry

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `entryID`: number
- `rank`: number?

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetUnit

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitTokenPvPRestrictedForAddOns
- `hideStatus`: bool?

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetUnitAura

MayReturnNothing=true, RequiresUnitAuraAccess=true, SecretArguments=AllowedWhenUntainted, SecretWhenUnitAuraRestricted=true

Arguments:

- `unitToken`: UnitTokenRestrictedForAddOns [NeverSecret=true]
- `index`: luaIndex
- `filter`: AuraFilters?

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetUnitAuraByAuraInstanceID -- Obtains aura info like other functions with the caveat that the filters will always at least include the typically mutually exclusive HELPFUL|HARMFUL regardless of what the argument value is set to

MayReturnNothing=true, RequiresUnitAuraAccess=true, SecretArguments=AllowedWhenUntainted, SecretWhenUnitAuraRestricted=true

Arguments:

- `unitToken`: UnitTokenRestrictedForAddOns
- `auraInstanceID`: number
- `filter`: AuraFilters?

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetUnitBuff

MayReturnNothing=true, RequiresUnitAuraAccess=true, SecretArguments=AllowedWhenUntainted, SecretWhenUnitAuraRestricted=true

Arguments:

- `unitToken`: UnitTokenRestrictedForAddOns
- `index`: luaIndex
- `filter`: AuraFilters?

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetUnitBuffByAuraInstanceID

MayReturnNothing=true, RequiresUnitAuraAccess=true, SecretArguments=AllowedWhenUntainted, SecretWhenUnitAuraRestricted=true

Arguments:

- `unitToken`: UnitTokenRestrictedForAddOns
- `auraInstanceID`: number
- `filter`: AuraFilters?

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetUnitDebuff

MayReturnNothing=true, RequiresUnitAuraAccess=true, SecretArguments=AllowedWhenUntainted, SecretWhenUnitAuraRestricted=true

Arguments:

- `unitToken`: UnitTokenRestrictedForAddOns
- `index`: luaIndex
- `filter`: AuraFilters?

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetUnitDebuffByAuraInstanceID

MayReturnNothing=true, RequiresUnitAuraAccess=true, SecretArguments=AllowedWhenUntainted, SecretWhenUnitAuraRestricted=true

Arguments:

- `unitToken`: UnitTokenRestrictedForAddOns
- `auraInstanceID`: number
- `filter`: AuraFilters?

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetUpgradeItem

MayReturnNothing=true

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetWeeklyReward

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `itemDBID`: WeeklyRewardItemDBID

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetWorldCursor

MayReturnNothing=true

Returns:

- `data`: TooltipData

### C_TooltipInfo.GetWorldLootObject

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `unitTokenString`: cstring

Returns:

- `data`: TooltipData

## Events

### HIDE_HYPERLINK_TOOLTIP

SynchronousEvent=true

### SHOW_HYPERLINK_TOOLTIP

SynchronousEvent=true

Payload:

- `hyperlink`: string

### TOOLTIP_DATA_UPDATE -- Sends an update to the UI that a sparse or cache lookup has resolved

UniqueEvent=true

Payload:

- `dataInstanceID`: number?
