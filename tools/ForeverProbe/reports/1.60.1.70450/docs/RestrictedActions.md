# RestrictedActions

Namespace `C_RestrictedActions`.

Environment=All, Predicates={}

## Functions

### C_RestrictedActions.CheckAllowProtectedFunctions -- Returns true if the calling context has permissions to call protected functions on the supplied object.

SecretArguments=AllowedWhenUntainted, SecureHooksAllowed=false

Arguments:

- `object`: FrameScriptObject
- `silent`: bool [default=false] -- If true, don't signal blocked action errors if protected function calls are disallowed.

Returns:

- `protectedFunctionsAllowed`: bool

### C_RestrictedActions.GetAddOnRestrictionState -- Returns the current state of an addon restriction type.

SecretArguments=AllowedWhenUntainted

Arguments:

- `type`: AddOnRestrictionType

Returns:

- `state`: AddOnRestrictionState

### C_RestrictedActions.InCombatLockdown

Returns:

- `inCombatLockdown`: bool

### C_RestrictedActions.IsAddOnRestrictionActive -- Returns true if an addon restriction type is in an active state. Will always return false during dispatch of ADDON_RESTRICTION_STATE_CHANGED.

SecretArguments=AllowedWhenUntainted

Arguments:

- `type`: AddOnRestrictionType

Returns:

- `active`: bool

## Events

### ADDON_ACTION_BLOCKED

SynchronousEvent=true

Payload:

- `isTainted`: cstring
- `function`: cstring

### ADDON_ACTION_FORBIDDEN

SynchronousEvent=true

Payload:

- `isTainted`: cstring
- `function`: cstring

### ADDON_RESTRICTION_STATE_CHANGED -- Fired when the state of an addon restriction type is changing. This event is sequenced such that it will always be fired before a restriction becomes active, or after it is deactivated.

SynchronousEvent=true

Payload:

- `type`: AddOnRestrictionType
- `state`: AddOnRestrictionState

### MACRO_ACTION_BLOCKED

SynchronousEvent=true

Payload:

- `function`: cstring

### MACRO_ACTION_FORBIDDEN

SynchronousEvent=true

Payload:

- `function`: cstring
