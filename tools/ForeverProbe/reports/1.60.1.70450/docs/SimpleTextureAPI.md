# SimpleTextureAPI

Environment=All, Predicates={}

## Functions

### AddMaskTexture

SecretArguments=AllowedWhenUntainted

Arguments:

- `mask`: SimpleMaskTexture

### GetMaskTexture

ConstSecretAccessor=true, SecretArguments=AllowedWhenUntainted, SecretReturnsForAspect={1=1}

Arguments:

- `index`: luaIndex

Returns:

- `mask`: SimpleMaskTexture

### GetNumMaskTextures

SecretReturnsForAspect={1=1}

Returns:

- `count`: size

### RemoveMaskTexture

SecretArguments=AllowedWhenUntainted

Arguments:

- `mask`: SimpleMaskTexture
