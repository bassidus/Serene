# EncounterInfo

Namespace `C_EncounterInfo`.

Environment=All, Predicates={}

## Events

### BOSS_KILL

SynchronousEvent=true

Payload:

- `encounterID`: number
- `encounterName`: cstring

### DISABLE_LOW_LEVEL_RAID

SynchronousEvent=true

### ENABLE_LOW_LEVEL_RAID

SynchronousEvent=true

### ENCOUNTER_END

SynchronousEvent=true

Payload:

- `encounterID`: number
- `encounterName`: cstring
- `difficultyID`: number
- `groupSize`: number
- `success`: number
- `encounterUnitStatus`: table<EncounterUnitStatus> -- List of all boss units engaged during this encounter.

### ENCOUNTER_START

SynchronousEvent=true

Payload:

- `encounterID`: number
- `encounterName`: cstring
- `difficultyID`: number
- `groupSize`: number

### INSTANCE_LOCK_START

SynchronousEvent=true

### INSTANCE_LOCK_STOP

SynchronousEvent=true

### INSTANCE_LOCK_WARNING

SynchronousEvent=true

### RAID_TARGET_UPDATE

SynchronousEvent=true

### UPDATE_INSTANCE_INFO

SynchronousEvent=true

## Tables

### EncounterUnitStatus

Fields:

- `creatureID`: number
- `creatureName`: string
- `remainingHealthPercent`: number
