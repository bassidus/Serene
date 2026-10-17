# AdventureMap

Namespace `C_AdventureMap`.

Environment=All, Predicates={}

## Functions

### C_AdventureMap.GetAdventureMapTextureKit

Returns:

- `adventureMapTextureKit`: textureKit

### C_AdventureMap.GetNumMapInsets

Returns:

- `numMapInsets`: number

### C_AdventureMap.GetNumQuestOffers

Returns:

- `numQuestOffers`: number

### C_AdventureMap.GetNumZoneChoices

Returns:

- `numZoneChoices`: number

### C_AdventureMap.GetQuestPortraitInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `info`: AdventureMapQuestPortraitInfo

## Events

### ADVENTURE_MAP_CLOSE

SynchronousEvent=true

### ADVENTURE_MAP_OPEN

SynchronousEvent=true

Payload:

- `followerTypeID`: number

### ADVENTURE_MAP_QUEST_UPDATE

SynchronousEvent=true

Payload:

- `questID`: number

### ADVENTURE_MAP_UPDATE_INSETS

UniqueEvent=true

### ADVENTURE_MAP_UPDATE_POIS

UniqueEvent=true

## Tables

### AdventureMapQuestPortraitInfo

Fields:

- `portraitDisplayID`: number
- `mountPortraitDisplayID`: number
- `name`: string
- `text`: string
- `modelSceneID`: number?
