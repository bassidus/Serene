# SimpleMessageFrameAPI

Environment=All, Predicates={}

## Functions

### AddMessage

SecretArguments=AllowedWhenUntainted

Arguments:

- `text`: cstring
- `colorR`: number
- `colorG`: number
- `colorB`: number
- `a`: SingleColorValue?
- `messageID`: number?

### Clear

### GetFadeDuration

Returns:

- `fadeDurationSeconds`: number

### GetFadePower

Returns:

- `fadePower`: number

### GetFading

Returns:

- `isFading`: bool

### GetFont

Returns:

- `fontFile`: cstring
- `height`: uiFontHeight
- `flags`: TBFFlags

### GetFontObject

Returns:

- `font`: SimpleFont

### GetFontStringByID

ConstSecretAccessor=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `messageID`: number

Returns:

- `fontString`: SimpleFontString

### GetIndentedWordWrap

Returns:

- `wordWrap`: bool

### GetInsertMode

Returns:

- `mode`: InsertMode

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

### GetTimeVisible

Returns:

- `timeVisibleSeconds`: number

### HasMessageByID

SecretArguments=AllowedWhenUntainted

Arguments:

- `messageID`: number

Returns:

- `hasMessage`: bool

### ResetMessageFadeByID

SecretArguments=AllowedWhenUntainted

Arguments:

- `messageID`: number

### SetFadeDuration

SecretArguments=AllowedWhenUntainted

Arguments:

- `fadeDurationSeconds`: number

### SetFadePower

SecretArguments=AllowedWhenUntainted

Arguments:

- `fadePower`: number

### SetFading

SecretArguments=AllowedWhenUntainted

Arguments:

- `fading`: bool

### SetFont

RequiresValidFontAsset=true, RequiresValidFontHeight=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `fontFile`: cstring
- `height`: uiFontHeight
- `flags`: TBFFlags

### SetFontObject

SecretArguments=AllowedWhenUntainted

Arguments:

- `font`: SimpleFont

### SetIndentedWordWrap

SecretArguments=AllowedWhenUntainted

Arguments:

- `wordWrap`: bool

### SetInsertMode

SecretArguments=AllowedWhenUntainted

Arguments:

- `mode`: InsertMode

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

### SetTimeVisible

SecretArguments=AllowedWhenUntainted

Arguments:

- `timeVisibleSeconds`: number
