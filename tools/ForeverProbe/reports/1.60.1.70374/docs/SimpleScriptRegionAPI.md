# SimpleScriptRegionAPI

Environment=All, Predicates={}

## Functions

### CanChangeProtectedState

SecretReturnsForAspect={1=1}

Returns:

- `canChange`: bool

### CanPropagateMouseClicks

Returns:

- `canPropagate`: bool

### CanPropagateMouseMotion

Returns:

- `canPropagate`: bool

### ClearScripts -- Remove all script handlers set through Scripts in XML or SetScript in Lua

ChecksForbiddenAspects={1={Argument=self, Aspect=2}}

### CollapsesLayout

Returns:

- `collapsesLayout`: bool

### EnableMouse

IsProtectedFunction=true, SecretArguments=NotAllowed

Arguments:

- `enable`: bool [default=false]

### EnableMouseMotion

IsProtectedFunction=true, SecretArguments=NotAllowed

Arguments:

- `enable`: bool [default=false]

### EnableMouseWheel

IsProtectedFunction=true, SecretArguments=NotAllowed

Arguments:

- `enable`: bool [default=false]

### FocusEnter

ChecksForbiddenAspects={1={Argument=self, Aspect=64}}, IsProtectedFunction=true, SecretArguments=NotAllowed

Arguments:

- `fromMouseMotion`: bool [default=true]

### FocusExit

ChecksForbiddenAspects={1={Argument=self, Aspect=64}}, IsProtectedFunction=true, SecretArguments=NotAllowed

Arguments:

- `fromMouseMotion`: bool [default=true]

### GetBottom

MayReturnNothing=true, SecretWhenAnchoringSecret=true

Returns:

- `bottom`: uiUnit

### GetCenter

MayReturnNothing=true, SecretWhenAnchoringSecret=true

Returns:

- `x`: uiUnit
- `y`: uiUnit

### GetHeight

ConstSecretAccessor=true, SecretArguments=AllowedWhenUntainted, SecretWhenAnchoringSecret=true

Arguments:

- `ignoreRect`: bool [default=false]

Returns:

- `height`: uiUnit

### GetLeft

MayReturnNothing=true, SecretWhenAnchoringSecret=true

Returns:

- `left`: uiUnit

### GetRect

MayReturnNothing=true, SecretWhenAnchoringSecret=true

Returns:

- `left`: uiUnit
- `bottom`: uiUnit
- `width`: uiUnit
- `height`: uiUnit

### GetRight

MayReturnNothing=true, SecretWhenAnchoringSecret=true

Returns:

- `right`: uiUnit

### GetRoundLayoutToNearestPixel

Returns:

- `enabled`: bool

### GetScaledRect

MayReturnNothing=true, SecretWhenAnchoringSecret=true

Returns:

- `left`: uiUnit
- `bottom`: uiUnit
- `width`: uiUnit
- `height`: uiUnit

### GetScript

ChecksForbiddenAspects={1={Argument=self, Aspect=2}}, ConstSecretAccessor=true, RequiresSupportedScript=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `scriptTypeName`: ScriptTypeName
- `bindingType`: ScriptBindingType [default=Extrinsic]

Returns:

- `script`: LuaFunctionReference

### GetSize

ConstSecretAccessor=true, SecretArguments=AllowedWhenUntainted, SecretWhenAnchoringSecret=true

Arguments:

- `ignoreRect`: bool [default=false]

Returns:

- `width`: uiUnit
- `height`: uiUnit

### GetSourceLocation

SecretReturnsForAspect={1=1}

Returns:

- `location`: string

### GetTop

MayReturnNothing=true, SecretWhenAnchoringSecret=true

Returns:

- `top`: uiUnit

### GetWidth

ConstSecretAccessor=true, SecretArguments=AllowedWhenUntainted, SecretWhenAnchoringSecret=true

Arguments:

- `ignoreRect`: bool [default=false]

Returns:

- `width`: uiUnit

### HasScript

ConstSecretAccessor=true, SecretArguments=AllowedWhenUntainted, SecretReturnsForAspect={1=1}

Arguments:

- `scriptName`: cstring

Returns:

- `hasScript`: bool

### Hide

### HookScript

ChecksForbiddenAspects={1={Argument=self, Aspect=2}}, RequiresAssignableScript=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `scriptTypeName`: ScriptTypeName
- `script`: LuaFunctionReference
- `bindingType`: ScriptBindingType [default=Extrinsic]

Returns:

- `success`: bool

### Intersects

SecretArguments=AllowedWhenUntainted, SecretWhenAnchoringSecret=true

Arguments:

- `region`: ScriptRegion

Returns:

- `intersects`: bool

### IsAnchoringRestricted

SecretReturnsForAspect={1=1}

Returns:

- `isRestricted`: bool

### IsAnchoringSecret

SecretReturnsForAspect={1=1}

Returns:

- `isSecret`: bool

### IsCollapsed

Returns:

- `isCollapsed`: bool

### IsDragging

Returns:

- `isDragging`: bool

### IsMouseClickEnabled

Returns:

- `enabled`: bool

### IsMouseEnabled

Returns:

- `enabled`: bool

### IsMouseMotionEnabled

Returns:

- `enabled`: bool

### IsMouseMotionFocus

ChecksForbiddenAspects={1={Argument=self, Aspect=128}}

Returns:

- `isMouseMotionFocus`: bool

### IsMouseOver

ConstSecretAccessor=true, SecretArguments=AllowedWhenUntainted, SecretWhenAnchoringSecret=true

Arguments:

- `offsetTop`: uiUnit [default=0]
- `offsetBottom`: uiUnit [default=0]
- `offsetLeft`: uiUnit [default=0]
- `offsetRight`: uiUnit [default=0]

Returns:

- `isMouseOver`: bool

### IsMouseWheelEnabled

Returns:

- `enabled`: bool

### IsProtected

SecretReturnsForAspect={1=1}

Returns:

- `isProtected`: bool
- `isProtectedExplicitly`: bool

### IsRectValid

Returns:

- `isValid`: bool

### IsShown

SecretReturnsForAspect={1=32}

Returns:

- `isShown`: bool

### IsVisible

SecretReturnsForAspect={1=32}

Returns:

- `isVisible`: bool

### MouseDown

ChecksForbiddenAspects={1={Argument=self, Aspect=64}}, IsProtectedFunction=true, SecretArguments=NotAllowed

Arguments:

- `button`: cstring [default=LeftButton]

### MouseUp

ChecksForbiddenAspects={1={Argument=self, Aspect=64}}, IsProtectedFunction=true, SecretArguments=NotAllowed

Arguments:

- `button`: cstring [default=LeftButton]

### SetCollapsesLayout

IsProtectedFunction=true, SecretArguments=NotAllowed

Arguments:

- `collapsesLayout`: bool

### SetMouseClickEnabled

IsProtectedFunction=true, SecretArguments=NotAllowed

Arguments:

- `enabled`: bool [default=false]

### SetMouseMotionEnabled

IsProtectedFunction=true, SecretArguments=NotAllowed

Arguments:

- `enabled`: bool [default=false]

### SetParent

CheckAllowChangeParent=true, IsProtectedFunction=true, SecretArguments=NotAllowed

Arguments:

- `parent`: SimpleFrame?

### SetPassThroughButtons

HasRestrictions=true, IsProtectedFunction=true, SecretArguments=NotAllowed

Arguments:

- `buttons`: MouseButton [StrideIndex=1]

### SetPropagateMouseClicks

HasRestrictions=true, IsProtectedFunction=true, SecretArguments=NotAllowed

Arguments:

- `propagate`: bool

### SetPropagateMouseMotion

HasRestrictions=true, IsProtectedFunction=true, SecretArguments=NotAllowed

Arguments:

- `propagate`: bool

### SetRoundLayoutToNearestPixel

IsProtectedFunction=true, SecretArguments=NotAllowed

Arguments:

- `enabled`: bool

### SetScript

ChecksForbiddenAspects={1={Argument=self, Aspect=2}}, RequiresAssignableScript=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `scriptTypeName`: ScriptTypeName
- `script`: LuaFunctionReference?

### SetShown

SecretArguments=AllowedWhenUntainted, SecretArgumentsAddAspect={1=32}

Arguments:

- `show`: bool [default=false]

### ShouldButtonPassThrough

SecretArguments=AllowedWhenUntainted

Arguments:

- `button`: MouseButton

Returns:

- `shouldPassThrough`: bool

### Show
