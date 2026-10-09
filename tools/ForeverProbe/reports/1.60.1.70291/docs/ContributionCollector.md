# ContributionCollector

Namespace `C_ContributionCollector`.

Environment=All, Predicates={}

## Functions

### C_ContributionCollector.Close

### C_ContributionCollector.Contribute

SecretArguments=AllowedWhenUntainted

Arguments:

- `contributionID`: number

### C_ContributionCollector.GetActive

Returns:

- `contributionID`: number [StrideIndex=1]

### C_ContributionCollector.GetAtlases

SecretArguments=AllowedWhenUntainted

Arguments:

- `contributionID`: number

Returns:

- `atlasName`: table<textureAtlas>

### C_ContributionCollector.GetBuffs

SecretArguments=AllowedWhenUntainted

Arguments:

- `contributionID`: number

Returns:

- `spellID`: number [StrideIndex=1]

### C_ContributionCollector.GetContributionAppearance

SecretArguments=AllowedWhenUntainted

Arguments:

- `contributionID`: number
- `contributionState`: ContributionState

Returns:

- `appearance`: ContributionAppearance?

### C_ContributionCollector.GetContributionCollectorsForMap

SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

Returns:

- `contributionCollectors`: table<ContributionMapInfo>

### C_ContributionCollector.GetContributionResult

SecretArguments=AllowedWhenUntainted

Arguments:

- `contributionID`: number

Returns:

- `result`: ContributionResult

### C_ContributionCollector.GetDescription

SecretArguments=AllowedWhenUntainted

Arguments:

- `contributionID`: number

Returns:

- `description`: cstring [default=]

### C_ContributionCollector.GetManagedContributionsForCreatureID

SecretArguments=AllowedWhenUntainted

Arguments:

- `creatureID`: number

Returns:

- `contributionID`: number [StrideIndex=1]

### C_ContributionCollector.GetName

SecretArguments=AllowedWhenUntainted

Arguments:

- `contributionID`: number

Returns:

- `name`: cstring [default=]

### C_ContributionCollector.GetOrderIndex

SecretArguments=AllowedWhenUntainted

Arguments:

- `contributionID`: number

Returns:

- `orderIndex`: number

### C_ContributionCollector.GetRequiredContributionCurrency

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `contributionID`: number

Returns:

- `currencyID`: number [default=0]
- `currencyAmount`: number [default=0]

### C_ContributionCollector.GetRequiredContributionItem

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `contributionID`: number

Returns:

- `itemID`: number [default=0]
- `itemCount`: number [default=0]

### C_ContributionCollector.GetRewardQuestID

SecretArguments=AllowedWhenUntainted

Arguments:

- `contributionID`: number

Returns:

- `questID`: number

### C_ContributionCollector.GetState

SecretArguments=AllowedWhenUntainted

Arguments:

- `contributionID`: number

Returns:

- `contributionState`: ContributionState [default=None]
- `contributionPercentageComplete`: number
- `timeOfNextStateChange`: time_t?
- `startTime`: time_t

### C_ContributionCollector.HasPendingContribution

SecretArguments=AllowedWhenUntainted

Arguments:

- `contributionID`: number

Returns:

- `hasPending`: bool

### C_ContributionCollector.IsAwaitingRewardQuestData

SecretArguments=AllowedWhenUntainted

Arguments:

- `contributionID`: number

Returns:

- `awaitingData`: bool

## Events

### CONTRIBUTION_CHANGED

SynchronousEvent=true

Payload:

- `state`: ContributionState
- `result`: ContributionResult
- `name`: string
- `contributionID`: number [StrideIndex=1]

### CONTRIBUTION_COLLECTOR_PENDING

SynchronousEvent=true

Payload:

- `contributionID`: number
- `isPending`: bool
- `result`: number

### CONTRIBUTION_COLLECTOR_UPDATE

UniqueEvent=true

### CONTRIBUTION_COLLECTOR_UPDATE_SINGLE

SynchronousEvent=true

Payload:

- `contributionID`: number

## Tables

### ContributionResult

MaxValue=7, MinValue=0, NumValues=8

Fields:

- `Success`: ContributionResult [= 0]
- `MustBeNearNpc`: ContributionResult [= 1]
- `IncorrectState`: ContributionResult [= 2]
- `InvalidID`: ContributionResult [= 3]
- `QuestDataMissing`: ContributionResult [= 4]
- `FailedConditionCheck`: ContributionResult [= 5]
- `UnableToCompleteTurnIn`: ContributionResult [= 6]
- `InternalError`: ContributionResult [= 7]

### ContributionAppearance

Fields:

- `stateName`: cstring
- `stateColor`: colorRGB (ColorMixin)
- `tooltipLine`: cstring
- `tooltipUseTimeRemaining`: bool
- `statusBarAtlas`: textureAtlas
- `borderAtlas`: textureAtlas
- `bannerAtlas`: textureAtlas

### ContributionMapInfo

Fields:

- `areaPoiID`: number
- `position`: vector2 (Vector2DMixin)
- `name`: cstring
- `atlasName`: string
- `collectorCreatureID`: number
