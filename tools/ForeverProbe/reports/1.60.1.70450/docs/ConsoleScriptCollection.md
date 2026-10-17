# ConsoleScriptCollection

Namespace `C_ConsoleScriptCollection`.

Environment=All, Predicates={}

## Functions

### C_ConsoleScriptCollection.GetCollectionDataByID

SecretArguments=AllowedWhenUntainted

Arguments:

- `collectionID`: number

Returns:

- `data`: ConsoleScriptCollectionData?

### C_ConsoleScriptCollection.GetCollectionDataByTag

SecretArguments=AllowedWhenUntainted

Arguments:

- `collectionTag`: string

Returns:

- `data`: ConsoleScriptCollectionData?

### C_ConsoleScriptCollection.GetElements

SecretArguments=AllowedWhenUntainted

Arguments:

- `collectionID`: number

Returns:

- `elementIDs`: table<ConsoleScriptCollectionElementData>

### C_ConsoleScriptCollection.GetScriptData

SecretArguments=AllowedWhenUntainted

Arguments:

- `consoleScriptID`: number

Returns:

- `data`: ConsoleScriptData

## Tables

### ConsoleScriptCollectionData

Fields:

- `ID`: number
- `name`: cstring

### ConsoleScriptCollectionElementData

Fields:

- `collectionID`: number?
- `consoleScriptID`: number?

### ConsoleScriptData

Fields:

- `ID`: number
- `name`: cstring
- `help`: cstring
- `script`: cstring
- `params`: cstring
- `isLuaScript`: bool

### ConsoleScriptParameter

Fields:

- `name`: string
- `description`: string
