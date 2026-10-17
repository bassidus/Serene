# LuaDurationManualClockAPI

Environment=All, ObjectType=Userdata, Predicates={}

## Functions

### AdvanceTime -- Advances the clock by a specified number of seconds.

SecretArguments=AllowedWhenUntainted

Arguments:

- `delta`: Seconds

### ResetTime -- Resets the clock to a zero time value.

### RewindTime -- Rewinds the clock by a specified number of seconds.

SecretArguments=AllowedWhenUntainted

Arguments:

- `delta`: Seconds

### SetTime -- Sets the current clock timestamp to a given value.

SecretArguments=AllowedWhenUntainted

Arguments:

- `time`: FrameTime
