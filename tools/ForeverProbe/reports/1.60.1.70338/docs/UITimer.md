# UITimer

Namespace `C_Timer`.

Environment=All, Predicates={}

## Functions

### C_Timer.After

SecretArguments=AllowedWhenUntainted

Arguments:

- `seconds`: number
- `callback`: TimerCallback

### C_Timer.NewTicker

SecretArguments=AllowedWhenUntainted

Arguments:

- `seconds`: number
- `callback`: TickerCallback
- `iterations`: number?

Returns:

- `cbObject`: TickerCallback

### C_Timer.NewTimedSignalMap -- Creates a new timed signal map that invokes the supplied callback with each key as it becomes due.

SecretArguments=AllowedWhenUntainted

Arguments:

- `callback`: TimedSignalMapCallback -- Callback to execute when each entry becomes due.

Returns:

- `signalMap`: TimedSignalMap -- The newly created timed signal map.

### C_Timer.NewTimer

SecretArguments=AllowedWhenUntainted

Arguments:

- `seconds`: number
- `callback`: TickerCallback

Returns:

- `cbObject`: TickerCallback

## Tables

### TickerCallback

### TimerCallback
