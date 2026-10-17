# FrameAPIUnitPositionFrame

Environment=All, Predicates={}

## Functions

### AddUnit

SecretArguments=AllowedWhenUntainted

Arguments:

- `unitTokenString`: cstring
- `asset`: TextureAssetDisk
- `width`: uiUnit?
- `height`: uiUnit?
- `r`: number?
- `g`: number?
- `b`: number?
- `a`: number?
- `sublayer`: number?
- `showFacing`: bool?

### ClearUnits

### FinalizeUnits

### GetMouseOverUnits

Returns:

- `units`: UnitTokenType [StrideIndex=1]

### GetPlayerPingScale

Returns:

- `scale`: number

### GetUiMapID

Returns:

- `mapID`: number

### SetPlayerPingScale

SecretArguments=AllowedWhenUntainted

Arguments:

- `scale`: number

### SetPlayerPingTexture

SecretArguments=AllowedWhenUntainted

Arguments:

- `textureType`: PingTextureType
- `asset`: FileAsset
- `width`: uiUnit [default=0]
- `height`: uiUnit [default=0]

### SetUiMapID

SecretArguments=AllowedWhenUntainted

Arguments:

- `mapID`: number

### SetUnitColor

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitTokenType
- `colorR`: number
- `colorG`: number
- `colorB`: number
- `colorA`: number

### StartPlayerPing

SecretArguments=AllowedWhenUntainted

Arguments:

- `duration`: number [default=0]
- `fadeDuration`: number [default=0]

### StopPlayerPing
