# UIMacros

Namespace `C_Macro`.

Environment=All, Predicates={}

## Functions

### C_Macro.GetMacroName

SecretArguments=AllowedWhenUntainted

Arguments:

- `macroId`: luaIndex

Returns:

- `name`: cstring?

### C_Macro.GetSelectedMacroIcon

SecretArguments=AllowedWhenUntainted

Arguments:

- `macroId`: luaIndex

Returns:

- `textureNum`: fileID

### C_Macro.RunMacroText

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `text`: cstring
- `button`: cstring

### C_Macro.SetMacroExecuteLineCallback

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `cb`: MacroExecuteLineCallback

## Events

### UPDATE_MACROS

SynchronousEvent=true

## Tables

### MacroExecuteLineCallback
