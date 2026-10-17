# CombatAudioAlert

Namespace `C_CombatAudioAlert`.

Environment=All, Predicates={}

## Functions

### C_CombatAudioAlert.AddToKnownTargetingList

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `added`: bool [SecretValue=true]

### C_CombatAudioAlert.GetCategoryVoice

SecretArguments=AllowedWhenUntainted

Arguments:

- `category`: CombatAudioAlertCategory

Returns:

- `voice`: number

### C_CombatAudioAlert.GetCategoryVolume

SecretArguments=AllowedWhenUntainted

Arguments:

- `category`: CombatAudioAlertCategory

Returns:

- `volume`: number

### C_CombatAudioAlert.GetFormatSetting

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: CombatAudioAlertUnit
- `alertType`: CombatAudioAlertType

Returns:

- `formatVal`: number

### C_CombatAudioAlert.GetSpeakerSpeed

Returns:

- `speed`: number

### C_CombatAudioAlert.GetSpecSetting

SecretArguments=AllowedWhenUntainted

Arguments:

- `setting`: CombatAudioAlertSpecSetting

Returns:

- `value`: number

### C_CombatAudioAlert.GetThrottle

SecretArguments=AllowedWhenUntainted

Arguments:

- `throttleType`: CombatAudioAlertThrottle

Returns:

- `throttle`: number

### C_CombatAudioAlert.IsEnabled

Returns:

- `isEnabled`: bool

### C_CombatAudioAlert.RemoveFromKnownTargetingList

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `removed`: bool [SecretValue=true]

### C_CombatAudioAlert.SetCategoryVoice

SecretArguments=AllowedWhenUntainted

Arguments:

- `category`: CombatAudioAlertCategory
- `newVal`: number

Returns:

- `success`: bool

### C_CombatAudioAlert.SetCategoryVolume

SecretArguments=AllowedWhenUntainted

Arguments:

- `category`: CombatAudioAlertCategory
- `newVal`: number

Returns:

- `success`: bool

### C_CombatAudioAlert.SetFormatSetting

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: CombatAudioAlertUnit
- `alertType`: CombatAudioAlertType
- `newVal`: number

Returns:

- `success`: bool

### C_CombatAudioAlert.SetSpeakerSpeed

SecretArguments=AllowedWhenUntainted

Arguments:

- `newVal`: number

Returns:

- `success`: bool

### C_CombatAudioAlert.SetSpecSetting

SecretArguments=AllowedWhenUntainted

Arguments:

- `setting`: CombatAudioAlertSpecSetting
- `newVal`: number

Returns:

- `success`: bool

### C_CombatAudioAlert.SetThrottle

SecretArguments=AllowedWhenUntainted

Arguments:

- `throttleType`: CombatAudioAlertThrottle
- `newVal`: number

Returns:

- `success`: bool

### C_CombatAudioAlert.SpeakText

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `text`: string
- `category`: CombatAudioAlertCategory
- `allowOverlap`: bool [default=true]

Returns:

- `utteranceID`: number
