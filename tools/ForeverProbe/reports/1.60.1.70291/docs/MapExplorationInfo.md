# MapExplorationInfo

Namespace `C_MapExplorationInfo`.

Environment=All, Predicates={}

## Functions

### C_MapExplorationInfo.GetExploredAreaIDsAtPosition

SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number
- `normalizedPosition`: vector2 (Vector2DMixin)

Returns:

- `areaID`: table<number>?

### C_MapExplorationInfo.GetExploredMapTextures

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

Returns:

- `overlayInfo`: table<UiMapExplorationInfo>

## Events

### MAP_EXPLORATION_UPDATED

SynchronousEvent=true

## Tables

### UiMapExplorationHitRect

Fields:

- `top`: number
- `bottom`: number
- `left`: number
- `right`: number

### UiMapExplorationInfo

Fields:

- `textureWidth`: number
- `textureHeight`: number
- `offsetX`: number
- `offsetY`: number
- `isShownByMouseOver`: bool
- `isDrawOnTopLayer`: bool
- `fileDataIDs`: table<number>
- `hitRect`: UiMapExplorationHitRect
