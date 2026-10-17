# RecruitAFriend

Namespace `C_RecruitAFriend`.

Environment=All, Predicates={}

## Functions

### C_RecruitAFriend.CanSummonFriend

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `guid`: WOWGUID

Returns:

- `canSummon`: bool
- `reason`: RecruitAFriendFailure

### C_RecruitAFriend.ClaimActivityReward

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `activityID`: number
- `acceptanceID`: RecruitAcceptanceID

Returns:

- `success`: bool

### C_RecruitAFriend.ClaimNextReward

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `rafVersion`: RecruitAFriendRewardsVersion?

Returns:

- `success`: bool

### C_RecruitAFriend.GenerateRecruitmentLink

HasRestrictions=true

Returns:

- `success`: bool

### C_RecruitAFriend.GetRAFInfo

Returns:

- `info`: RafInfo

### C_RecruitAFriend.GetRAFSystemInfo

Returns:

- `systemInfo`: RafSystemInfo

### C_RecruitAFriend.GetRecruitActivityRequirementsText

SecretArguments=AllowedWhenUntainted

Arguments:

- `activityID`: number
- `acceptanceID`: RecruitAcceptanceID

Returns:

- `requirementsText`: table<string>

### C_RecruitAFriend.GetRecruitInfo

Returns:

- `active`: bool
- `faction`: number

### C_RecruitAFriend.GetSummonFriendCooldown

Returns:

- `startTimeSeconds`: number
- `durationSeconds`: number
- `enableCooldownTimer`: bool

### C_RecruitAFriend.IsRecruitAFriendLinked

SecretArguments=AllowedWhenUntainted

Arguments:

- `guid`: WOWGUID

Returns:

- `result`: bool

### C_RecruitAFriend.IsRecruitingEnabled

Returns:

- `enabled`: bool

### C_RecruitAFriend.IsSystemEnabled

Returns:

- `isSystemEnabled`: bool

### C_RecruitAFriend.IsSystemSupported

Returns:

- `isSystemSupported`: bool

### C_RecruitAFriend.RemoveRAFRecruit

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `wowAccountGUID`: WOWGUID

Returns:

- `success`: bool

### C_RecruitAFriend.RequestUpdatedRecruitmentInfo

HasRestrictions=true

Returns:

- `success`: bool

### C_RecruitAFriend.SummonFriend

SecretArguments=AllowedWhenUntainted

Arguments:

- `target`: WOWGUID
- `name`: cstring

## Events

### RAF_INFO_UPDATED

SynchronousEvent=true

Payload:

- `info`: RafInfo

### RAF_RECRUITING_ENABLED_STATUS

SynchronousEvent=true

Payload:

- `enabled`: bool

### RAF_REWARD_CLAIM_FAILED

SynchronousEvent=true

### RAF_SYSTEM_ENABLED_STATUS

SynchronousEvent=true

Payload:

- `enabled`: bool

### RAF_SYSTEM_INFO_UPDATED

SynchronousEvent=true

Payload:

- `systemInfo`: RafSystemInfo

## Tables

### RafRecruitActivityState

MaxValue=2, MinValue=0, NumValues=3

Fields:

- `Incomplete`: RafRecruitActivityState [= 0]
- `Complete`: RafRecruitActivityState [= 1]
- `RewardClaimed`: RafRecruitActivityState [= 2]

### RafRecruitSubStatus

MaxValue=2, MinValue=0, NumValues=3

Fields:

- `Trial`: RafRecruitSubStatus [= 0]
- `Active`: RafRecruitSubStatus [= 1]
- `Inactive`: RafRecruitSubStatus [= 2]

### RafRewardType

MaxValue=7, MinValue=0, NumValues=8

Fields:

- `Pet`: RafRewardType [= 0]
- `Mount`: RafRewardType [= 1]
- `Appearance`: RafRewardType [= 2]
- `Title`: RafRewardType [= 3]
- `GameTime`: RafRewardType [= 4]
- `AppearanceSet`: RafRewardType [= 5]
- `Illusion`: RafRewardType [= 6]
- `Invalid`: RafRewardType [= 7]

### RafAppearanceInfo

Fields:

- `appearanceID`: number

### RafAppearanceSetInfo

Fields:

- `setID`: number
- `setName`: string
- `appearanceIDs`: table<number>

### RafIllusionInfo

Fields:

- `spellItemEnchantmentID`: number

### RafInfo

Fields:

- `versions`: table<RafVersionInfo>
- `recruitmentInfo`: RafRecruitmentinfo?
- `recruits`: table<RafRecruit>
- `claimInProgress`: bool

### RafMonthCount

Fields:

- `lifetimeMonths`: number
- `spentMonths`: number
- `availableMonths`: number

### RafMountInfo

Fields:

- `spellID`: number
- `mountID`: number

### RafPetInfo

Fields:

- `creatureID`: number
- `speciesID`: number
- `displayID`: number
- `speciesName`: string
- `description`: string

### RafRecruit

Fields:

- `bnetAccountID`: number
- `wowAccountGUID`: WOWGUID
- `battleTag`: string
- `monthsRemaining`: number
- `subStatus`: RafRecruitSubStatus
- `acceptanceID`: RecruitAcceptanceID
- `versionRecruited`: RecruitAFriendRewardsVersion
- `activities`: table<RafRecruitActivity>

### RafRecruitActivity

Fields:

- `activityID`: number
- `rewardQuestID`: number
- `state`: RafRecruitActivityState

### RafRecruitmentinfo

Fields:

- `recruitmentCode`: string
- `recruitmentURL`: string
- `expireTime`: number
- `remainingTimeSeconds`: number
- `totalUses`: number
- `remainingUses`: number
- `sourceRealm`: string
- `sourceFaction`: string

### RafReward

Fields:

- `rewardID`: number
- `rafVersion`: RecruitAFriendRewardsVersion
- `itemID`: number
- `rewardType`: RafRewardType
- `petInfo`: RafPetInfo?
- `mountInfo`: RafMountInfo?
- `appearanceInfo`: RafAppearanceInfo?
- `titleInfo`: RafTitleInfo?
- `appearanceSetInfo`: RafAppearanceSetInfo?
- `illusionInfo`: RafIllusionInfo?
- `canClaim`: bool
- `claimed`: bool
- `canAfford`: bool
- `repeatable`: bool
- `repeatableClaimCount`: number
- `monthsRequired`: number
- `monthCost`: number
- `availableInMonths`: number
- `iconID`: fileID

### RafSystemInfo

Fields:

- `maxRecruits`: number
- `maxRecruitMonths`: number
- `maxRecruitmentUses`: number
- `daysInCycle`: number

### RafTitleInfo

Fields:

- `titleMaskID`: number

### RafVersionInfo

Fields:

- `rafVersion`: RecruitAFriendRewardsVersion
- `monthCount`: RafMonthCount
- `rewards`: table<RafReward>
- `nextReward`: RafReward?
- `numAffordableRewards`: number
- `numRecruits`: number
