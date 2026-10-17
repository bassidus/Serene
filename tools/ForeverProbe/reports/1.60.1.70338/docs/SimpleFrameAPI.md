# SimpleFrameAPI

Environment=All, Predicates={}

## Functions

### AbortDrag

### AddRoleset -- Adds a roleset tag to this frame without removing existing ones.

IsProtectedFunction=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `roleset`: string

### CanChangeAttribute

SecretReturnsForAspect={1=1}

Returns:

- `canChangeAttributes`: bool

### ClearAlphaGradient

### ClearAttribute

IsProtectedFunction=true, SecretArguments=NotAllowed, SecretReturnsForAspect={1=1}

Arguments:

- `attributeName`: cstring

Returns:

- `cleared`: bool

### ClearAttributes

IsProtectedFunction=true

### CreateFontString

SecretArguments=NotAllowed

Arguments:

- `name`: cstring?
- `drawLayer`: DrawLayer?
- `templateName`: cstring?

Returns:

- `line`: SimpleFontString

### CreateLine

SecretArguments=NotAllowed

Arguments:

- `name`: cstring?
- `drawLayer`: DrawLayer?
- `templateName`: cstring?
- `subLevel`: number?

Returns:

- `line`: SimpleLine

### CreateMaskTexture

SecretArguments=NotAllowed

Arguments:

- `name`: cstring?
- `drawLayer`: DrawLayer?
- `templateName`: cstring?
- `subLevel`: number?

Returns:

- `maskTexture`: SimpleMaskTexture

### CreateTexture

SecretArguments=NotAllowed

Arguments:

- `name`: cstring?
- `drawLayer`: DrawLayer?
- `templateName`: cstring?
- `subLevel`: number?

Returns:

- `texture`: SimpleTexture

### CreateVectorGraphics

SecretArguments=NotAllowed

Arguments:

- `name`: cstring?
- `drawLayer`: DrawLayer?
- `templateName`: cstring?
- `subLevel`: number?

Returns:

- `vectorGraphics`: SimpleVectorGraphics

### DesaturateHierarchy

SecretArguments=NotAllowed

Arguments:

- `desaturation`: number
- `excludeRoot`: bool [default=false]

### DisableDrawLayer

SecretArguments=AllowedWhenUntainted

Arguments:

- `layer`: DrawLayer

### DoesClipChildren

Returns:

- `clipsChildren`: bool

### DoesHyperlinkPropagateToParent -- Returns whether hyperlink events (ex. OnHyperlinkEnter, OnHyperlinkLeave, OnHyperlinkClick) are propagated to this frame's parent.

Returns:

- `canPropagate`: bool

### EnableDrawLayer

SecretArguments=AllowedWhenUntainted

Arguments:

- `layer`: DrawLayer

### EnableGamePadButton

IsProtectedFunction=true, SecretArguments=NotAllowed

Arguments:

- `enable`: bool [default=false]

### EnableGamePadStick

IsProtectedFunction=true, SecretArguments=NotAllowed

Arguments:

- `enable`: bool [default=false]

### EnableKeyboard

IsProtectedFunction=true, SecretArguments=NotAllowed

Arguments:

- `enable`: bool [default=false]

### ExecuteAttribute

SecretArguments=AllowedWhenUntainted, SecretReturnsForAspect={1=1}

Arguments:

- `attributeName`: cstring
- `arguments`: cstring? [StrideIndex=1]

Returns:

- `success`: bool
- `returns`: cstring? [StrideIndex=1]

### GetAlpha

SecretReturnsForAspect={1=128}

Returns:

- `alpha`: SingleColorValue

### GetAttribute

ConstSecretAccessor=true, SecretArguments=AllowedWhenUntainted, SecretReturnsForAspect={1=1}

Arguments:

- `attributeName`: cstring

Returns:

- `value`: cstring

### GetBoundsRect

Returns:

- `left`: uiUnit [ConditionalSecret=true]
- `bottom`: uiUnit [ConditionalSecret=true]
- `width`: uiUnit [ConditionalSecret=true]
- `height`: uiUnit [ConditionalSecret=true]

### GetChildren

SecretReturnsForAspect={1=1}

Returns:

- `children`: SimpleFrame [StrideIndex=1]

### GetClampRectInsets

Returns:

- `left`: uiUnit
- `right`: uiUnit
- `top`: uiUnit
- `bottom`: uiUnit

### GetDontSavePosition

Returns:

- `dontSave`: bool

### GetEffectiveAlpha

RequiresScriptObjectAlphaAccess=true, SecretReturnsForAspect={1=128}

Returns:

- `effectiveAlpha`: SingleColorValue

### GetEffectiveScale

SecretReturnsForAspect={1=64}

Returns:

- `effectiveScale`: number

### GetEffectivelyFlattensRenderLayers

Returns:

- `flatten`: bool

### GetFlattensRenderLayers

Returns:

- `flatten`: bool

### GetFrameLevel

SecretReturnsForAspect={1=256}

Returns:

- `frameLevel`: number

### GetFrameStrata

SecretReturnsForAspect={1=16777216}

Returns:

- `strata`: FrameStrata

### GetHighestFrameLevel -- Returns the highest framelevel of the frame and its first order children, or all children if iterateAllChildren is true.

ConstSecretAccessor=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `iterateAllChildren`: bool [default=false]

Returns:

- `frameLevel`: number [ConditionalSecret=true]

### GetHitRectInsets

Returns:

- `left`: uiUnit
- `right`: uiUnit
- `top`: uiUnit
- `bottom`: uiUnit

### GetHyperlinksEnabled

Returns:

- `enabled`: bool

### GetID

SecretReturnsForAspect={1=2}

Returns:

- `id`: number

### GetNumChildren

SecretReturnsForAspect={1=1}

Returns:

- `numChildren`: number

### GetNumRegions

SecretReturnsForAspect={1=1}

Returns:

- `numRegions`: number

### GetOnUpdateMode -- Returns the currently configured OnUpdate script execution mode.

Returns:

- `onUpdateMode`: OnUpdateMode

### GetPropagateKeyboardInput

Returns:

- `propagate`: bool

### GetRaisedFrameLevel

Returns:

- `frameLevel`: number

### GetRegions

SecretReturnsForAspect={1=1}

Returns:

- `regions`: SimpleRegion [StrideIndex=1]

### GetResizeBounds

Returns:

- `minWidth`: uiUnit
- `minHeight`: uiUnit
- `maxWidth`: uiUnit
- `maxHeight`: uiUnit

### GetRolesetNames -- Returns the roleset tags assigned to this frame. Returns a list containing 'roleless' if none are assigned.

Returns:

- `rolesets`: table<string>

### GetScale

SecretReturnsForAspect={1=64}

Returns:

- `frameScale`: number

### GetWindow

Returns:

- `window`: SimpleWindow

### HasAlphaGradient

Returns:

- `hasAlphaGradient`: bool

### HasFixedFrameLevel

Returns:

- `isFixed`: bool

### HasFixedFrameStrata

Returns:

- `isFixed`: bool

### Hide

IsProtectedFunction=true

### InterceptStartDrag

SecretArguments=AllowedWhenUntainted

Arguments:

- `delegate`: SimpleFrame

Returns:

- `success`: bool

### IsClampedToScreen

Returns:

- `clampedToScreen`: bool

### IsDrawLayerEnabled

ConstSecretAccessor=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `layer`: DrawLayer

Returns:

- `isEnabled`: bool

### IsEventRegistered

ChecksForbiddenAspects={1={Argument=self, Aspect=16}}, ConstSecretAccessor=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `eventName`: cstring

Returns:

- `isRegistered`: bool
- `units`: UnitTokenType? [StrideIndex=1]

### IsFrameBuffer

Returns:

- `isFrameBuffer`: bool

### IsGamePadButtonEnabled

Returns:

- `enabled`: bool

### IsGamePadStickEnabled

Returns:

- `enabled`: bool

### IsHighlightLocked

Returns:

- `locked`: bool

### IsIgnoringChildrenForBounds

Returns:

- `ignore`: bool

### IsIgnoringParentAlpha

Returns:

- `ignore`: bool

### IsIgnoringParentScale

Returns:

- `ignore`: bool

### IsKeyboardEnabled

Returns:

- `enabled`: bool

### IsMovable

Returns:

- `isMovable`: bool

### IsObjectLoaded

Returns:

- `isLoaded`: bool

### IsResizable

Returns:

- `resizable`: bool

### IsRolesetFiltered -- Returns whether this frame is hidden because of its rolesets being filtered.

Returns:

- `isRolesetFiltered`: bool

### IsShown

SecretReturnsForAspect={1=32}

Returns:

- `isShown`: bool

### IsToplevel

SecretReturnsForAspect={1=4}

Returns:

- `isTopLevel`: bool

### IsUserPlaced

Returns:

- `isUserPlaced`: bool

### IsUsingParentLevel

Returns:

- `usingParentLevel`: bool

### IsVisible

SecretReturnsForAspect={1=32}

Returns:

- `isVisible`: bool

### LockHighlight

### Lower

IsProtectedFunction=true

### Raise

IsProtectedFunction=true

### RegisterAllEvents

AddsForbiddenAspects={1={Argument=self, Aspect=16}}, ChecksForbiddenAspects={1={Argument=self, Aspect=16}}

### RegisterEvent

AddsForbiddenAspects={1={Argument=self, Aspect=16}}, ChecksForbiddenAspects={1={Argument=self, Aspect=16}}, SecretArguments=AllowedWhenUntainted

Arguments:

- `eventName`: cstring

Returns:

- `registered`: bool

### RegisterEventCallback

AddsForbiddenAspects={1={Argument=self, Aspect=16}}, ChecksForbiddenAspects={1={Argument=self, Aspect=16}}, SecretArguments=AllowedWhenUntainted

Arguments:

- `eventName`: cstring
- `cb`: FrameEventCallbackType

Returns:

- `registered`: bool

### RegisterForDrag

SecretArguments=AllowedWhenUntainted

Arguments:

- `buttons`: MouseButton [StrideIndex=1]

### RegisterUnitEvent

AddsForbiddenAspects={1={Argument=self, Aspect=16}}, ChecksForbiddenAspects={1={Argument=self, Aspect=16}}, SecretArguments=AllowedWhenUntainted

Arguments:

- `eventName`: cstring
- `units`: UnitTokenType [StrideIndex=1]

Returns:

- `registered`: bool

### RegisterUnitEventCallback

AddsForbiddenAspects={1={Argument=self, Aspect=16}}, ChecksForbiddenAspects={1={Argument=self, Aspect=16}}, SecretArguments=AllowedWhenUntainted

Arguments:

- `eventName`: cstring
- `cb`: FrameEventCallbackType
- `units`: UnitTokenType [StrideIndex=1]

Returns:

- `registered`: bool

### RemoveRoleset -- Removes a roleset tag from this frame.

IsProtectedFunction=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `roleset`: string

### ResizeToBoundsRect

IsProtectedFunction=true

### RotateTextures

SecretArguments=AllowedWhenUntainted

Arguments:

- `radians`: number
- `x`: number [default=0.5]
- `y`: number [default=0.5]

### SetAlpha

SecretArguments=AllowedWhenTainted, SecretArgumentsAddAspect={1=128}

Arguments:

- `alpha`: SingleColorValue

### SetAlphaFromBoolean

SecretArguments=AllowedWhenTainted, SecretArgumentsAddAspect={1=128}

Arguments:

- `value`: bool
- `alphaIfTrue`: SingleColorValue [default=255]
- `alphaIfFalse`: SingleColorValue [default=0]

### SetAlphaGradient

SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: number
- `gradient`: vector2 (Vector2DMixin)

### SetAttribute

SecretArguments=AllowedWhenUntainted, SecretReturnsForAspect={1=1}

Arguments:

- `attributeName`: cstring
- `value`: cstring

### SetAttributeNoHandler

SecretArguments=AllowedWhenUntainted, SecretReturnsForAspect={1=1}

Arguments:

- `attributeName`: cstring
- `value`: cstring

### SetClampRectInsets

IsProtectedFunction=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `left`: uiUnit
- `right`: uiUnit
- `top`: uiUnit
- `bottom`: uiUnit

### SetClampedToScreen

IsProtectedFunction=true, SecretArguments=NotAllowed

Arguments:

- `clampedToScreen`: bool

### SetClipsChildren

SecretArguments=AllowedWhenUntainted

Arguments:

- `clipsChildren`: bool

### SetDontSavePosition

SecretArguments=AllowedWhenUntainted

Arguments:

- `dontSave`: bool

### SetDrawLayerEnabled

SecretArguments=AllowedWhenUntainted

Arguments:

- `layer`: DrawLayer
- `isEnabled`: bool [default=false]

### SetFixedFrameLevel

IsProtectedFunction=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `isFixed`: bool

### SetFixedFrameStrata

IsProtectedFunction=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `isFixed`: bool

### SetFlattensRenderLayers

SecretArguments=AllowedWhenUntainted

Arguments:

- `flatten`: bool

### SetFrameLevel

IsProtectedFunction=true, SecretArguments=AllowedWhenUntainted, SecretArgumentsAddAspect={1=256}

Arguments:

- `frameLevel`: number

### SetFrameStrata

IsProtectedFunction=true, SecretArguments=AllowedWhenUntainted, SecretArgumentsAddAspect={1=16777216}

Arguments:

- `strata`: FrameStrata

### SetHighlightLocked

SecretArguments=AllowedWhenUntainted

Arguments:

- `locked`: bool

### SetHitRectInsets

IsProtectedFunction=true, SecretArguments=NotAllowed

Arguments:

- `left`: uiUnit
- `right`: uiUnit
- `top`: uiUnit
- `bottom`: uiUnit

### SetHyperlinkPropagateToParent -- Enables or disables propagating hyperlink events (ex. OnHyperlinkEnter, OnHyperlinkLeave, OnHyperlinkClick) to this frame's parent.

ChecksForbiddenAspects={1={Argument=self, Aspect=4}}, SecretArguments=AllowedWhenUntainted

Arguments:

- `canPropagate`: bool

### SetHyperlinksEnabled

IsProtectedFunction=true, SecretArguments=NotAllowed

Arguments:

- `enabled`: bool [default=false]

### SetID

IsProtectedFunction=true, SecretArguments=AllowedWhenTainted, SecretArgumentsAddAspect={1=2}

Arguments:

- `id`: number

### SetIgnoreParentAlpha

SecretArguments=AllowedWhenUntainted

Arguments:

- `ignore`: bool

### SetIgnoreParentScale

IsProtectedFunction=true, SecretArguments=NotAllowed

Arguments:

- `ignore`: bool

### SetIgnoringChildrenForBounds

SecretArguments=AllowedWhenUntainted

Arguments:

- `ignore`: bool

### SetIsFrameBuffer

SecretArguments=NotAllowed

Arguments:

- `isFrameBuffer`: bool

### SetMovable

SecretArguments=AllowedWhenUntainted

Arguments:

- `movable`: bool

### SetOnUpdateMode -- Changes when OnUpdate scripts are executed for this object.

SecretArguments=AllowedWhenUntainted

Arguments:

- `onUpdateMode`: OnUpdateMode

### SetPropagateKeyboardInput

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `propagate`: bool

### SetResizable

SecretArguments=AllowedWhenUntainted

Arguments:

- `resizable`: bool

### SetResizeBounds

SecretArguments=AllowedWhenUntainted

Arguments:

- `minWidth`: uiUnit
- `minHeight`: uiUnit
- `maxWidth`: uiUnit?
- `maxHeight`: uiUnit?

### SetRolesets -- Sets the roleset tags for this frame, used by the UI mode system to gate visibility. Supports comma-separated names to assign multiple rolesets. Pass nil to clear.

IsProtectedFunction=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `rolesetsString`: cstring?

### SetScale

IsProtectedFunction=true, SecretArguments=AllowedWhenUntainted, SecretArgumentsAddAspect={1=64}

Arguments:

- `scale`: number

### SetShown

IsProtectedFunction=true, SecretArguments=AllowedWhenUntainted, SecretArgumentsAddAspect={1=32}

Arguments:

- `shown`: bool [default=false]

### SetToplevel

IsProtectedFunction=true, SecretArguments=AllowedWhenUntainted, SecretArgumentsAddAspect={1=4}

Arguments:

- `topLevel`: bool

### SetUserPlaced

SecretArguments=AllowedWhenUntainted

Arguments:

- `userPlaced`: bool

### SetUsingParentLevel

IsProtectedFunction=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `usingParentLevel`: bool

### SetWindow

SecretArguments=AllowedWhenUntainted

Arguments:

- `window`: SimpleWindow?

### Show

IsProtectedFunction=true

### StartMoving

IsProtectedFunction=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `alwaysStartFromMouse`: bool [default=false]

### StartSizing

IsProtectedFunction=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `resizePoint`: FramePoint?
- `alwaysStartFromMouse`: bool [default=false]

### StopMovingOrSizing

IsProtectedFunction=true

### UnlockHighlight

### UnregisterAllEvents

AddsForbiddenAspects={1={Argument=self, Aspect=16}}, ChecksForbiddenAspects={1={Argument=self, Aspect=16}}

### UnregisterEvent

AddsForbiddenAspects={1={Argument=self, Aspect=16}}, ChecksForbiddenAspects={1={Argument=self, Aspect=16}}, SecretArguments=AllowedWhenUntainted

Arguments:

- `eventName`: cstring

Returns:

- `registered`: bool

## Tables

### CreateRegionParams

Fields:

- `name`: cstring?
- `drawLayer`: DrawLayer?
- `templateName`: cstring?
- `subLevel`: number?

### FrameEventCallbackType
