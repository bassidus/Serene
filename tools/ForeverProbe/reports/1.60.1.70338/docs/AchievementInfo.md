# AchievementInfo

Namespace `C_AchievementInfo`.

Environment=All, Predicates={}

## Functions

### C_AchievementInfo.AreGuildAchievementsEnabled

Returns:

- `enabled`: bool

### C_AchievementInfo.GetRewardItemID

SecretArguments=AllowedWhenUntainted

Arguments:

- `achievementID`: number

Returns:

- `rewardItemID`: number?

### C_AchievementInfo.GetSupercedingAchievements

SecretArguments=AllowedWhenUntainted

Arguments:

- `achievementID`: number

Returns:

- `supercedingAchievements`: table<number>

### C_AchievementInfo.IsGuildAchievement

SecretArguments=AllowedWhenUntainted

Arguments:

- `achievementId`: number

Returns:

- `isGuild`: bool

### C_AchievementInfo.IsValidAchievement

SecretArguments=AllowedWhenUntainted

Arguments:

- `achievementId`: number

Returns:

- `isValidAchievement`: bool

### C_AchievementInfo.SetPortraitTexture

SecretArguments=AllowedWhenUntainted

Arguments:

- `textureObject`: SimpleTexture

## Events

### ACHIEVEMENT_EARNED

SynchronousEvent=true

Payload:

- `achievementID`: number
- `alreadyEarned`: bool?

### ACHIEVEMENT_PLAYER_NAME

SynchronousEvent=true

Payload:

- `achievementID`: number

### ACHIEVEMENT_SEARCH_UPDATED

SynchronousEvent=true

### CRITERIA_COMPLETE

SynchronousEvent=true

Payload:

- `criteriaID`: number

### CRITERIA_EARNED

SynchronousEvent=true

Payload:

- `achievementID`: number
- `description`: cstring
- `achievementAlreadyEarnedOnAccount`: bool

### CRITERIA_UPDATE

SynchronousEvent=true

### INSPECT_ACHIEVEMENT_READY

SynchronousEvent=true

Payload:

- `guid`: WOWGUID

### RECEIVED_ACHIEVEMENT_LIST

UniqueEvent=true

### RECEIVED_ACHIEVEMENT_MEMBER_LIST

SynchronousEvent=true

Payload:

- `achievementID`: number

### TRACKED_ACHIEVEMENT_LIST_CHANGED

SynchronousEvent=true

Payload:

- `achievementID`: number?
- `added`: bool?

### TRACKED_ACHIEVEMENT_UPDATE

SynchronousEvent=true

Payload:

- `achievementID`: number
- `criteriaID`: number?
- `elapsed`: time_t?
- `duration`: number?
