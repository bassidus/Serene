# FogOfWar

Namespace `C_FogOfWar`.

Environment=All, Predicates={}

## Functions

### C_FogOfWar.GetFogOfWarForMap

SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

Returns:

- `fogOfWarID`: number?

### C_FogOfWar.GetFogOfWarInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `fogOfWarID`: number

Returns:

- `fogOfWarInfo`: FogOfWarInfo?

## Events

### FOG_OF_WAR_UPDATED

UniqueEvent=true

## Tables

### FogOfWarInfo

Fields:

- `fogOfWarID`: number
- `backgroundAtlas`: textureAtlas
- `maskAtlas`: textureAtlas
- `maskScalar`: number
