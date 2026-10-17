# PerksActivities

Namespace `C_PerksActivities`.

Environment=All, Predicates={}

## Functions

### C_PerksActivities.AddTrackedPerksActivity

SecretArguments=AllowedWhenUntainted

Arguments:

- `perksActivityID`: number

### C_PerksActivities.ClearPerksActivitiesPendingCompletion

### C_PerksActivities.GetAllPerksActivityTags

Returns:

- `tags`: PerksActivityTags

### C_PerksActivities.GetPerksActivitiesInfo

Returns:

- `info`: PerksActivitiesInfo

### C_PerksActivities.GetPerksActivitiesPendingCompletion

Returns:

- `pending`: PerksActivitiesPending

### C_PerksActivities.GetPerksActivityChatLink

SecretArguments=AllowedWhenUntainted

Arguments:

- `perksActivityID`: number

Returns:

- `link`: cstring

### C_PerksActivities.GetPerksActivityInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `perksActivityID`: number

Returns:

- `info`: PerksActivityInfo?

### C_PerksActivities.GetPerksUIThemePrefix

Returns:

- `kitPrefix`: string

### C_PerksActivities.GetTrackedPerksActivities

Returns:

- `trackedPerksActivities`: PerksActivitiesTracked

### C_PerksActivities.RemoveTrackedPerksActivity

SecretArguments=AllowedWhenUntainted

Arguments:

- `perksActivityID`: number

## Events

### PERKS_ACTIVITIES_TRACKED_LIST_CHANGED

SynchronousEvent=true

Payload:

- `perksActivityID`: number
- `added`: bool

### PERKS_ACTIVITIES_TRACKED_UPDATED

UniqueEvent=true

### PERKS_ACTIVITIES_UPDATED

UniqueEvent=true

### PERKS_ACTIVITY_COMPLETED

SynchronousEvent=true

Payload:

- `perksActivityID`: number

## Tables

### PerksActivitiesInfo

Fields:

- `activePerksMonth`: number
- `displayMonthName`: cstring
- `secondsRemaining`: time_t
- `activities`: table<PerksActivityInfo>
- `thresholds`: table<PerksActivityThresholdInfo>

### PerksActivitiesPending

Fields:

- `pendingIDs`: table<number>

### PerksActivitiesTracked

Fields:

- `trackedIDs`: table<number>

### PerksActivityCondition

Fields:

- `isMet`: bool
- `text`: cstring
- `uiPriority`: number

### PerksActivityInfo

Fields:

- `ID`: number
- `activityName`: cstring
- `description`: string
- `thresholdContributionAmount`: number
- `completed`: bool
- `inProgress`: bool
- `tracked`: bool
- `supersedes`: number
- `uiPriority`: number
- `areAllConditionsMet`: bool
- `conditions`: table<PerksActivityCondition>
- `eventName`: cstring?
- `eventStartTime`: time_t?
- `eventEndTime`: time_t?
- `requirementsList`: table<CriteriaRequirement>
- `criteriaList`: table<CriteriaRequiredValue>
- `tagNames`: table<string>

### PerksActivityTags

Fields:

- `tagName`: table<string>

### PerksActivityThresholdInfo

Fields:

- `thresholdOrderIndex`: number
- `currencyAwardAmount`: number
- `requiredContributionAmount`: number
- `pendingReward`: bool
- `itemReward`: number?
