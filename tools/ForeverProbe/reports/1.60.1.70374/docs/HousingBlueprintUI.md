# HousingBlueprintUI

Namespace `C_HousingBlueprint`.

Environment=All, Predicates={}

## Functions

### C_HousingBlueprint.CanExportRoom -- Returns true if the specific room is allowed to be exported

SecretArguments=AllowedWhenUntainted

Arguments:

- `roomGUID`: WOWGUID

Returns:

- `canExport`: bool

### C_HousingBlueprint.CanExportTypeFromCurrentLocation -- Returns true if the player's current location is a valid place to attempt to export a specific kind of blueprint

SecretArguments=AllowedWhenUntainted

Arguments:

- `type`: HousingBlueprintType

Returns:

- `locationValid`: bool

### C_HousingBlueprint.CanImportTypeFromCurrentLocation -- Returns true if the player's current location is a valid place to attempt to import a specific kind of blueprint

SecretArguments=AllowedWhenUntainted

Arguments:

- `type`: HousingBlueprintType

Returns:

- `locationValid`: bool

### C_HousingBlueprint.DeleteBlueprint -- Delete the specified owned blueprint; Listen for HousingBlueprintDeleteSuccess and HousingBlueprintDeleteFailure for results

SecretArguments=AllowedWhenUntainted

Arguments:

- `blueprintID`: BigUInteger

### C_HousingBlueprint.ExportBlueprint -- Saves out a new Blueprint of the specified type, using the specified name, if available, based on where the player is currently standing (see GetExportAvailability); Listen for HousingBlueprintExportSuccess and HousingBlueprintExportFailure for results

SecretArguments=AllowedWhenUntainted

Arguments:

- `type`: HousingBlueprintType
- `name`: cstring

### C_HousingBlueprint.ExportRoomBlueprint -- Saves out a new Blueprint of the specified room, using the specified name, if available (see GetExportAvailability); Listen for HousingBlueprintExportSuccess and HousingBlueprintExportFailure for results

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: cstring
- `roomGUID`: WOWGUID

### C_HousingBlueprint.GetBlueprintHyperlink

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `blueprintShareCode`: cstring

Returns:

- `hyperLink`: string

### C_HousingBlueprint.GetBlueprintTypeForCode -- Returns what type of Blueprint the specified code is for; Will return HousingBlueprintType.None if code is invalid; Does NOT check whether the shareCode actually matches up to a real valid Blueprint

SecretArguments=AllowedWhenUntainted

Arguments:

- `shareCode`: cstring

Returns:

- `type`: HousingBlueprintType

### C_HousingBlueprint.GetExportAvailability -- Returns success if the player can currently export Blueprints, or a specific error type (ex: invalid location or permissions)

Returns:

- `availability`: HousingResult

### C_HousingBlueprint.GetFeatureAvailability -- Returns success if Blueprints as a feature is currently enabled and available

Returns:

- `blueprintsAvailability`: HousingResult

### C_HousingBlueprint.GetImportAvailability -- Returns success if the player can currently import Blueprints, or a specific error type (ex: invalid location or permissions)

Returns:

- `availability`: HousingResult

### C_HousingBlueprint.ImportBlueprint -- Imports the specified blueprint, if available (see GetImportAvailability and CanImportTypeFromCurrentLocation); Listen for HousingBlueprintImportSuccess and HousingBlueprintImportFailure for results

SecretArguments=AllowedWhenUntainted

Arguments:

- `shareCode`: cstring

### C_HousingBlueprint.IsShareCodeValid -- Returns true if the string matches the valid expected format for a Blueprint Share Code; Does NOT check whether the shareCode actually matches up to a real valid Blueprint

SecretArguments=AllowedWhenUntainted

Arguments:

- `shareCode`: cstring

Returns:

- `isValid`: bool

### C_HousingBlueprint.RenameBlueprint -- Rename the specified owned blueprint to the specified name; Listen for HousingBlueprintRenameSuccess and HousingBlueprintRenameFailure for results

SecretArguments=AllowedWhenUntainted

Arguments:

- `blueprintID`: BigUInteger
- `newName`: cstring

### C_HousingBlueprint.RequestBlueprintCollection -- Request the full list of all of the player's Blueprints; This is async, either the HOUSING_BLUEPRINT_COLLECTION_RECEIVED or HOUSING_BLUEPRINT_COLLECTION_FAILURE event will eventually be fired as a result

### C_HousingBlueprint.RequestBlueprintContents -- Request the full contents of a specific Blueprint, in context of the current owned plot or house (if any); This is async as content info includes dynamic data from the server, either the HOUSING_BLUEPRINT_CONTENTS_RECEIVED or HOUSING_BLUEPRINT_CONTENTS_FAILURE event will eventually be fired as a result; Calling this again before a prior request has finished will cancel the prior request

SecretArguments=AllowedWhenUntainted

Arguments:

- `shareCode`: cstring

### C_HousingBlueprint.RequestBlueprintContentsForContext -- Request the full contents of a specific Blueprint, either in context of a specific owned House or plot, or explicitly outside of any specific context; Typically used to update missing requirement info from previously-retrieved contents; See RequestBlueprintContents for other notes

SecretArguments=AllowedWhenUntainted

Arguments:

- `shareCode`: cstring
- `optionalHouseGUID`: WOWGUID?

### C_HousingBlueprint.StartImportRoomBlueprint -- Start the process of importing a Room Blueprint. This will lead to Layout Mode being opened, so the player can then select an available door to attach the room to

SecretArguments=AllowedWhenUntainted

Arguments:

- `shareCode`: cstring

### C_HousingBlueprint.UpdateBlueprintStringFromInput

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `inputShareCode`: cstring

Returns:

- `updatedShareCode`: string

## Events

### HOUSING_BLUEPRINT_COLLECTION_FAILURE

SynchronousEvent=true

Payload:

- `result`: HousingResult

### HOUSING_BLUEPRINT_COLLECTION_RECEIVED

SynchronousEvent=true

Payload:

- `collection`: HousingBlueprintCollection

### HOUSING_BLUEPRINT_CONTENTS_FAILURE

SynchronousEvent=true

Payload:

- `blueprintShareCode`: string
- `result`: HousingResult

### HOUSING_BLUEPRINT_CONTENTS_RECEIVED

SynchronousEvent=true

Payload:

- `contentInfo`: HousingBlueprintContentInfo

### HOUSING_BLUEPRINT_DELETE_FAILURE

SynchronousEvent=true

Payload:

- `blueprintID`: BigUInteger
- `result`: HousingResult

### HOUSING_BLUEPRINT_DELETE_SUCCESS

SynchronousEvent=true

Payload:

- `blueprintID`: BigUInteger

### HOUSING_BLUEPRINT_EXPORT_FAILURE

SynchronousEvent=true

Payload:

- `result`: HousingResult

### HOUSING_BLUEPRINT_EXPORT_SUCCESS

SynchronousEvent=true

Payload:

- `blueprintShareCode`: string

### HOUSING_BLUEPRINT_IMPORT_FAILURE

SynchronousEvent=true

Payload:

- `result`: HousingResult

### HOUSING_BLUEPRINT_IMPORT_STARTED

SynchronousEvent=true

### HOUSING_BLUEPRINT_IMPORT_SUCCESS

SynchronousEvent=true

### HOUSING_BLUEPRINT_RENAME_FAILURE

SynchronousEvent=true

Payload:

- `blueprintID`: BigUInteger
- `result`: HousingResult

### HOUSING_BLUEPRINT_RENAME_SUCCESS

SynchronousEvent=true

Payload:

- `blueprintID`: BigUInteger
- `name`: string

### HOUSING_BLUEPRINTS_AVAILABILITY_CHANGED

SynchronousEvent=true
