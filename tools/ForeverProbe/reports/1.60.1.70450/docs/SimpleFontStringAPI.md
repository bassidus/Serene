# SimpleFontStringAPI

Environment=All, Predicates={}

## Functions

### CalculateScreenAreaFromCharacterSpan

RequiresFontStringTextAccess=true, SecretArguments=AllowedWhenUntainted, SecretReturnsForAspect={1=8}, SecretWhenAnchoringSecret=true

Arguments:

- `leftIndex`: luaIndex
- `rightIndex`: luaIndex

Returns:

- `areas`: table<uiBoundsRect>?

### CanNonSpaceWrap

Returns:

- `wrap`: bool

### CanWordWrap

Returns:

- `wrap`: bool

### ClearAlphaGradient

### ClearText -- Sets text to an empty string and removes the Text secret aspect.

ChecksForbiddenAspects={1={Argument=self, Aspect=512}}

### FindCharacterIndexAtCoordinate

MayReturnNothing=true, RequiresFontStringTextAccess=true, SecretArguments=AllowedWhenUntainted, SecretReturnsForAspect={1=8}, SecretWhenAnchoringSecret=true

Arguments:

- `x`: uiUnit
- `y`: uiUnit

Returns:

- `characterIndex`: luaIndex
- `inside`: bool

### GetAlphaGradient

Returns:

- `start`: number
- `length`: number

### GetFieldSize

Returns:

- `fieldSize`: number

### GetFont

Returns:

- `fontFile`: FontAsset?
- `fontHeight`: uiUnit
- `flags`: TBFFlags

### GetFontHeight

SecretArguments=AllowedWhenUntainted

Arguments:

- `calculated`: bool [default=true]

Returns:

- `height`: uiUnit

### GetFontObject

Returns:

- `font`: SimpleFont

### GetIndentedWordWrap

Returns:

- `wrap`: bool

### GetJustifyH

Returns:

- `justifyH`: JustifyHorizontal

### GetJustifyV

Returns:

- `justifyV`: JustifyVertical

### GetLineHeight

Returns:

- `lineHeight`: uiUnit

### GetMaxLines

Returns:

- `maxLines`: number

### GetNumLines

SecretWhenAnchoringSecret=true

Returns:

- `numLines`: number

### GetRotation

Returns:

- `radians`: number

### GetScaleAnimationMode

Returns:

- `scaleAnimationMode`: FontStringScaleAnimationMode

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

### GetSmoothScaling

Returns:

- `smoothScaling`: bool

### GetSpacing

Returns:

- `spacing`: uiUnit

### GetStringHeight

SecretWhenAnchoringSecret=true

Returns:

- `height`: uiUnit

### GetStringWidth

SecretWhenAnchoringSecret=true

Returns:

- `width`: uiUnit

### GetText

SecretReturnsForAspect={1=8}

Returns:

- `text`: cstring

### GetTextColor

MayReturnNothing=true, SecretReturnsForAspect={1=2048, 2=128}

Returns:

- `colorR`: number
- `colorG`: number
- `colorB`: number
- `colorA`: number

### GetTextScale

Returns:

- `textScale`: number

### GetUnboundedStringWidth

SecretWhenAnchoringSecret=true

Returns:

- `width`: uiUnit

### GetUnboundedStringWidthForText

SecretArguments=AllowedWhenUntainted, SecretWhenAnchoringSecret=true

Arguments:

- `text`: cstring

Returns:

- `width`: uiUnit

### GetWrappedWidth

SecretWhenAnchoringSecret=true

Returns:

- `width`: uiUnit

### IsTruncated

SecretWhenAnchoringSecret=true

Returns:

- `isTruncated`: bool

### OnColorsUpdated

### SetAlphaGradient

SecretArguments=AllowedWhenUntainted

Arguments:

- `start`: number
- `length`: number

Returns:

- `isWithinText`: bool

### SetDesaturateEmbeddedTextures

SecretArguments=AllowedWhenUntainted

Arguments:

- `desaturate`: bool

### SetFixedColor

SecretArguments=AllowedWhenUntainted

Arguments:

- `fixedColor`: bool

### SetFont

RequiresValidFontAsset=true, RequiresValidFontHeight=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `fontFile`: FontAsset
- `fontHeight`: uiFontHeight
- `flags`: TBFFlags?

Returns:

- `success`: bool

### SetFontHeight

SecretArguments=AllowedWhenUntainted

Arguments:

- `height`: uiUnit

### SetFontObject

SecretArguments=AllowedWhenUntainted

Arguments:

- `font`: SimpleFont

### SetFormattedText

SecretArguments=AllowedWhenTainted, SecretArgumentsAddAspect={1=8}

Arguments:

- `text`: cstring

### SetIndentedWordWrap

SecretArguments=AllowedWhenUntainted

Arguments:

- `wrap`: bool

### SetJustifyH

SecretArguments=AllowedWhenUntainted

Arguments:

- `justifyH`: JustifyHorizontal

### SetJustifyV

SecretArguments=AllowedWhenUntainted

Arguments:

- `justifyV`: JustifyVertical

### SetMaxLines

SecretArguments=AllowedWhenUntainted

Arguments:

- `maxLines`: number

### SetNonSpaceWrap

SecretArguments=AllowedWhenUntainted

Arguments:

- `wrap`: bool

### SetRotation

SecretArguments=AllowedWhenUntainted

Arguments:

- `radians`: number

### SetScaleAnimationMode

SecretArguments=NotAllowed

Arguments:

- `scaleAnimationMode`: FontStringScaleAnimationMode

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

### SetSmoothScaling

SecretArguments=AllowedWhenUntainted

Arguments:

- `smoothScaling`: bool -- If true, text height will not snap to nearest whole numbers for scaled font strings.

### SetSpacing

SecretArguments=AllowedWhenUntainted

Arguments:

- `spacing`: uiUnit

### SetText

SecretArguments=AllowedWhenTainted, SecretArgumentsAddAspect={1=8}

Arguments:

- `text`: cstring [default=]

### SetTextColor

SecretArguments=AllowedWhenTainted, SecretArgumentsAddAspect={1=2048, 2=128}

Arguments:

- `colorR`: number
- `colorG`: number
- `colorB`: number
- `a`: SingleColorValue?

### SetTextHeight

SecretArguments=AllowedWhenUntainted

Arguments:

- `height`: uiUnit

### SetTextScale

SecretArguments=AllowedWhenUntainted

Arguments:

- `textScale`: number

### SetTextToFit

SecretArguments=AllowedWhenTainted, SecretArgumentsAddAspect={1=8}

Arguments:

- `text`: cstring [default=]

### SetWordWrap

SecretArguments=AllowedWhenUntainted

Arguments:

- `wrap`: bool
