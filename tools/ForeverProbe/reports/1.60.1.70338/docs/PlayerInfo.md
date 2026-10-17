# PlayerInfo

Namespace `C_PlayerInfo`.

Environment=All, Predicates={}

## Functions

### C_PlayerInfo.CanPlayerEnterChromieTime

Returns:

- `canEnter`: bool

### C_PlayerInfo.CanPlayerUseAreaLoot

Returns:

- `canUseAreaLoot`: bool

### C_PlayerInfo.CanPlayerUseMountEquipment

Returns:

- `canUseMountEquipment`: bool
- `failureReason`: string

### C_PlayerInfo.CanUseItem

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemID`: number

Returns:

- `isUseable`: bool

### C_PlayerInfo.GetAlternateFormInfo

Returns:

- `hasAlternateForm`: bool
- `inAlternateForm`: bool

### C_PlayerInfo.GetContentDifficultyCreatureForPlayer

SecretArguments=AllowedWhenUntainted

Arguments:

- `unitToken`: UnitToken

Returns:

- `difficulty`: RelativeContentDifficulty

### C_PlayerInfo.GetContentDifficultyQuestForPlayer

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `difficulty`: RelativeContentDifficulty

### C_PlayerInfo.GetDisplayID

Returns:

- `displayID`: number

### C_PlayerInfo.GetGlidingInfo

Returns:

- `isGliding`: bool
- `canGlide`: bool
- `forwardSpeed`: number

### C_PlayerInfo.GetInstancesUnlockedAtLevel

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `level`: number
- `isRaid`: bool

Returns:

- `dungeonID`: table<number>

### C_PlayerInfo.GetNativeDisplayID

Returns:

- `nativeDisplayID`: number

### C_PlayerInfo.GetPetStableCreatureDisplayInfoID

SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: number

Returns:

- `creatureDisplayInfoID`: number

### C_PlayerInfo.GetPlayerCharacterData

MayReturnNothing=true

Returns:

- `characterData`: PlayerInfoCharacterData

### C_PlayerInfo.GetPlayerMythicPlusRatingSummary -- Returns the players mythic+ rating summary which includes the runs they've completed as well as their current season m+ rating

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `playerToken`: UnitToken

Returns:

- `ratingSummary`: MythicPlusRatingSummary

### C_PlayerInfo.HasAccountInventoryLock

Returns:

- `hasAccountInventoryLock`: bool

### C_PlayerInfo.HasVisibleInvSlot

SecretArguments=AllowedWhenUntainted

Arguments:

- `slot`: luaIndex

Returns:

- `isVisible`: bool

### C_PlayerInfo.IsAccountBankEnabled

Returns:

- `isAccountBankEnabled`: bool

### C_PlayerInfo.IsCharacterBankEnabled

Returns:

- `isCharacterBankEnabled`: bool

### C_PlayerInfo.IsDisplayRaceNative

Returns:

- `isDisplayRaceNative`: bool

### C_PlayerInfo.IsExpansionLandingPageUnlockedForPlayer

SecretArguments=AllowedWhenUntainted

Arguments:

- `expansionID`: number

Returns:

- `isUnlocked`: bool

### C_PlayerInfo.IsMirrorImage

Returns:

- `isMirrorImage`: bool

### C_PlayerInfo.IsPlayerEligibleForNPE

Returns:

- `isEligible`: bool
- `failureReason`: string

### C_PlayerInfo.IsPlayerEligibleForNPEv2

Returns:

- `isEligible`: bool
- `failureReason`: string

### C_PlayerInfo.IsPlayerInChromieTime

Returns:

- `inChromieTime`: bool

### C_PlayerInfo.IsPlayerInRPE

Returns:

- `isInRPE`: bool

### C_PlayerInfo.IsPlayerInTimerunningHeroicWorldTier

Returns:

- `inTimerunningHeroicWorldTier`: bool

### C_PlayerInfo.IsPlayerNPERestricted

Returns:

- `isRestricted`: bool

### C_PlayerInfo.IsReturningCharacter

Returns:

- `isReturning`: bool

### C_PlayerInfo.IsSelfFoundActive

Returns:

- `active`: bool

### C_PlayerInfo.IsTradingPostAvailable

Returns:

- `isAvailable`: bool

### C_PlayerInfo.IsTravelersLogAvailable

Returns:

- `isAvailable`: bool

### C_PlayerInfo.IsTutorialsTabAvailable

Returns:

- `isAvailable`: bool

### C_PlayerInfo.ShouldDisplaySurname

Returns:

- `display`: bool

## Tables

### MythicPlusRatingMapSummary -- Specific information about a completed mythic plus run.

Fields:

- `challengeModeID`: number
- `mapScore`: number
- `bestRunLevel`: number
- `bestRunDurationMS`: number
- `finishedSuccess`: bool

### MythicPlusRatingSummary -- The current season rating and well as a list of completed mythic plus runs.

Fields:

- `currentSeasonScore`: number
- `runs`: table<MythicPlusRatingMapSummary>
