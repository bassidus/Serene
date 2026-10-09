# ContentTracking

Namespace `C_ContentTracking`.

Environment=All, Predicates={}

## Functions

### C_ContentTracking.GetBestMapForTrackable

SecretArguments=AllowedWhenUntainted

Arguments:

- `trackableType`: ContentTrackingType
- `trackableID`: number
- `ignoreWaypoint`: bool [default=false]

Returns:

- `result`: ContentTrackingResult
- `mapID`: number?

### C_ContentTracking.GetCollectableSourceTrackingEnabled

Returns:

- `isEnabled`: bool

### C_ContentTracking.GetCollectableSourceTypes

Returns:

- `collectableSourceTypes`: table<ContentTrackingType>

### C_ContentTracking.GetCurrentTrackingTarget

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `type`: ContentTrackingType
- `id`: number

Returns:

- `targetType`: ContentTrackingTargetType
- `targetID`: number

### C_ContentTracking.GetEncounterTrackingInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `journalEncounterID`: number

Returns:

- `trackingInfo`: EncounterTrackingInfo

### C_ContentTracking.GetNextWaypointForTrackable

SecretArguments=AllowedWhenUntainted

Arguments:

- `trackableType`: ContentTrackingType
- `trackableID`: number
- `uiMapID`: number

Returns:

- `result`: ContentTrackingResult
- `mapInfo`: ContentTrackingMapInfo?

### C_ContentTracking.GetObjectiveText

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `targetType`: ContentTrackingTargetType
- `targetID`: number
- `includeHyperlinks`: bool [default=true]

Returns:

- `objectiveText`: string

### C_ContentTracking.GetTitle

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `trackableType`: ContentTrackingType
- `trackableID`: number

Returns:

- `title`: string

### C_ContentTracking.GetTrackablesOnMap

SecretArguments=AllowedWhenUntainted

Arguments:

- `trackableType`: ContentTrackingType
- `uiMapID`: number

Returns:

- `result`: ContentTrackingResult
- `trackableMapInfos`: table<ContentTrackingMapInfo>

### C_ContentTracking.GetTrackedIDs

SecretArguments=AllowedWhenUntainted

Arguments:

- `trackableType`: ContentTrackingType

Returns:

- `entryIDs`: table<number>

### C_ContentTracking.GetVendorTrackingInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `collectableEntryID`: number

Returns:

- `vendorTrackingInfo`: VendorTrackingInfo

### C_ContentTracking.GetWaypointText

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `trackableType`: ContentTrackingType
- `trackableID`: number

Returns:

- `waypointText`: string

### C_ContentTracking.IsNavigable -- If successful, returns if the trackable is either on your current map, or if we're able to determine a route to that map from your location via waypoints.

SecretArguments=AllowedWhenUntainted

Arguments:

- `trackableType`: ContentTrackingType
- `trackableID`: number

Returns:

- `result`: ContentTrackingResult
- `isNavigable`: bool

### C_ContentTracking.IsTrackable

SecretArguments=AllowedWhenUntainted

Arguments:

- `type`: ContentTrackingType
- `id`: number

Returns:

- `isTrackable`: bool

### C_ContentTracking.IsTracking

SecretArguments=AllowedWhenUntainted

Arguments:

- `type`: ContentTrackingType
- `id`: number

Returns:

- `isTracking`: bool

### C_ContentTracking.StartTracking

SecretArguments=AllowedWhenUntainted

Arguments:

- `type`: ContentTrackingType
- `id`: number

Returns:

- `error`: ContentTrackingError?

### C_ContentTracking.StopTracking

SecretArguments=AllowedWhenUntainted

Arguments:

- `type`: ContentTrackingType
- `id`: number
- `stopType`: ContentTrackingStopType

### C_ContentTracking.ToggleTracking

SecretArguments=AllowedWhenUntainted

Arguments:

- `type`: ContentTrackingType
- `id`: number
- `stopType`: ContentTrackingStopType

Returns:

- `error`: ContentTrackingError?

## Events

### CONTENT_TRACKING_IS_ENABLED_UPDATE

SynchronousEvent=true

Payload:

- `isEnabled`: bool

### CONTENT_TRACKING_LIST_UPDATE

SynchronousEvent=true

### CONTENT_TRACKING_UPDATE

SynchronousEvent=true

Payload:

- `type`: ContentTrackingType
- `id`: number
- `isTracked`: bool

### TRACKABLE_INFO_UPDATE

SynchronousEvent=true

Payload:

- `type`: ContentTrackingType
- `id`: number

### TRACKING_TARGET_INFO_UPDATE

SynchronousEvent=true

Payload:

- `targetType`: ContentTrackingTargetType
- `targetID`: number
