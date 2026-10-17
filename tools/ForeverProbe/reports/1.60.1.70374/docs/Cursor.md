# Cursor

Namespace `C_Cursor`.

Environment=All, Predicates={}

## Functions

### C_Cursor.GetCursorItem

MayReturnNothing=true

Returns:

- `item`: ItemLocation (ItemLocationMixin)

## Events

### BATTLE_PET_CURSOR_CLEAR

SynchronousEvent=true

### CURSOR_CHANGED

SynchronousEvent=true

Payload:

- `isDefault`: bool
- `newCursorType`: UICursorType
- `oldCursorType`: UICursorType
- `oldCursorVirtualID`: number

### MOUNT_CURSOR_CLEAR

SynchronousEvent=true

### WORLD_CURSOR_TOOLTIP_UPDATE -- Sends an update when the mouse enters or leaves something in-world (object, unit, etc) that should display a tooltip

SynchronousEvent=true

Payload:

- `anchorType`: WorldCursorAnchorType
