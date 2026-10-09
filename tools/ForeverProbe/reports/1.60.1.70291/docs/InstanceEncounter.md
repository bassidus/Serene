# InstanceEncounter

Namespace `C_InstanceEncounter`.

Environment=All, Predicates={}

## Functions

### C_InstanceEncounter.IsEncounterInProgress

Returns:

- `isInProgress`: bool

### C_InstanceEncounter.IsEncounterLimitingResurrections

Returns:

- `isLimitingResurrections`: bool

### C_InstanceEncounter.IsEncounterSuppressingRelease

Returns:

- `isSuppressingRelease`: bool

### C_InstanceEncounter.ShouldShowTimelineForEncounter

Returns:

- `shouldShow`: bool

## Events

### ENCOUNTER_STATE_CHANGED -- Signaled when the in-progress state of an encounter changes.

CallbackEvent=true, SynchronousEvent=true

Payload:

- `isInProgress`: bool

### INSTANCE_ENCOUNTER_ADD_TIMER

SynchronousEvent=true

Payload:

- `timeRemaining`: number

### INSTANCE_ENCOUNTER_ENGAGE_UNIT

SynchronousEvent=true

### INSTANCE_ENCOUNTER_OBJECTIVE_COMPLETE

SynchronousEvent=true

Payload:

- `objectiveID`: number

### INSTANCE_ENCOUNTER_OBJECTIVE_START

SynchronousEvent=true

Payload:

- `objectiveID`: number
- `objectiveProgress`: number

### INSTANCE_ENCOUNTER_OBJECTIVE_UPDATE

SynchronousEvent=true

Payload:

- `objectiveID`: number
- `objectiveProgress`: number
