# MirrorTimer

Environment=All, Predicates={}

## Functions

### GetMirrorTimerInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `timerIndex`: luaIndex

Returns:

- `name`: cstring
- `startValue`: number
- `maxValue`: number
- `scale`: number
- `paused`: number
- `label`: cstring
- `spellID`: number

### GetMirrorTimerProgress

SecretArguments=AllowedWhenUntainted

Arguments:

- `timerName`: cstring

Returns:

- `progress`: number?

## Tables

### MirrorTimerInfo

Fields:

- `name`: cstring
- `startValue`: number
- `maxValue`: number
- `scale`: number
- `paused`: number
- `label`: cstring
- `spellID`: number
