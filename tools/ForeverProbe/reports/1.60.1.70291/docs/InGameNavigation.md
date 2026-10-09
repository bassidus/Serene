# InGameNavigation

Namespace `C_Navigation`.

Environment=All, Predicates={}

## Functions

### C_Navigation.GetDistance

Returns:

- `distance`: number

### C_Navigation.GetFrame

Returns:

- `frame`: ScriptRegion?

### C_Navigation.GetNearestPartyMemberToken

HasRestrictions=true

Returns:

- `unitToken`: cstring

### C_Navigation.GetNextWaypointForMap

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

Returns:

- `x`: number
- `y`: number
- `waypointDescription`: string

### C_Navigation.GetTargetState

Returns:

- `state`: NavigationState

### C_Navigation.HasValidScreenPosition

Returns:

- `hasValidScreenPosition`: bool

### C_Navigation.WasClampedToScreen

Returns:

- `wasClamped`: bool

## Events

### NAVIGATION_DESTINATION_REACHED

SynchronousEvent=true

Payload:

- `isWaypoint`: bool

### NAVIGATION_FRAME_CREATED

SynchronousEvent=true

Payload:

- `region`: ScriptRegion

### NAVIGATION_FRAME_DESTROYED

SynchronousEvent=true

## Tables

### NavigationState

MaxValue=3, MinValue=0, NumValues=4

Fields:

- `Invalid`: NavigationState [= 0]
- `Occluded`: NavigationState [= 1]
- `InRange`: NavigationState [= 2]
- `Disabled`: NavigationState [= 3]
