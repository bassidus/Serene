# StorePublic

Namespace `C_StorePublic`.

Environment=All, Predicates={}

## Functions

### C_StorePublic.DoesGroupHavePurchaseableProducts

SecretArguments=AllowedWhenUntainted

Arguments:

- `groupID`: number

Returns:

- `hasPurchaseableProducts`: bool

### C_StorePublic.EventStoreUISetShown

SecretArguments=AllowedWhenUntainted

Arguments:

- `newShown`: bool
- `contextKey`: string?

### C_StorePublic.IsEnabled

Returns:

- `enabled`: bool
