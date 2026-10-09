# PlayerInteractionManager

Namespace `C_PlayerInteractionManager`.

Environment=All, Predicates={}

## Functions

### C_PlayerInteractionManager.ClearInteraction

SecretArguments=AllowedWhenUntainted

Arguments:

- `type`: PlayerInteractionType?

### C_PlayerInteractionManager.ConfirmationInteraction

SecretArguments=AllowedWhenUntainted

Arguments:

- `type`: PlayerInteractionType?

### C_PlayerInteractionManager.InteractUnit

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: string
- `exactMatch`: bool [default=false]
- `looseTargeting`: bool [default=true]

Returns:

- `success`: bool

### C_PlayerInteractionManager.IsInteractingWithNpcOfType

SecretArguments=AllowedWhenUntainted

Arguments:

- `type`: PlayerInteractionType

Returns:

- `interacting`: bool

### C_PlayerInteractionManager.IsReplacingUnit

Returns:

- `replacing`: bool

### C_PlayerInteractionManager.IsValidNPCInteraction

SecretArguments=AllowedWhenUntainted

Arguments:

- `type`: PlayerInteractionType

Returns:

- `isValidInteraction`: bool

### C_PlayerInteractionManager.ReopenInteraction

HasRestrictions=true

### C_PlayerInteractionManager.ShardTransferConfirm

## Events

### PLAYER_INTERACTION_MANAGER_FRAME_HIDE

SynchronousEvent=true

Payload:

- `type`: PlayerInteractionType

### PLAYER_INTERACTION_MANAGER_FRAME_SHOW

SynchronousEvent=true

Payload:

- `type`: PlayerInteractionType
