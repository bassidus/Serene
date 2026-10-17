# CombatLog

Namespace `C_CombatLog`.

Environment=All, Predicates={}

## Functions

### C_CombatLog.ApplyFilterSettings

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `filterSettings`: LuaValueVariant

### C_CombatLog.AreFilteredEventsEnabled

Returns:

- `enabled`: bool

### C_CombatLog.ClearEntries

### C_CombatLog.DoesObjectMatchFilter

SecretArguments=AllowedWhenUntainted

Arguments:

- `mask`: CombatLogObject
- `flags`: CombatLogObject

Returns:

- `matches`: bool

### C_CombatLog.GetEntryRetentionTime

Returns:

- `retentionTime`: number

### C_CombatLog.GetMessageLimit

Returns:

- `messageLimit`: number

### C_CombatLog.IsCombatLogRestricted

Returns:

- `restricted`: bool

### C_CombatLog.RefilterEntries

### C_CombatLog.SetEntryRetentionTime

SecretArguments=AllowedWhenUntainted

Arguments:

- `retentionTime`: number

### C_CombatLog.SetFilteredEventsEnabled

SecretArguments=AllowedWhenUntainted

Arguments:

- `enabled`: bool

### C_CombatLog.SetMessageLimit

SecretArguments=AllowedWhenUntainted

Arguments:

- `messageLimit`: number

## Events

### COMBAT_LOG_ENTRIES_CLEARED

SynchronousEvent=true

### COMBAT_LOG_EVENT

CallbackEvent=true, HasRestrictions=true, SynchronousEvent=true

### COMBAT_LOG_EVENT_UNFILTERED

CallbackEvent=true, HasRestrictions=true, SynchronousEvent=true

### COMBAT_LOG_MESSAGE_LIMIT_CHANGED

SynchronousEvent=true

Payload:

- `messageLimit`: number
