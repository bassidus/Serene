# LobbyMatchmakerInfo

Namespace `C_LobbyMatchmakerInfo`.

Environment=All, Predicates={}

## Functions

### C_LobbyMatchmakerInfo.AbandonQueue

### C_LobbyMatchmakerInfo.EnterQueue

SecretArguments=AllowedWhenUntainted

Arguments:

- `playlistEntry`: PartyPlaylistEntry

### C_LobbyMatchmakerInfo.GetCurrQueuePlaylistEntry

Returns:

- `playlistEntry`: PartyPlaylistEntry

### C_LobbyMatchmakerInfo.GetCurrQueueState

Returns:

- `queueState`: PlunderstormQueueState

### C_LobbyMatchmakerInfo.GetQueueFromMainlineEnabled

Returns:

- `queueFromMainlineEnabled`: bool

### C_LobbyMatchmakerInfo.GetQueueStartTime

Returns:

- `queueStartTime`: number

### C_LobbyMatchmakerInfo.IsInQueue

Returns:

- `isInQueue`: bool

### C_LobbyMatchmakerInfo.RespondToQueuePop

SecretArguments=AllowedWhenUntainted

Arguments:

- `acceptQueue`: bool

## Events

### LOBBY_MATCHMAKER_QUEUE_ABANDONED

SynchronousEvent=true

### LOBBY_MATCHMAKER_QUEUE_ERROR

SynchronousEvent=true

### LOBBY_MATCHMAKER_QUEUE_EXPIRED

SynchronousEvent=true

### LOBBY_MATCHMAKER_QUEUE_POPPED

SynchronousEvent=true

### LOBBY_MATCHMAKER_QUEUE_STATUS_UPDATE

SynchronousEvent=true

## Tables

### PlunderstormQueueState

MaxValue=3, MinValue=0, NumValues=4

Fields:

- `None`: PlunderstormQueueState [= 0]
- `Queued`: PlunderstormQueueState [= 1]
- `Proposed`: PlunderstormQueueState [= 2]
- `Suspended`: PlunderstormQueueState [= 3]

### LobbyMatchmakerQueueInfo

Fields:

- `isQueueActive`: bool [default=false]
- `playlistEntryID`: PartyPlaylistEntry
- `queueState`: PlunderstormQueueState
- `queueStartTime`: number
