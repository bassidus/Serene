# IslandsQueue

Namespace `C_IslandsQueue`.

Environment=All, Predicates={}

## Functions

### C_IslandsQueue.CloseIslandsQueueScreen

### C_IslandsQueue.GetIslandDifficultyInfo

Returns:

- `islandDifficultyInfo`: table<IslandsQueueDifficultyInfo>

### C_IslandsQueue.GetIslandsMaxGroupSize

Returns:

- `maxGroupSize`: number

### C_IslandsQueue.GetIslandsWeeklyQuestID

Returns:

- `questID`: number?

### C_IslandsQueue.QueueForIsland

SecretArguments=AllowedWhenUntainted

Arguments:

- `difficultyID`: number

### C_IslandsQueue.RequestPreloadRewardData

SecretArguments=AllowedWhenUntainted

Arguments:

- `questId`: number

## Events

### ISLANDS_QUEUE_CLOSE

SynchronousEvent=true

### ISLANDS_QUEUE_OPEN

SynchronousEvent=true

## Tables

### IslandsQueueDifficultyInfo

Fields:

- `difficultyId`: number
- `previewRewardQuestId`: number
