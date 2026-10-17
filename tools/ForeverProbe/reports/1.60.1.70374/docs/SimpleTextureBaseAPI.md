# SimpleTextureBaseAPI

Environment=All, Predicates={}

## Functions

### ClearRadialProgressBar -- Disable radial progress bar rendering and restore standard texture display.

### ClearSVG

ChecksForbiddenAspects={1={Argument=self, Aspect=2048}}

### ClearTextureSlice -- Disable shader based nineslice texture rendering. Since SetAtlas will automatically load slice data for the atlas from the DB, can be useful if you want to disable nineslice after setting an atlas.

### ClearVertexOffsets

### GetAtlas

Returns:

- `atlas`: textureAtlas

### GetBlendMode

Returns:

- `blendMode`: BlendMode

### GetDesaturation

SecretReturnsForAspect={1=4096}

Returns:

- `desaturation`: normalizedValue

### GetHorizTile

Returns:

- `tiling`: bool

### GetRadialProgressBarEndOffset -- Returns the end angle offset of the radial progress bar as a normalized value (0 to 1).

Returns:

- `offset`: normalizedValue

### GetRadialProgressBarFeather -- Returns the feather/blur amount applied to the radial progress bar edge.

Returns:

- `feather`: normalizedValue

### GetRadialProgressBarPercent -- Returns the fill percentage of the radial progress bar (0 to 1).

SecretReturnsForAspect={1=8388608}

Returns:

- `percent`: normalizedValue

### GetRadialProgressBarReverse -- Returns whether the radial progress bar fills in reverse (counterclockwise) direction.

Returns:

- `reverse`: bool

### GetRadialProgressBarStartOffset -- Returns the start angle offset of the radial progress bar as a normalized value (0 to 1).

Returns:

- `offset`: normalizedValue

### GetRotation

ChecksForbiddenAspects={1={Argument=self, Aspect=4096}}, SecretReturnsForAspect={1=65536}

Returns:

- `radians`: number
- `normalizedRotationPoint`: vector2 (Vector2DMixin)

### GetTexCoord

SecretReturnsForAspect={1=8192}

Returns:

- `ulX`: number
- `ulY`: number
- `llX`: number
- `llY`: number
- `urX`: number
- `urY`: number
- `lrX`: number
- `lrY`: number

### GetTexelSnappingBias

Returns:

- `bias`: normalizedValue

### GetTexture

Returns:

- `textureFile`: cstring?

### GetTextureFileID

Returns:

- `textureFile`: fileID

### GetTextureFilePath

Returns:

- `textureFile`: cstring?

### GetTextureSliceMargins

MayReturnNothing=true

Returns:

- `left`: number
- `top`: number
- `right`: number
- `bottom`: number

### GetTextureSliceMode

MayReturnNothing=true

Returns:

- `sliceMode`: UITextureSliceMode

### GetVertTile

Returns:

- `tiling`: bool

### GetVertexOffset

ConstSecretAccessor=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `vertexIndex`: luaIndex

Returns:

- `offsetX`: uiUnit
- `offsetY`: uiUnit

### IsBlockingLoadRequested

Returns:

- `blocking`: bool

### IsDesaturated

RequiresScriptObjectDesaturationAccess=true, SecretReturnsForAspect={1=4096}

Returns:

- `desaturated`: bool

### IsSnappingToPixelGrid

Returns:

- `snap`: bool

### ResetTexCoord

### SetAtlas

SecretArguments=AllowedWhenTainted

Arguments:

- `atlas`: textureAtlas
- `useAtlasSize`: bool [default=false, NeverSecret=true]
- `filterMode`: FilterMode? [NeverSecret=true]
- `resetTexCoords`: bool? [NeverSecret=true]
- `wrapModeHorizontal`: cstring? [NeverSecret=true]
- `wrapModeVertical`: cstring? [NeverSecret=true]

### SetBlendMode

SecretArguments=AllowedWhenUntainted

Arguments:

- `blendMode`: BlendMode

### SetBlockingLoadsRequested

SecretArguments=AllowedWhenUntainted

Arguments:

- `blocking`: bool [default=false]

### SetColorTexture

ChecksForbiddenAspects={1={Argument=self, Aspect=2048}}, SecretArguments=AllowedWhenTainted

Arguments:

- `colorR`: number
- `colorG`: number
- `colorB`: number
- `a`: SingleColorValue?

### SetDesaturated

SecretArguments=AllowedWhenTainted, SecretArgumentsAddAspect={1=4096}

Arguments:

- `desaturated`: bool [default=false]

### SetDesaturation

SecretArguments=AllowedWhenTainted, SecretArgumentsAddAspect={1=4096}

Arguments:

- `desaturation`: normalizedValue

### SetGradient

SecretArguments=AllowedWhenUntainted

Arguments:

- `orientation`: Orientation
- `minColor`: colorRGBA (ColorMixin)
- `maxColor`: colorRGBA (ColorMixin)

### SetHorizTile

SecretArguments=AllowedWhenUntainted

Arguments:

- `tiling`: bool [default=false]

### SetMask

SecretArguments=AllowedWhenUntainted

Arguments:

- `file`: cstring

### SetRadialProgressBarEndOffset -- Sets the end angle offset of the radial progress bar as a normalized value (0 to 1).

SecretArguments=AllowedWhenUntainted

Arguments:

- `offset`: normalizedValue

### SetRadialProgressBarFeather -- Sets the feather/blur amount applied to the radial progress bar edge (higher = more gradual falloff).

SecretArguments=AllowedWhenUntainted

Arguments:

- `feather`: normalizedValue

### SetRadialProgressBarPercent -- Sets the fill percentage of the radial progress bar (0 to 1).

SecretArguments=AllowedWhenTainted, SecretArgumentsAddAspect={1=8388608}

Arguments:

- `percent`: normalizedValue

### SetRadialProgressBarReverse -- Sets whether the radial progress bar fills in reverse (counterclockwise) direction.

SecretArguments=AllowedWhenUntainted

Arguments:

- `reverse`: bool

### SetRadialProgressBarStartOffset -- Sets the start angle offset of the radial progress bar as a normalized value (0 to 1), where 0 is at the bottom.

SecretArguments=AllowedWhenUntainted

Arguments:

- `offset`: normalizedValue

### SetRotation

SecretArguments=AllowedWhenTainted, SecretArgumentsAddAspect={1=65536}

Arguments:

- `radians`: number
- `normalizedRotationPoint`: vector2 (Vector2DMixin)?

### SetSVG

ChecksForbiddenAspects={1={Argument=self, Aspect=2048}}, SecretArguments=AllowedWhenTainted

Arguments:

- `svgAsset`: FileAsset

Returns:

- `success`: bool

### SetSnapToPixelGrid

SecretArguments=AllowedWhenUntainted

Arguments:

- `snap`: bool [default=false]

### SetSpriteSheetCell

SecretArguments=AllowedWhenTainted, SecretArgumentsAddAspect={1=8192}

Arguments:

- `cell`: luaIndex [ConditionalSecret=true]
- `numRows`: number [NeverSecret=true]
- `numColumns`: number [NeverSecret=true]
- `cellWidth`: number? [NeverSecret=true]
- `cellHeight`: number? [NeverSecret=true]

### SetTexCoord

SecretArguments=AllowedWhenTainted, SecretArgumentsAddAspect={1=8192}

Arguments:

- `left`: number
- `right`: number
- `bottom`: number
- `top`: number

### SetTexelSnappingBias

SecretArguments=AllowedWhenUntainted

Arguments:

- `bias`: normalizedValue

### SetTexture

SecretArguments=AllowedWhenTainted

Arguments:

- `textureAsset`: cstring?
- `wrapModeHorizontal`: cstring?
- `wrapModeVertical`: cstring?
- `filterMode`: cstring?

Returns:

- `success`: bool

### SetTextureSliceMargins -- Enables nineslice texture rendering using the specified pixel margins. Preferred over legacy nineslice approach that uses 9 separate textures.

SecretArguments=AllowedWhenUntainted

Arguments:

- `left`: number
- `top`: number
- `right`: number
- `bottom`: number

### SetTextureSliceMode -- Controls whether the center and sides are Stretched or Tiled when using nineslice texture rendering. Defaults to Stretched.

SecretArguments=AllowedWhenUntainted

Arguments:

- `sliceMode`: UITextureSliceMode

### SetVertTile

SecretArguments=AllowedWhenUntainted

Arguments:

- `tiling`: bool [default=false]

### SetVertexOffset

SecretArguments=AllowedWhenUntainted

Arguments:

- `vertexIndex`: luaIndex
- `offsetX`: uiUnit
- `offsetY`: uiUnit
