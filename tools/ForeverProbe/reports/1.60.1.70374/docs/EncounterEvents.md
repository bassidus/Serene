# EncounterEvents

Namespace `C_EncounterEvents`.

Environment=All, Predicates={}

## Functions

### C_EncounterEvents.GetEventColor -- Returns any custom color override applied for an encounter event.

SecretArguments=AllowedWhenUntainted

Arguments:

- `encounterEventID`: number
- `trigger`: EncounterEventColorTrigger

Returns:

- `color`: colorRGBA (ColorMixin)?

### C_EncounterEvents.GetEventInfo -- Returns information about an encounter event.

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `encounterEventID`: number

Returns:

- `encounterEventInfo`: EncounterEventInfo

### C_EncounterEvents.GetEventList -- Returns a list of all encounter event IDs.

Returns:

- `encounterEventIDs`: table<number>

### C_EncounterEvents.GetEventSound -- Returns information on a custom sound file to be played when an encounter event trigger occurs.

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `encounterEventID`: number
- `trigger`: EncounterEventSoundTrigger

Returns:

- `sound`: EncounterEventSoundInfo

### C_EncounterEvents.HasEventInfo -- Returns true if an encounter event record with a specified ID exists.

SecretArguments=AllowedWhenUntainted

Arguments:

- `encounterEventID`: number

Returns:

- `exists`: bool

### C_EncounterEvents.PlayEventSound -- Plays any registered custom sound file for a given encounter event trigger.

SecretArguments=AllowedWhenUntainted

Arguments:

- `encounterEventID`: number
- `trigger`: EncounterEventSoundTrigger

Returns:

- `handle`: SoundHandle

### C_EncounterEvents.SetEventColor -- Sets a custom color override for an encounter event. This can be used to colorize text or timer bars individually.

SecretArguments=NotAllowed

Arguments:

- `encounterEventID`: number
- `trigger`: EncounterEventColorTrigger
- `color`: colorRGBA (ColorMixin)?

### C_EncounterEvents.SetEventSound -- Sets a custom sound file to be played when an encounter event trigger occurs.

SecretArguments=NotAllowed

Arguments:

- `encounterEventID`: number
- `trigger`: EncounterEventSoundTrigger
- `sound`: EncounterEventSoundInfo?
