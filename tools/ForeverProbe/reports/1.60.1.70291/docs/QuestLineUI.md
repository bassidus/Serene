# QuestLineUI

Namespace `C_QuestLine`.

Environment=All, Predicates={}

## Functions

### C_QuestLine.GetAvailableQuestLines

SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

Returns:

- `questLines`: table<QuestLineInfo>

### C_QuestLine.GetForceVisibleQuests

SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

Returns:

- `questIDs`: table<number>

### C_QuestLine.GetQuestLineInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number
- `uiMapID`: number?
- `displayableOnly`: bool [default=false]

Returns:

- `questLineInfo`: QuestLineInfo?

### C_QuestLine.GetQuestLineQuests

SecretArguments=AllowedWhenUntainted

Arguments:

- `questLineID`: number

Returns:

- `questIDs`: table<number>

### C_QuestLine.IsComplete

SecretArguments=AllowedWhenUntainted

Arguments:

- `questLineID`: number

Returns:

- `isComplete`: bool

### C_QuestLine.QuestLineIgnoresAccountCompletedFiltering

SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number
- `questLineID`: number

Returns:

- `questLineIgnoresAccountCompletedFiltering`: bool

### C_QuestLine.RequestQuestLinesForMap

SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

## Tables

### QuestLineFloorLocation

MaxValue=2, MinValue=0, NumValues=3

Fields:

- `Above`: QuestLineFloorLocation [= 0]
- `Below`: QuestLineFloorLocation [= 1]
- `Same`: QuestLineFloorLocation [= 2]

### QuestLineInfo

Fields:

- `questLineName`: cstring
- `questName`: cstring
- `questLineID`: number
- `questID`: number
- `x`: number
- `y`: number
- `isHidden`: bool
- `isLegendary`: bool
- `isLocalStory`: bool
- `isDaily`: bool
- `isCampaign`: bool
- `isImportant`: bool
- `isAccountCompleted`: bool
- `isCombatAllyQuest`: bool
- `isMeta`: bool
- `inProgress`: bool
- `isQuestStart`: bool
- `floorLocation`: QuestLineFloorLocation
- `startMapID`: number
