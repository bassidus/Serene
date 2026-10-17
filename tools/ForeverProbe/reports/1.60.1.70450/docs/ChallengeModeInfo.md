# ChallengeModeInfo

Namespace `C_ChallengeMode`.

Environment=All, Predicates={}

## Functions

### C_ChallengeMode.CanUseKeystoneInCurrentMap

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemLocation`: ItemLocation (ItemLocationMixin)

Returns:

- `canUse`: bool

### C_ChallengeMode.ClearKeystone

### C_ChallengeMode.CloseKeystoneFrame

### C_ChallengeMode.GetActiveChallengeMapID

Returns:

- `mapChallengeModeID`: number?

### C_ChallengeMode.GetActiveKeystoneInfo

Returns:

- `activeKeystoneLevel`: number
- `activeAffixIDs`: table<number>
- `wasActiveKeystoneCharged`: bool

### C_ChallengeMode.GetAffixInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `affixID`: number

Returns:

- `name`: cstring
- `description`: cstring
- `filedataid`: number

### C_ChallengeMode.GetChallengeCompletionInfo

Returns:

- `info`: ChallengeCompletionInfo

### C_ChallengeMode.GetDeathCount

MayReturnNothing=true

Returns:

- `numDeaths`: number
- `timeLost`: number

### C_ChallengeMode.GetDungeonScoreRarityColor -- Returns a color value from the passed in overall season M+ rating.

SecretArguments=AllowedWhenUntainted

Arguments:

- `dungeonScore`: number

Returns:

- `scoreColor`: colorRGB (ColorMixin)

### C_ChallengeMode.GetGuildLeaders

MayReturnNothing=true

Returns:

- `topAttempt`: table<ChallengeModeGuildTopAttempt>

### C_ChallengeMode.GetKeystoneLevelRarityColor -- Returns a color value from the passed in keystone level.

SecretArguments=AllowedWhenUntainted

Arguments:

- `level`: number

Returns:

- `levelScore`: colorRGB (ColorMixin)

### C_ChallengeMode.GetLeaverPenaltyWarningTimeLeft -- Returns how much time is left before player is automatically flagged as a leaver (and removed from the group) for exiting a restricted challenge mode instance

Returns:

- `timeLeftSeconds`: number [default=0]

### C_ChallengeMode.GetMapScoreInfo

MayReturnNothing=true

Returns:

- `displayScores`: table<MythicPlusRatingLinkInfo>

### C_ChallengeMode.GetMapTable

Returns:

- `mapChallengeModeIDs`: table<number>

### C_ChallengeMode.GetMapUIInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `mapChallengeModeID`: number

Returns:

- `name`: cstring
- `id`: number
- `timeLimit`: number
- `texture`: number?
- `backgroundTexture`: number
- `mapID`: number

### C_ChallengeMode.GetOverallDungeonScore -- Gets the overall season mythic+ rating for the player.

Returns:

- `overallDungeonScore`: number

### C_ChallengeMode.GetPowerLevelDamageHealthMod

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `powerLevel`: number

Returns:

- `damageMod`: number
- `healthMod`: number

### C_ChallengeMode.GetSlottedKeystoneInfo

MayReturnNothing=true

Returns:

- `mapChallengeModeID`: number
- `affixIDs`: table<number>
- `keystoneLevel`: number

### C_ChallengeMode.GetSpecificDungeonOverallScoreRarityColor -- Returns a color value from the passed in mythic+ rating from the combined affix scores for a specific dungeon

SecretArguments=AllowedWhenUntainted

Arguments:

- `specificDungeonOverallScore`: number

Returns:

- `specificDungeonOverallScoreColor`: colorRGB (ColorMixin)

### C_ChallengeMode.GetSpecificDungeonScoreRarityColor -- Returns a color value from the passed in mythic+ rating for a specific dungeon.

SecretArguments=AllowedWhenUntainted

Arguments:

- `specificDungeonScore`: number

Returns:

- `specificDungeonScoreColor`: colorRGB (ColorMixin)

### C_ChallengeMode.GetStartTime

Returns:

- `startTime`: number

### C_ChallengeMode.HasSlottedKeystone

Returns:

- `hasSlottedKeystone`: bool

### C_ChallengeMode.IsChallengeModeActive

Returns:

- `challengeModeActive`: bool

### C_ChallengeMode.IsChallengeModeResettable

Returns:

- `canReset`: bool

### C_ChallengeMode.RemoveKeystone

Returns:

- `removalSuccessful`: bool

### C_ChallengeMode.RequestLeaders

SecretArguments=AllowedWhenUntainted

Arguments:

- `mapChallengeModeID`: number

### C_ChallengeMode.Reset

### C_ChallengeMode.SlotKeystone

### C_ChallengeMode.StartChallengeMode

Returns:

- `success`: bool

## Events

### CHALLENGE_MODE_COMPLETED

SynchronousEvent=true

### CHALLENGE_MODE_COMPLETED_REWARDS

SynchronousEvent=true

Payload:

- `mapID`: number
- `medal`: number
- `timeMS`: number
- `money`: number
- `rewards`: table<ChallengeModeReward>

### CHALLENGE_MODE_DEATH_COUNT_UPDATED

SynchronousEvent=true

### CHALLENGE_MODE_KEYSTONE_RECEPTABLE_OPEN

SynchronousEvent=true

### CHALLENGE_MODE_KEYSTONE_SLOTTED

SynchronousEvent=true

Payload:

- `keystoneID`: number

### CHALLENGE_MODE_LEADERBOARD_RESULT

SynchronousEvent=true

Payload:

- `mapID`: number
- `challengeModeID`: number
- `page`: number
- `results`: table<MythicPlusLeaderboardResult>

### CHALLENGE_MODE_LEADERS_UPDATE

SynchronousEvent=true

### CHALLENGE_MODE_LEAVER_TIMER_ENDED

SynchronousEvent=true

### CHALLENGE_MODE_LEAVER_TIMER_STARTED

SynchronousEvent=true

### CHALLENGE_MODE_MAPS_UPDATE

SynchronousEvent=true

### CHALLENGE_MODE_MEMBER_INFO_UPDATED

SynchronousEvent=true

### CHALLENGE_MODE_NEW_RECORD

SynchronousEvent=true

Payload:

- `mapID`: number
- `timeMS`: number
- `medal`: number

### CHALLENGE_MODE_RESET

SynchronousEvent=true

Payload:

- `mapID`: number

### CHALLENGE_MODE_START

SynchronousEvent=true

Payload:

- `mapID`: number

## Tables

### ChallengeCompletionInfo

Fields:

- `mapChallengeModeID`: number [default=0]
- `level`: number [default=0]
- `time`: number [default=0]
- `onTime`: bool [default=false]
- `keystoneUpgradeLevels`: number [default=0]
- `practiceRun`: bool [default=false]
- `oldOverallDungeonScore`: number?
- `newOverallDungeonScore`: number?
- `isMapRecord`: bool [default=false]
- `isAffixRecord`: bool [default=false]
- `isEligibleForScore`: bool [default=false]
- `members`: table<ChallengeModeCompletionMemberInfo>

### ChallengeModeBestTime

Fields:

- `mapChallengeModeID`: number
- `durationMs`: number
- `members`: table<ChallengeModeBestTimeMember>

### ChallengeModeBestTimeMember

Fields:

- `name`: string
- `classFileName`: cstring
- `className`: cstring
- `specializationID`: number

### ChallengeModeCompletionMemberInfo

Fields:

- `memberGUID`: WOWGUID
- `name`: string

### ChallengeModeGuildAttemptMember

Fields:

- `name`: string
- `classFileName`: cstring

### ChallengeModeGuildTopAttempt

Fields:

- `name`: string
- `classFileName`: cstring
- `keystoneLevel`: number
- `mapChallengeModeID`: number
- `isYou`: bool
- `members`: table<ChallengeModeGuildAttemptMember>

### ChallengeModeReward

Fields:

- `rewardID`: number
- `displayInfoID`: number
- `quantity`: number
- `isCurrency`: bool
