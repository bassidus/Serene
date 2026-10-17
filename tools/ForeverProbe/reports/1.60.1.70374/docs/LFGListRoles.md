# LFGListRoles

Namespace `C_LFGListRoles`.

Environment=All, Predicates={}

## Functions

### C_LFGListRoles.GetRoles

MayReturnNothing=true

Returns:

- `roles`: LFGRoles

### C_LFGListRoles.GetSavedRoles

MayReturnNothing=true

Returns:

- `roles`: LFGRoles

### C_LFGListRoles.SetRoles

SecretArguments=AllowedWhenUntainted

Arguments:

- `roles`: LFGRoles
- `limitToClassRoles`: bool [default=false]

Returns:

- `success`: bool

## Events

### LFG_LIST_ROLE_UPDATE

SynchronousEvent=true
