# SimpleEditBoxAPI

Environment=All, Predicates={}

## Functions

### AddHistoryLine

SecretArguments=AllowedWhenUntainted

Arguments:

- `text`: cstring

### ClearFocus

ChecksForbiddenAspects={1={Argument=self, Aspect=64}}

### ClearHighlightText

### ClearHistory

### Disable

### Enable

### GetAltArrowKeyMode

Returns:

- `altMode`: bool

### GetBlinkSpeed

Returns:

- `cursorBlinkSpeedSec`: number

### GetCursorPosition

SecretReturnsForAspect={1=1024, 2=8}

Returns:

- `cursorPosition`: number

### GetDisplayText

MayReturnNothing=true, SecretReturnsForAspect={1=8}

Returns:

- `displayText`: string

### GetFont

Returns:

- `name`: cstring
- `fontHeight`: uiUnit
- `flags`: TBFFlags

### GetFontObject

Returns:

- `font`: SimpleFont

### GetHighlightColor

Returns:

- `colorR`: number
- `colorG`: number
- `colorB`: number
- `colorA`: number

### GetHistoryLines

Returns:

- `numHistoryLines`: number

### GetIndentedWordWrap

Returns:

- `isIndented`: bool

### GetInputLanguage

Returns:

- `language`: cstring

### GetJustifyH

Returns:

- `justifyH`: JustifyHorizontal

### GetJustifyV

Returns:

- `justifyV`: JustifyVertical

### GetMaxBytes

Returns:

- `maxBytes`: number

### GetMaxLetters

Returns:

- `maxLetters`: number

### GetNumLetters

MayReturnNothing=true

Returns:

- `numLetters`: number

### GetNumLines

Returns:

- `lines`: number

### GetNumber

SecretReturnsForAspect={1=8}

Returns:

- `number`: number?

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

- `fontHeight`: uiUnit

### GetText

SecretReturnsForAspect={1=8}

Returns:

- `text`: cstring

### GetTextColor

Returns:

- `colorR`: number
- `colorG`: number
- `colorB`: number
- `colorA`: number

### GetTextInsets

Returns:

- `left`: uiUnit
- `right`: uiUnit
- `top`: uiUnit
- `bottom`: uiUnit

### GetUTF8CursorPosition

SecretReturnsForAspect={1=1024, 2=8}

Returns:

- `cursorPosition`: number

### GetVisibleTextByteLimit

Returns:

- `maxVisibleBytes`: number

### HasFocus

ChecksForbiddenAspects={1={Argument=self, Aspect=128}}

Returns:

- `hasFocus`: bool

### HasText

Returns:

- `hasText`: bool

### HighlightText

SecretArguments=AllowedWhenUntainted

Arguments:

- `start`: number [default=0]
- `stop`: number [default=-1]

### Insert

SecretArguments=AllowedWhenUntainted, SecretArgumentsAddAspect={1=8}

Arguments:

- `text`: cstring

### IsAlphabeticOnly

Returns:

- `enabled`: bool

### IsAutoFocus

Returns:

- `autoFocus`: bool

### IsCountInvisibleLetters

Returns:

- `countInvisibleLetters`: bool

### IsEnabled

Returns:

- `isEnabled`: bool

### IsInIMECompositionMode

Returns:

- `isInIMECompositionMode`: bool

### IsMultiLine

Returns:

- `multiline`: bool

### IsNumeric

Returns:

- `isNumeric`: bool

### IsNumericFullRange

Returns:

- `isNumeric`: bool

### IsPassword

Returns:

- `isPassword`: bool

### IsSecureText

SecretReturnsForAspect={1=16}

Returns:

- `isSecure`: bool

### ResetInputMode

### SetAlphabeticOnly

SecretArguments=AllowedWhenUntainted

Arguments:

- `enabled`: bool [default=false]

### SetAltArrowKeyMode

SecretArguments=AllowedWhenUntainted

Arguments:

- `altMode`: bool [default=false]

### SetAutoFocus

SecretArguments=AllowedWhenUntainted

Arguments:

- `autoFocus`: bool [default=false]

### SetBlinkSpeed

SecretArguments=AllowedWhenUntainted

Arguments:

- `cursorBlinkSpeedSec`: number

### SetCountInvisibleLetters

SecretArguments=AllowedWhenUntainted

Arguments:

- `countInvisibleLetters`: bool [default=false]

### SetCursorPosition

ChecksForbiddenAspects={1={Argument=self, Aspect=64}}, SecretArguments=AllowedWhenUntainted, SecretArgumentsAddAspect={1=1024}

Arguments:

- `cursorPosition`: number

### SetEnabled

SecretArguments=AllowedWhenUntainted

Arguments:

- `enabled`: bool [default=false]

### SetFocus

ChecksForbiddenAspects={1={Argument=self, Aspect=64}}

### SetFont

RequiresValidFontAsset=true, RequiresValidFontHeight=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `fontFile`: cstring
- `height`: uiFontHeight
- `flags`: TBFFlags

Returns:

- `success`: bool

### SetFontObject

SecretArguments=AllowedWhenUntainted

Arguments:

- `font`: SimpleFont

### SetHighlightColor

SecretArguments=AllowedWhenUntainted

Arguments:

- `colorR`: number
- `colorG`: number
- `colorB`: number
- `a`: SingleColorValue?

### SetHistoryLines

SecretArguments=AllowedWhenUntainted

Arguments:

- `numHistoryLines`: number

### SetIndentedWordWrap

SecretArguments=AllowedWhenUntainted

Arguments:

- `isIndented`: bool [default=false]

### SetJustifyH

SecretArguments=AllowedWhenUntainted

Arguments:

- `justifyH`: JustifyHorizontal

### SetJustifyV

SecretArguments=AllowedWhenUntainted

Arguments:

- `justifyV`: JustifyVertical

### SetMaxBytes

SecretArguments=AllowedWhenUntainted

Arguments:

- `maxBytes`: number

### SetMaxLetters

SecretArguments=AllowedWhenUntainted

Arguments:

- `maxLetters`: number

### SetMultiLine

SecretArguments=AllowedWhenUntainted

Arguments:

- `multiline`: bool [default=false]

### SetNumber

SecretArguments=AllowedWhenUntainted, SecretArgumentsAddAspect={1=8}

Arguments:

- `number`: number

### SetNumeric

SecretArguments=AllowedWhenUntainted

Arguments:

- `isNumeric`: bool [default=false]

### SetNumericFullRange

SecretArguments=AllowedWhenUntainted

Arguments:

- `isNumeric`: bool [default=false]

### SetPassword

SecretArguments=AllowedWhenUntainted

Arguments:

- `isPassword`: bool [default=false]

### SetSecureText

SecretArguments=AllowedWhenUntainted, SecretArgumentsAddAspect={1=16}

Arguments:

- `isSecure`: bool [default=false]

### SetSecurityDisablePaste

### SetSecurityDisableSetText

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

- `fontHeight`: uiUnit

### SetText

SecretArguments=AllowedWhenUntainted, SecretArgumentsAddAspect={1=8}

Arguments:

- `text`: cstring

### SetTextColor

SecretArguments=AllowedWhenUntainted

Arguments:

- `colorR`: number
- `colorG`: number
- `colorB`: number
- `a`: SingleColorValue?

### SetTextInsets

SecretArguments=AllowedWhenUntainted

Arguments:

- `left`: uiUnit
- `right`: uiUnit
- `top`: uiUnit
- `bottom`: uiUnit

### SetVisibleTextByteLimit

SecretArguments=AllowedWhenUntainted

Arguments:

- `maxVisibleBytes`: number

### ToggleInputLanguage
