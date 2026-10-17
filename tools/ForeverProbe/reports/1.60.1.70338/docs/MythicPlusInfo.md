# MythicPlusInfo

Namespace `C_MythicPlus`.

Environment=All, Predicates={}

## Functions

### C_MythicPlus.GetCurrentAffixes

MayReturnNothing=true

Returns:

- `affixIDs`: table<MythicPlusKeystoneAffix>

### C_MythicPlus.GetCurrentSeason

Returns:

- `seasonID`: number

### C_MythicPlus.GetCurrentSeasonValues

Returns:

- `displaySeasonID`: number
- `milestoneSeasonID`: number
- `rewardSeasonID`: number

### C_MythicPlus.GetCurrentUIDisplaySeason

Returns:

- `seasonID`: number?

### C_MythicPlus.GetEndOfRunGearSequenceLevel

SecretArguments=AllowedWhenUntainted

Arguments:

- `keystoneLevel`: number

Returns:

- `sequenceLevel`: number?

### C_MythicPlus.GetLastWeeklyBestInformation

MayReturnNothing=true

Returns:

- `challengeMapId`: number
- `level`: number

### C_MythicPlus.GetOwnedKeystoneChallengeMapID

MayReturnNothing=true

Returns:

- `challengeMapID`: number

### C_MythicPlus.GetOwnedKeystoneLevel

MayReturnNothing=true

Returns:

- `keyStoneLevel`: number

### C_MythicPlus.GetOwnedKeystoneMapID

MayReturnNothing=true

Returns:

- `mapID`: number

### C_MythicPlus.GetRewardLevelForDifficultyLevel

SecretArguments=AllowedWhenUntainted

Arguments:

- `difficultyLevel`: number

Returns:

- `weeklyRewardLevel`: number
- `endOfRunRewardLevel`: number

### C_MythicPlus.GetRewardLevelFromKeystoneLevel

SecretArguments=AllowedWhenUntainted

Arguments:

- `keystoneLevel`: number

Returns:

- `rewardLevel`: number?

### C_MythicPlus.GetRunHistory

SecretArguments=AllowedWhenUntainted

Arguments:

- `includePreviousWeeks`: bool [default=false]
- `includeIncompleteRuns`: bool [default=false]
- `currentSeasonOnly`: bool [default=false]

Returns:

- `runs`: table<MythicPlusRunInfo>

### C_MythicPlus.GetSeasonBestAffixScoreInfoForMap -- Gets the active players best runs by the seasonal tracked affixes as well as their overall score for the current season.

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `mapChallengeModeID`: number

Returns:

- `affixScores`: table<MythicPlusAffixScoreInfo>
- `bestOverAllScore`: number

### C_MythicPlus.GetSeasonBestForMap

SecretArguments=AllowedWhenUntainted

Arguments:

- `mapChallengeModeID`: number

Returns:

- `intimeInfo`: MapSeasonBestInfo?
- `overtimeInfo`: MapSeasonBestInfo?

### C_MythicPlus.GetSeasonBestMythicRatingFromThisExpansion

MayReturnNothing=true

Returns:

- `bestSeasonScore`: number
- `bestSeason`: number

### C_MythicPlus.GetWeeklyBestForMap

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `mapChallengeModeID`: number

Returns:

- `durationSec`: number
- `level`: number
- `completionDate`: CalendarTime
- `affixIDs`: table<number>
- `members`: table<MythicPlusMember>
- `dungeonScore`: number

### C_MythicPlus.GetWeeklyChestRewardLevel

Returns:

- `currentWeekBestLevel`: number
- `weeklyRewardLevel`: number
- `nextDifficultyWeeklyRewardLevel`: number
- `nextBestLevel`: number

### C_MythicPlus.IsMythicPlusActive

Returns:

- `isMythicPlusActive`: bool

### C_MythicPlus.RequestCurrentAffixes

### C_MythicPlus.RequestMapInfo

### C_MythicPlus.RequestRewards

## Events

### MYTHIC_PLUS_CURRENT_AFFIX_UPDATE

SynchronousEvent=true

### MYTHIC_PLUS_NEW_WEEKLY_RECORD

SynchronousEvent=true

Payload:

- `mapChallengeModeID`: number
- `completionMilliseconds`: number
- `level`: number

## Tables

### MapSeasonBestInfo

Fields:

- `durationSec`: number
- `level`: number
- `completionDate`: CalendarTime
- `affixIDs`: table<number>
- `members`: table<MythicPlusMember>
- `dungeonScore`: number

### MythicPlusDate

Fields:

- `year`: number
- `month`: number
- `day`: number
- `hour`: number
- `minute`: number
- `weekday`: luaIndex

### MythicPlusKeystoneAffix

Fields:

- `id`: number
- `seasonID`: number

### MythicPlusMember

Fields:

- `name`: string?
- `specID`: number
- `classID`: number

### MythicPlusRunInfo

Fields:

- `mapChallengeModeID`: number
- `level`: number
- `thisWeek`: bool
- `completed`: bool
- `runScore`: number
- `durationSec`: number
- `completionDate`: CalendarTime
- `season`: number

### SeasonTimeInfo

Fields:

- `bestTime`: number
- `lastTime`: number
- `medal`: number
