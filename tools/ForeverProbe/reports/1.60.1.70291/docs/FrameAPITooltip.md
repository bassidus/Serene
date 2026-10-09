# FrameAPITooltip

Environment=All, Predicates={}

## Functions

### AddFontStrings

CheckAllowChangeParent=true, ChecksForbiddenAspects={1={Argument=leftFontString, Aspect=512}, 2={Argument=rightFontString, Aspect=512}}, SecretArguments=AllowedWhenUntainted

Arguments:

- `leftFontString`: SimpleFontString
- `rightFontString`: SimpleFontString

### ClearPadding -- Set all padding values to 0.0 and remove the Padding SecretAspect.

### GetLeftLine

SecretArguments=AllowedWhenUntainted

Arguments:

- `line`: luaIndex

Returns:

- `leftFontString`: SimpleFontString

### GetMinimumWidth

SecretReturnsForAspect={1=131072}

Returns:

- `width`: number
- `forced`: bool

### GetPadding

SecretReturnsForAspect={1=262144}

Returns:

- `right`: number
- `bottom`: number
- `left`: number
- `top`: number

### GetRightLine

SecretArguments=AllowedWhenUntainted

Arguments:

- `line`: luaIndex

Returns:

- `rightFontString`: SimpleFontString

### SetMinimumWidth

SecretArguments=AllowedWhenUntainted, SecretArgumentsAddAspect={1=131072}

Arguments:

- `width`: number
- `force`: bool [default=false]

### SetPadding

SecretArguments=AllowedWhenUntainted, SecretArgumentsAddAspect={1=262144}

Arguments:

- `right`: number
- `bottom`: number
- `left`: number?
- `top`: number?

### SetText

SecretArguments=AllowedWhenTainted, SecretArgumentsAddAspect={1=8}

Arguments:

- `text`: cstring [ConditionalSecret=true]
- `colorR`: number
- `colorG`: number
- `colorB`: number
- `alpha`: number [default=1, ConditionalSecret=true]
- `wrap`: bool [default=false, ConditionalSecret=true]
