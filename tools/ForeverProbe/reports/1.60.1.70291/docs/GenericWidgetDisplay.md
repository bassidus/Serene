# GenericWidgetDisplay

Namespace `C_GenericWidgetDisplay`.

Environment=All, Predicates={}

## Functions

### C_GenericWidgetDisplay.Acknowledge

### C_GenericWidgetDisplay.Close

## Events

### GENERIC_WIDGET_DISPLAY_SHOW

SynchronousEvent=true

Payload:

- `info`: GenericWidgetDisplayFrameInfo

## Tables

### GenericWidgetDisplayFrameInfo

Fields:

- `uiWidgetSetID`: number?
- `uiTextureKit`: textureKit?
- `title`: string?
- `frameWidth`: number
- `frameHeight`: number
- `extraButtonText`: string?
- `closeButtonText`: string?
