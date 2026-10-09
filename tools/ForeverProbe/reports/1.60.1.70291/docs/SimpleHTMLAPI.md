# SimpleHTMLAPI

Environment=All, Predicates={}

## Functions

### GetContentHeight

Returns:

- `height`: uiUnit

### GetFont

ConstSecretAccessor=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `textType`: HTMLTextType

Returns:

- `fontFile`: cstring
- `height`: uiFontHeight
- `flags`: TBFFlags

### GetFontObject

ConstSecretAccessor=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `textType`: HTMLTextType

Returns:

- `font`: SimpleFont

### GetHyperlinkFormat

Returns:

- `format`: cstring

### GetIndentedWordWrap

ConstSecretAccessor=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `textType`: HTMLTextType

Returns:

- `wordWrap`: bool

### GetJustifyH

ConstSecretAccessor=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `textType`: HTMLTextType

Returns:

- `justifyH`: JustifyHorizontal

### GetJustifyV

ConstSecretAccessor=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `textType`: HTMLTextType

Returns:

- `justifyV`: JustifyVertical

### GetShadowColor

ConstSecretAccessor=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `textType`: HTMLTextType

Returns:

- `colorR`: number
- `colorG`: number
- `colorB`: number
- `colorA`: number

### GetShadowOffset

ConstSecretAccessor=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `textType`: HTMLTextType

Returns:

- `offsetX`: number
- `offsetY`: number

### GetSpacing

ConstSecretAccessor=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `textType`: HTMLTextType

Returns:

- `spacing`: uiUnit

### GetTextColor

ConstSecretAccessor=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `textType`: HTMLTextType

Returns:

- `colorR`: number
- `colorG`: number
- `colorB`: number
- `colorA`: number

### GetTextData

SecretReturnsForAspect={1=8}

Returns:

- `content`: table<HTMLContentNode>

### SetFont

RequiresValidFontAsset=true, RequiresValidFontHeight=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `textType`: HTMLTextType
- `fontFile`: cstring
- `height`: uiFontHeight
- `flags`: TBFFlags

### SetFontObject

SecretArguments=AllowedWhenUntainted

Arguments:

- `textType`: HTMLTextType
- `font`: SimpleFont

### SetHyperlinkFormat

SecretArguments=AllowedWhenUntainted

Arguments:

- `format`: cstring

### SetIndentedWordWrap

SecretArguments=AllowedWhenUntainted

Arguments:

- `textType`: HTMLTextType
- `wordWrap`: bool

### SetJustifyH

SecretArguments=AllowedWhenUntainted

Arguments:

- `textType`: HTMLTextType
- `justifyH`: JustifyHorizontal

### SetJustifyV

SecretArguments=AllowedWhenUntainted

Arguments:

- `textType`: HTMLTextType
- `justifyV`: JustifyVertical

### SetShadowColor

SecretArguments=AllowedWhenUntainted

Arguments:

- `textType`: HTMLTextType
- `colorR`: number
- `colorG`: number
- `colorB`: number
- `a`: SingleColorValue?

### SetShadowOffset

SecretArguments=AllowedWhenUntainted

Arguments:

- `textType`: HTMLTextType
- `offsetX`: number
- `offsetY`: number

### SetSpacing

SecretArguments=AllowedWhenUntainted

Arguments:

- `textType`: HTMLTextType
- `spacing`: uiUnit

### SetText

SecretArguments=AllowedWhenUntainted, SecretArgumentsAddAspect={1=8}

Arguments:

- `text`: cstring
- `ignoreMarkup`: bool [default=false]

### SetTextColor

SecretArguments=AllowedWhenUntainted

Arguments:

- `textType`: HTMLTextType
- `colorR`: number
- `colorG`: number
- `colorB`: number
- `a`: SingleColorValue?
