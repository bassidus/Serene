# TransmogrifySets

Namespace `C_TransmogSets`.

Environment=All, Predicates={}

## Functions

### C_TransmogSets.ClearLatestSource

### C_TransmogSets.ClearNewSource

SecretArguments=AllowedWhenUntainted

Arguments:

- `sourceID`: number

### C_TransmogSets.ClearSetNewSourcesForSlot

SecretArguments=AllowedWhenUntainted

Arguments:

- `transmogSetID`: number
- `slot`: luaIndex

### C_TransmogSets.GetAllSets

Returns:

- `sets`: table<TransmogSetInfo>

### C_TransmogSets.GetAllSourceIDs

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `transmogSetID`: number

Returns:

- `sources`: table<number>

### C_TransmogSets.GetAvailableSets

Returns:

- `sets`: table<TransmogSetInfo>

### C_TransmogSets.GetBaseSetID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `transmogSetID`: number

Returns:

- `baseTransmogSetID`: number

### C_TransmogSets.GetBaseSets

Returns:

- `sets`: table<TransmogSetInfo>

### C_TransmogSets.GetBaseSetsFilter

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex

Returns:

- `isChecked`: bool

### C_TransmogSets.GetCameraIDs

Returns:

- `detailsCameraID`: number?
- `vendorCameraID`: number?

### C_TransmogSets.GetFilteredBaseSetsCounts

Returns:

- `numCollected`: number
- `numTotal`: number

### C_TransmogSets.GetFullBaseSetsCounts

Returns:

- `numCollected`: number
- `numTotal`: number

### C_TransmogSets.GetIsFavorite

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `transmogSetID`: number

Returns:

- `isFavorite`: bool
- `isGroupFavorite`: bool

### C_TransmogSets.GetLatestSource

Returns:

- `sourceID`: number

### C_TransmogSets.GetSetInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `transmogSetID`: number

Returns:

- `set`: TransmogSetInfo

### C_TransmogSets.GetSetNewSources

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `transmogSetID`: number

Returns:

- `sourceIDs`: table<number>

### C_TransmogSets.GetSetPrimaryAppearances

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `transmogSetID`: number

Returns:

- `apppearances`: table<TransmogSetPrimaryAppearanceInfo>

### C_TransmogSets.GetSetsContainingSourceID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `sourceID`: number

Returns:

- `setIDs`: table<number>

### C_TransmogSets.GetSetsFilter

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex

Returns:

- `isChecked`: bool

### C_TransmogSets.GetSourceIDsForSlot

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `transmogSetID`: number
- `slot`: luaIndex

Returns:

- `sources`: table<number>

### C_TransmogSets.GetSourcesForSlot

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `transmogSetID`: number
- `slot`: luaIndex

Returns:

- `sources`: table<AppearanceSourceInfo>

### C_TransmogSets.GetTransmogSetsClassFilter

Returns:

- `classID`: number

### C_TransmogSets.GetUsableSets

Returns:

- `sets`: table<TransmogSetInfo>

### C_TransmogSets.GetValidBaseSetsCountsForCharacter

Returns:

- `numCollected`: number
- `numTotal`: number

### C_TransmogSets.GetValidClassForSet

SecretArguments=AllowedWhenUntainted

Arguments:

- `transmogSetID`: number

Returns:

- `classID`: number?

### C_TransmogSets.GetVariantSets

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `transmogSetID`: number

Returns:

- `sets`: table<TransmogSetInfo>

### C_TransmogSets.HasAnyValidSets

Returns:

- `hasAnyValidSets`: bool

### C_TransmogSets.HasAvailableSets

Returns:

- `hasAvailableSets`: bool

### C_TransmogSets.HasUsableSets

Returns:

- `hasUsableSets`: bool

### C_TransmogSets.IsBaseSetCollected

SecretArguments=AllowedWhenUntainted

Arguments:

- `transmogSetID`: number

Returns:

- `isCollected`: bool

### C_TransmogSets.IsNewSource

SecretArguments=AllowedWhenUntainted

Arguments:

- `sourceID`: number

Returns:

- `isNew`: bool

### C_TransmogSets.IsSetVisible

SecretArguments=AllowedWhenUntainted

Arguments:

- `transmogSetID`: number

Returns:

- `isVisible`: bool

### C_TransmogSets.IsUsingDefaultBaseSetsFilters

Returns:

- `isUsingDefaultBaseSetsFilters`: bool

### C_TransmogSets.IsUsingDefaultSetsFilters

Returns:

- `isUsingDefaultSetsFilters`: bool

### C_TransmogSets.SetBaseSetsFilter

SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex
- `isChecked`: bool

### C_TransmogSets.SetDefaultBaseSetsFilters

### C_TransmogSets.SetDefaultSetsFilters

### C_TransmogSets.SetHasNewSources

SecretArguments=AllowedWhenUntainted

Arguments:

- `transmogSetID`: number

Returns:

- `hasNewSources`: bool

### C_TransmogSets.SetHasNewSourcesForSlot

SecretArguments=AllowedWhenUntainted

Arguments:

- `transmogSetID`: number
- `slot`: luaIndex

Returns:

- `hasNewSources`: bool

### C_TransmogSets.SetIsFavorite

SecretArguments=AllowedWhenUntainted

Arguments:

- `transmogSetID`: number
- `isFavorite`: bool

### C_TransmogSets.SetSetsFilter

SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex
- `isChecked`: bool

### C_TransmogSets.SetTransmogSetsClassFilter

SecretArguments=AllowedWhenUntainted

Arguments:

- `classID`: number

## Tables

### TransmogSetInfo

Fields:

- `setID`: number
- `name`: string
- `baseSetID`: number?
- `description`: cstring?
- `label`: cstring?
- `expansionID`: number
- `patchID`: number
- `uiOrder`: number
- `classMask`: number
- `hiddenUntilCollected`: bool
- `requiredFaction`: cstring?
- `collected`: bool
- `favorite`: bool
- `limitedTimeSet`: bool
- `validForCharacter`: bool
- `grantAsPrecedingVariant`: bool

### TransmogSetPrimaryAppearanceInfo

Fields:

- `appearanceID`: number
- `collected`: bool
