# ProfessionSpecUI

Namespace `C_ProfSpecs`.

Environment=All, Predicates={}

## Functions

### C_ProfSpecs.CanRefundPath

SecretArguments=AllowedWhenUntainted

Arguments:

- `pathID`: number
- `configID`: number

Returns:

- `canRefund`: bool

### C_ProfSpecs.CanUnlockTab

SecretArguments=AllowedWhenUntainted

Arguments:

- `tabTreeID`: number
- `configID`: number

Returns:

- `canUnlock`: bool

### C_ProfSpecs.GetChildrenForPath

SecretArguments=AllowedWhenUntainted

Arguments:

- `pathID`: number

Returns:

- `childIDs`: table<number>

### C_ProfSpecs.GetConfigIDForSkillLine

SecretArguments=AllowedWhenUntainted

Arguments:

- `skillLineID`: number

Returns:

- `configID`: number

### C_ProfSpecs.GetCurrencyInfoForSkillLine

SecretArguments=AllowedWhenUntainted

Arguments:

- `skillLineID`: number

Returns:

- `info`: SpecializationCurrencyInfo

### C_ProfSpecs.GetDefaultSpecSkillLine

Returns:

- `defaultSpecSkillLine`: number?

### C_ProfSpecs.GetDescriptionForPath

SecretArguments=AllowedWhenUntainted

Arguments:

- `pathID`: number

Returns:

- `description`: string

### C_ProfSpecs.GetDescriptionForPerk

SecretArguments=AllowedWhenUntainted

Arguments:

- `perkID`: number

Returns:

- `description`: string

### C_ProfSpecs.GetEntryIDForPerk

SecretArguments=AllowedWhenUntainted

Arguments:

- `perkID`: number

Returns:

- `entryID`: number

### C_ProfSpecs.GetNewSpecReminderProfName

Returns:

- `profName`: cstring?

### C_ProfSpecs.GetPerksForPath

SecretArguments=AllowedWhenUntainted

Arguments:

- `pathID`: number

Returns:

- `perkInfos`: table<SpecPerkInfo>

### C_ProfSpecs.GetRootPathForTab

SecretArguments=AllowedWhenUntainted

Arguments:

- `tabTreeID`: number

Returns:

- `rootPathID`: number?

### C_ProfSpecs.GetSourceTextForPath

SecretArguments=AllowedWhenUntainted

Arguments:

- `pathID`: number
- `configID`: number

Returns:

- `sourceText`: cstring

### C_ProfSpecs.GetSpecTabIDsForSkillLine

SecretArguments=AllowedWhenUntainted

Arguments:

- `skillLineID`: number

Returns:

- `specTabIDs`: table<number>

### C_ProfSpecs.GetSpecTabInfo

Returns:

- `specTabInfo`: SpecializationTabInfo

### C_ProfSpecs.GetSpendCurrencyForPath

SecretArguments=AllowedWhenUntainted

Arguments:

- `pathID`: number

Returns:

- `currencyID`: number?

### C_ProfSpecs.GetSpendEntryForPath

SecretArguments=AllowedWhenUntainted

Arguments:

- `pathID`: number

Returns:

- `entryID`: number

### C_ProfSpecs.GetStateForPath

SecretArguments=AllowedWhenUntainted

Arguments:

- `pathID`: number
- `configID`: number

Returns:

- `state`: ProfessionsSpecPathState

### C_ProfSpecs.GetStateForPerk

SecretArguments=AllowedWhenUntainted

Arguments:

- `perkID`: number
- `configID`: number

Returns:

- `state`: ProfessionsSpecPerkState

### C_ProfSpecs.GetStateForTab

SecretArguments=AllowedWhenUntainted

Arguments:

- `tabTreeID`: number
- `configID`: number

Returns:

- `tabInfo`: ProfessionsSpecTabState

### C_ProfSpecs.GetTabInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `tabTreeID`: number

Returns:

- `tabInfo`: ProfTabInfo?

### C_ProfSpecs.GetUnlockEntryForPath

SecretArguments=AllowedWhenUntainted

Arguments:

- `pathID`: number

Returns:

- `entryID`: number

### C_ProfSpecs.GetUnlockRankForPerk

SecretArguments=AllowedWhenUntainted

Arguments:

- `perkID`: number

Returns:

- `unlockRank`: number?

### C_ProfSpecs.ShouldShowPointsReminder

Returns:

- `showReminder`: bool

### C_ProfSpecs.ShouldShowPointsReminderForSkillLine

SecretArguments=AllowedWhenUntainted

Arguments:

- `skillLineID`: number

Returns:

- `showReminder`: bool

### C_ProfSpecs.ShouldShowSpecTab

Returns:

- `showSpecTab`: bool

### C_ProfSpecs.SkillLineHasSpecialization

SecretArguments=AllowedWhenUntainted

Arguments:

- `skillLineID`: number

Returns:

- `hasSpecialization`: bool

## Events

### SKILL_LINE_SPECS_RANKS_CHANGED

UniqueEvent=true

### SKILL_LINE_SPECS_UNLOCKED

UniqueEvent=true

Payload:

- `skillLineID`: number
- `tradeSkillID`: number
