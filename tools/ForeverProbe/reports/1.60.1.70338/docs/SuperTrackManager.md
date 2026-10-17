# SuperTrackManager

Namespace `C_SuperTrack`.

Environment=All, Predicates={}

## Functions

### C_SuperTrack.ClearAllSuperTracked

### C_SuperTrack.ClearSuperTrackedContent

### C_SuperTrack.ClearSuperTrackedMapPin

### C_SuperTrack.GetHighestPrioritySuperTrackingType

Returns:

- `type`: SuperTrackingType?

### C_SuperTrack.GetSuperTrackedContent

MayReturnNothing=true

Returns:

- `trackableType`: ContentTrackingType
- `trackableID`: number

### C_SuperTrack.GetSuperTrackedItemName

MayReturnNothing=true

Returns:

- `name`: string
- `description`: string

### C_SuperTrack.GetSuperTrackedMapPin

MayReturnNothing=true

Returns:

- `type`: SuperTrackingMapPinType
- `typeID`: number

### C_SuperTrack.GetSuperTrackedQuestID

Returns:

- `questID`: number?

### C_SuperTrack.GetSuperTrackedVignette

Returns:

- `vignetteGUID`: WOWGUID?

### C_SuperTrack.IsSuperTrackingAnything

Returns:

- `isSuperTracking`: bool

### C_SuperTrack.IsSuperTrackingContent

Returns:

- `isSuperTracking`: bool

### C_SuperTrack.IsSuperTrackingCorpse

Returns:

- `isSuperTracking`: bool

### C_SuperTrack.IsSuperTrackingMapPin

Returns:

- `isSuperTracking`: bool

### C_SuperTrack.IsSuperTrackingQuest

Returns:

- `isSuperTracking`: bool

### C_SuperTrack.IsSuperTrackingUserWaypoint

Returns:

- `isSuperTracking`: bool

### C_SuperTrack.SetSuperTrackedContent

SecretArguments=AllowedWhenUntainted

Arguments:

- `trackableType`: ContentTrackingType
- `trackableID`: number

### C_SuperTrack.SetSuperTrackedMapPin

SecretArguments=AllowedWhenUntainted

Arguments:

- `type`: SuperTrackingMapPinType
- `typeID`: number

### C_SuperTrack.SetSuperTrackedQuestID

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

### C_SuperTrack.SetSuperTrackedUserWaypoint

SecretArguments=AllowedWhenUntainted

Arguments:

- `superTracked`: bool

### C_SuperTrack.SetSuperTrackedVignette

SecretArguments=AllowedWhenUntainted

Arguments:

- `vignetteGUID`: WOWGUID

## Events

### SUPER_TRACKING_CHANGED

UniqueEvent=true

### SUPER_TRACKING_PATH_UPDATED

UniqueEvent=true
