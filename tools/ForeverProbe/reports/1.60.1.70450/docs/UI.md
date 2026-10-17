# UI

Namespace `C_UI`.

Environment=All, Predicates={}

## Functions

### C_UI.DoesAnyDisplayHaveNotch -- True if any display attached has a notch. This does not mean the current view intersects the notch.

Returns:

- `notchPresent`: bool

### C_UI.GetTopLeftNotchSafeRegion -- Region of screen left of screen notch. Zeros if no notch.

Returns:

- `left`: number
- `right`: number
- `top`: number
- `bottom`: number

### C_UI.GetTopRightNotchSafeRegion -- Region of screen right of screen notch. Zeros if no notch.

Returns:

- `left`: number
- `right`: number
- `top`: number
- `bottom`: number

### C_UI.GetUIParent

Returns:

- `uiParent`: SimpleFrame

### C_UI.GetWorldFrame

Returns:

- `worldFrame`: SimpleFrame

### C_UI.Reload

### C_UI.ShouldUIParentAvoidNotch -- UIParent will shift down to avoid notch if true. This does not mean there is a notch.

Returns:

- `willAvoidNotch`: bool

## Events

### NOTCHED_DISPLAY_MODE_CHANGED

SynchronousEvent=true

### UI_SCALE_CHANGED

SynchronousEvent=true
