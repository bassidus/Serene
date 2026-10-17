# HouseEditorUI

Namespace `C_HouseEditor`.

Environment=All, Predicates={}

## Functions

### C_HouseEditor.ActivateHouseEditorMode -- Attempts switch the House Editor to a specific House Editor mode

SecretArguments=AllowedWhenUntainted

Arguments:

- `editMode`: HouseEditorMode

Returns:

- `result`: HousingResult -- The initial result of the attempt to activate the mode; If Success, mode is either already active, or we've succesfully started making required requests to server; Listen for MODE_CHANGED or MODE_CHANGE_FAILURE events for ultimate end result after server calls

### C_HouseEditor.EnterHouseEditor -- Attempts to open the House Editor to the default House Editor mode

Returns:

- `result`: HousingResult -- The initial result of the attempt to open the Editor; If Success, Editor is either already active, or we've succesfully started making required requests to server; Listen for MODE_CHANGED or MODE_CHANGE_FAILURE events for ultimate end result after server calls

### C_HouseEditor.GetActiveHouseEditorMode

Returns:

- `editMode`: HouseEditorMode

### C_HouseEditor.GetHouseEditorAvailability -- Returns the availability state of the House Editor overall

Returns:

- `result`: HousingResult

### C_HouseEditor.GetHouseEditorModeAvailability -- Returns the availability of a specific House Editor mode

SecretArguments=AllowedWhenUntainted

Arguments:

- `editMode`: HouseEditorMode

Returns:

- `result`: HousingResult

### C_HouseEditor.GetHouseEditorPlayerType

Returns:

- `playerType`: HouseEditorPlayerType

### C_HouseEditor.IsHouseEditorActive -- Returns whether the House Editor is active, in any mode

Returns:

- `isEditorActive`: bool

### C_HouseEditor.IsHouseEditorModeActive -- Returns whether the specific House Editor mode is active

SecretArguments=AllowedWhenUntainted

Arguments:

- `editMode`: HouseEditorMode

Returns:

- `isModeActive`: bool

### C_HouseEditor.IsHouseEditorStatusAvailable -- Returns true if the HouseEditor currently able process mode availability and switching; May be false if not in a house or plot, or while waiting to get house settings back from the server

Returns:

- `editorStatusAvailable`: bool

### C_HouseEditor.LeaveHouseEditor

## Events

### HOUSE_EDITOR_AVAILABILITY_CHANGED

SynchronousEvent=true

### HOUSE_EDITOR_MODE_CHANGE_FAILURE

SynchronousEvent=true

Payload:

- `result`: HousingResult

### HOUSE_EDITOR_MODE_CHANGED

SynchronousEvent=true

Payload:

- `currentEditMode`: HouseEditorMode

## Tables

### HouseEditorPlayerType

MaxValue=2, MinValue=0, NumValues=3

Fields:

- `None`: HouseEditorPlayerType [= 0] -- Not in a house or plot, or at one without even sufficient visiting permissions
- `Owner`: HouseEditorPlayerType [= 1] -- Owner of the current house or plot
- `Visitor`: HouseEditorPlayerType [= 2] -- A visitor of the current house or plot
