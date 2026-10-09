# TradeSkillUI

Namespace `C_TradeSkillUI`.

Environment=All, Predicates={}

## Functions

### C_TradeSkillUI.CanStoreEnchantInItem

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemGUID`: WOWGUID

Returns:

- `canStore`: bool

### C_TradeSkillUI.CanTradeSkillShowCraftingUI

SecretArguments=AllowedWhenUntainted

Arguments:

- `tradeSkillSpellID`: number

Returns:

- `canShow`: bool

### C_TradeSkillUI.CancelProfessionRespec

### C_TradeSkillUI.CheckRespecNPC

Returns:

- `canInteract`: bool

### C_TradeSkillUI.CloseTradeSkill

### C_TradeSkillUI.ConfirmProfessionRespec

### C_TradeSkillUI.CraftEnchant

SecretArguments=AllowedWhenUntainted

Arguments:

- `recipeSpellID`: number
- `numCasts`: number [default=1]
- `craftingReagents`: table<CraftingReagentInfo>?
- `itemTarget`: ItemLocation (ItemLocationMixin)?
- `applyConcentration`: bool?

### C_TradeSkillUI.CraftRecipe

SecretArguments=AllowedWhenUntainted

Arguments:

- `recipeSpellID`: number
- `numCasts`: number [default=1]
- `craftingReagents`: table<CraftingReagentInfo>?
- `recipeLevel`: luaIndex?
- `orderID`: BigUInteger?
- `applyConcentration`: bool?

### C_TradeSkillUI.CraftSalvage

SecretArguments=AllowedWhenUntainted

Arguments:

- `recipeSpellID`: number
- `numCasts`: number [default=1]
- `itemTarget`: ItemLocation (ItemLocationMixin)
- `craftingReagents`: table<CraftingReagentInfo>?
- `applyConcentration`: bool?

### C_TradeSkillUI.DoesRecraftingRecipeAcceptItem

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemLocation`: ItemLocation (ItemLocationMixin)
- `recipeID`: number

Returns:

- `result`: bool

### C_TradeSkillUI.GetAllProfessionTradeSkillLines

Returns:

- `skillLineID`: table<number>

### C_TradeSkillUI.GetBaseProfessionInfo

Returns:

- `info`: ProfessionInfo

### C_TradeSkillUI.GetChildProfessionInfo

Returns:

- `info`: ProfessionInfo

### C_TradeSkillUI.GetChildProfessionInfos

Returns:

- `infos`: table<ProfessionInfo>

### C_TradeSkillUI.GetConcentrationCurrencyID

SecretArguments=AllowedWhenUntainted

Arguments:

- `skillLineID`: number

Returns:

- `currencyType`: number

### C_TradeSkillUI.GetCraftableCount

SecretArguments=AllowedWhenUntainted

Arguments:

- `recipeSpellID`: number
- `recipeLevel`: luaIndex?

Returns:

- `numAvailable`: number

### C_TradeSkillUI.GetCraftingOperationInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `recipeID`: number
- `craftingReagents`: table<CraftingReagentInfo>
- `allocationItemGUID`: WOWGUID?
- `applyConcentration`: bool

Returns:

- `info`: CraftingOperationInfo?

### C_TradeSkillUI.GetCraftingOperationInfoForOrder

SecretArguments=AllowedWhenUntainted

Arguments:

- `recipeID`: number
- `craftingReagents`: table<CraftingReagentInfo>
- `orderID`: BigUInteger
- `applyConcentration`: bool

Returns:

- `info`: CraftingOperationInfo?

### C_TradeSkillUI.GetCraftingReagentBonusText

SecretArguments=AllowedWhenUntainted

Arguments:

- `recipeSpellID`: number
- `craftingReagentIndex`: luaIndex
- `craftingReagents`: table<CraftingReagentInfo>
- `allocationItemGUID`: WOWGUID?

Returns:

- `bonusText`: table<string>

### C_TradeSkillUI.GetCraftingTargetItems

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemIDs`: table<number>

Returns:

- `items`: table<CraftingTargetItem>

### C_TradeSkillUI.GetDependentReagents

SecretArguments=AllowedWhenUntainted

Arguments:

- `reagent`: CraftingReagent

Returns:

- `reagents`: table<CraftingReagent>

### C_TradeSkillUI.GetEnchantItems

SecretArguments=AllowedWhenUntainted

Arguments:

- `recipeID`: number
- `craftingReagents`: table<CraftingReagentInfo>?

Returns:

- `items`: table<WOWGUID>

### C_TradeSkillUI.GetFactionSpecificOutputItem

SecretArguments=AllowedWhenUntainted

Arguments:

- `recipeSpellID`: number

Returns:

- `itemID`: number?

### C_TradeSkillUI.GetGatheringOperationInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `recipeID`: number

Returns:

- `info`: GatheringOperationInfo?

### C_TradeSkillUI.GetHideUnownedFlags

SecretArguments=AllowedWhenUntainted

Arguments:

- `recipeID`: number

Returns:

- `cannotModifyHideUnowned`: bool
- `alwaysShowUnowned`: bool

### C_TradeSkillUI.GetItemCraftedQualityByItemInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

Returns:

- `quality`: number?

### C_TradeSkillUI.GetItemCraftedQualityInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

Returns:

- `info`: CraftingQualityInfo?

### C_TradeSkillUI.GetItemReagentQualityByItemInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

Returns:

- `quality`: number?

### C_TradeSkillUI.GetItemReagentQualityInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

Returns:

- `info`: CraftingQualityInfo?

### C_TradeSkillUI.GetItemSlotModifications

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemGUID`: WOWGUID

Returns:

- `slotMods`: table<CraftingItemSlotModification>

### C_TradeSkillUI.GetItemSlotModificationsForOrder

SecretArguments=AllowedWhenUntainted

Arguments:

- `orderID`: BigUInteger

Returns:

- `slotMods`: table<CraftingItemSlotModification>

### C_TradeSkillUI.GetOriginalCraftRecipeID

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemGUID`: WOWGUID

Returns:

- `recipeID`: number?
- `skillLineAbilityID`: number?

### C_TradeSkillUI.GetProfessionByInventorySlot

SecretArguments=AllowedWhenUntainted

Arguments:

- `slot`: luaIndex

Returns:

- `profession`: Profession?

### C_TradeSkillUI.GetProfessionChildSkillLineID

Returns:

- `skillLineID`: number

### C_TradeSkillUI.GetProfessionForCursorItem

Returns:

- `profession`: Profession?

### C_TradeSkillUI.GetProfessionInfoByRecipeID

SecretArguments=AllowedWhenUntainted

Arguments:

- `recipeID`: number

Returns:

- `info`: ProfessionInfo

### C_TradeSkillUI.GetProfessionInfoBySkillLineID

SecretArguments=AllowedWhenUntainted

Arguments:

- `skillLineID`: number

Returns:

- `info`: ProfessionInfo

### C_TradeSkillUI.GetProfessionInventorySlots

Returns:

- `invSlots`: table<InventorySlots>

### C_TradeSkillUI.GetProfessionNameForSkillLineAbility

SecretArguments=AllowedWhenUntainted

Arguments:

- `skillLineAbilityID`: number

Returns:

- `professionNmae`: cstring

### C_TradeSkillUI.GetProfessionSkillLineID

SecretArguments=AllowedWhenUntainted

Arguments:

- `profession`: Profession

Returns:

- `skillLineID`: number

### C_TradeSkillUI.GetProfessionSlots

SecretArguments=AllowedWhenUntainted

Arguments:

- `profession`: Profession

Returns:

- `slots`: table<luaIndex>

### C_TradeSkillUI.GetProfessionSpells

SecretArguments=AllowedWhenUntainted

Arguments:

- `professionID`: number
- `skillLineID`: number?

Returns:

- `knownSpells`: table<number>

### C_TradeSkillUI.GetQualitiesForRecipe

SecretArguments=AllowedWhenUntainted

Arguments:

- `recipeID`: number

Returns:

- `qualityIDs`: table<number>?

### C_TradeSkillUI.GetReagentDifficultyText

SecretArguments=AllowedWhenUntainted

Arguments:

- `craftingReagentIndex`: luaIndex
- `craftingReagents`: table<CraftingReagentInfo>

Returns:

- `bonusText`: string

### C_TradeSkillUI.GetReagentSlotStatus

SecretArguments=AllowedWhenUntainted

Arguments:

- `mcrSlotID`: number
- `recipeSpellID`: number
- `skillLineAbilityID`: number

Returns:

- `locked`: bool
- `lockedReason`: string

### C_TradeSkillUI.GetRecipeDescription

SecretArguments=AllowedWhenUntainted

Arguments:

- `recipeID`: number
- `craftingReagents`: table<CraftingReagentInfo>
- `allocationItemGUID`: WOWGUID?

Returns:

- `description`: string

### C_TradeSkillUI.GetRecipeInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `recipeSpellID`: number
- `recipeLevel`: luaIndex?

Returns:

- `recipeInfo`: TradeSkillRecipeInfo?

### C_TradeSkillUI.GetRecipeInfoForSkillLineAbility

SecretArguments=AllowedWhenUntainted

Arguments:

- `skillLineAbilityID`: number
- `recipeLevel`: luaIndex?

Returns:

- `recipeInfo`: TradeSkillRecipeInfo?

### C_TradeSkillUI.GetRecipeItemQualityInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `recipeID`: number
- `quality`: number

Returns:

- `info`: CraftingQualityInfo?

### C_TradeSkillUI.GetRecipeOutputItemData

SecretArguments=AllowedWhenUntainted

Arguments:

- `recipeSpellID`: number
- `reagents`: table<CraftingReagentInfo>?
- `allocationItemGUID`: WOWGUID?
- `overrideQualityID`: number?
- `recraftOrderID`: BigUInteger?

Returns:

- `outputInfo`: CraftingRecipeOutputInfo

### C_TradeSkillUI.GetRecipeQualityItemIDs

SecretArguments=AllowedWhenUntainted

Arguments:

- `recipeSpellID`: number

Returns:

- `qualityItemIDs`: table<number>?

### C_TradeSkillUI.GetRecipeQualityReagentLink

SecretArguments=AllowedWhenUntainted

Arguments:

- `recipeID`: number
- `dataSlotIndex`: luaIndex
- `qualityIndex`: luaIndex

Returns:

- `link`: cstring

### C_TradeSkillUI.GetRecipeRequirements

SecretArguments=AllowedWhenUntainted

Arguments:

- `recipeID`: number

Returns:

- `requirements`: table<CraftingRecipeRequirement>

### C_TradeSkillUI.GetRecipeSchematic

SecretArguments=AllowedWhenUntainted

Arguments:

- `recipeSpellID`: number
- `isRecraft`: bool
- `recipeLevel`: luaIndex?

Returns:

- `schematic`: CraftingRecipeSchematic

### C_TradeSkillUI.GetRecipesTracked

SecretArguments=AllowedWhenUntainted

Arguments:

- `isRecraft`: bool

Returns:

- `recipeIDs`: table<number>

### C_TradeSkillUI.GetRecraftItems

SecretArguments=AllowedWhenUntainted

Arguments:

- `recipeID`: number?

Returns:

- `items`: table<WOWGUID>

### C_TradeSkillUI.GetRecraftRemovalWarnings

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemGUID`: WOWGUID
- `replacedReagents`: table<CraftingReagent>

Returns:

- `warnings`: table<cstring>

### C_TradeSkillUI.GetRemainingRecasts

Returns:

- `remaining`: number

### C_TradeSkillUI.GetSalvagableItemIDs

SecretArguments=AllowedWhenUntainted

Arguments:

- `recipeID`: number

Returns:

- `itemIDs`: table<number>

### C_TradeSkillUI.GetShowLearned

Returns:

- `flag`: bool

### C_TradeSkillUI.GetShowUnlearned

Returns:

- `flag`: bool

### C_TradeSkillUI.GetSkillLineForGear

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

Returns:

- `skillLineID`: number?

### C_TradeSkillUI.GetSourceTypeFilter

Returns:

- `sourceTypeFilter`: number

### C_TradeSkillUI.GetTradeSkillDisplayName

SecretArguments=AllowedWhenUntainted

Arguments:

- `skillLineID`: number

Returns:

- `professionDisplayName`: cstring

### C_TradeSkillUI.HasFavoriteOrderRecipes

Returns:

- `hasFavorites`: bool

### C_TradeSkillUI.IsEnchantTargetValid

SecretArguments=AllowedWhenUntainted

Arguments:

- `recipeID`: number
- `itemGUID`: WOWGUID
- `craftingReagents`: table<CraftingReagentInfo>?

Returns:

- `valid`: bool

### C_TradeSkillUI.IsGuildTradeSkillsEnabled

Returns:

- `enabled`: bool

### C_TradeSkillUI.IsNPCCrafting

Returns:

- `result`: bool

### C_TradeSkillUI.IsNearProfessionSpellFocus

SecretArguments=AllowedWhenUntainted

Arguments:

- `profession`: Profession

Returns:

- `nearFocus`: bool

### C_TradeSkillUI.IsOriginalCraftRecipeLearned

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemGUID`: WOWGUID

Returns:

- `learned`: bool

### C_TradeSkillUI.IsRecipeFirstCraft

SecretArguments=AllowedWhenUntainted

Arguments:

- `recipeID`: number

Returns:

- `result`: bool

### C_TradeSkillUI.IsRecipeInBaseSkillLine

SecretArguments=AllowedWhenUntainted

Arguments:

- `recipeID`: number

Returns:

- `result`: bool

### C_TradeSkillUI.IsRecipeInSkillLine

SecretArguments=AllowedWhenUntainted

Arguments:

- `recipeID`: number
- `skillLineID`: number

Returns:

- `result`: bool

### C_TradeSkillUI.IsRecipeProfessionLearned

SecretArguments=AllowedWhenUntainted

Arguments:

- `recipeID`: number

Returns:

- `recipeProfessionLearned`: bool

### C_TradeSkillUI.IsRecipeTracked

SecretArguments=AllowedWhenUntainted

Arguments:

- `recipeID`: number
- `isRecraft`: bool

Returns:

- `tracked`: bool

### C_TradeSkillUI.IsRecraftItemEquipped

SecretArguments=AllowedWhenUntainted

Arguments:

- `recraftItemGUID`: WOWGUID

Returns:

- `isEquipped`: bool

### C_TradeSkillUI.IsRecraftReagentValid

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemGUID`: WOWGUID
- `reagent`: CraftingReagent

Returns:

- `valid`: bool

### C_TradeSkillUI.IsRuneforging

Returns:

- `result`: bool

### C_TradeSkillUI.OpenRecipe

SecretArguments=AllowedWhenUntainted

Arguments:

- `recipeID`: number

### C_TradeSkillUI.OpenTradeSkill

SecretArguments=AllowedWhenUntainted

Arguments:

- `skillLineID`: number

Returns:

- `opened`: bool

### C_TradeSkillUI.RecraftLimitCategoryValid

SecretArguments=AllowedWhenUntainted

Arguments:

- `reagent`: CraftingReagent

Returns:

- `recraftValid`: bool

### C_TradeSkillUI.RecraftRecipe

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemGUID`: WOWGUID
- `craftingReagents`: table<CraftingReagentInfo>?
- `removedModifications`: table<CraftingItemSlotModification>?
- `applyConcentration`: bool?

Returns:

- `result`: bool

### C_TradeSkillUI.RecraftRecipeForOrder

SecretArguments=AllowedWhenUntainted

Arguments:

- `orderID`: BigUInteger
- `itemGUID`: WOWGUID
- `craftingReagents`: table<CraftingReagentInfo>?
- `removedModifications`: table<CraftingItemSlotModification>?
- `applyConcentration`: bool?

Returns:

- `result`: bool

### C_TradeSkillUI.SetOnlyShowAvailableForOrders

SecretArguments=AllowedWhenUntainted

Arguments:

- `flag`: bool

### C_TradeSkillUI.SetProfessionChildSkillLineID

SecretArguments=AllowedWhenUntainted

Arguments:

- `skillLineID`: number

### C_TradeSkillUI.SetRecipeTracked

SecretArguments=AllowedWhenUntainted

Arguments:

- `recipeID`: number
- `tracked`: bool
- `isRecraft`: bool

### C_TradeSkillUI.SetShowLearned

SecretArguments=AllowedWhenUntainted

Arguments:

- `flag`: bool

### C_TradeSkillUI.SetShowUnlearned

SecretArguments=AllowedWhenUntainted

Arguments:

- `flag`: bool

### C_TradeSkillUI.SetSourceTypeFilter

SecretArguments=AllowedWhenUntainted

Arguments:

- `sourceTypeFilter`: number

## Events

### CRAFTING_DETAILS_UPDATE

SynchronousEvent=true

### NEW_RECIPE_LEARNED

SynchronousEvent=true

Payload:

- `recipeID`: number
- `recipeLevel`: luaIndex?
- `baseRecipeID`: number?

### OBLITERUM_FORGE_PENDING_ITEM_CHANGED

SynchronousEvent=true

### OPEN_RECIPE_RESPONSE

SynchronousEvent=true

Payload:

- `recipeID`: number
- `skillLineID`: number
- `expansionSkillLineID`: number

### PROFESSION_RESPEC_CONFIRMATION

SynchronousEvent=true

Payload:

- `skillName`: cstring

### TRACKED_RECIPE_UPDATE

SynchronousEvent=true

Payload:

- `recipeID`: number
- `tracked`: bool

### TRADE_SKILL_CLOSE

SynchronousEvent=true

### TRADE_SKILL_CRAFT_BEGIN

SynchronousEvent=true

Payload:

- `recipeSpellID`: number

### TRADE_SKILL_CRAFTING_REAGENT_BONUS_TEXT_UPDATED

SynchronousEvent=true

Payload:

- `itemID`: number

### TRADE_SKILL_CURRENCY_REWARD_RESULT

SynchronousEvent=true

Payload:

- `data`: CraftingCurrencyResultData

### TRADE_SKILL_DATA_SOURCE_CHANGED

UniqueEvent=true

### TRADE_SKILL_DATA_SOURCE_CHANGING

UniqueEvent=true

### TRADE_SKILL_DETAILS_UPDATE

UniqueEvent=true

### TRADE_SKILL_FAVORITES_CHANGED

UniqueEvent=true

Payload:

- `isFavorite`: bool
- `recipeSpellID`: number

### TRADE_SKILL_ITEM_CRAFTED_RESULT

SynchronousEvent=true

Payload:

- `data`: CraftingItemResultData

### TRADE_SKILL_ITEM_UPDATE

SynchronousEvent=true

Payload:

- `itemGUID`: WOWGUID

### TRADE_SKILL_LIST_UPDATE

UniqueEvent=true

### TRADE_SKILL_NAME_UPDATE

SynchronousEvent=true

### TRADE_SKILL_SHOW

SynchronousEvent=true

### UPDATE_TRADESKILL_CAST_STOPPED

UniqueEvent=true

Payload:

- `isScrapping`: bool
