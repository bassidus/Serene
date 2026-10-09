# FrameAPINamePlate

Environment=All, Predicates={1={Documentation={1=Guarded APIs require that the nameplate frame must allow changes to its hit test points.}, FailureMode=Error, Name=RequiresCanChangeHitTestPoints, Type=Precondition}}

## Functions

### CanChangeHitTestPoints -- Returns true if this nameplate permits changes to its hit-test points. Updates are normally blocked for tainted code during combat, except on the tick a unit is first assigned or when untainted code updates hit-test points on the same tick.

Returns:

- `canChangeHitTestPoints`: bool

### ClearAllHitTestPoints -- Clears the anchor points that determine where the mouse interacts with the nameplate.

RequiresCanChangeHitTestPoints=true

### GetHitTestPoints -- Returns the anchor points that determine where the mouse interacts with the nameplate.

Returns:

- `anchors`: table<AnchorBinding>

### SetAllHitTestPoints -- Sets the anchor points that determine where the mouse interacts with the nameplate to fully encompass the target region.

RequiresCanChangeHitTestPoints=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `relativeTo`: ScriptRegion

### SetHitTestPoints -- Sets the anchor points that determine where the mouse interacts with the nameplate.

RequiresCanChangeHitTestPoints=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `anchors`: table<AnchorBinding> -- List of anchor points to use for hit testing. All existing points will be cleared.

### SetStackingBoundsFrame

SecretArguments=AllowedWhenUntainted

Arguments:

- `frame`: SimpleFrame
