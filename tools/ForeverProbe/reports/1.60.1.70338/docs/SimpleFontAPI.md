# SimpleFontAPI

Environment=All, Predicates={}

## Functions

### CopyFontObject

SecretArguments=AllowedWhenUntainted

Arguments:

- `sourceFont`: SimpleFont

### GetAlpha

Returns:

- `alpha`: SingleColorValue

### GetFont

Returns:

- `fontFile`: cstring
- `height`: uiFontHeight
- `flags`: TBFFlags

### GetFontHeight -- Return is either in uiUnits or internal height due to fixedHeight.

Returns:

- `height`: number

### GetFontObject

Returns:

- `font`: SimpleFont

### GetFontObjectForAlphabet

ConstSecretAccessor=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `alphabet`: FontAlphabet

Returns:

- `font`: SimpleFont

### GetIndentedWordWrap

Returns:

- `wordWrap`: bool

### GetJustifyH

Returns:

- `justifyH`: JustifyHorizontal

### GetJustifyV

Returns:

- `justifyV`: JustifyVertical

### GetShadowColor

Returns:

- `colorR`: number
- `colorG`: number
- `colorB`: number
- `colorA`: number

### GetShadowOffset

Returns:

- `offsetX`: number
- `offsetY`: number

### GetSpacing

Returns:

- `spacing`: uiUnit

### GetTextColor

Returns:

- `colorR`: number
- `colorG`: number
- `colorB`: number
- `colorA`: number

### SetAlpha

SecretArguments=AllowedWhenUntainted

Arguments:

- `alpha`: SingleColorValue

### SetFont

RequiresValidFontAsset=true, RequiresValidFontHeight=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `fontFile`: cstring
- `height`: uiFontHeight
- `flags`: TBFFlags

### SetFontHeight -- Preserves all flags, does correct height conversion due to fixedHeight.

SecretArguments=AllowedWhenUntainted

Arguments:

- `height`: number

### SetFontObject

SecretArguments=AllowedWhenUntainted

Arguments:

- `font`: SimpleFont

### SetIndentedWordWrap

SecretArguments=AllowedWhenUntainted

Arguments:

- `wordWrap`: bool

### SetJustifyH

SecretArguments=AllowedWhenUntainted

Arguments:

- `justifyH`: JustifyHorizontal

### SetJustifyV

SecretArguments=AllowedWhenUntainted

Arguments:

- `justifyV`: JustifyVertical

### SetShadowColor

SecretArguments=AllowedWhenUntainted

Arguments:

- `colorR`: number
- `colorG`: number
- `colorB`: number
- `a`: SingleColorValue?

### SetShadowOffset

SecretArguments=AllowedWhenUntainted

Arguments:

- `offsetX`: number
- `offsetY`: number

### SetSpacing

SecretArguments=AllowedWhenUntainted

Arguments:

- `spacing`: uiUnit

### SetTextColor

SecretArguments=AllowedWhenUntainted

Arguments:

- `colorR`: number
- `colorG`: number
- `colorB`: number
- `a`: SingleColorValue?
