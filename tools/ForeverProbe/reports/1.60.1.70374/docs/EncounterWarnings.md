# EncounterWarnings

Namespace `C_EncounterWarnings`.

Environment=All, Predicates={}

## Functions

### C_EncounterWarnings.GetColorForSeverity

SecretArguments=AllowedWhenUntainted

Arguments:

- `severity`: EncounterEventSeverity

Returns:

- `color`: colorRGBA (ColorMixin)

### C_EncounterWarnings.GetEditModeWarningInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `severity`: EncounterEventSeverity

Returns:

- `warningInfo`: EncounterWarningInfo

### C_EncounterWarnings.GetPlayCustomSoundsWhenHidden -- Returns true if custom sound alerts are allowed to play for hidden warning messages.

Returns:

- `play`: bool

### C_EncounterWarnings.GetSoundKitForSeverity

SecretArguments=AllowedWhenUntainted

Arguments:

- `severity`: EncounterEventSeverity

Returns:

- `soundKitID`: number

### C_EncounterWarnings.GetWarningsShown -- Returns true if text messages for encounter events are allowed to be shown.

Returns:

- `shown`: bool

### C_EncounterWarnings.IsFeatureAvailable

Returns:

- `isAvailable`: bool

### C_EncounterWarnings.IsFeatureEnabled

Returns:

- `isAvailableAndEnabled`: bool

### C_EncounterWarnings.PlaySound

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `severity`: EncounterEventSeverity

Returns:

- `soundHandle`: number

### C_EncounterWarnings.SetPlayCustomSoundsWhenHidden -- Controls whether custom sound alerts for encounter events are allowed to play for warning messages that are hidden.

SecretArguments=NotAllowed

Arguments:

- `play`: bool -- If true, allow playing custom sound alerts. Note that sound alerts will not be played if the encounter warnings feature has been disabled.

### C_EncounterWarnings.SetWarningsShown -- Controls whether text messages for encounter events are allowed to be shown.

SecretArguments=NotAllowed

Arguments:

- `shown`: bool -- If false, hides all warning messages in the default UI.

## Events

### ENCOUNTER_WARNING

SynchronousEvent=true

Payload:

- `encounterWarningInfo`: EncounterWarningInfo

## Tables

### EncounterWarningInfo

Fields:

- `text`: cstring [SecretValue=true]
- `casterGUID`: WOWGUID [SecretValue=true]
- `casterName`: cstring [SecretValue=true]
- `targetGUID`: WOWGUID [SecretValue=true]
- `targetName`: cstring [SecretValue=true]
- `iconFileID`: number [SecretValue=true]
- `tooltipSpellID`: number [SecretValue=true]
- `isDeadly`: bool [SecretValue=true]
- `color`: colorRGBA (ColorMixin) [SecretValue=true]
- `duration`: Seconds
- `severity`: EncounterEventSeverity
- `shouldPlaySound`: bool
- `shouldShowChatMessage`: bool
- `shouldShowWarning`: bool
