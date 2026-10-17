# BattlePet

Namespace `C_BattlePet`.

Environment=All, Predicates={}

## Events

### PET_BATTLE_ABILITY_CHANGED

SynchronousEvent=true

Payload:

- `owner`: number
- `petIndex`: number
- `abilityID`: number

### PET_BATTLE_ACTION_SELECTED

SynchronousEvent=true

### PET_BATTLE_AURA_APPLIED

SynchronousEvent=true

Payload:

- `owner`: number
- `petIndex`: number
- `auraInstanceID`: number

### PET_BATTLE_AURA_CANCELED

SynchronousEvent=true

Payload:

- `owner`: number
- `petIndex`: number
- `auraInstanceID`: number

### PET_BATTLE_AURA_CHANGED

SynchronousEvent=true

Payload:

- `owner`: number
- `petIndex`: number
- `auraInstanceID`: number

### PET_BATTLE_CAPTURED

SynchronousEvent=true

Payload:

- `owner`: number
- `petIndex`: number

### PET_BATTLE_CLOSE

SynchronousEvent=true

### PET_BATTLE_FINAL_ROUND

SynchronousEvent=true

Payload:

- `owner`: number

### PET_BATTLE_HEALTH_CHANGED

SynchronousEvent=true

Payload:

- `owner`: number
- `petIndex`: number
- `healthChange`: number

### PET_BATTLE_LEVEL_CHANGED

SynchronousEvent=true

Payload:

- `owner`: number
- `petIndex`: number
- `newLevel`: number

### PET_BATTLE_MAX_HEALTH_CHANGED

SynchronousEvent=true

Payload:

- `owner`: number
- `petIndex`: number
- `healthChange`: number

### PET_BATTLE_OPENING_DONE

SynchronousEvent=true

### PET_BATTLE_OPENING_START

SynchronousEvent=true

### PET_BATTLE_OVER

SynchronousEvent=true

### PET_BATTLE_OVERRIDE_ABILITY

SynchronousEvent=true

Payload:

- `abilityIndex`: number

### PET_BATTLE_PET_CHANGED

SynchronousEvent=true

Payload:

- `owner`: number

### PET_BATTLE_PET_ROUND_PLAYBACK_COMPLETE

SynchronousEvent=true

Payload:

- `roundNumber`: number

### PET_BATTLE_PET_ROUND_RESULTS

SynchronousEvent=true

Payload:

- `roundNumber`: number

### PET_BATTLE_PET_TYPE_CHANGED

SynchronousEvent=true

Payload:

- `owner`: number
- `petIndex`: number
- `stateValue`: number

### PET_BATTLE_PVP_DUEL_REQUEST_CANCEL

SynchronousEvent=true

### PET_BATTLE_PVP_DUEL_REQUESTED

SynchronousEvent=true

Payload:

- `fullName`: cstring

### PET_BATTLE_QUEUE_PROPOSAL_ACCEPTED

SynchronousEvent=true

### PET_BATTLE_QUEUE_PROPOSAL_DECLINED

SynchronousEvent=true

### PET_BATTLE_QUEUE_PROPOSE_MATCH

SynchronousEvent=true

### PET_BATTLE_QUEUE_STATUS

SynchronousEvent=true

### PET_BATTLE_XP_CHANGED

SynchronousEvent=true

Payload:

- `owner`: number
- `petIndex`: number
- `xpChange`: number
