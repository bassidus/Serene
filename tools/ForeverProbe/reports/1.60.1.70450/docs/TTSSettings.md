# TTSSettings

Namespace `C_TTSSettings`.

Environment=All, Predicates={}

## Functions

### C_TTSSettings.GetChannelEnabled

SecretArguments=AllowedWhenUntainted

Arguments:

- `channelInfo`: ChatChannelInfo

Returns:

- `enabled`: bool

### C_TTSSettings.GetCharacterSettingsSaved

Returns:

- `settingsBeenSaved`: bool

### C_TTSSettings.GetChatTypeEnabled

SecretArguments=AllowedWhenUntainted

Arguments:

- `chatName`: cstring

Returns:

- `enabled`: bool

### C_TTSSettings.GetSetting

SecretArguments=AllowedWhenUntainted

Arguments:

- `setting`: TtsBoolSetting

Returns:

- `enabled`: bool

### C_TTSSettings.GetSpeechRate

Returns:

- `rate`: number

### C_TTSSettings.GetSpeechVolume

Returns:

- `volume`: number

### C_TTSSettings.GetVoiceOptionID

SecretArguments=AllowedWhenUntainted

Arguments:

- `voiceType`: TtsVoiceType

Returns:

- `voiceID`: number

### C_TTSSettings.GetVoiceOptionName

SecretArguments=AllowedWhenUntainted

Arguments:

- `voiceType`: TtsVoiceType

Returns:

- `voiceName`: cstring

### C_TTSSettings.MarkCharacterSettingsSaved

### C_TTSSettings.SetChannelEnabled

SecretArguments=AllowedWhenUntainted

Arguments:

- `channelInfo`: ChatChannelInfo
- `newVal`: bool [default=false]

### C_TTSSettings.SetChannelKeyEnabled

SecretArguments=AllowedWhenUntainted

Arguments:

- `channelKey`: string
- `newVal`: bool [default=false]

### C_TTSSettings.SetChatTypeEnabled

SecretArguments=AllowedWhenUntainted

Arguments:

- `chatName`: cstring
- `newVal`: bool [default=false]

### C_TTSSettings.SetDefaultSettings

### C_TTSSettings.SetSetting

SecretArguments=AllowedWhenUntainted

Arguments:

- `setting`: TtsBoolSetting
- `newVal`: bool [default=false]

### C_TTSSettings.SetSpeechRate

SecretArguments=AllowedWhenUntainted

Arguments:

- `newVal`: number

### C_TTSSettings.SetSpeechVolume

SecretArguments=AllowedWhenUntainted

Arguments:

- `newVal`: number

### C_TTSSettings.SetVoiceOption

SecretArguments=AllowedWhenUntainted

Arguments:

- `voiceType`: TtsVoiceType
- `voiceID`: number

### C_TTSSettings.SetVoiceOptionName

SecretArguments=AllowedWhenUntainted

Arguments:

- `voiceType`: TtsVoiceType
- `voiceName`: string

### C_TTSSettings.ShouldOverrideMessage

SecretArguments=AllowedWhenUntainted

Arguments:

- `language`: number
- `messageText`: string

Returns:

- `overrideMessage`: bool
