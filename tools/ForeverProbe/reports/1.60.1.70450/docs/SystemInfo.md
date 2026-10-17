# SystemInfo

Namespace `C_System`.

Environment=All, Predicates={}

## Functions

### C_System.GetFrameStack

Returns:

- `objects`: table<ScriptRegion>

## Events

### CAPTUREFRAMES_FAILED

SynchronousEvent=true

### CAPTUREFRAMES_SUCCEEDED

SynchronousEvent=true

### DISABLE_TAXI_BENCHMARK

SynchronousEvent=true

### ENABLE_TAXI_BENCHMARK

SynchronousEvent=true

### FIRST_FRAME_RENDERED

UniqueEvent=true

### GENERIC_ERROR

SynchronousEvent=true

Payload:

- `errorMessage`: cstring

### GLOBAL_MOUSE_DOWN

SynchronousEvent=true

Payload:

- `button`: cstring

### GLOBAL_MOUSE_UP

SynchronousEvent=true

Payload:

- `button`: cstring

### GLOBAL_REGION_MOUSE_DOWN

SynchronousEvent=true

Payload:

- `region`: ScriptRegion
- `button`: cstring

### GLOBAL_REGION_MOUSE_UP

SynchronousEvent=true

Payload:

- `region`: ScriptRegion
- `button`: cstring

### INITIAL_HOTFIXES_APPLIED

SynchronousEvent=true

### LOC_RESULT

SynchronousEvent=true

Payload:

- `result`: cstring

### LOGOUT_CANCEL

SynchronousEvent=true

### PLAYER_CAMPING

SynchronousEvent=true

### PLAYER_ENTERING_WORLD

SynchronousEvent=true

Payload:

- `isInitialLogin`: bool
- `isReloadingUi`: bool

### PLAYER_LEAVING_WORLD

SynchronousEvent=true

### PLAYER_LOGIN

SynchronousEvent=true

### PLAYER_LOGOUT

SynchronousEvent=true

### PLAYER_QUITING

SynchronousEvent=true

### SEARCH_DB_LOADED

SynchronousEvent=true

### SHARD_TRANSFER

SynchronousEvent=true

### SHARD_TRANSFER_CANCELLED

SynchronousEvent=true

### SHARD_TRANSFER_IMMINENT

SynchronousEvent=true

### STREAMING_ICON

SynchronousEvent=true

Payload:

- `streamingStatus`: number

### SYSMSG

SynchronousEvent=true

Payload:

- `string`: cstring
- `r`: number
- `g`: number
- `b`: number

### TIME_PLAYED_MSG

SynchronousEvent=true

Payload:

- `totalTimePlayed`: number
- `timePlayedThisLevel`: number

### UI_ERROR_MESSAGE

UniqueEvent=true

Payload:

- `errorType`: luaIndex
- `message`: string

### UI_ERROR_POPUP

UniqueEvent=true

Payload:

- `errorType`: luaIndex
- `message`: string

### UI_INFO_MESSAGE

UniqueEvent=true

Payload:

- `errorType`: luaIndex
- `message`: string

### VARIABLES_LOADED

SynchronousEvent=true

### WOW_MOUSE_NOT_FOUND

SynchronousEvent=true
