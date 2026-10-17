# MajorFactionsUI

Namespace `C_MajorFactions`.

Environment=All, Predicates={}

## Functions

### C_MajorFactions.GetCurrentRenownLevel

SecretArguments=AllowedWhenUntainted

Arguments:

- `majorFactionID`: number

Returns:

- `level`: number

### C_MajorFactions.GetMajorFactionData

SecretArguments=AllowedWhenUntainted

Arguments:

- `majorFactionID`: number

Returns:

- `data`: MajorFactionData?

### C_MajorFactions.GetMajorFactionIDs

SecretArguments=AllowedWhenUntainted

Arguments:

- `expansionID`: number?

Returns:

- `majorFactionIDs`: table<number>

### C_MajorFactions.GetMajorFactionProgressionInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `majorFactionID`: number

Returns:

- `data`: MajorFactionProgressionInfo?

### C_MajorFactions.GetMajorFactionRenownInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `majorFactionID`: number

Returns:

- `data`: MajorFactionRenownInfo?

### C_MajorFactions.GetRenownLevels

SecretArguments=AllowedWhenUntainted

Arguments:

- `majorFactionID`: number

Returns:

- `levels`: table<MajorFactionRenownLevelInfo>

### C_MajorFactions.GetRenownNPCFactionID

Returns:

- `renownNPCFactionID`: number

### C_MajorFactions.GetRenownRewardsForLevel

SecretArguments=AllowedWhenUntainted

Arguments:

- `majorFactionID`: number
- `renownLevel`: number

Returns:

- `rewards`: table<MajorFactionRenownRewardInfo>

### C_MajorFactions.GetTotalReputationForRenownLevel

SecretArguments=AllowedWhenUntainted

Arguments:

- `majorFactionID`: number
- `renownLevel`: number

Returns:

- `totalReputation`: number

### C_MajorFactions.HasMaximumRenown

SecretArguments=AllowedWhenUntainted

Arguments:

- `majorFactionID`: number

Returns:

- `hasMaxRenown`: bool

### C_MajorFactions.IsMajorFactionHiddenFromExpansionPage

SecretArguments=AllowedWhenUntainted

Arguments:

- `majorFactionID`: number

Returns:

- `isHidden`: bool

### C_MajorFactions.IsWeeklyRenownCapped

SecretArguments=AllowedWhenUntainted

Arguments:

- `majorFactionID`: number

Returns:

- `isWeeklyCapped`: bool

### C_MajorFactions.ShouldDisplayMajorFactionAsJourney

SecretArguments=AllowedWhenUntainted

Arguments:

- `majorFactionID`: number

Returns:

- `shouldDisplayMajorFactionAsJourney`: bool

### C_MajorFactions.ShouldUseJourneyRewardTrack

SecretArguments=AllowedWhenUntainted

Arguments:

- `majorFactionID`: number

Returns:

- `shouldUseJourneyRewardTrack`: bool

## Events

### MAJOR_FACTION_INTERACTION_ENDED

SynchronousEvent=true

### MAJOR_FACTION_INTERACTION_STARTED

SynchronousEvent=true

### MAJOR_FACTION_RENOWN_LEVEL_CHANGED

SynchronousEvent=true

Payload:

- `majorFactionID`: number
- `newRenownLevel`: number
- `oldRenownLevel`: number

### MAJOR_FACTION_UNLOCKED

SynchronousEvent=true

Payload:

- `majorFactionID`: number

## Tables

### MajorFactionData

Fields:

- `name`: cstring
- `description`: cstring
- `highlights`: table<RenownHighlightInfo>
- `factionID`: number
- `expansionID`: number
- `bountySetID`: number
- `isUnlocked`: bool
- `useJourneyUnlockToast`: bool
- `hideRenownLevelUpToast`: bool
- `unlockDescription`: cstring?
- `uiPriority`: number
- `renownLevel`: number
- `maxLevel`: number
- `renownReputationEarned`: number
- `renownLevelThreshold`: number
- `textureKit`: textureKit
- `celebrationSoundKit`: number
- `renownFanfareSoundKitID`: number
- `factionFontColor`: DBColorExport?
- `renownTrackLevelEffectID`: number?
- `playerCompanionID`: number?

### MajorFactionProgressionInfo

Fields:

- `renownLevel`: number
- `previousWeekProgressiveMaxLevel`: number
- `currentWeekProgressiveMaxLevel`: number
- `maxLevel`: number
- `renownReputationEarned`: number
- `renownLevelThreshold`: number
- `weekNumber`: number

### MajorFactionRenownInfo

Fields:

- `renownLevel`: number
- `renownReputationEarned`: number
- `renownLevelThreshold`: number

### MajorFactionRenownLevelInfo

Fields:

- `factionID`: number
- `level`: number
- `locked`: bool
- `isMilestone`: bool
- `isCapstone`: bool

### MajorFactionRenownRewardInfo

Fields:

- `renownRewardID`: number
- `uiOrder`: number
- `isAccountUnlock`: bool
- `itemID`: number?
- `spellID`: number?
- `mountID`: number?
- `transmogID`: number?
- `transmogSetID`: number?
- `titleMaskID`: number?
- `transmogIllusionSourceID`: number?
- `icon`: fileID?
- `name`: cstring?
- `description`: cstring?
- `toastDescription`: cstring?
- `rewardType`: number?
- `isCollected`: bool?

### RenownHighlightInfo

Fields:

- `title`: cstring
- `description`: cstring
- `level`: number
