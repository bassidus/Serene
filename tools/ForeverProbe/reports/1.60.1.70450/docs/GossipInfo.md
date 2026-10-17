# GossipInfo

Namespace `C_GossipInfo`.

Environment=All, Predicates={}

## Functions

### C_GossipInfo.CloseGossip

### C_GossipInfo.ForceGossip

Returns:

- `forceGossip`: bool

### C_GossipInfo.GetActiveQuests

Returns:

- `info`: table<GossipQuestUIInfo>

### C_GossipInfo.GetAvailableQuests

Returns:

- `info`: table<GossipQuestUIInfo>

### C_GossipInfo.GetCompletedOptionDescriptionString

Returns:

- `description`: string?

### C_GossipInfo.GetCustomGossipDescriptionString

Returns:

- `description`: string?

### C_GossipInfo.GetFriendshipReputation

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `friendshipFactionID`: number

Returns:

- `reputationInfo`: FriendshipReputationInfo

### C_GossipInfo.GetFriendshipReputationRanks

SecretArguments=AllowedWhenUntainted

Arguments:

- `friendshipFactionID`: number

Returns:

- `rankInfo`: FriendshipReputationRankInfo

### C_GossipInfo.GetNumActiveQuests

Returns:

- `numQuests`: number

### C_GossipInfo.GetNumAvailableQuests

Returns:

- `numQuests`: number

### C_GossipInfo.GetOptionUIWidgetSetsAndTypesByOptionID

SecretArguments=AllowedWhenUntainted

Arguments:

- `gossipOptionID`: number

Returns:

- `gossipOptionUIWidgetSetsAndTypes`: table<GossipOptionUIWidgetSetAndType>?

### C_GossipInfo.GetOptions

Returns:

- `info`: table<GossipOptionUIInfo>

### C_GossipInfo.GetPoiForUiMapID

SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

Returns:

- `gossipPoiID`: number?

### C_GossipInfo.GetPoiInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number
- `gossipPoiID`: number

Returns:

- `gossipPoiInfo`: GossipPoiInfo?

### C_GossipInfo.GetText

Returns:

- `gossipText`: cstring

### C_GossipInfo.RefreshOptions

### C_GossipInfo.SelectActiveQuest

SecretArguments=AllowedWhenUntainted

Arguments:

- `optionID`: number

### C_GossipInfo.SelectAvailableQuest

SecretArguments=AllowedWhenUntainted

Arguments:

- `optionID`: number

### C_GossipInfo.SelectOption

SecretArguments=AllowedWhenUntainted

Arguments:

- `optionID`: number
- `text`: cstring?
- `confirmed`: bool?

### C_GossipInfo.SelectOptionByIndex

SecretArguments=AllowedWhenUntainted

Arguments:

- `optionID`: number
- `text`: cstring?
- `confirmed`: bool?

## Events

### DYNAMIC_GOSSIP_POI_UPDATED

UniqueEvent=true

### GOSSIP_CLOSED

SynchronousEvent=true

Payload:

- `interactionIsContinuing`: bool

### GOSSIP_CONFIRM

SynchronousEvent=true

Payload:

- `gossipID`: number
- `text`: string
- `cost`: WOWMONEY

### GOSSIP_CONFIRM_CANCEL

SynchronousEvent=true

### GOSSIP_ENTER_CODE

SynchronousEvent=true

Payload:

- `gossipID`: number

### GOSSIP_OPTIONS_REFRESHED

SynchronousEvent=true

### GOSSIP_SHOW

SynchronousEvent=true

Payload:

- `uiTextureKit`: textureKit?

## Tables

### GossipOptionRewardType

MaxValue=1, MinValue=0, NumValues=2

Fields:

- `Item`: GossipOptionRewardType [= 0]
- `Currency`: GossipOptionRewardType [= 1]

### GossipOptionStatus

MaxValue=3, MinValue=0, NumValues=4

Fields:

- `Available`: GossipOptionStatus [= 0]
- `Unavailable`: GossipOptionStatus [= 1]
- `Locked`: GossipOptionStatus [= 2]
- `AlreadyComplete`: GossipOptionStatus [= 3]

### GossipOptionUIWidgetSetTypes

MaxValue=1, MinValue=0, NumValues=2

Fields:

- `Modifiers`: GossipOptionUIWidgetSetTypes [= 0]
- `Background`: GossipOptionUIWidgetSetTypes [= 1]

### FriendshipReputationInfo

Fields:

- `friendshipFactionID`: number
- `standing`: number
- `maxRep`: number
- `name`: string?
- `text`: string
- `texture`: number
- `reaction`: string
- `reactionThreshold`: number
- `nextThreshold`: number?
- `reversedColor`: bool
- `overrideColor`: number?

### FriendshipReputationRankInfo

Fields:

- `currentLevel`: number
- `maxLevel`: number

### GossipOptionRewardInfo

Fields:

- `id`: number
- `quantity`: number
- `rewardType`: GossipOptionRewardType
- `context`: ItemCreationContext

### GossipOptionUIInfo

Fields:

- `gossipOptionID`: number?
- `name`: string
- `icon`: fileID
- `rewards`: table<GossipOptionRewardInfo>
- `status`: GossipOptionStatus
- `spellID`: number?
- `flags`: number
- `overrideIconID`: fileID?
- `selectOptionWhenOnlyOption`: bool
- `orderIndex`: number
- `failureDescription`: string?

### GossipOptionUIWidgetSetAndType

Fields:

- `widgetType`: number
- `uiWidgetSetID`: number

### GossipPoiInfo

Fields:

- `name`: string
- `textureIndex`: number
- `position`: vector2 (Vector2DMixin)
- `inBattleMap`: bool

### GossipQuestUIInfo

Fields:

- `title`: string
- `questLevel`: number
- `isTrivial`: bool
- `frequency`: number?
- `repeatable`: bool?
- `isComplete`: bool?
- `isLegendary`: bool
- `isIgnored`: bool
- `questID`: number
- `isImportant`: bool
- `isMeta`: bool
- `questInfoID`: number
