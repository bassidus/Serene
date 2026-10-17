# WorldStateInfo

Namespace `C_WorldStateInfo`.

Environment=All, Predicates={}

## Events

### CANCEL_PLAYER_COUNTDOWN

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `initiatedBy`: WOWGUID
- `informChat`: bool
- `initiatedByName`: string?

### START_PLAYER_COUNTDOWN

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `initiatedBy`: WOWGUID
- `timeRemaining`: time_t
- `totalTime`: time_t
- `informChat`: bool
- `initiatedByName`: string?

### START_TIMER

SynchronousEvent=true

Payload:

- `timerType`: StartTimerType
- `timeRemaining`: time_t
- `totalTime`: time_t

### STOP_TIMER_OF_TYPE

SynchronousEvent=true

Payload:

- `timerType`: StartTimerType

### WORLD_STATE_TIMER_START

SynchronousEvent=true

Payload:

- `timerID`: number

### WORLD_STATE_TIMER_STOP

SynchronousEvent=true

Payload:

- `timerID`: number
