# ReputationInfo

Namespace `C_Reputation`.

Environment=All, Predicates={}

## Functions

### C_Reputation.AreLegacyReputationsShown

Returns:

- `areLegacyReputationsShown`: bool

### C_Reputation.CollapseAllFactionHeaders

### C_Reputation.CollapseFactionHeader

SecretArguments=AllowedWhenUntainted

Arguments:

- `factionSortIndex`: luaIndex

### C_Reputation.ExpandAllFactionHeaders

### C_Reputation.ExpandFactionHeader

SecretArguments=AllowedWhenUntainted

Arguments:

- `factionSortIndex`: luaIndex

### C_Reputation.GetFactionDataByID

SecretArguments=AllowedWhenUntainted

Arguments:

- `factionID`: number

Returns:

- `factionData`: FactionData?

### C_Reputation.GetFactionDataByIndex

SecretArguments=AllowedWhenUntainted

Arguments:

- `factionSortIndex`: luaIndex

Returns:

- `factionData`: FactionData?

### C_Reputation.GetFactionParagonInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `factionID`: number

Returns:

- `currentValue`: number
- `threshold`: number
- `rewardQuestID`: number
- `hasRewardPending`: bool
- `tooLowLevelForParagon`: bool
- `paragonStorageLevel`: number

### C_Reputation.GetGuildFactionData

Returns:

- `guildFactionData`: FactionData?

### C_Reputation.GetGuildRepExpirationTime

Returns:

- `expirationTime`: number?

### C_Reputation.GetNumFactions

Returns:

- `numFactions`: number

### C_Reputation.GetReputationSortType

Returns:

- `sortType`: ReputationSortType

### C_Reputation.GetSelectedFaction

Returns:

- `selectedFactionSortIndex`: luaIndex

### C_Reputation.GetWatchedFactionData

Returns:

- `watchedFactionData`: FactionData?

### C_Reputation.IsAccountWideReputation

SecretArguments=AllowedWhenUntainted

Arguments:

- `factionID`: number

Returns:

- `isAccountWide`: bool

### C_Reputation.IsFactionActive

SecretArguments=AllowedWhenUntainted

Arguments:

- `factionSortIndex`: luaIndex

Returns:

- `isActive`: bool

### C_Reputation.IsFactionParagon

SecretArguments=AllowedWhenUntainted

Arguments:

- `factionID`: number

Returns:

- `factionIsParagon`: bool

### C_Reputation.IsFactionParagonForCurrentPlayer

SecretArguments=AllowedWhenUntainted

Arguments:

- `factionID`: number

Returns:

- `currentPlayerHasParagon`: bool

### C_Reputation.IsMajorFaction

SecretArguments=AllowedWhenUntainted

Arguments:

- `factionID`: number

Returns:

- `isMajorFaction`: bool

### C_Reputation.RequestFactionParagonPreloadRewardData

SecretArguments=AllowedWhenUntainted

Arguments:

- `factionID`: number

### C_Reputation.SetFactionActive

SecretArguments=AllowedWhenUntainted

Arguments:

- `factionSortIndex`: luaIndex
- `setActive`: bool

### C_Reputation.SetLegacyReputationsShown

SecretArguments=AllowedWhenUntainted

Arguments:

- `showLegacyReputations`: bool

### C_Reputation.SetReputationSortType

SecretArguments=AllowedWhenUntainted

Arguments:

- `sortType`: ReputationSortType

### C_Reputation.SetSelectedFaction

SecretArguments=AllowedWhenUntainted

Arguments:

- `factionSortIndex`: luaIndex

### C_Reputation.SetWatchedFactionByID

SecretArguments=AllowedWhenUntainted

Arguments:

- `factionID`: number

### C_Reputation.SetWatchedFactionByIndex

SecretArguments=AllowedWhenUntainted

Arguments:

- `factionSortIndex`: luaIndex

### C_Reputation.ToggleFactionAtWar

SecretArguments=AllowedWhenUntainted

Arguments:

- `factionSortIndex`: luaIndex

## Events

### FACTION_STANDING_CHANGED

SynchronousEvent=true

Payload:

- `factionID`: number
- `updatedStanding`: number

## Tables

### ReputationSortType

MaxValue=2, MinValue=0, NumValues=3

Fields:

- `None`: ReputationSortType [= 0]
- `Account`: ReputationSortType [= 1]
- `Character`: ReputationSortType [= 2]

### FactionData

Fields:

- `factionID`: number
- `name`: cstring
- `description`: cstring
- `reaction`: luaIndex
- `currentReactionThreshold`: number
- `nextReactionThreshold`: number
- `currentStanding`: number
- `atWarWith`: bool
- `canToggleAtWar`: bool
- `isChild`: bool
- `isHeader`: bool
- `isHeaderWithRep`: bool
- `isCollapsed`: bool
- `isWatched`: bool
- `hasBonusRepGain`: bool
- `canSetInactive`: bool
- `isAccountWide`: bool
