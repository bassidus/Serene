# SwingTimer

Namespace `C_SwingTimer`.

Environment=All, Predicates={}

## Functions

### C_SwingTimer.EnableRangeCheck -- Used in conjunction with PlayerSwingRangeUpdate to inform the UI when the current target goes in or out of auto attack range.

SecretArguments=AllowedWhenUntainted

Arguments:

- `swingType`: PlayerSwingType
- `enable`: bool -- True if changes in range for the swing type should dispatch PlayerSwingRangeUpdate. False if the swing type no longer needs the event.

### C_SwingTimer.IsTargetWithinSwingRange -- Whether the current target is within range of the player's auto attack for the given swing type. Auto attacks only ever apply to the current target, so no other unit can be queried.

SecretArguments=AllowedWhenUntainted

Arguments:

- `swingType`: PlayerSwingType

Returns:

- `isInRange`: bool? -- Nil when no range check could be made, for example there is no target, the target cannot be attacked, or no weapon is equipped for the swing type. Nil must not be treated as out of range.

## Events

### PLAYER_SWING

SynchronousEvent=true

Payload:

- `swingDuration`: number
- `swingType`: PlayerSwingType

### PLAYER_SWING_RANGE_UPDATE -- Only signaled for swing types that have an active range check. See C_SwingTimer.EnableRangeCheck.

SynchronousEvent=true

Payload:

- `swingType`: PlayerSwingType
- `isInRange`: bool -- Whether the current target is within auto attack range. Should not be used if the 'checksRange' parameter is false.
- `checksRange`: bool -- Can be false if a range check was not made for any reason, for example there is not a current target.

## Tables

### PlayerSwingType

MaxValue=2, MinValue=0, NumValues=3

Fields:

- `MainHand`: PlayerSwingType [= 0]
- `OffHand`: PlayerSwingType [= 1]
- `Ranged`: PlayerSwingType [= 2]
