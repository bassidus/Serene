# GameRules

Namespace `C_GameRules`.

Environment=All, Predicates={}

## Functions

### C_GameRules.AccountHasSDEnabled

Returns:

- `isSDEnabled`: bool

### C_GameRules.AutoConnectToGameModeRealm

SecretArguments=AllowedWhenUntainted

Arguments:

- `gameModeRecordID`: number

### C_GameRules.DoesGameModeHavePromo

SecretArguments=AllowedWhenUntainted

Arguments:

- `gameModeRecordID`: number

Returns:

- `hasPromo`: bool

### C_GameRules.GetActiveGameMode

Returns:

- `gameMode`: GameMode

### C_GameRules.GetCurrentEventRealmQueues

Returns:

- `eventRealmQueues`: EventRealmQueues

### C_GameRules.GetCurrentGameModeDisplayInfo

Returns:

- `info`: GameModeDisplayInfo?

### C_GameRules.GetCurrentGameModeRecordID

Returns:

- `gameModeRecordID`: number

### C_GameRules.GetDisplayedGameModeRecordIDAtIndex

SecretArguments=AllowedWhenUntainted

Arguments:

- `displayIndex`: luaIndex

Returns:

- `gameModeRecordID`: number

### C_GameRules.GetForeverExperiencePreset

Returns:

- `preset`: ForeverExperiencePreset?

### C_GameRules.GetGameModeDisplayInfoByRecordID

SecretArguments=AllowedWhenUntainted

Arguments:

- `gameModeRecordID`: number

Returns:

- `info`: GameModeDisplayInfo?

### C_GameRules.GetGameModeGlueScreenName

Returns:

- `screenName`: cstring

### C_GameRules.GetGameModePromoGlobalString

SecretArguments=AllowedWhenUntainted

Arguments:

- `gameModeRecordID`: number

Returns:

- `promoGlobalString`: cstring

### C_GameRules.GetGameRuleAsFloat -- Returns the numeric value specified in the Game Rule, multiplied by 0.1 for every decimal place requested

SecretArguments=AllowedWhenUntainted

Arguments:

- `gameRule`: GameRule
- `decimalPlaces`: number [default=0]

Returns:

- `value`: number

### C_GameRules.GetGameRuleAsFrameStrata -- Returns the value specified in the Game Rule converted to a frame strata

SecretArguments=AllowedWhenUntainted

Arguments:

- `gameRule`: GameRule

Returns:

- `frameStrata`: cstring

### C_GameRules.GetNumDisplayedGameModes

Returns:

- `numDisplayedGameModes`: number

### C_GameRules.IsCharacterlessLoginActive

Returns:

- `active`: bool

### C_GameRules.IsClassAllowedForGameMode

SecretArguments=AllowedWhenUntainted

Arguments:

- `classID`: number

Returns:

- `valid`: bool

### C_GameRules.IsGameModeEnabled

SecretArguments=AllowedWhenUntainted

Arguments:

- `gameModeRecordID`: number

Returns:

- `enabled`: bool

### C_GameRules.IsGameRuleActive

SecretArguments=AllowedWhenUntainted

Arguments:

- `gameRule`: GameRule

Returns:

- `isActive`: bool

### C_GameRules.IsHardcoreActive

Returns:

- `active`: bool

### C_GameRules.IsMultiActionBarVisibilityForced

Returns:

- `valid`: bool

### C_GameRules.IsPersonalResourceDisplayEnabled -- Checks the game rule as well as nameplateShowSelf

Returns:

- `isPersonalResourceDisplayEnabled`: bool

### C_GameRules.IsPlunderstorm

Returns:

- `active`: bool

### C_GameRules.IsSDHDToggleEnabled

Returns:

- `isEnabled`: bool

### C_GameRules.IsSelfFoundAllowed

Returns:

- `active`: bool

### C_GameRules.IsStandard

Returns:

- `active`: bool

### C_GameRules.IsWoWHack

Returns:

- `active`: bool

### C_GameRules.SetForeverExperiencePreset

SecretArguments=AllowedWhenUntainted

Arguments:

- `preset`: ForeverExperiencePreset

### C_GameRules.SetSDHDToggleValue

SecretArguments=AllowedWhenUntainted

Arguments:

- `setToSD`: bool

## Events

### ACTIVE_GAME_MODE_UPDATED

SynchronousEvent=true

Payload:

- `gameMode`: GameMode

### AVAILABLE_GAME_MODES_UPDATED

SynchronousEvent=true

### EVENT_REALM_QUEUES_UPDATED

SynchronousEvent=true

Payload:

- `eventRealmQueues`: EventRealmQueues

### GAME_MODE_DISPLAY_INFO_UPDATED

SynchronousEvent=true

### GAME_MODE_DISPLAY_MODE_TOGGLE_DISABLED

SynchronousEvent=true

Payload:

- `gameModeRecordID`: number
- `disabled`: bool

### GAME_RULES_CHANGED

SynchronousEvent=true

## Tables

### ForeverExperiencePreset

MaxValue=1, MinValue=0, NumValues=2

Fields:

- `Classic`: ForeverExperiencePreset [= 0]
- `Modern`: ForeverExperiencePreset [= 1]

### GameModeDisplayInfo

Fields:

- `logo`: fileID
- `logoHeight`: number
- `logoVerticalOffset`: number
- `logoShrunkenHeight`: number
- `logoUsesDarkBackdrop`: bool
- `characterCreateExtraHeight`: number
- `characterCreateOuterBorder`: fileID
