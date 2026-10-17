# CVarScripts

Namespace `C_CVar`.

Environment=All, Predicates={1={FailureMode=Error, Name=RequiresIndexInRange, Type=Precondition}, 2={FailureMode=ReturnNothing, Name=RequiresNonReadOnlyCVar, Type=Precondition}, 3={FailureMode=ReturnNothing, Name=RequiresNonSecureCVar, Type=Precondition}, 4={FailureMode=ReturnNothing, Name=RequiresValidAndPublicCVar, Type=Precondition}}

## Functions

### C_CVar.AreCVarsLoaded

Returns:

- `loaded`: bool

### C_CVar.GetCVar

SecretArguments=NotAllowed

Arguments:

- `name`: cstring

Returns:

- `value`: string?

### C_CVar.GetCVarBitfield

SecretArguments=NotAllowed

Arguments:

- `name`: cstring
- `index`: luaIndex

Returns:

- `value`: bool?

### C_CVar.GetCVarBool

SecretArguments=NotAllowed

Arguments:

- `name`: cstring

Returns:

- `value`: bool?

### C_CVar.GetCVarDefault

RequiresValidAndPublicCVar=true, SecretArguments=NotAllowed

Arguments:

- `name`: cstring

Returns:

- `defaultValue`: string?

### C_CVar.GetCVarInfo

SecretArguments=NotAllowed

Arguments:

- `name`: cstring

Returns:

- `value`: cstring
- `defaultValue`: cstring
- `isStoredServerAccount`: bool
- `isStoredServerCharacter`: bool
- `isLockedFromUser`: bool
- `isSecure`: bool
- `isReadOnly`: bool

### C_CVar.RegisterCVar

SecretArguments=NotAllowed

Arguments:

- `name`: cstring
- `value`: cstring?

### C_CVar.RemoveTempCVar

RequiresNonReadOnlyCVar=true, RequiresNonSecureCVar=true, RequiresValidAndPublicCVar=true, SecretArguments=NotAllowed

Arguments:

- `name`: cstring

### C_CVar.ResetTestCVars

### C_CVar.SetCVar

RequiresNonReadOnlyCVar=true, RequiresNonSecureCVar=true, RequiresValidAndPublicCVar=true, SecretArguments=NotAllowed

Arguments:

- `name`: cstring
- `value`: cstring?

Returns:

- `success`: bool

### C_CVar.SetCVarBitfield

RequiresIndexInRange=true, RequiresNonReadOnlyCVar=true, RequiresNonSecureCVar=true, RequiresValidAndPublicCVar=true, SecretArguments=NotAllowed

Arguments:

- `name`: cstring
- `index`: luaIndex
- `value`: bool

Returns:

- `success`: bool

### C_CVar.SetTempCVar

RequiresNonReadOnlyCVar=true, RequiresNonSecureCVar=true, RequiresValidAndPublicCVar=true, SecretArguments=NotAllowed

Arguments:

- `name`: cstring
- `value`: cstring?

## Tables

### CVarInfo

Fields:

- `value`: cstring
- `defaultValue`: cstring
- `isStoredServerAccount`: bool
- `isStoredServerCharacter`: bool
- `isLockedFromUser`: bool
- `isSecure`: bool
- `isReadOnly`: bool
