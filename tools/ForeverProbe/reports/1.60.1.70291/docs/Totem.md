# Totem

Environment=All, Predicates={}

## Functions

### DestroyTotem

SecretArguments=AllowedWhenUntainted

Arguments:

- `slot`: luaIndex

### GetNumTotemSlots

Returns:

- `numSlots`: number

### GetTotemCannotDismiss

SecretArguments=AllowedWhenUntainted

Arguments:

- `slot`: luaIndex

Returns:

- `cannotDismiss`: bool?

### GetTotemDuration

SecretArguments=AllowedWhenUntainted

Arguments:

- `slot`: luaIndex

Returns:

- `duration`: LuaDurationObject

### GetTotemInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted, SecretWhenTotemSlotSecret=true

Arguments:

- `slot`: luaIndex

Returns:

- `haveTotem`: bool
- `totemName`: cstring
- `startTime`: number
- `duration`: number
- `icon`: fileID
- `modRate`: number
- `spellID`: number

### GetTotemTimeLeft

SecretArguments=AllowedWhenUntainted, SecretWhenTotemSlotSecret=true

Arguments:

- `slot`: luaIndex

Returns:

- `timeLeft`: number?

### TargetTotem

SecretArguments=AllowedWhenUntainted

Arguments:

- `slot`: luaIndex

## Tables

### TotemInfoScript

Fields:

- `haveTotem`: bool
- `totemName`: cstring
- `startTime`: number
- `duration`: number
- `icon`: fileID
- `modRate`: number
- `spellID`: number
