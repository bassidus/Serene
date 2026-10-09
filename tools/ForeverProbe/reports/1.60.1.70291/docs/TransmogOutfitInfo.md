# TransmogOutfitInfo

Namespace `C_TransmogOutfitInfo`.

Environment=All, Predicates={}

## Functions

### C_TransmogOutfitInfo.AddNewOutfit

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: cstring
- `icon`: fileID

### C_TransmogOutfitInfo.CanPlayerTransmogSlot

SecretArguments=AllowedWhenUntainted

Arguments:

- `slot`: TransmogOutfitSlot

Returns:

- `valid`: bool

### C_TransmogOutfitInfo.ChangeDisplayedOutfit

SecretArguments=AllowedWhenUntainted

Arguments:

- `outfitID`: number
- `trigger`: TransmogSituationTrigger
- `toggleLock`: bool
- `allowRemoveOutfit`: bool

### C_TransmogOutfitInfo.ChangeToOutfit

SecretArguments=AllowedWhenUntainted

Arguments:

- `playerFacingOutfitIndex`: number
- `allowRemoveOutfit`: bool

### C_TransmogOutfitInfo.ChangeViewedOutfit

SecretArguments=AllowedWhenUntainted

Arguments:

- `outfitID`: number

### C_TransmogOutfitInfo.ClearAllPendingSituations

### C_TransmogOutfitInfo.ClearAllPendingTransmogs

### C_TransmogOutfitInfo.ClearDisplayedOutfit

SecretArguments=AllowedWhenUntainted

Arguments:

- `trigger`: TransmogSituationTrigger
- `toggleLock`: bool

### C_TransmogOutfitInfo.ClearOutfit

### C_TransmogOutfitInfo.CommitAndApplyAllPending

SecretArguments=AllowedWhenUntainted

Arguments:

- `useAvailableDiscount`: bool

### C_TransmogOutfitInfo.CommitOutfitInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `outfitID`: number
- `name`: cstring
- `icon`: fileID

### C_TransmogOutfitInfo.CommitPendingSituations

### C_TransmogOutfitInfo.GetActiveOutfitID

Returns:

- `outfitID`: number

### C_TransmogOutfitInfo.GetAllSlotLocationInfo

MayReturnNothing=true

Returns:

- `appearanceSlotInfo`: table<TransmogOutfitSlotInfo>
- `illusionSlotInfo`: table<TransmogOutfitSlotInfo>

### C_TransmogOutfitInfo.GetAllTransmogOutfitOptionSheatheCategoryInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `imaID`: number

Returns:

- `categoryInfo`: table<TransmogOutfitOptionSheatheCategoryInfo>

### C_TransmogOutfitInfo.GetCollectionInfoForSlotAndOption

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `slot`: TransmogOutfitSlot
- `option`: TransmogOutfitSlotOption
- `collectionType`: TransmogCollectionType

Returns:

- `collectionInfo`: TransmogOutfitCollectionInfo

### C_TransmogOutfitInfo.GetCurrentlyViewedOutfitID

Returns:

- `outfitID`: number

### C_TransmogOutfitInfo.GetEquippedSlotOptionFromTransmogSlot

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `slot`: TransmogOutfitSlot

Returns:

- `option`: TransmogOutfitSlotOption

### C_TransmogOutfitInfo.GetIllusionDefaultIMAIDForCollectionType

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `collectionType`: TransmogCollectionType

Returns:

- `imaID`: number

### C_TransmogOutfitInfo.GetItemModifiedAppearanceEffectiveCategory

SecretArguments=AllowedWhenUntainted

Arguments:

- `imaID`: number

Returns:

- `categoryID`: TransmogCollectionType

### C_TransmogOutfitInfo.GetLinkedSlotInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `slot`: TransmogOutfitSlot

Returns:

- `linkedSlotInfo`: TransmogOutfitLinkedSlotInfo

### C_TransmogOutfitInfo.GetMaxNumberOfTotalOutfitsForSource

SecretArguments=AllowedWhenUntainted

Arguments:

- `source`: TransmogOutfitEntrySource

Returns:

- `maxOutfitCount`: number

### C_TransmogOutfitInfo.GetMaxNumberOfUsableOutfits

Returns:

- `maxOutfitCount`: number

### C_TransmogOutfitInfo.GetNextOutfitCost

Returns:

- `outfitCost`: BigUInteger

### C_TransmogOutfitInfo.GetNumberOfOutfitsUnlockedForSource

SecretArguments=AllowedWhenUntainted

Arguments:

- `source`: TransmogOutfitEntrySource

Returns:

- `unlockedOutfitCount`: number

### C_TransmogOutfitInfo.GetOptionsForSlot

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `slot`: TransmogOutfitSlot

Returns:

- `options`: table<TransmogOutfitOptionInfo>
- `artifactOptions`: table<TransmogOutfitOptionInfo>?

### C_TransmogOutfitInfo.GetOutfitInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `outfitID`: number

Returns:

- `outfitInfo`: TransmogOutfitEntryInfo

### C_TransmogOutfitInfo.GetOutfitInfoByName

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: cstring -- Case-insensitive outfit name to search for. If multiple exist with the same name, it is unspecified which outfit will be returned.

Returns:

- `outfitInfo`: TransmogOutfitEntryInfo

### C_TransmogOutfitInfo.GetOutfitInfoByPlayerFacingIndex

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `playerFacingOutfitIndex`: number

Returns:

- `outfitInfo`: TransmogOutfitEntryInfo

### C_TransmogOutfitInfo.GetOutfitSituation

SecretArguments=AllowedWhenUntainted

Arguments:

- `option`: TransmogSituationOption

Returns:

- `value`: bool

### C_TransmogOutfitInfo.GetOutfitSituationsEnabled

Returns:

- `enabled`: bool

### C_TransmogOutfitInfo.GetOutfitsInfo

MayReturnNothing=true

Returns:

- `outfitsInfo`: table<TransmogOutfitEntryInfo>

### C_TransmogOutfitInfo.GetPendingTransmogCost

MayReturnNothing=true

Returns:

- `cost`: BigUInteger
- `modifierFlags`: number

### C_TransmogOutfitInfo.GetSecondarySlotState

SecretArguments=AllowedWhenUntainted

Arguments:

- `slot`: TransmogOutfitSlot

Returns:

- `state`: bool

### C_TransmogOutfitInfo.GetSetSourcesForSlot

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `transmogSetID`: number
- `slot`: TransmogOutfitSlot

Returns:

- `sources`: table<AppearanceSourceInfo>

### C_TransmogOutfitInfo.GetSlotGroupInfo

MayReturnNothing=true

Returns:

- `slotGroups`: table<TransmogOutfitSlotGroup>

### C_TransmogOutfitInfo.GetSourceIDsForSlot

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `transmogSetID`: number
- `slot`: TransmogOutfitSlot

Returns:

- `sources`: table<number>

### C_TransmogOutfitInfo.GetTransmogOutfitSlotForInventoryType

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `inventoryType`: luaIndex

Returns:

- `slot`: TransmogOutfitSlot

### C_TransmogOutfitInfo.GetTransmogOutfitSlotFromInventorySlot

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `inventorySlot`: InventorySlots

Returns:

- `slot`: TransmogOutfitSlot

### C_TransmogOutfitInfo.GetUISituationCategoriesAndOptions

MayReturnNothing=true

Returns:

- `categoryData`: table<TransmogSituationCategory>

### C_TransmogOutfitInfo.GetUnassignedAtlasForSlot

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `slot`: TransmogOutfitSlot

Returns:

- `atlas`: textureAtlas

### C_TransmogOutfitInfo.GetUnassignedDisplayAtlasForSlot

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `slot`: TransmogOutfitSlot

Returns:

- `atlas`: textureAtlas

### C_TransmogOutfitInfo.GetViewedOutfitSlotInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `slot`: TransmogOutfitSlot
- `type`: TransmogType
- `option`: TransmogOutfitSlotOption

Returns:

- `slotInfo`: ViewedTransmogOutfitSlotInfo

### C_TransmogOutfitInfo.HasPendingOutfitSituations

Returns:

- `hasPending`: bool

### C_TransmogOutfitInfo.HasPendingOutfitTransmogs

Returns:

- `hasPending`: bool

### C_TransmogOutfitInfo.InTransmogEvent

Returns:

- `inTransmogEvent`: bool

### C_TransmogOutfitInfo.IsEquippedGearOutfitDisplayed

Returns:

- `isDisplayed`: bool

### C_TransmogOutfitInfo.IsEquippedGearOutfitLocked

Returns:

- `isLocked`: bool

### C_TransmogOutfitInfo.IsLockedOutfit

SecretArguments=AllowedWhenUntainted

Arguments:

- `outfitID`: number

Returns:

- `isLocked`: bool

### C_TransmogOutfitInfo.IsSlotWeaponSlot

SecretArguments=AllowedWhenUntainted

Arguments:

- `slot`: TransmogOutfitSlot

Returns:

- `isWeaponSlot`: bool

### C_TransmogOutfitInfo.IsTransmogEnabled

Returns:

- `enabled`: bool

### C_TransmogOutfitInfo.IsUsableDiscountAvailable

Returns:

- `isAvailable`: bool

### C_TransmogOutfitInfo.IsValidTransmogOutfitName

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: cstring

Returns:

- `isApproved`: bool

### C_TransmogOutfitInfo.PickupOutfit

SecretArguments=AllowedWhenUntainted

Arguments:

- `outfitID`: number

### C_TransmogOutfitInfo.ResetOutfitSituations

### C_TransmogOutfitInfo.RevertPendingTransmog

SecretArguments=AllowedWhenUntainted

Arguments:

- `slot`: TransmogOutfitSlot
- `type`: TransmogType
- `option`: TransmogOutfitSlotOption

### C_TransmogOutfitInfo.SetOutfitSituationsEnabled

SecretArguments=AllowedWhenUntainted

Arguments:

- `enabled`: bool

### C_TransmogOutfitInfo.SetOutfitToCustomSet

SecretArguments=AllowedWhenUntainted

Arguments:

- `transmogCustomSetID`: number

### C_TransmogOutfitInfo.SetOutfitToOutfit

SecretArguments=AllowedWhenUntainted

Arguments:

- `outfitID`: number

### C_TransmogOutfitInfo.SetOutfitToSet

SecretArguments=AllowedWhenUntainted

Arguments:

- `transmogSetID`: number

### C_TransmogOutfitInfo.SetPendingTransmog

SecretArguments=AllowedWhenUntainted

Arguments:

- `slot`: TransmogOutfitSlot
- `type`: TransmogType
- `option`: TransmogOutfitSlotOption
- `transmogID`: number
- `displayType`: TransmogOutfitDisplayType

### C_TransmogOutfitInfo.SetPendingTransmogSheatheCategory

SecretArguments=AllowedWhenUntainted

Arguments:

- `slot`: TransmogOutfitSlot
- `option`: TransmogOutfitSlotOption
- `category`: TransmogOutfitSlotOptionSheatheCategory

### C_TransmogOutfitInfo.SetSecondarySlotState

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `slot`: TransmogOutfitSlot
- `state`: bool

### C_TransmogOutfitInfo.SetViewedOptionForSlot

SecretArguments=AllowedWhenUntainted

Arguments:

- `slot`: TransmogOutfitSlot
- `option`: TransmogOutfitSlotOption

### C_TransmogOutfitInfo.SlotHasSecondary

SecretArguments=AllowedWhenUntainted

Arguments:

- `slot`: TransmogOutfitSlot

Returns:

- `hasSecondary`: bool

### C_TransmogOutfitInfo.TransmogEventActive

Returns:

- `transmogEventActive`: bool

### C_TransmogOutfitInfo.UpdatePendingSituation

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `option`: TransmogSituationOption
- `value`: bool

## Events

### TRANSMOG_DISPLAYED_OUTFIT_CHANGED

SynchronousEvent=true

### TRANSMOG_OUTFITS_CHANGED

SynchronousEvent=true

Payload:

- `newOutfitID`: number?

### VIEWED_TRANSMOG_OUTFIT_CHANGED

SynchronousEvent=true

### VIEWED_TRANSMOG_OUTFIT_SECONDARY_SLOTS_CHANGED

SynchronousEvent=true

### VIEWED_TRANSMOG_OUTFIT_SITUATIONS_CHANGED

SynchronousEvent=true

### VIEWED_TRANSMOG_OUTFIT_SLOT_OPTION_CHANGED

SynchronousEvent=true

Payload:

- `slot`: TransmogOutfitSlot
- `option`: TransmogOutfitSlotOption

### VIEWED_TRANSMOG_OUTFIT_SLOT_REFRESH

UniqueEvent=true

### VIEWED_TRANSMOG_OUTFIT_SLOT_SAVE_SUCCESS

SynchronousEvent=true

Payload:

- `slot`: TransmogOutfitSlot
- `type`: TransmogType
- `option`: TransmogOutfitSlotOption

## Tables

### TransmogOutfitCollectionInfo

Fields:

- `name`: cstring
- `isWeapon`: bool
- `canHaveIllusions`: bool

### TransmogOutfitEntryInfo

Fields:

- `outfitID`: number
- `name`: string
- `situationCategories`: table<cstring>
- `icon`: fileID
- `isEventOutfit`: bool
- `isDisabled`: bool
- `playerFacingOutfitIndex`: number

### TransmogOutfitLinkedSlotInfo

Fields:

- `primarySlotInfo`: TransmogOutfitSlotInfo
- `secondarySlotInfo`: TransmogOutfitSlotInfo

### TransmogOutfitOptionInfo

Fields:

- `type`: TransmogOutfitSlotOption
- `name`: cstring
- `enabled`: bool

### TransmogOutfitOptionSheatheCategoryInfo

Fields:

- `sheatheCategory`: TransmogOutfitSlotOptionSheatheCategory
- `categoryName`: cstring

### TransmogOutfitSlotGroup

Fields:

- `position`: TransmogOutfitSlotPosition
- `appearanceSlotInfo`: table<TransmogOutfitSlotInfo>
- `illusionSlotInfo`: table<TransmogOutfitSlotInfo>

### TransmogOutfitSlotInfo

Fields:

- `slot`: TransmogOutfitSlot
- `type`: TransmogType
- `collectionType`: TransmogCollectionType
- `slotName`: cstring
- `isSecondary`: bool

### TransmogSituationCategory

Fields:

- `triggerID`: number
- `name`: cstring
- `description`: cstring
- `isRadioButton`: bool
- `groupData`: table<TransmogSituationGroup>

### TransmogSituationGroup

Fields:

- `groupID`: number
- `secondaryID`: number
- `optionData`: table<TransmogSituationOptionData>

### TransmogSituationOption

Fields:

- `situationID`: number
- `specID`: number
- `loadoutID`: number
- `equipmentSetID`: number

### TransmogSituationOptionData

Fields:

- `name`: cstring
- `value`: bool
- `option`: TransmogSituationOption

### ViewedTransmogOutfitSlotInfo

Fields:

- `transmogID`: number
- `displayType`: TransmogOutfitDisplayType
- `isTransmogrified`: bool
- `hasPending`: bool
- `isPendingCollected`: bool
- `canTransmogrify`: bool
- `warning`: TransmogOutfitSlotWarning
- `warningText`: cstring
- `error`: TransmogOutfitSlotError
- `errorText`: cstring
- `texture`: fileID?
- `sheatheCategory`: TransmogOutfitSlotOptionSheatheCategory
