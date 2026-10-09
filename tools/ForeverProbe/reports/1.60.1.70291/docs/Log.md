# Log

Namespace `C_Log`.

Environment=All, Predicates={}

## Functions

### C_Log.LogErrorMessage

SecretArguments=AllowedWhenUntainted

Arguments:

- `message`: cstring

### C_Log.LogMessage

SecretArguments=AllowedWhenUntainted

Arguments:

- `message`: cstring

### C_Log.LogMessageWithPriority

SecretArguments=AllowedWhenUntainted

Arguments:

- `priority`: LogPriority
- `message`: cstring

### C_Log.LogWarningMessage

SecretArguments=AllowedWhenUntainted

Arguments:

- `message`: cstring
