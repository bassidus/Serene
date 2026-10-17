# NeighborhoodInitiative

Namespace `C_NeighborhoodInitiative`.

Environment=All, Predicates={}

## Functions

### C_NeighborhoodInitiative.AddTrackedInitiativeTask

SecretArguments=AllowedWhenUntainted

Arguments:

- `initiativeTaskID`: number

### C_NeighborhoodInitiative.GetActiveNeighborhood

Returns:

- `neighborhoodGUID`: WOWGUID

### C_NeighborhoodInitiative.GetAvailableHouseXP

Returns:

- `availabeXP`: number

### C_NeighborhoodInitiative.GetInitiativeActivityLogInfo

Returns:

- `info`: InitiativeActivityLogInfo?

### C_NeighborhoodInitiative.GetInitiativeTaskChatLink

SecretArguments=AllowedWhenUntainted

Arguments:

- `initiativeTaskID`: number

Returns:

- `link`: cstring

### C_NeighborhoodInitiative.GetInitiativeTaskInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `initiativeTaskID`: number

Returns:

- `info`: InitiativeTaskInfo?

### C_NeighborhoodInitiative.GetInitiativeTaskRewardScaling

SecretArguments=AllowedWhenUntainted

Arguments:

- `taskID`: number
- `numItems`: number

Returns:

- `scaledAmount`: number

### C_NeighborhoodInitiative.GetNeighborhoodInitiativeInfo

Returns:

- `info`: NeighborhoodInitiativeInfo?

### C_NeighborhoodInitiative.GetRequiredLevel

Returns:

- `reqLevel`: number

### C_NeighborhoodInitiative.GetTrackedInitiativeTasks

Returns:

- `trackedInitiativeTasks`: InitiativeTasksTracked

### C_NeighborhoodInitiative.IsInitiativeEnabled

Returns:

- `enabled`: bool

### C_NeighborhoodInitiative.IsPlayerInNeighborhoodGroup

Returns:

- `inValidGroup`: bool

### C_NeighborhoodInitiative.IsViewingActiveNeighborhood

Returns:

- `isViewingActiveNeighborhood`: bool

### C_NeighborhoodInitiative.PlayerHasInitiativeAccess

Returns:

- `success`: bool

### C_NeighborhoodInitiative.PlayerMeetsRequiredLevel

Returns:

- `success`: bool

### C_NeighborhoodInitiative.RemoveTrackedInitiativeTask

SecretArguments=AllowedWhenUntainted

Arguments:

- `initiativeTaskID`: number

### C_NeighborhoodInitiative.RequestInitiativeActivityLog

### C_NeighborhoodInitiative.RequestNeighborhoodInitiativeInfo

### C_NeighborhoodInitiative.SetActiveNeighborhood

SecretArguments=AllowedWhenUntainted

Arguments:

- `neighborhoodGUID`: WOWGUID

### C_NeighborhoodInitiative.SetViewingNeighborhood

SecretArguments=AllowedWhenUntainted

Arguments:

- `neighborhoodGUID`: WOWGUID

## Events

### INITIATIVE_ACTIVITY_LOG_UPDATED

SynchronousEvent=true

### INITIATIVE_COMPLETED

SynchronousEvent=true

Payload:

- `initiativeTitle`: string

### INITIATIVE_TASK_COMPLETED

SynchronousEvent=true

Payload:

- `taskName`: string

### INITIATIVE_TASKS_TRACKED_LIST_CHANGED

SynchronousEvent=true

Payload:

- `initiativeTaskID`: number
- `added`: bool

### INITIATIVE_TASKS_TRACKED_UPDATED

UniqueEvent=true

### NEIGHBORHOOD_INITIATIVE_UPDATED

SynchronousEvent=true

## Tables

### InitiativeActivityLogEntry

Fields:

- `taskID`: number
- `playerName`: string
- `taskName`: cstring
- `completionTime`: time_t
- `amount`: number

### InitiativeActivityLogInfo

Fields:

- `isLoaded`: bool
- `neighborhoodGUID`: WOWGUID
- `nextUpdateTime`: time_t
- `taskActivity`: table<InitiativeActivityLogEntry>

### InitiativeMilestoneInfo

Fields:

- `milestoneOrderIndex`: number
- `requiredContributionAmount`: number
- `rewards`: table<InitiativeMilestoneRewardInfo>

### InitiativeMilestoneRewardInfo

Fields:

- `title`: string
- `description`: string
- `decorID`: number
- `decorQuantity`: number
- `favor`: number
- `money`: WOWMONEY
- `rewardQuestID`: number

### InitiativeTaskInfo

Fields:

- `ID`: number
- `taskName`: cstring
- `description`: string
- `progressContributionAmount`: number
- `tracked`: bool
- `supersedes`: number
- `timesCompleted`: number
- `completed`: bool
- `inProgress`: bool
- `taskType`: NeighborhoodInitiativeTaskType
- `sortOrder`: number
- `rewardQuestID`: number
- `requirementsList`: table<CriteriaRequirement>
- `criteriaList`: table<CriteriaRequiredValue>

### InitiativeTasksTracked

Fields:

- `trackedIDs`: table<number>

### NeighborhoodInitiativeInfo

Fields:

- `isLoaded`: bool
- `neighborhoodGUID`: WOWGUID
- `initiativeID`: number
- `currentCycleID`: number
- `progressRequired`: number
- `currentProgress`: number
- `playerTotalContribution`: number
- `duration`: time_t
- `tasks`: table<InitiativeTaskInfo>
- `milestones`: table<InitiativeMilestoneInfo>
- `title`: string
- `description`: string
