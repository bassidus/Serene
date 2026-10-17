# QuestSession

Namespace `C_QuestSession`.

Environment=All, Predicates={}

## Functions

### C_QuestSession.CanStart

Returns:

- `allowed`: bool

### C_QuestSession.CanStop

Returns:

- `allowed`: bool

### C_QuestSession.Exists

Returns:

- `exists`: bool

### C_QuestSession.GetAvailableSessionCommand

Returns:

- `command`: QuestSessionCommand

### C_QuestSession.GetPendingCommand

Returns:

- `command`: QuestSessionCommand

### C_QuestSession.GetProposedMaxLevelForSession

Returns:

- `proposedMaxLevel`: number

### C_QuestSession.GetSessionBeginDetails

Returns:

- `details`: QuestSessionPlayerDetails?

### C_QuestSession.GetSuperTrackedQuest

Returns:

- `questID`: number?

### C_QuestSession.HasJoined

Returns:

- `hasJoined`: bool

### C_QuestSession.HasPendingCommand

Returns:

- `hasPendingCommand`: bool

### C_QuestSession.RequestSessionStart

### C_QuestSession.RequestSessionStop

### C_QuestSession.SendSessionBeginResponse

SecretArguments=AllowedWhenUntainted

Arguments:

- `beginSession`: bool

### C_QuestSession.SetQuestIsSuperTracked

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number
- `superTrack`: bool

## Events

### QUEST_SESSION_CREATED

UniqueEvent=true

### QUEST_SESSION_DESTROYED

UniqueEvent=true

### QUEST_SESSION_ENABLED_STATE_CHANGED

SynchronousEvent=true

Payload:

- `enabled`: bool

### QUEST_SESSION_JOINED

UniqueEvent=true

### QUEST_SESSION_LEFT

UniqueEvent=true

### QUEST_SESSION_MEMBER_CONFIRM

SynchronousEvent=true

### QUEST_SESSION_MEMBER_START_RESPONSE

SynchronousEvent=true

Payload:

- `guid`: WOWGUID
- `response`: bool

### QUEST_SESSION_NOTIFICATION

SynchronousEvent=true

Payload:

- `result`: QuestSessionResult
- `guid`: WOWGUID

## Tables

### QuestSessionPlayerDetails

Fields:

- `name`: string
- `guid`: WOWGUID
