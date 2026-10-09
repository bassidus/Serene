# UIEventToastManagerInfo

Namespace `C_EventToastManager`.

Environment=All, Predicates={}

## Functions

### C_EventToastManager.GetLevelUpDisplayToastsFromLevel

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `level`: number

Returns:

- `toastInfo`: table<EventToastInfo>

### C_EventToastManager.GetNextToastToDisplay

MayReturnNothing=true

Returns:

- `toastInfo`: EventToastInfo

### C_EventToastManager.RemoveCurrentToast

## Events

### DISPLAY_EVENT_TOAST_LINK

SynchronousEvent=true

Payload:

- `link`: string

### DISPLAY_EVENT_TOASTS

SynchronousEvent=true

## Tables

### EventToastInfo

Fields:

- `eventToastID`: number
- `title`: string
- `subtitle`: string
- `instructionText`: string
- `iconFileID`: fileID
- `subIcon`: textureAtlas?
- `link`: string
- `qualityString`: string?
- `quality`: number?
- `eventType`: EventToastEventType
- `displayType`: EventToastDisplayType
- `uiTextureKit`: textureKit
- `sortOrder`: number
- `time`: number?
- `uiWidgetSetID`: number?
- `extraUiWidgetSetID`: number?
- `titleTooltip`: string?
- `subtitleTooltip`: string?
- `titleTooltipUiWidgetSetID`: number?
- `subtitleTooltipUiWidgetSetID`: number?
- `showSoundKitID`: number?
- `hideSoundKitID`: number?
- `colorTint`: colorRGB (ColorMixin)?
- `flags`: number
