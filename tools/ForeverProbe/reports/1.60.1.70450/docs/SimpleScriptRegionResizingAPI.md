# SimpleScriptRegionResizingAPI

Environment=All, Predicates={}

## Functions

### AdjustPointsOffset

IsProtectedFunction=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `x`: uiUnit
- `y`: uiUnit

### ClearAllPoints -- Clears all points and immediately invalidates the rect. (Prior to 11.2.0, this would only invalidate rect immediately for AnchoringRestricted regions.)

IsProtectedFunction=true

### ClearPoint

IsProtectedFunction=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `point`: FramePoint

### ClearPointsOffset

IsProtectedFunction=true

### GetNumPoints

Returns:

- `numPoints`: number

### GetPoint

ConstSecretAccessor=true, MayReturnNothing=true, SecretArguments=AllowedWhenUntainted, SecretWhenAnchoringSecret=true

Arguments:

- `anchorIndex`: luaIndex [default=0]
- `resolveCollapsed`: bool [default=false]

Returns:

- `point`: FramePoint
- `relativeTo`: ScriptRegion
- `relativePoint`: FramePoint
- `offsetX`: uiUnit
- `offsetY`: uiUnit

### GetPointByName

ConstSecretAccessor=true, MayReturnNothing=true, SecretArguments=AllowedWhenUntainted, SecretWhenAnchoringSecret=true

Arguments:

- `point`: FramePoint
- `resolveCollapsed`: bool [default=false]

Returns:

- `point`: FramePoint
- `relativeTo`: ScriptRegion
- `relativePoint`: FramePoint
- `offsetX`: uiUnit
- `offsetY`: uiUnit

### SetAllPoints

CheckAllowInheritForbiddenLayoutAspects=true, IsProtectedFunction=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `relativeTo`: ScriptRegion
- `doResize`: bool [default=true]

### SetHeight

IsProtectedFunction=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `height`: uiUnit

### SetPoint

CheckAllowInheritForbiddenLayoutAspects=true, IsProtectedFunction=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `point`: FramePoint
- `relativeTo`: ScriptRegion
- `relativePoint`: FramePoint
- `offsetX`: uiUnit
- `offsetY`: uiUnit

### SetPointsOffset

IsProtectedFunction=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `x`: uiUnit
- `y`: uiUnit

### SetSize

IsProtectedFunction=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `x`: uiUnit
- `y`: uiUnit

### SetWidth

IsProtectedFunction=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `width`: uiUnit
