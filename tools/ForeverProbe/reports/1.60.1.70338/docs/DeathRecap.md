# DeathRecap

Namespace `C_DeathRecap`.

Environment=All, Predicates={}

## Functions

### C_DeathRecap.GetRecapEvents

SecretArguments=AllowedWhenUntainted

Arguments:

- `recapID`: number?

Returns:

- `events`: table<DeathRecapEventInfo>

### C_DeathRecap.GetRecapLink

SecretArguments=AllowedWhenUntainted

Arguments:

- `recapID`: number?

Returns:

- `link`: string

### C_DeathRecap.GetRecapMaxHealth -- Returns the max health for the unit that died in the provided death recap.

SecretArguments=AllowedWhenUntainted

Arguments:

- `recapID`: number?

Returns:

- `maxHealth`: number

### C_DeathRecap.HasRecapEvents

SecretArguments=AllowedWhenUntainted

Arguments:

- `recapID`: number?

Returns:

- `hasEvents`: bool

## Tables

### DeathRecapEventInfo
