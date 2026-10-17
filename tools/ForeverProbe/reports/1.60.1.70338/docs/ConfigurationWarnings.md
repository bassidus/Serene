# ConfigurationWarnings

Namespace `C_ConfigurationWarnings`.

Environment=All, Predicates={}

## Functions

### C_ConfigurationWarnings.GetConfigurationWarningSeen

SecretArguments=AllowedWhenUntainted

Arguments:

- `configurationWarning`: ConfigurationWarning

Returns:

- `hasSeenConfigurationWarning`: bool

### C_ConfigurationWarnings.GetConfigurationWarningString

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `configurationWarning`: ConfigurationWarning

Returns:

- `configurationWarningString`: string

### C_ConfigurationWarnings.GetConfigurationWarnings

SecretArguments=AllowedWhenUntainted

Arguments:

- `includeSeenWarnings`: bool [default=false]

Returns:

- `configurationWarnings`: table<ConfigurationWarning>

### C_ConfigurationWarnings.SetConfigurationWarningSeen

SecretArguments=AllowedWhenUntainted

Arguments:

- `configurationWarning`: ConfigurationWarning
