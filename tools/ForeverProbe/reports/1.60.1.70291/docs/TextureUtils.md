# TextureUtils

Namespace `C_Texture`.

Environment=All, Predicates={}

## Functions

### C_Texture.ClearTitleIconTexture

SecretArguments=AllowedWhenUntainted

Arguments:

- `texture`: SimpleTexture

### C_Texture.GetAtlasElementID

SecretArguments=AllowedWhenUntainted

Arguments:

- `atlas`: textureAtlas

Returns:

- `elementID`: number

### C_Texture.GetAtlasElements

Returns:

- `atlases`: table<textureAtlas>

### C_Texture.GetAtlasExists

SecretArguments=AllowedWhenUntainted

Arguments:

- `atlas`: textureAtlas

Returns:

- `atlasExists`: bool

### C_Texture.GetAtlasID

SecretArguments=AllowedWhenUntainted

Arguments:

- `atlas`: textureAtlas

Returns:

- `atlasID`: number

### C_Texture.GetAtlasInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `atlas`: textureAtlas

Returns:

- `info`: AtlasInfo

### C_Texture.GetFilenameFromFileDataID

SecretArguments=AllowedWhenUntainted

Arguments:

- `fileDataID`: number

Returns:

- `filename`: string

### C_Texture.GetTitleIconTexture

SecretArguments=AllowedWhenUntainted

Arguments:

- `titleID`: string
- `version`: TitleIconVersion
- `callback`: GetTitleIconTextureCallback

### C_Texture.IsTitleIconTextureReady

SecretArguments=AllowedWhenUntainted

Arguments:

- `titleID`: string
- `version`: TitleIconVersion

Returns:

- `ready`: bool

### C_Texture.SetTitleIconTexture

SecretArguments=AllowedWhenUntainted

Arguments:

- `texture`: SimpleTexture
- `titleID`: string
- `version`: TitleIconVersion

### C_Texture.SetURLTexture

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `texture`: SimpleTexture
- `url`: cstring

## Events

### URL_TEXTURE_REQUEST_RESULT

SynchronousEvent=true

Payload:

- `texture`: SimpleTexture
- `result`: UrlTextureResult

## Tables

### TitleIconVersion

MaxValue=2, MinValue=0, NumValues=3

Fields:

- `Small`: TitleIconVersion [= 0]
- `Medium`: TitleIconVersion [= 1]
- `Large`: TitleIconVersion [= 2]

### UrlTextureResult

MaxValue=4, MinValue=1, NumValues=4

Fields:

- `Found`: UrlTextureResult [= 1]
- `NotFound`: UrlTextureResult [= 2]
- `Requested`: UrlTextureResult [= 3]
- `NotAllowed`: UrlTextureResult [= 4]

### AtlasInfo

Fields:

- `elementName`: cstring
- `width`: number
- `height`: number
- `rawSize`: vector2 (Vector2DMixin)
- `leftTexCoord`: number
- `rightTexCoord`: number
- `topTexCoord`: number
- `bottomTexCoord`: number
- `tilesHorizontally`: bool
- `tilesVertically`: bool
- `file`: fileID?
- `filename`: string?
- `sliceData`: UITextureSliceData?

### GetTitleIconTextureCallback
