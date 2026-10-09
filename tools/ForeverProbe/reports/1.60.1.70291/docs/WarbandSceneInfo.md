# WarbandSceneInfo

Namespace `C_WarbandScene`.

Environment=All, Predicates={}

## Functions

### C_WarbandScene.GetRandomEntryID

Returns:

- `warbandSceneID`: number

### C_WarbandScene.GetWarbandSceneEntry

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `warbandSceneID`: number

Returns:

- `warbandSceneEntry`: WarbandSceneEntry

### C_WarbandScene.HasWarbandScene

SecretArguments=AllowedWhenUntainted

Arguments:

- `warbandSceneID`: number

Returns:

- `owned`: bool

### C_WarbandScene.IsFavorite

SecretArguments=AllowedWhenUntainted

Arguments:

- `warbandSceneID`: number

Returns:

- `favorite`: bool

### C_WarbandScene.SearchWarbandSceneEntries

SecretArguments=AllowedWhenUntainted

Arguments:

- `searchParams`: WarbandSceneSearchInfo

Returns:

- `matchingEntryIDs`: table<number>

### C_WarbandScene.SetFavorite

SecretArguments=AllowedWhenUntainted

Arguments:

- `warbandSceneID`: number
- `favorite`: bool

### C_WarbandScene.WarbandScenesAvailable

Returns:

- `areWarbandScenesAvailable`: bool

## Events

### NEW_WARBAND_SCENE_ADDED

SynchronousEvent=true

Payload:

- `warbandScenID`: number

### WARBAND_SCENE_FAVORITES_UPDATED

SynchronousEvent=true

## Tables

### WarbandSceneEntry

Fields:

- `warbandSceneID`: number [default=0]
- `name`: cstring
- `description`: cstring
- `source`: cstring
- `quality`: number
- `textureKit`: textureKit
- `isFavorite`: bool [default=false]
- `hasFanfare`: bool [default=false]
- `sourceType`: number [default=0]

### WarbandSceneSearchInfo

Fields:

- `ownedOnly`: bool [default=false]
- `favoritesOnly`: bool [default=false]
