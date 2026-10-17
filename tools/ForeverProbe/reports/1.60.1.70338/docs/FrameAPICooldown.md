# FrameAPICooldown

Environment=All, Predicates={}

## Functions

### Clear

IsProtectedFunction=true

### GetCooldownDisplayDuration -- The returned duration unit is milliseconds, unaffected by modRate.

SecretReturnsForAspect={1=32768}

Returns:

- `duration`: number

### GetCooldownDuration -- The returned duration unit is milliseconds and is multiplied by the modRate.

SecretReturnsForAspect={1=32768}

Returns:

- `duration`: number

### GetCooldownTimes

SecretReturnsForAspect={1=32768}

Returns:

- `start`: number
- `duration`: number

### GetCountdownAbbrevThreshold -- Returns the threshold below which cooldown numbers are displayed as an abbreviated form without a unit suffix (eg. '1:31').

Returns:

- `seconds`: Seconds

### GetCountdownFontString

Returns:

- `countdownString`: SimpleFontString

### GetCountdownFormatter

Returns:

- `formatter`: NumericFormatter?

### GetCountdownMillisecondsThreshold -- Returns the threshold below which cooldown numbers are displayed as a decimal value with one place for milliseconds (eg. '8.7').

Returns:

- `seconds`: Seconds

### GetDrawBling

SecretReturnsForAspect={1=524288}

Returns:

- `drawBling`: bool

### GetDrawEdge

SecretReturnsForAspect={1=524288}

Returns:

- `drawEdge`: bool

### GetDrawSwipe

SecretReturnsForAspect={1=524288}

Returns:

- `drawSwipe`: bool

### GetEdgeScale

Returns:

- `edgeScale`: number

### GetHideCountdownNumbers

Returns:

- `hideNumbers`: bool

### GetMinimumCountdownDuration

Returns:

- `milliseconds`: Milliseconds

### GetReverse

Returns:

- `reverse`: bool

### GetRotation

Returns:

- `rotationRadians`: number

### GetUseAuraDisplayTime

Returns:

- `useAuraDisplayTime`: bool

### IsPaused

Returns:

- `isPaused`: bool

### Pause

### Resume

### SetBlingTexture

SecretArguments=AllowedWhenUntainted

Arguments:

- `texture`: FileAsset
- `colorR`: number
- `colorG`: number
- `colorB`: number
- `colorA`: number

### SetCooldown

IsProtectedFunction=true, SecretArguments=AllowedWhenUntainted, SecretArgumentsAddAspect={1=32768}

Arguments:

- `start`: Seconds
- `duration`: Seconds
- `modRate`: number [default=1]

### SetCooldownDuration

IsProtectedFunction=true, SecretArguments=AllowedWhenUntainted, SecretArgumentsAddAspect={1=32768}

Arguments:

- `duration`: Seconds
- `modRate`: number [default=1]

### SetCooldownFromDurationObject

IsProtectedFunction=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `duration`: LuaDurationObject
- `clearIfZero`: bool [default=true]

### SetCooldownFromExpirationTime

IsProtectedFunction=true, SecretArguments=AllowedWhenUntainted, SecretArgumentsAddAspect={1=32768}

Arguments:

- `expirationTime`: Seconds
- `duration`: Seconds
- `modRate`: number [default=1]

### SetCooldownUNIX

IsProtectedFunction=true, SecretArguments=AllowedWhenUntainted, SecretArgumentsAddAspect={1=32768}

Arguments:

- `start`: number
- `duration`: number
- `modRate`: number [default=1]

### SetCountdownAbbrevThreshold -- Sets the threshold below which cooldown numbers are displayed as an abbreviated form without a unit suffix (eg. '1:31').

SecretArguments=AllowedWhenUntainted

Arguments:

- `seconds`: Seconds -- Number of seconds below which numbers will be abbreviated. If above one hour or below one minute, no abbreviation will be performed.

### SetCountdownFont

SecretArguments=AllowedWhenUntainted

Arguments:

- `fontName`: cstring

### SetCountdownFormatter

SecretArguments=AllowedWhenUntainted

Arguments:

- `formatter`: NumericFormatter?

### SetCountdownMillisecondsThreshold -- Sets the threshold below which cooldown numbers are displayed as a decimal value with one place for milliseconds (eg. '8.7').

SecretArguments=AllowedWhenUntainted

Arguments:

- `seconds`: Seconds -- Number of seconds below which numbers are displayed with milliseconds.

### SetDrawBling

SecretArguments=AllowedWhenTainted, SecretArgumentsAddAspect={1=524288}

Arguments:

- `drawBling`: bool [default=false]

### SetDrawEdge

SecretArguments=AllowedWhenTainted, SecretArgumentsAddAspect={1=524288}

Arguments:

- `drawEdge`: bool [default=false]

### SetDrawSwipe

SecretArguments=AllowedWhenTainted, SecretArgumentsAddAspect={1=524288}

Arguments:

- `drawSwipe`: bool [default=false]

### SetEdgeColor

SecretArguments=AllowedWhenTainted, SecretArgumentsAddAspect={1=524288}

Arguments:

- `colorR`: number
- `colorG`: number
- `colorB`: number
- `a`: SingleColorValue?

### SetEdgeScale

SecretArguments=AllowedWhenUntainted

Arguments:

- `scale`: number

### SetEdgeTexture

SecretArguments=AllowedWhenUntainted

Arguments:

- `texture`: FileAsset
- `colorR`: number
- `colorG`: number
- `colorB`: number
- `colorA`: number

### SetHideCountdownNumbers

SecretArguments=AllowedWhenUntainted

Arguments:

- `hideNumbers`: bool [default=false]

### SetMinimumCountdownDuration -- Controls the minimum duration above which countdown text will be shown. This is applied based upon the total duration of the cooldown, not the remaining duration as it ticks down.

SecretArguments=AllowedWhenUntainted

Arguments:

- `milliseconds`: Milliseconds

### SetPaused

SecretArguments=AllowedWhenUntainted

Arguments:

- `paused`: bool

### SetReverse

SecretArguments=AllowedWhenUntainted

Arguments:

- `reverse`: bool [default=false]

### SetRotation

SecretArguments=AllowedWhenUntainted

Arguments:

- `rotationRadians`: number

### SetSwipeColor

SecretArguments=AllowedWhenTainted, SecretArgumentsAddAspect={1=524288}

Arguments:

- `colorR`: number
- `colorG`: number
- `colorB`: number
- `a`: SingleColorValue?

### SetSwipeTexture

SecretArguments=AllowedWhenUntainted

Arguments:

- `texture`: FileAsset?
- `colorR`: number
- `colorG`: number
- `colorB`: number
- `colorA`: number

### SetTexCoordRange

SecretArguments=AllowedWhenUntainted

Arguments:

- `low`: vector2 (Vector2DMixin)
- `high`: vector2 (Vector2DMixin)

### SetUseAuraDisplayTime -- Aura durations are displayed slightly differently than cooldown durations. Setting this to true will adjust the display logic to stay in sync with aura timers.

SecretArguments=AllowedWhenUntainted

Arguments:

- `useAuraDisplayTime`: bool [default=false]

### SetUseCircularEdge

SecretArguments=AllowedWhenUntainted

Arguments:

- `useCircularEdge`: bool [default=false]
