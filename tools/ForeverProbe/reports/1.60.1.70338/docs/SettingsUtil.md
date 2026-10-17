# SettingsUtil

Namespace `C_SettingsUtil`.

Environment=All, Predicates={}

## Functions

### C_SettingsUtil.NotifySettingsLoaded

### C_SettingsUtil.OpenSettingsPanel

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `openToCategoryID`: number?
- `scrollToElementName`: stringView?

## Events

### SETTINGS_LOADED

SynchronousEvent=true

### SETTINGS_PANEL_OPEN

SynchronousEvent=true

Payload:

- `openToCategoryID`: number?
- `scrollToElementName`: stringView?
