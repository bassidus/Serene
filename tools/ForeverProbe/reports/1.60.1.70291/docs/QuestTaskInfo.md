# QuestTaskInfo

Namespace `C_TaskQuest`.

Environment=All, Predicates={}

## Functions

### C_TaskQuest.DoesMapShowTaskQuestObjectives

SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

Returns:

- `showsTaskQuestObjectives`: bool

### C_TaskQuest.GetQuestInfoByQuestID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `questTitle`: cstring
- `factionID`: number?
- `capped`: bool?
- `displayAsObjective`: bool?

### C_TaskQuest.GetQuestLocation

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number
- `uiMapID`: number

Returns:

- `locationX`: number
- `locationY`: number

### C_TaskQuest.GetQuestProgressBarInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `progress`: number

### C_TaskQuest.GetQuestTimeLeftMinutes

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `minutesLeft`: number

### C_TaskQuest.GetQuestTimeLeftSeconds

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `secondsLeft`: number

### C_TaskQuest.GetQuestUIWidgetSetByType

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number
- `type`: MapIconUIWidgetSetType

Returns:

- `widgetSet`: number

### C_TaskQuest.GetQuestZoneID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `uiMapID`: number

### C_TaskQuest.GetQuestsOnMap

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

Returns:

- `taskPOIs`: table<QuestPOIMapInfo>

### C_TaskQuest.GetThreatQuests

Returns:

- `quests`: table<number>

### C_TaskQuest.IsActive

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `active`: bool

### C_TaskQuest.RequestPreloadRewardData

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number
