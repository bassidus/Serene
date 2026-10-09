# EncodingUtil

Namespace `C_EncodingUtil`.

Environment=All, Predicates={}

## Functions

### C_EncodingUtil.CompressString

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `source`: stringView
- `method`: CompressionMethod [default=Deflate]
- `level`: CompressionLevel [default=Default]

Returns:

- `output`: string

### C_EncodingUtil.DecodeBase64

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `source`: stringView
- `variant`: Base64Variant [default=Standard]

Returns:

- `output`: string

### C_EncodingUtil.DecodeHex

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `source`: string

Returns:

- `output`: string

### C_EncodingUtil.DecompressString

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `source`: stringView
- `method`: CompressionMethod [default=Deflate]

Returns:

- `output`: string

### C_EncodingUtil.DeserializeCBOR

SecretArguments=AllowedWhenUntainted

Arguments:

- `source`: stringView

Returns:

- `value`: LuaValueVariant?

### C_EncodingUtil.DeserializeJSON

SecretArguments=AllowedWhenUntainted

Arguments:

- `source`: string

Returns:

- `value`: LuaValueVariant?

### C_EncodingUtil.EncodeBase64

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `source`: stringView
- `variant`: Base64Variant [default=Standard]

Returns:

- `output`: string

### C_EncodingUtil.EncodeHex

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `source`: stringView

Returns:

- `output`: string

### C_EncodingUtil.SerializeCBOR

SecretArguments=AllowedWhenUntainted

Arguments:

- `value`: LuaValueVariant?
- `options`: CBORSerializationOptions?

Returns:

- `output`: string

### C_EncodingUtil.SerializeJSON

SecretArguments=AllowedWhenUntainted

Arguments:

- `value`: LuaValueVariant?
- `options`: JSONSerializationOptions?

Returns:

- `output`: string

## Tables

### Base64Variant

MaxValue=1, MinValue=0, NumValues=2

Fields:

- `Standard`: Base64Variant [= 0] -- Encodes with the alphabet defined in RFC 4648 (with potential padding bytes)
- `StandardUrlSafe`: Base64Variant [= 1] -- Encodes with the 'URL and Filename Safe' alphabet from RFC 4648 (with potential padding bytes)

### CompressionLevel

MaxValue=2, MinValue=0, NumValues=3

Fields:

- `Default`: CompressionLevel [= 0]
- `OptimizeForSpeed`: CompressionLevel [= 1]
- `OptimizeForSize`: CompressionLevel [= 2]

### CompressionMethod

MaxValue=2, MinValue=0, NumValues=3

Fields:

- `Deflate`: CompressionMethod [= 0]
- `Zlib`: CompressionMethod [= 1]
- `Gzip`: CompressionMethod [= 2]

### CBORSerializationOptions

Fields:

- `ignoreSerializationErrors`: bool [default=false] -- If true, attempt to ignore errors from unsupported values and instead replace them where applicable with 'undefined' CBOR items.

### JSONSerializationOptions

Fields:

- `ignoreSerializationErrors`: bool [default=false] -- If true, attempt to ignore errors from unsupported values and instead replace them where applicable with 'null' JSON values.
