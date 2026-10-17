# TimedSignalMapAPI

Environment=All, ObjectType=Userdata, Predicates={}

## Functions

### CancelAllSignals -- Cancels all scheduled signals.

RequiresTimedSignalMapAccess=true

### CancelSignal -- Cancels the scheduled signal for the specified key, if one exists.

RequiresTimedSignalMapAccess=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `key`: number -- Key to cancel. No effect if the key is not scheduled.

### GetNextSignal -- Returns the next key due to signal along with its scheduled time.

RequiresTimedSignalMapAccess=true

Returns:

- `key`: number -- The key that has been scheduled.
- `time`: FrameTime -- Absolute time, on the same clock as GetTime(), at which the key is scheduled to signal.

### GetSignalCount -- Returns the number of keys currently scheduled to signal.

RequiresTimedSignalMapAccess=true

Returns:

- `count`: size -- Count of scheduled keys.

### GetSignalTime -- Returns the absolute time at which the specified key is scheduled to signal.

ConstSecretAccessor=true, RequiresTimedSignalMapAccess=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `key`: number -- Key to query.

Returns:

- `time`: FrameTime? -- Absolute time the key will signal; nil if not scheduled.

### HasSignal -- Returns whether the specified key is currently scheduled to signal.

ConstSecretAccessor=true, RequiresTimedSignalMapAccess=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `key`: number -- Key to test.

Returns:

- `hasSignal`: bool -- True if the key is scheduled to signal.

### SignalAfter -- Schedules the specified key to signal after a delay from the current time, replacing any existing schedule for that key.

RequiresTimedSignalMapAccess=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `key`: number -- Key to signal. Re-scheduling an existing key replaces its time.
- `secondsFromNow`: Seconds -- Delay in seconds from now, converted to an absolute time when scheduled.

### SignalAt -- Schedules the specified key to signal at an absolute time, replacing any existing schedule for that key.

RequiresTimedSignalMapAccess=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `key`: number -- Key to signal. Re-scheduling an existing key replaces its time.
- `time`: FrameTime -- Absolute time at which to signal, on the same clock as GetTime().
