# RaidMarkers

Environment=All, Predicates={}

## Functions

### CanBeRaidTarget

SecretArguments=AllowedWhenUntainted

Arguments:

- `target`: UnitToken

Returns:

- `result`: bool

### ClearRaidMarker

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `raidMarkerIndex`: luaIndex

### GetNextAvailableRaidTargetMarkerIndex

SecretArguments=AllowedWhenUntainted, SecretInChatMessagingLockdown=true

Arguments:

- `startIndex`: luaIndex
- `reverseSearch`: bool [default=false]
- `wrapSearch`: bool [default=false]
- `treatDeadNonFriendlyAsAvailable`: bool [default=false]

Returns:

- `nextAvailableRaidTargetMarkerIndex`: luaIndex

### GetRaidTargetIndex

SecretArguments=AllowedWhenUntainted, SecretReturns=true

Arguments:

- `target`: UnitToken

Returns:

- `result`: luaIndex?

### IsRaidMarkerActive

SecretArguments=AllowedWhenUntainted, SecretInChatMessagingLockdown=true

Arguments:

- `index`: luaIndex

Returns:

- `result`: bool

### IsRaidMarkerSystemEnabled

Returns:

- `enabled`: bool

### PlaceRaidMarker

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex
- `token`: cstring?

### RemoveRaidTargets -- Removes all assigned raid target markers.

HasRestrictions=true

### SetRaidTarget

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `target`: UnitToken
- `userIndex`: luaIndex
