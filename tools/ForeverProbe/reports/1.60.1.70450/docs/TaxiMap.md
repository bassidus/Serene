# TaxiMap

Namespace `C_TaxiMap`.

Environment=All, Predicates={}

## Functions

### C_TaxiMap.GetAllTaxiNodes -- Returns information on taxi nodes at the current flight master.

SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

Returns:

- `taxiNodes`: table<TaxiNodeInfo>

### C_TaxiMap.GetTaxiNodesForMap -- Returns information on taxi nodes for a given map, without considering the current flight master.

SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

Returns:

- `mapTaxiNodes`: table<MapTaxiNodeInfo>

### C_TaxiMap.ShouldMapShowTaxiNodes

SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

Returns:

- `shouldShowNodes`: bool

## Events

### TAXI_NODE_STATUS_CHANGED

SynchronousEvent=true

### TAXIMAP_CLOSED

SynchronousEvent=true

### TAXIMAP_OPENED

SynchronousEvent=true

Payload:

- `system`: number

## Tables

### FlightPathFaction

MaxValue=2, MinValue=0, NumValues=3

Fields:

- `Neutral`: FlightPathFaction [= 0]
- `Horde`: FlightPathFaction [= 1]
- `Alliance`: FlightPathFaction [= 2]

### FlightPathState

MaxValue=2, MinValue=0, NumValues=3

Fields:

- `Current`: FlightPathState [= 0]
- `Reachable`: FlightPathState [= 1]
- `Unreachable`: FlightPathState [= 2]

### MapTaxiNodeInfo

Fields:

- `nodeID`: number
- `position`: vector2 (Vector2DMixin)
- `name`: cstring
- `atlasName`: cstring
- `faction`: FlightPathFaction
- `textureKit`: textureKit
- `isUndiscovered`: bool

### TaxiNodeInfo

Fields:

- `nodeID`: number
- `position`: vector2 (Vector2DMixin)
- `name`: cstring
- `state`: FlightPathState
- `slotIndex`: luaIndex
- `textureKit`: textureKit
- `useSpecialIcon`: bool
- `specialIconCostString`: string?
- `isMapLayerTransition`: bool
