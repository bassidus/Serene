# CombatLogSecure

Namespace `C_CombatLogSecure`.

Environment=SecureOnly, Predicates={}

## Functions

### C_CombatLogSecure.AddEventFilter

HasRestrictions=true

### C_CombatLogSecure.ClearEventFilters

HasRestrictions=true

### C_CombatLogSecure.CreateCombatLogMessage

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `message`: string
- `colorR`: number
- `colorG`: number
- `colorB`: number
- `order`: CombatLogMessageOrder

### C_CombatLogSecure.GetCurrentEntryInfo

HasRestrictions=true

### C_CombatLogSecure.GetCurrentEventInfo

HasRestrictions=true

### C_CombatLogSecure.GetEntryCount

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `ignoreFilter`: bool [default=false]

Returns:

- `count`: number

### C_CombatLogSecure.SeekToNewestEntry

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `ignoreFilter`: bool [default=false]

Returns:

- `isValidEntry`: bool

### C_CombatLogSecure.SeekToPreviousEntry

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `ignoreFilter`: bool [default=false]

Returns:

- `isValidEntry`: bool

### C_CombatLogSecure.ShouldShowCurrentEntry

HasRestrictions=true

Returns:

- `shouldShow`: bool

## Events

### COMBAT_LOG_APPLY_FILTER_SETTINGS

CallbackEvent=true, HasRestrictions=true

Payload:

- `filterSettings`: LuaValueVariant

### COMBAT_LOG_MESSAGE

SynchronousEvent=true

Payload:

- `message`: string -- A preformatted combat log message protected by a |K string wrapper.
- `colorR`: number
- `colorG`: number
- `colorB`: number
- `order`: CombatLogMessageOrder

### COMBAT_LOG_REFILTER_ENTRIES

CallbackEvent=true, HasRestrictions=true
