# ArtifactUI

Namespace `C_ArtifactUI`.

Environment=All, Predicates={}

## Functions

### C_ArtifactUI.AddPower

SecretArguments=AllowedWhenUntainted

Arguments:

- `powerID`: number

Returns:

- `success`: bool

### C_ArtifactUI.ApplyCursorRelicToSlot

SecretArguments=AllowedWhenUntainted

Arguments:

- `relicSlotIndex`: luaIndex

### C_ArtifactUI.CanApplyArtifactRelic

SecretArguments=AllowedWhenUntainted

Arguments:

- `relicItemID`: number
- `onlyUnlocked`: bool

Returns:

- `canApply`: bool

### C_ArtifactUI.CanApplyCursorRelicToSlot

SecretArguments=AllowedWhenUntainted

Arguments:

- `relicSlotIndex`: luaIndex

Returns:

- `canApply`: bool

### C_ArtifactUI.CanApplyRelicItemIDToEquippedArtifactSlot

SecretArguments=AllowedWhenUntainted

Arguments:

- `relicItemID`: number
- `relicSlotIndex`: luaIndex

Returns:

- `canApply`: bool

### C_ArtifactUI.CanApplyRelicItemIDToSlot

SecretArguments=AllowedWhenUntainted

Arguments:

- `relicItemID`: number
- `relicSlotIndex`: luaIndex

Returns:

- `canApply`: bool

### C_ArtifactUI.CheckRespecNPC

Returns:

- `canRespec`: bool

### C_ArtifactUI.Clear

### C_ArtifactUI.ClearForgeCamera

### C_ArtifactUI.ConfirmRespec

### C_ArtifactUI.DoesEquippedArtifactHaveAnyRelicsSlotted

Returns:

- `hasAnyRelicsSlotted`: bool

### C_ArtifactUI.GetAppearanceInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `appearanceSetIndex`: number
- `appearanceIndex`: number

Returns:

- `artifactAppearanceID`: number
- `appearanceName`: string
- `displayIndex`: number
- `unlocked`: bool
- `failureDescription`: string?
- `uiCameraID`: number
- `altHandCameraID`: number?
- `swatchColorR`: number
- `swatchColorG`: number
- `swatchColorB`: number
- `modelOpacity`: number
- `modelSaturation`: number
- `obtainable`: bool

### C_ArtifactUI.GetAppearanceInfoByID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `artifactAppearanceID`: number

Returns:

- `artifactAppearanceSetID`: number
- `artifactAppearanceID`: number
- `appearanceName`: string
- `displayIndex`: number
- `unlocked`: bool
- `failureDescription`: string?
- `uiCameraID`: number
- `altHandCameraID`: number?
- `swatchColorR`: number
- `swatchColorG`: number
- `swatchColorB`: number
- `modelOpacity`: number
- `modelSaturation`: number
- `obtainable`: bool

### C_ArtifactUI.GetAppearanceSetInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `appearanceSetIndex`: number

Returns:

- `artifactAppearanceSetID`: number
- `appearanceSetName`: string
- `appearanceSetDescription`: string
- `numAppearances`: number

### C_ArtifactUI.GetArtifactArtInfo

MayReturnNothing=true

Returns:

- `artifactArtInfo`: ArtifactArtInfo

### C_ArtifactUI.GetArtifactInfo

MayReturnNothing=true

Returns:

- `itemID`: number
- `altItemID`: number?
- `name`: string
- `icon`: fileID
- `xp`: number
- `pointsSpent`: number
- `quality`: number
- `artifactAppearanceID`: number
- `appearanceModID`: number
- `itemAppearanceID`: number?
- `altItemAppearanceID`: number?
- `altOnTop`: bool
- `tier`: ArtifactTiers

### C_ArtifactUI.GetArtifactItemID

MayReturnNothing=true

Returns:

- `itemID`: number

### C_ArtifactUI.GetArtifactTier

Returns:

- `tier`: ArtifactTiers?

### C_ArtifactUI.GetArtifactXPRewardTargetInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `artifactCategoryID`: number

Returns:

- `name`: string
- `icon`: fileID

### C_ArtifactUI.GetCostForPointAtRank

SecretArguments=AllowedWhenUntainted

Arguments:

- `rank`: number
- `tier`: ArtifactTiers

Returns:

- `cost`: number

### C_ArtifactUI.GetEquippedArtifactArtInfo

MayReturnNothing=true

Returns:

- `artifactArtInfo`: ArtifactArtInfo

### C_ArtifactUI.GetEquippedArtifactInfo

MayReturnNothing=true

Returns:

- `itemID`: number
- `altItemID`: number?
- `name`: string
- `icon`: fileID
- `xp`: number
- `pointsSpent`: number
- `quality`: number
- `artifactAppearanceID`: number
- `appearanceModID`: number
- `itemAppearanceID`: number?
- `altItemAppearanceID`: number?
- `altOnTop`: bool
- `tier`: ArtifactTiers

### C_ArtifactUI.GetEquippedArtifactItemID

MayReturnNothing=true

Returns:

- `itemID`: number

### C_ArtifactUI.GetEquippedArtifactNumRelicSlots

SecretArguments=AllowedWhenUntainted

Arguments:

- `onlyUnlocked`: bool [default=false] -- If true then only the relic slots that are unlocked will be considered.

Returns:

- `numRelicSlots`: number

### C_ArtifactUI.GetEquippedArtifactRelicInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `relicSlotIndex`: luaIndex

Returns:

- `name`: string
- `icon`: fileID
- `slotTypeName`: cstring -- Matches the socket identifiers used in the socketing system.
- `link`: string

### C_ArtifactUI.GetEquippedRelicLockedReason

SecretArguments=AllowedWhenUntainted

Arguments:

- `relicSlotIndex`: luaIndex

Returns:

- `lockedReason`: string?

### C_ArtifactUI.GetForgeRotation

Returns:

- `forgeRotationX`: number
- `forgeRotationY`: number
- `forgeRotationZ`: number

### C_ArtifactUI.GetItemLevelIncreaseProvidedByRelic

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `itemLinkOrID`: ItemInfo

Returns:

- `itemIevelIncrease`: number

### C_ArtifactUI.GetMetaPowerInfo

Returns:

- `spellID`: number [StrideIndex=1]
- `powerCost`: number [StrideIndex=2]
- `currentRank`: number [StrideIndex=3]

### C_ArtifactUI.GetNumAppearanceSets

Returns:

- `numAppearanceSets`: number

### C_ArtifactUI.GetNumObtainedArtifacts

Returns:

- `numObtainedArtifacts`: number

### C_ArtifactUI.GetNumRelicSlots

SecretArguments=AllowedWhenUntainted

Arguments:

- `onlyUnlocked`: bool [default=false] -- If true then only the relic slots that are unlocked will be considered.

Returns:

- `numRelicSlots`: number

### C_ArtifactUI.GetPointsRemaining

Returns:

- `pointsRemaining`: number

### C_ArtifactUI.GetPowerHyperlink

SecretArguments=AllowedWhenUntainted

Arguments:

- `powerID`: number

Returns:

- `link`: cstring

### C_ArtifactUI.GetPowerInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `powerID`: number

Returns:

- `powerInfo`: ArtifactPowerInfo

### C_ArtifactUI.GetPowerLinks

SecretArguments=AllowedWhenUntainted

Arguments:

- `powerID`: number

Returns:

- `linkingPowerID`: table<number>

### C_ArtifactUI.GetPowers

MayReturnNothing=true

Returns:

- `powerID`: table<number>

### C_ArtifactUI.GetPowersAffectedByRelic

SecretArguments=AllowedWhenUntainted

Arguments:

- `relicSlotIndex`: luaIndex

Returns:

- `powerIDs`: number [StrideIndex=1]

### C_ArtifactUI.GetPowersAffectedByRelicItemLink

SecretArguments=AllowedWhenUntainted

Arguments:

- `relicItemInfo`: ItemInfo

Returns:

- `powerIDs`: number [StrideIndex=1]

### C_ArtifactUI.GetPreviewAppearance

Returns:

- `artifactAppearanceID`: number?

### C_ArtifactUI.GetRelicInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `relicSlotIndex`: luaIndex

Returns:

- `name`: string
- `icon`: fileID
- `slotTypeName`: cstring -- Matches the socket identifiers used in the socketing system.
- `link`: string

### C_ArtifactUI.GetRelicInfoByItemID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `itemID`: number

Returns:

- `name`: string
- `icon`: fileID
- `slotTypeName`: cstring -- Matches the socket identifiers used in the socketing system.
- `link`: string

### C_ArtifactUI.GetRelicLockedReason

SecretArguments=AllowedWhenUntainted

Arguments:

- `relicSlotIndex`: luaIndex

Returns:

- `lockedReason`: string?

### C_ArtifactUI.GetRelicSlotType

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `relicSlotIndex`: luaIndex

Returns:

- `slotTypeName`: cstring

### C_ArtifactUI.GetRespecArtifactArtInfo

MayReturnNothing=true

Returns:

- `artifactArtInfo`: ArtifactArtInfo

### C_ArtifactUI.GetRespecArtifactInfo

MayReturnNothing=true

Returns:

- `itemID`: number
- `altItemID`: number?
- `name`: string
- `icon`: fileID
- `xp`: number
- `pointsSpent`: number
- `quality`: number
- `artifactAppearanceID`: number
- `appearanceModID`: number
- `itemAppearanceID`: number?
- `altItemAppearanceID`: number?
- `altOnTop`: bool
- `tier`: ArtifactTiers

### C_ArtifactUI.GetRespecCost

Returns:

- `cost`: number

### C_ArtifactUI.GetTotalPowerCost

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `startingTrait`: luaIndex
- `numTraits`: number
- `artifactTier`: ArtifactTiers

Returns:

- `totalArtifactPowerCost`: number

### C_ArtifactUI.GetTotalPurchasedRanks

Returns:

- `totalPurchasedRanks`: number

### C_ArtifactUI.IsArtifactDisabled

Returns:

- `artifactDisabled`: bool

### C_ArtifactUI.IsArtifactItem

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemLocation`: ItemLocation (ItemLocationMixin)

Returns:

- `isArtifact`: bool

### C_ArtifactUI.IsAtForge

Returns:

- `isAtForge`: bool

### C_ArtifactUI.IsEquippedArtifactDisabled

Returns:

- `artifactDisabled`: bool

### C_ArtifactUI.IsEquippedArtifactMaxed

Returns:

- `artifactMaxed`: bool

### C_ArtifactUI.IsMaxedByRulesOrEffect

Returns:

- `isEffectivelyMaxed`: bool

### C_ArtifactUI.IsPowerKnown

SecretArguments=AllowedWhenUntainted

Arguments:

- `powerID`: number

Returns:

- `known`: bool

### C_ArtifactUI.IsViewedArtifactEquipped

Returns:

- `isViewedArtifactEquipped`: bool

### C_ArtifactUI.SetAppearance

SecretArguments=AllowedWhenUntainted

Arguments:

- `artifactAppearanceID`: number

### C_ArtifactUI.SetForgeCamera

### C_ArtifactUI.SetForgeRotation

SecretArguments=AllowedWhenUntainted

Arguments:

- `forgeRotationX`: number
- `forgeRotationY`: number
- `forgeRotationZ`: number

### C_ArtifactUI.SetPreviewAppearance -- Call without an argument to clear the preview.

SecretArguments=AllowedWhenUntainted

Arguments:

- `artifactAppearanceID`: number [default=0]

### C_ArtifactUI.ShouldSuppressForgeRotation

Returns:

- `shouldSuppressForgeRotation`: bool

## Events

### ARTIFACT_CLOSE

SynchronousEvent=true

### ARTIFACT_ENDGAME_REFUND

SynchronousEvent=true

Payload:

- `numRefundedPowers`: number
- `refundedTier`: ArtifactTiers
- `bagOrSlotIndex`: luaIndex
- `slotIndex`: luaIndex?

### ARTIFACT_RELIC_FORGE_CLOSE

SynchronousEvent=true

### ARTIFACT_RELIC_FORGE_PREVIEW_RELIC_CHANGED

SynchronousEvent=true

### ARTIFACT_RELIC_FORGE_UPDATE

SynchronousEvent=true

### ARTIFACT_RELIC_INFO_RECEIVED

SynchronousEvent=true

### ARTIFACT_RESPEC_PROMPT

SynchronousEvent=true

### ARTIFACT_TIER_CHANGED

SynchronousEvent=true

Payload:

- `newTier`: luaIndex
- `bagOrSlotIndex`: luaIndex
- `slotIndex`: luaIndex?

### ARTIFACT_UPDATE

SynchronousEvent=true

Payload:

- `newItem`: bool

### ARTIFACT_XP_UPDATE

SynchronousEvent=true

## Tables

### ArtifactAppearanceInfo

Fields:

- `artifactAppearanceID`: number
- `appearanceName`: string
- `displayIndex`: number
- `unlocked`: bool
- `failureDescription`: string?
- `uiCameraID`: number
- `altHandCameraID`: number?
- `swatchColor`: colorRGB (ColorMixin)
- `modelOpacity`: number
- `modelSaturation`: number
- `obtainable`: bool

### ArtifactAppearanceSetInfo

Fields:

- `artifactAppearanceSetID`: number
- `appearanceSetName`: string
- `appearanceSetDescription`: string
- `numAppearances`: number

### ArtifactArtInfo

Fields:

- `textureKit`: textureKit
- `titleName`: string
- `titleColor`: colorRGB (ColorMixin)
- `barConnectedColor`: colorRGB (ColorMixin)
- `barDisconnectedColor`: colorRGB (ColorMixin)
- `uiModelSceneID`: number
- `spellVisualKitID`: number

### ArtifactInfo

Fields:

- `itemID`: number
- `altItemID`: number?
- `name`: string
- `icon`: fileID
- `xp`: number
- `pointsSpent`: number
- `quality`: number
- `artifactAppearanceID`: number
- `appearanceModID`: number
- `itemAppearanceID`: number?
- `altItemAppearanceID`: number?
- `altOnTop`: bool
- `tier`: ArtifactTiers

### ArtifactMetaPowerInfo

Fields:

- `spellID`: number
- `powerCost`: number
- `currentRank`: number

### ArtifactPowerInfo

Fields:

- `spellID`: number
- `cost`: number
- `currentRank`: number
- `maxRank`: number
- `bonusRanks`: number
- `numMaxRankBonusFromTier`: number
- `prereqsMet`: bool
- `isStart`: bool
- `isGoldMedal`: bool
- `isFinal`: bool
- `tier`: luaIndex
- `position`: vector2 (Vector2DMixin)
- `offset`: vector2 (Vector2DMixin)?
- `linearIndex`: luaIndex?

### ArtifactRelicInfo

Fields:

- `name`: string
- `icon`: fileID
- `slotTypeName`: cstring -- Matches the socket identifiers used in the socketing system.
- `link`: string
