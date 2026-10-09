# WeeklyRewards

Namespace `C_WeeklyRewards`.

Environment=All, Predicates={}

## Functions

### C_WeeklyRewards.AreRewardsForCurrentRewardPeriod

Returns:

- `isCurrentPeriod`: bool

### C_WeeklyRewards.CanClaimRewards

Returns:

- `canClaimRewards`: bool

### C_WeeklyRewards.ClaimReward

SecretArguments=AllowedWhenUntainted

Arguments:

- `id`: number

### C_WeeklyRewards.CloseInteraction

### C_WeeklyRewards.GetActivities

SecretArguments=AllowedWhenUntainted

Arguments:

- `type`: WeeklyRewardChestThresholdType?

Returns:

- `activities`: table<WeeklyRewardActivityInfo>

### C_WeeklyRewards.GetActivityEncounterInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `type`: WeeklyRewardChestThresholdType
- `index`: luaIndex

Returns:

- `info`: table<WeeklyRewardActivityEncounterInfo>

### C_WeeklyRewards.GetConquestWeeklyProgress

Returns:

- `weeklyProgress`: ConquestWeeklyProgress

### C_WeeklyRewards.GetDifficultyIDForActivityTier

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `activityTierID`: number

Returns:

- `difficultyID`: number

### C_WeeklyRewards.GetExampleRewardItemHyperlinks

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `id`: number

Returns:

- `hyperlink`: string
- `upgradeHyperlink`: string

### C_WeeklyRewards.GetItemHyperlink

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `itemDBID`: WeeklyRewardItemDBID

Returns:

- `hyperlink`: cstring

### C_WeeklyRewards.GetNextActivitiesIncrease

SecretArguments=AllowedWhenUntainted

Arguments:

- `activityTierID`: number
- `level`: number

Returns:

- `hasSeasonData`: bool
- `nextActivityTierID`: number?
- `nextLevel`: number?
- `itemLevel`: number?

### C_WeeklyRewards.GetNextMythicPlusIncrease

SecretArguments=AllowedWhenUntainted

Arguments:

- `mythicPlusLevel`: number

Returns:

- `hasSeasonData`: bool
- `nextMythicPlusLevel`: number?
- `itemLevel`: number?

### C_WeeklyRewards.GetNumCompletedDungeonRuns

Returns:

- `numHeroic`: number
- `numMythic`: number
- `numMythicPlus`: number

### C_WeeklyRewards.GetSortedProgressForActivity

SecretArguments=AllowedWhenUntainted

Arguments:

- `type`: WeeklyRewardChestThresholdType
- `combineSharedDifficulty`: bool

Returns:

- `progress`: table<WeeklyRewardActivityTierProgress>

### C_WeeklyRewards.HasAvailableRewards

Returns:

- `hasAvailableRewards`: bool

### C_WeeklyRewards.HasGeneratedRewards

Returns:

- `hasGeneratedRewards`: bool

### C_WeeklyRewards.HasInteraction

Returns:

- `isInteracting`: bool

### C_WeeklyRewards.IsWeeklyChestRetired

Returns:

- `isRetired`: bool

### C_WeeklyRewards.OnUIInteract

### C_WeeklyRewards.ShouldShowFinalRetirementMessage

Returns:

- `showRetirementMessage`: bool

### C_WeeklyRewards.ShouldShowRetirementMessage

Returns:

- `showRetirementMessage`: bool

## Events

### WEEKLY_REWARDS_ITEM_CHANGED

SynchronousEvent=true

### WEEKLY_REWARDS_UPDATE

SynchronousEvent=true

## Tables

### ConquestProgressBarDisplayType

MaxValue=2, MinValue=0, NumValues=3

Fields:

- `FirstChest`: ConquestProgressBarDisplayType [= 0]
- `AdditionalChest`: ConquestProgressBarDisplayType [= 1]
- `Seasonal`: ConquestProgressBarDisplayType [= 2]

### ConquestWeeklyProgress

Fields:

- `progress`: number
- `maxProgress`: number
- `displayType`: ConquestProgressBarDisplayType
- `unlocksCompleted`: number
- `maxUnlocks`: number
- `sampleItemHyperlink`: string

### WeeklyRewardActivityEncounterInfo

Fields:

- `encounterID`: number
- `bestDifficulty`: number
- `uiOrder`: number
- `instanceID`: number

### WeeklyRewardActivityInfo

Fields:

- `type`: WeeklyRewardChestThresholdType
- `index`: luaIndex
- `threshold`: number
- `progress`: number
- `id`: number
- `activityTierID`: number
- `level`: number
- `claimID`: number?
- `raidString`: cstring?
- `rewards`: table<WeeklyRewardActivityRewardInfo>

### WeeklyRewardActivityRewardInfo

Fields:

- `type`: CachedRewardType
- `id`: number
- `quantity`: number
- `itemDBID`: WeeklyRewardItemDBID?

### WeeklyRewardActivityTierProgress

Fields:

- `activityTierID`: number
- `difficulty`: number
- `numPoints`: number
