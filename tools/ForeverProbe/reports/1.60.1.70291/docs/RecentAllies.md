# RecentAllies

Namespace `C_RecentAllies`.

Environment=All, Predicates={1={FailureMode=ReturnNothing, Name=RequiresRecentAllies, Type=Precondition}}

## Functions

### C_RecentAllies.CanSetRecentAllyNote

RequiresRecentAllies=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `characterGUID`: WOWGUID

Returns:

- `canSetNote`: bool

### C_RecentAllies.GetRecentAllies

RequiresRecentAllies=true

Returns:

- `recentAlliesData`: table<RecentAllyData>

### C_RecentAllies.GetRecentAllyByFullName

RequiresRecentAllies=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `fullCharacterName`: cstring

Returns:

- `recentAllyData`: RecentAllyData?

### C_RecentAllies.GetRecentAllyByGUID

RequiresRecentAllies=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `characterGUID`: WOWGUID

Returns:

- `recentAllyData`: RecentAllyData?

### C_RecentAllies.IsInteractionCategoryFilterSupportedForCurrentGameType

SecretArguments=AllowedWhenUntainted

Arguments:

- `interactionCategoryFilter`: RecentAlliesInteractionCategoryFilter

Returns:

- `isInteractionCategoryFilterSupportedForCurrentGameType`: bool

### C_RecentAllies.IsRecentAllyByFullName

RequiresRecentAllies=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `fullCharacterName`: cstring

Returns:

- `isRecentAlly`: bool

### C_RecentAllies.IsRecentAllyByGUID

RequiresRecentAllies=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `characterGUID`: WOWGUID

Returns:

- `isRecentAlly`: bool

### C_RecentAllies.IsRecentAllyDataReady

RequiresRecentAllies=true

Returns:

- `isReady`: bool

### C_RecentAllies.IsRecentAllyPinned

RequiresRecentAllies=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `characterGUID`: WOWGUID

Returns:

- `isPinned`: bool

### C_RecentAllies.IsSystemEnabled

Returns:

- `isRecentAllySystemEnabled`: bool

### C_RecentAllies.IsSystemSupported

Returns:

- `isRecentAllySystemSupported`: bool

### C_RecentAllies.SearchRecentAllies

RequiresRecentAllies=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `searchInfo`: RecentAlliesSearchInfo

Returns:

- `recentAlliesData`: table<RecentAllyData>

### C_RecentAllies.SetRecentAllyNote

RequiresRecentAllies=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `characterGUID`: WOWGUID
- `note`: cstring

### C_RecentAllies.SetRecentAllyPinned

RequiresRecentAllies=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `characterGUID`: WOWGUID
- `isPinned`: bool

### C_RecentAllies.TryRequestRecentAlliesData

HasRestrictions=true, RequiresRecentAllies=true

## Events

### LET_RECENT_ALLIES_SEE_LOCATION_SETTING_UPDATED

SynchronousEvent=true

### RECENT_ALLIES_CACHE_UPDATE

UniqueEvent=true

### RECENT_ALLIES_DATA_READY

SynchronousEvent=true

### RECENT_ALLIES_SYSTEM_STATUS_UPDATED

SynchronousEvent=true

### RECENT_ALLY_DATA_UPDATED

SynchronousEvent=true

Payload:

- `characterGUID`: WOWGUID

## Tables

### RecentAlliesSearchInfo

Fields:

- `searchText`: string
- `isOnline`: bool
- `isDND`: bool
- `isAFK`: bool
- `isOffline`: bool
- `interactionCategoryFilters`: table<RecentAlliesInteractionCategoryFilter>

### RecentAllyCharacterData

Fields:

- `guid`: WOWGUID
- `name`: string
- `fullName`: string
- `realmName`: string
- `level`: number
- `classID`: number
- `raceID`: number
- `sex`: UnitSex

### RecentAllyData

Fields:

- `stateData`: RecentAllyStateData
- `characterData`: RecentAllyCharacterData
- `interactionData`: RecentAllyInteractionData

### RecentAllyInteraction

Fields:

- `type`: RolodexType
- `description`: cstring
- `timestamp`: time_t
- `contextData`: RecentAllyInteractionContextData

### RecentAllyInteractionContextData

Fields:

- `itemID`: number?
- `locationName`: cstring?
- `activityDifficultyID`: number?
- `activityDifficultyLevel`: number?

### RecentAllyInteractionData

Fields:

- `interactions`: table<RecentAllyInteraction>
- `note`: string?

### RecentAllyStateData

Fields:

- `isOnline`: bool
- `isDND`: bool
- `isAFK`: bool
- `isConvertedLegacyFriend`: bool
- `pinExpirationDate`: time_t?
- `friendRequestSentThisSession`: bool
- `currentLocation`: string?
