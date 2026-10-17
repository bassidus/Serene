# SimpleRegionAPI

Environment=All, Predicates={}

## Functions

### GetAlpha

SecretReturnsForAspect={1=128}

Returns:

- `alpha`: SingleColorValue

### GetDrawLayer

Returns:

- `layer`: DrawLayer
- `sublayer`: number

### GetEffectiveScale

SecretReturnsForAspect={1=64}

Returns:

- `effectiveScale`: number

### GetScale

SecretReturnsForAspect={1=64}

Returns:

- `scale`: number

### GetVertexColor

MayReturnNothing=true, SecretReturnsForAspect={1=2048, 2=128}

Returns:

- `colorR`: number
- `colorG`: number
- `colorB`: number
- `colorA`: number

### IsIgnoringParentAlpha

Returns:

- `isIgnoring`: bool

### IsIgnoringParentScale

Returns:

- `isIgnoring`: bool

### IsObjectLoaded

Returns:

- `isLoaded`: bool

### SetAlpha

SecretArguments=AllowedWhenTainted, SecretArgumentsAddAspect={1=128}

Arguments:

- `alpha`: SingleColorValue

### SetAlphaFromBoolean

SecretArguments=AllowedWhenTainted, SecretArgumentsAddAspect={1=128}

Arguments:

- `value`: bool
- `alphaIfTrue`: SingleColorValue [default=255]
- `alphaIfFalse`: SingleColorValue [default=0]

### SetDrawLayer

SecretArguments=AllowedWhenUntainted

Arguments:

- `layer`: DrawLayer
- `sublevel`: number [default=0]

### SetIgnoreParentAlpha

SecretArguments=AllowedWhenUntainted

Arguments:

- `ignore`: bool

### SetIgnoreParentScale

IsProtectedFunction=true, SecretArguments=NotAllowed

Arguments:

- `ignore`: bool

### SetScale

IsProtectedFunction=true, SecretArguments=AllowedWhenUntainted, SecretArgumentsAddAspect={1=64}

Arguments:

- `scale`: number

### SetVertexColor

SecretArguments=AllowedWhenTainted, SecretArgumentsAddAspect={1=2048, 2=128}

Arguments:

- `colorR`: number
- `colorG`: number
- `colorB`: number
- `a`: SingleColorValue?

### SetVertexColorFromBoolean

SecretArguments=AllowedWhenTainted, SecretArgumentsAddAspect={1=2048, 2=128}

Arguments:

- `value`: bool
- `colorIfTrue`: colorRGBA (ColorMixin)
- `colorIfFalse`: colorRGBA (ColorMixin)
