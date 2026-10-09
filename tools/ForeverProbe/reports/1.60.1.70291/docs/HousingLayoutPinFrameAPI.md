# HousingLayoutPinFrameAPI

Environment=All, Predicates={}

## Functions

### CanMove

Returns:

- `moveRestriction`: HousingLayoutRestriction

### CanRemove

Returns:

- `removalRestriction`: HousingLayoutRestriction

### CanRotate

Returns:

- `rotateRestriction`: HousingLayoutRestriction

### Drag

SecretArguments=AllowedWhenUntainted

Arguments:

- `isAccessible`: bool

### GetDoorConnectionInfo

Returns:

- `connectionInfo`: DoorConnectionInfo?

### GetPinType

Returns:

- `type`: HousingLayoutPinType

### GetRoomGUID

Returns:

- `roomGUID`: WOWGUID

### GetRoomName

Returns:

- `name`: cstring?

### IsAnyPartOfRoomSelected -- Returns true if this pin's associated room, or anything attached to it, is selected. Ex: If pin is for a door, returns true if its room, or any other doors on that room, are selected

Returns:

- `isSelected`: bool

### IsConnectedToDraggingRoom

Returns:

- `isConnectedToDraggingRoom`: bool

### IsOccupiedDoor -- Will be nil if pin is not a Door

Returns:

- `isOccupied`: bool?

### IsPartOfDraggingRoom

Returns:

- `isPartOfDraggingRoom`: bool

### IsSelected -- Returns true if this pin's object is itself selected; See IsAnyPartOfRoomSelected for a broader Selected check

Returns:

- `isSelected`: bool

### IsValid

Returns:

- `isValid`: bool

### IsValidForSelectedFloorplan

Returns:

- `isValid`: bool

### Select

### SetUpdateCallback

SecretArguments=AllowedWhenUntainted

Arguments:

- `cb`: PinUpdatedCallback
