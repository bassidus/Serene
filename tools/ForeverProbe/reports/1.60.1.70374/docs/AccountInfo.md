# AccountInfo

Namespace `C_AccountInfo`.

Environment=All, Predicates={}

## Functions

### C_AccountInfo.GetIDFromBattleNetAccountGUID

SecretArguments=AllowedWhenUntainted

Arguments:

- `battleNetAccountGUID`: WOWGUID

Returns:

- `battleNetAccountID`: number

### C_AccountInfo.IsGUIDBattleNetAccountType

SecretArguments=AllowedWhenUntainted

Arguments:

- `guid`: WOWGUID

Returns:

- `isBNet`: bool

### C_AccountInfo.IsGUIDRelatedToLocalAccount

SecretArguments=AllowedWhenUntainted

Arguments:

- `guid`: WOWGUID

Returns:

- `isLocalUser`: bool
