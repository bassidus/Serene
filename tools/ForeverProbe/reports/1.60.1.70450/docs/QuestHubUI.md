# QuestHubUI

Namespace `C_QuestHub`.

Environment=All, Predicates={}

## Functions

### C_QuestHub.IsAreaPOICurrentlyRelatedToHub

SecretArguments=AllowedWhenUntainted

Arguments:

- `areaPoiID`: number
- `hubAreaPoiID`: number

Returns:

- `isRelated`: bool

### C_QuestHub.IsQuestCurrentlyRelatedToHub

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number
- `hubAreaPoiID`: number

Returns:

- `isRelated`: bool
