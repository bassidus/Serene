# HousingLayoutUI

Namespace `C_HousingLayout`.

Environment=All, Predicates={}

## Functions

### C_HousingLayout.AnyRoomsOnFloor

SecretArguments=AllowedWhenUntainted

Arguments:

- `floor`: number

Returns:

- `anyRooms`: bool

### C_HousingLayout.CanSetViewedFloor

SecretArguments=AllowedWhenUntainted

Arguments:

- `floor`: number

Returns:

- `canSet`: bool

### C_HousingLayout.CancelActiveLayoutEditing

### C_HousingLayout.ConfirmStairChoice

SecretArguments=AllowedWhenUntainted

Arguments:

- `choice`: HousingLayoutStairDirection? -- If not set, the pending stair operation will be cancelled

### C_HousingLayout.DeselectFloorplan

### C_HousingLayout.DeselectRoomOrDoor

### C_HousingLayout.GetBaseRoomFloor

Returns:

- `floor`: number

### C_HousingLayout.GetHighestOccupiedFloorIndex

Returns:

- `highestFloorIndex`: number

### C_HousingLayout.GetLowestOccupiedFloorIndex

Returns:

- `lowestFloorIndex`: number

### C_HousingLayout.GetNumActiveRooms

Returns:

- `numRooms`: number

### C_HousingLayout.GetRoomPlacementBudget -- Returns the max room placement budget for the current owned house's interior; Can be increased via house level

Returns:

- `placementBudget`: number? -- Will be nil if not in an owned House or Plot

### C_HousingLayout.GetRoomPlayerIsIn -- Returns the guid of the interior room the player is standing in, or nil if not currently standing in one

MayReturnNothing=true

Returns:

- `roomGUID`: WOWGUID

### C_HousingLayout.GetSelectedBlueprintFloorplan

MayReturnNothing=true

Returns:

- `roomID`: number
- `shareCode`: cstring

### C_HousingLayout.GetSelectedDoor -- If a door is selected, returns its component id and the guid of the room it belongs to; Otherwise returns nothing

MayReturnNothing=true

Returns:

- `selectedDoorComponentID`: number
- `roomGUID`: WOWGUID

### C_HousingLayout.GetSelectedFloorplan

Returns:

- `roomID`: number?

### C_HousingLayout.GetSelectedRoom -- If a Room is selected, returns the room's guid; Otherwise returns nothing

MayReturnNothing=true

Returns:

- `roomGUID`: WOWGUID

### C_HousingLayout.GetSelectedStairwellRoomCount

Returns:

- `stairwellRoomCount`: number

### C_HousingLayout.GetSpentPlacementBudget -- Returns how much of the current owned house's room placement budget has been spent; Different kinds of rooms take up different budget amounts, so this value isn't an individual room count, see GetNumActiveRooms for that

Returns:

- `spentPlacementBudget`: number? -- Will be nil if not in an owned House

### C_HousingLayout.GetViewedFloor

Returns:

- `floor`: number

### C_HousingLayout.HasAnySelections -- Returns true if any room, door, or floorplan is currently selected or being dragged

Returns:

- `hasAnySelections`: bool

### C_HousingLayout.HasRoomPlacementBudget -- Returns whether there's a max room placement budget available and active for the current player, in the current house's interior

Returns:

- `hasBudget`: bool

### C_HousingLayout.HasSelectedBlueprintFloorplan

Returns:

- `hasSelectedBlueprintFloorplan`: bool

### C_HousingLayout.HasSelectedDoor -- Returns true if a door component is currently selected

Returns:

- `hasSelectedDoor`: bool

### C_HousingLayout.HasSelectedFloorplan

Returns:

- `hasSelectedFloorplan`: bool

### C_HousingLayout.HasSelectedRoom -- Returns true if a room is selected, will NOT return true if a door is selected

Returns:

- `hasSelectedRoom`: bool

### C_HousingLayout.HasStairs

SecretArguments=AllowedWhenUntainted

Arguments:

- `roomRecordID`: number

Returns:

- `hasStairs`: bool

### C_HousingLayout.HasValidConnection

SecretArguments=AllowedWhenUntainted

Arguments:

- `roomGUID`: WOWGUID
- `componentID`: number
- `roomId`: number

Returns:

- `canPlace`: bool

### C_HousingLayout.IsBaseRoom

SecretArguments=AllowedWhenUntainted

Arguments:

- `roomGUID`: WOWGUID

Returns:

- `isBaseRoom`: bool

### C_HousingLayout.IsDraggingRoom

Returns:

- `isDragging`: bool
- `isAccessibleDrag`: bool

### C_HousingLayout.MoveDraggedRoom -- Attempt to move the room currently being dragged to a specific connection point on a specific other room

SecretArguments=AllowedWhenUntainted

Arguments:

- `sourceDoorIndex`: number
- `destRoom`: WOWGUID
- `destDoorIndex`: number

### C_HousingLayout.MoveLayoutCamera

SecretArguments=AllowedWhenUntainted

Arguments:

- `direction`: HousingLayoutCameraDirection
- `isPressed`: bool

### C_HousingLayout.RemoveRoom -- Attempt to return a previously placed room to the House Chest

SecretArguments=AllowedWhenUntainted

Arguments:

- `roomGUID`: WOWGUID

### C_HousingLayout.RoomHasStairs -- Returns true of the provided roomGUID is a stairwell. Returns false if roomGUID is invalid

SecretArguments=AllowedWhenUntainted

Arguments:

- `roomGUID`: WOWGUID

Returns:

- `hasStairs`: bool

### C_HousingLayout.RotateFocusedRoom -- Rotates either the currently dragged or currently selected room, if either exist

SecretArguments=AllowedWhenUntainted

Arguments:

- `isLeft`: bool

### C_HousingLayout.RotateRoom -- Attempt to rotate an already placed room

SecretArguments=AllowedWhenUntainted

Arguments:

- `roomGUID`: WOWGUID
- `isLeft`: bool

### C_HousingLayout.SelectFloorplan

SecretArguments=AllowedWhenUntainted

Arguments:

- `roomID`: number

### C_HousingLayout.SetViewedFloor

SecretArguments=AllowedWhenUntainted

Arguments:

- `floor`: number

### C_HousingLayout.StartDrag

### C_HousingLayout.StopDrag

### C_HousingLayout.StopDraggingRoom

### C_HousingLayout.ZoomLayoutCamera

SecretArguments=AllowedWhenUntainted

Arguments:

- `zoomIn`: bool

Returns:

- `zoomChanged`: bool

## Events

### HOUSING_LAYOUT_DOOR_SELECTED -- Fired when one of the door nodes of an already placed room has been selected

SynchronousEvent=true

Payload:

- `roomGUID`: WOWGUID
- `componentID`: number

### HOUSING_LAYOUT_DOOR_SELECTION_CHANGED -- Fired when one of the door nodes of an already placed room has been selected or deselected

SynchronousEvent=true

Payload:

- `hasSelection`: bool

### HOUSING_LAYOUT_DRAG_TARGET_CHANGED -- Fired when an already placed room has either started or stopped being dragged

SynchronousEvent=true

Payload:

- `isDraggingRoom`: bool

### HOUSING_LAYOUT_FLOORPLAN_SELECTION_CHANGED -- Fired when a room option in the House Chest has been selected or deselected

SynchronousEvent=true

Payload:

- `hasSelection`: bool
- `roomID`: number
- `blueprintShareCode`: cstring?

### HOUSING_LAYOUT_OCCUPIED_FLOOR_RANGE_CHANGED

SynchronousEvent=true

Payload:

- `lowestFloor`: number
- `highestFloor`: number

### HOUSING_LAYOUT_PIN_FRAME_ADDED

SynchronousEvent=true

Payload:

- `pinFrame`: HousingLayoutPinFrame

### HOUSING_LAYOUT_PIN_FRAME_RELEASED

SynchronousEvent=true

Payload:

- `pinFrame`: HousingLayoutPinFrame

### HOUSING_LAYOUT_PIN_FRAMES_RELEASED

SynchronousEvent=true

### HOUSING_LAYOUT_ROOM_COMPONENT_THEME_SET_CHANGED

SynchronousEvent=true

Payload:

- `roomGUID`: WOWGUID
- `componentID`: number
- `newThemeSet`: number
- `result`: HousingResult

### HOUSING_LAYOUT_ROOM_MOVE_INVALID

SynchronousEvent=true

### HOUSING_LAYOUT_ROOM_MOVED -- Fired when a previously placed room has been moved to a different position or rotation

SynchronousEvent=true

### HOUSING_LAYOUT_ROOM_RECEIVED -- Fired when info for a newly placed room has been recieved while in Layout Mode

SynchronousEvent=true

Payload:

- `playAddedSound`: bool

### HOUSING_LAYOUT_ROOM_REMOVED -- Fired when a previously placed room has been removed while in Layout Mode

SynchronousEvent=true

### HOUSING_LAYOUT_ROOM_RETURNED -- Fired when a room that was being dragged is let go of without being placed, and is returned to the House Chest

SynchronousEvent=true

### HOUSING_LAYOUT_ROOM_SELECTION_CHANGED -- Fired when an already placed room has been selected or deselected

SynchronousEvent=true

Payload:

- `hasSelection`: bool

### HOUSING_LAYOUT_ROOM_SNAPPED -- Fired when a room being dragged has been snapped to a particular door connection

SynchronousEvent=true

### HOUSING_LAYOUT_VIEWED_FLOOR_CHANGED

SynchronousEvent=true

Payload:

- `floor`: number

### SHOW_STAIR_DIRECTION_CONFIRMATION

SynchronousEvent=true
