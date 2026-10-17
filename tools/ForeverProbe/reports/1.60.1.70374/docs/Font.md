# Font

Environment=All, Predicates={}

## Functions

### CreateFontFamily

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: cstring
- `members`: table<CreateFontFamilyMemberInfo>

Returns:

- `fontFamily`: SimpleFont

### GetFontInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `fontObject`: SimpleFont

Returns:

- `info`: FontScriptInfo?

### GetFonts

Returns:

- `fontNames`: table<cstring>

## Tables

### CreateFontFamilyMemberInfo

Fields:

- `alphabet`: FontAlphabet
- `file`: cstring
- `height`: uiFontHeight
- `flags`: TBFFlags

### FontScriptInfo

Fields:

- `color`: colorRGBA (ColorMixin)
- `height`: number
- `outline`: string
- `shadow`: FontScriptShadowInfo?
- `fontObject`: SimpleFont
- `canBeUserScaled`: bool

### FontScriptShadowInfo

Fields:

- `color`: colorRGBA (ColorMixin)
- `x`: number
- `y`: number
