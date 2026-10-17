# RolesetSystem

Namespace `C_Roleset`.

Environment=All, Predicates={}

## Functions

### C_Roleset.ApplyRolesetFilters -- Sets or clears both blocklist and allowlist filters atomically with a single visibility reevaluation. Pass an empty table to clear the corresponding filter.

SecretArguments=AllowedWhenUntainted

Arguments:

- `blockedRolesets`: table<string>
- `allowedRolesets`: table<string>

### C_Roleset.GetActiveAllowedRolesets -- Returns the rolesets in the currently active allowlist.

Returns:

- `allowedRolesets`: table<string>

### C_Roleset.GetActiveBlockedRolesets -- Returns the rolesets in the currently active blocklist.

Returns:

- `blockedRolesets`: table<string>
