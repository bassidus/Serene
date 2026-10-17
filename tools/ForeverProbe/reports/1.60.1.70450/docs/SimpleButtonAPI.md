# SimpleButtonAPI

Environment=All, Predicates={}

## Functions

### ClearDisabledTexture

### ClearHighlightTexture

### ClearNormalTexture

### ClearPushedTexture

### Click

ChecksForbiddenAspects={1={Argument=self, Aspect=64}}, SecretArguments=NotAllowed

Arguments:

- `button`: cstring [default=LeftButton]
- `isDown`: bool [default=false]

### Disable

IsProtectedFunction=true

### Enable

IsProtectedFunction=true

### GetButtonState

SecretReturnsForAspect={1=2097152}

Returns:

- `buttonState`: SimpleButtonStateToken

### GetDisabledFontObject

Returns:

- `font`: SimpleFont

### GetDisabledTexture

Returns:

- `texture`: SimpleTexture

### GetFontString

Returns:

- `fontString`: SimpleFontString

### GetHighlightFontObject

Returns:

- `font`: SimpleFont

### GetHighlightTexture

Returns:

- `texture`: SimpleTexture

### GetMotionScriptsWhileDisabled

Returns:

- `motionScriptsWhileDisabled`: bool

### GetNormalFontObject

Returns:

- `font`: SimpleFont

### GetNormalTexture

Returns:

- `texture`: SimpleTexture

### GetPushedTextOffset

Returns:

- `offsetX`: uiUnit
- `offsetY`: uiUnit

### GetPushedTexture

Returns:

- `texture`: SimpleTexture

### GetText

SecretReturnsForAspect={1=8}

Returns:

- `text`: cstring

### GetTextHeight

Returns:

- `height`: uiUnit

### GetTextWidth

Returns:

- `width`: uiUnit

### IsEnabled

SecretReturnsForAspect={1=2097152}

Returns:

- `isEnabled`: bool

### RegisterForClicks

IsProtectedFunction=true, SecretArguments=NotAllowed

Arguments:

- `buttons`: ClickButton [StrideIndex=1]

### RegisterForMouse

IsProtectedFunction=true, SecretArguments=NotAllowed

Arguments:

- `buttons`: ClickButton [StrideIndex=1]

### SetButtonState

SecretArguments=AllowedWhenUntainted, SecretArgumentsAddAspect={1=2097152}

Arguments:

- `buttonState`: SimpleButtonStateToken
- `lock`: bool [default=false]

### SetDisabledAtlas

SecretArguments=AllowedWhenUntainted

Arguments:

- `atlas`: textureAtlas

### SetDisabledFontObject

SecretArguments=AllowedWhenUntainted

Arguments:

- `font`: SimpleFont

### SetDisabledTexture

CheckAllowChangeParent=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `asset`: TextureAsset

### SetEnabled

IsProtectedFunction=true, SecretArguments=AllowedWhenUntainted, SecretArgumentsAddAspect={1=2097152}

Arguments:

- `enabled`: bool [default=false]

### SetFontString

CheckAllowChangeParent=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `fontString`: SimpleFontString

### SetFormattedText

SecretArguments=AllowedWhenUntainted, SecretArgumentsAddAspect={1=8}

Arguments:

- `text`: cstring

### SetHighlightAtlas

SecretArguments=AllowedWhenUntainted

Arguments:

- `atlas`: textureAtlas
- `blendMode`: BlendMode?

### SetHighlightFontObject

SecretArguments=AllowedWhenUntainted

Arguments:

- `font`: SimpleFont

### SetHighlightTexture

CheckAllowChangeParent=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `asset`: TextureAsset
- `blendMode`: BlendMode?

### SetMotionScriptsWhileDisabled

SecretArguments=AllowedWhenUntainted

Arguments:

- `motionScriptsWhileDisabled`: bool

### SetNormalAtlas

SecretArguments=AllowedWhenUntainted

Arguments:

- `atlas`: textureAtlas

### SetNormalFontObject

SecretArguments=AllowedWhenUntainted

Arguments:

- `font`: SimpleFont

### SetNormalTexture

CheckAllowChangeParent=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `asset`: TextureAsset

### SetPushedAtlas

SecretArguments=AllowedWhenUntainted

Arguments:

- `atlas`: textureAtlas

### SetPushedTextOffset

SecretArguments=AllowedWhenUntainted

Arguments:

- `offsetX`: uiUnit
- `offsetY`: uiUnit

### SetPushedTexture

CheckAllowChangeParent=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `asset`: TextureAsset

### SetText

SecretArguments=AllowedWhenUntainted, SecretArgumentsAddAspect={1=8}

Arguments:

- `text`: cstring [default=]
