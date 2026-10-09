# Sound

Namespace `C_Sound`.

Environment=All, Predicates={}

## Functions

### C_Sound.GetSoundScaledVolume

SecretArguments=AllowedWhenUntainted

Arguments:

- `soundHandle`: number

Returns:

- `scaledVolume`: number

### C_Sound.IsPlaying

SecretArguments=AllowedWhenUntainted

Arguments:

- `soundHandle`: number

Returns:

- `isPlaying`: bool

### C_Sound.PlayItemSound

SecretArguments=AllowedWhenUntainted

Arguments:

- `soundType`: ItemSoundType
- `itemLocation`: ItemLocation (ItemLocationMixin)

### C_Sound.PlaySound

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `soundKitID`: number
- `uiSoundSubType`: UISoundSubType [default=g_defaultSI3UISoundSubTypeForLua]
- `forceNoDuplicates`: bool [default=false]
- `runFinishCallback`: bool [default=false]
- `overridePriority`: number?
- `volumeOverride`: number?

Returns:

- `success`: bool
- `soundHandle`: SoundHandle

### C_Sound.PlaySoundWithOptions

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `params`: PlaySoundParams

Returns:

- `success`: bool
- `soundHandle`: SoundHandle

### C_Sound.PlayVocalErrorSound

SecretArguments=AllowedWhenUntainted

Arguments:

- `vocalErrorSoundID`: Vocalerrorsounds

## Events

### SOUND_DEVICE_UPDATE

SynchronousEvent=true

### SOUNDKIT_FINISHED

SynchronousEvent=true

Payload:

- `soundHandle`: number

## Tables

### PlaySoundParams

Fields:

- `soundKitID`: number
- `uiSoundSubType`: UISoundSubType [default=g_defaultSI3UISoundSubTypeForLua]
- `forceNoDuplicates`: bool [default=false]
- `runFinishCallback`: bool [default=false]
- `overridePriority`: number?
- `volumeOverride`: number?

### PlaySoundResult

Fields:

- `success`: bool
- `soundHandle`: SoundHandle
