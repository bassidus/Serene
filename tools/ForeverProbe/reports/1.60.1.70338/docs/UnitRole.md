# UnitRole

Environment=All, Predicates={}

## Functions

### AreClassRolesSoftSuggestions -- If true, UnitGetAvailableRoles results should be treated as suggested role, not hard limits on what role the current player can display as.

Returns:

- `result`: bool

### CanShowSetRoleButton

Returns:

- `result`: bool

### InitiateRolePoll

Returns:

- `result`: bool

### UnitGetAvailableRoles

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted, SecretWhenUnitIdentityRestricted=true

Arguments:

- `unit`: UnitToken

Returns:

- `tank`: bool
- `healer`: bool
- `dps`: bool

### UnitSetRole

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken
- `roleStr`: cstring?

Returns:

- `result`: bool

### UnitSetRoleEnum

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken
- `role`: LFGRole?

Returns:

- `result`: bool

## Events

### ROLE_CHANGED_INFORM

SynchronousEvent=true

Payload:

- `changedName`: cstring
- `fromName`: cstring
- `oldRole`: cstring
- `newRole`: cstring

### ROLE_POLL_BEGIN

SynchronousEvent=true

Payload:

- `fromName`: cstring
