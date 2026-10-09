# LuaDurationObjectAPI

Environment=All, ObjectType=Userdata, Predicates={}

## Functions

### Assign -- Copies another duration object and assigns it to this one.

SecretArguments=AllowedWhenUntainted

Arguments:

- `other`: LuaDurationObject

### Copy -- Returns a copy of this duration object.

ReturnsNeverSecret=true

Returns:

- `copy`: LuaDurationObject

### EvaluateElapsedDuration -- Calculates the elapsed duration in seconds and evaluates it against a supplied curve.

SecretArguments=AllowedWhenUntainted, SecretWhenCurveSecret=true

Arguments:

- `curve`: LuaCurveObjectBase
- `modifier`: DurationTimeModifier [default=RealTime]

Returns:

- `result`: LuaCurveEvaluatedResult

### EvaluateElapsedPercent -- Calculates the elapsed duration as a percentage value and evaluates it against a supplied curve.

SecretArguments=AllowedWhenUntainted, SecretWhenCurveSecret=true

Arguments:

- `curve`: LuaCurveObjectBase
- `modifier`: DurationTimeModifier [default=RealTime]

Returns:

- `result`: LuaCurveEvaluatedResult

### EvaluateRemainingDuration -- Calculates the remaining duration in seconds and evaluates it against a supplied curve.

SecretArguments=AllowedWhenUntainted, SecretWhenCurveSecret=true

Arguments:

- `curve`: LuaCurveObjectBase
- `modifier`: DurationTimeModifier [default=RealTime]

Returns:

- `result`: LuaCurveEvaluatedResult

### EvaluateRemainingPercent -- Calculates the remaining duration as a percentage value and evaluates it against a supplied curve.

SecretArguments=AllowedWhenUntainted, SecretWhenCurveSecret=true

Arguments:

- `curve`: LuaCurveObjectBase
- `modifier`: DurationTimeModifier [default=RealTime]

Returns:

- `result`: LuaCurveEvaluatedResult

### EvaluateTotalDuration -- Calculates the total duration in seconds and evaluates it against a supplied curve.

SecretArguments=AllowedWhenUntainted, SecretWhenCurveSecret=true

Arguments:

- `curve`: LuaCurveObjectBase
- `modifier`: DurationTimeModifier [default=RealTime]

Returns:

- `result`: LuaCurveEvaluatedResult

### FormatElapsedDuration -- Formats the elapsed duration of this object to a string.

SecretArguments=AllowedWhenUntainted, SecretWhenNumericFormatterSecret=true

Arguments:

- `formatter`: NumericFormatter
- `modifier`: DurationTimeModifier [default=RealTime]

Returns:

- `formatted`: string

### FormatRemainingDuration -- Formats the remaining duration of this object to a string.

SecretArguments=AllowedWhenUntainted, SecretWhenNumericFormatterSecret=true

Arguments:

- `formatter`: NumericFormatter
- `modifier`: DurationTimeModifier [default=RealTime]

Returns:

- `formatted`: string

### FormatTotalDuration -- Formats the total duration of this object to a string.

SecretArguments=AllowedWhenUntainted, SecretWhenNumericFormatterSecret=true

Arguments:

- `formatter`: NumericFormatter
- `modifier`: DurationTimeModifier [default=RealTime]

Returns:

- `formatted`: string

### GetClock -- Returns the clock source used by this object.

Returns:

- `clock`: LuaDurationClock? -- If nil, the duration object is using an internal default clock source equivalent to GetTime().

### GetClockTime -- Returns the current time of the clock source used by this object.

Returns:

- `clockTime`: FrameTime

### GetElapsedDuration -- Calculates the elapsed duration of the stored time span.

SecretArguments=AllowedWhenUntainted

Arguments:

- `modifier`: DurationTimeModifier [default=RealTime]

Returns:

- `elapsedDuration`: Seconds

### GetElapsedPercent -- Calculates the elapsed duration as a percentage value.

SecretArguments=AllowedWhenUntainted

Arguments:

- `modifier`: DurationTimeModifier [default=RealTime]

Returns:

- `elapsedPercent`: number

### GetEndTime -- Calculates the end time of the stored time span.

SecretArguments=AllowedWhenUntainted

Arguments:

- `modifier`: DurationTimeModifier [default=RealTime]

Returns:

- `endTime`: FrameTime

### GetModRate -- Returns the divisor used to convert a duration from real time to base time.

Returns:

- `modRate`: number

### GetRemainingDuration -- Calculates the remaining duration of the stored time span.

SecretArguments=AllowedWhenUntainted

Arguments:

- `modifier`: DurationTimeModifier [default=RealTime]

Returns:

- `remainingDuration`: Seconds

### GetRemainingPercent -- Calculates the remaining duration as a percentage value.

SecretArguments=AllowedWhenUntainted

Arguments:

- `modifier`: DurationTimeModifier [default=RealTime]

Returns:

- `remainingPercent`: number

### GetStartTime -- Calculates the start time of the stored time span.

SecretArguments=AllowedWhenUntainted

Arguments:

- `modifier`: DurationTimeModifier [default=RealTime]

Returns:

- `startTime`: FrameTime

### GetTotalDuration -- Calculates the total duration of the stored time span.

SecretArguments=AllowedWhenUntainted

Arguments:

- `modifier`: DurationTimeModifier [default=RealTime]

Returns:

- `totalDuration`: Seconds

### HasExpired -- Returns true once the duration has reached its end time.

SecretArguments=AllowedWhenUntainted

Arguments:

- `modifier`: DurationTimeModifier [default=RealTime]

Returns:

- `hasExpired`: bool

### HasSecretValues -- Returns true if the duration has been configured with any secret values.

ReturnsNeverSecret=true

Returns:

- `hasSecretValues`: bool

### HasStarted -- Returns true once the duration has reached its start time.

SecretArguments=AllowedWhenUntainted

Arguments:

- `modifier`: DurationTimeModifier [default=RealTime]

Returns:

- `hasStarted`: bool

### IsActive -- Returns true while the duration is at or after its start time and before its end time.

SecretArguments=AllowedWhenUntainted

Arguments:

- `modifier`: DurationTimeModifier [default=RealTime]

Returns:

- `isActive`: bool

### IsZero -- Returns true if the duration object is measuring a zero duration time span.

Returns:

- `isZero`: bool

### Reset -- Resets the duration object to represent a zero duration time span.

### SetClock -- Configures the clock source used by this object.

SecretArguments=AllowedWhenUntainted

Arguments:

- `clock`: LuaDurationClock? -- If nil, the duration object will use an internal default clock source equivalent to GetTime().

### SetTimeFromEnd -- Configures the duration object to represent an end time and a duration.

SecretArguments=AllowedWhenUntainted

Arguments:

- `endTime`: FrameTime
- `duration`: Seconds
- `modRate`: number [default=1] -- Optional divisor for converting this time span to a base time.

### SetTimeFromStart -- Configures the duration object to represent a start time and a duration.

SecretArguments=AllowedWhenUntainted

Arguments:

- `startTime`: FrameTime
- `duration`: Seconds
- `modRate`: number [default=1] -- Optional divisor for converting this time span to a base time.

### SetTimeSpan -- Configures the duration object to represent a fixed start and end time span. If the end time is earlier than the start time, the duration will clamp to zero.

SecretArguments=AllowedWhenUntainted

Arguments:

- `startTime`: FrameTime
- `endTime`: FrameTime

### SetToDefaults -- Resets all state on the duration, and clears the secret values flag.
