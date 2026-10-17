# CovenantSanctumUI

Namespace `C_CovenantSanctumUI`.

Environment=All, Predicates={}

## Functions

### C_CovenantSanctumUI.CanAccessReservoir

Returns:

- `canAccess`: bool

### C_CovenantSanctumUI.CanDepositAnima

Returns:

- `canDeposit`: bool

### C_CovenantSanctumUI.DepositAnima

### C_CovenantSanctumUI.EndInteraction

### C_CovenantSanctumUI.GetAnimaInfo

Returns:

- `currencyID`: number
- `maxDisplayableValue`: number

### C_CovenantSanctumUI.GetCurrentTalentTreeID

Returns:

- `currentTalentTreeID`: number?

### C_CovenantSanctumUI.GetFeatures

Returns:

- `features`: table<CovenantSanctumFeatureInfo>

### C_CovenantSanctumUI.GetRenownLevel

Returns:

- `level`: number

### C_CovenantSanctumUI.GetRenownLevels

SecretArguments=AllowedWhenUntainted

Arguments:

- `covenantID`: number

Returns:

- `levels`: table<CovenantSanctumRenownLevelInfo>

### C_CovenantSanctumUI.GetRenownRewardsForLevel

SecretArguments=AllowedWhenUntainted

Arguments:

- `covenantID`: number
- `renownLevel`: number

Returns:

- `rewards`: table<CovenantSanctumRenownRewardInfo>

### C_CovenantSanctumUI.GetSanctumType

Returns:

- `sanctumType`: GarrTalentFeatureSubtype?

### C_CovenantSanctumUI.GetSoulCurrencies

Returns:

- `currencyIDs`: table<number>

### C_CovenantSanctumUI.HasMaximumRenown

Returns:

- `hasMaxRenown`: bool

### C_CovenantSanctumUI.IsPlayerInRenownCatchUpMode

Returns:

- `isInCatchUpMode`: bool

### C_CovenantSanctumUI.IsWeeklyRenownCapped

Returns:

- `isWeeklyCapped`: bool

### C_CovenantSanctumUI.RequestCatchUpState

## Events

### COVENANT_RENOWN_CATCH_UP_STATE_UPDATE

SynchronousEvent=true

### COVENANT_SANCTUM_RENOWN_LEVEL_CHANGED

SynchronousEvent=true

Payload:

- `newRenownLevel`: number
- `oldRenownLevel`: number

## Tables

### CovenantSanctumFeatureInfo

Fields:

- `garrTalentTreeID`: number
- `featureType`: number
- `uiOrder`: number

### CovenantSanctumRenownLevelInfo

Fields:

- `level`: number
- `locked`: bool
- `isMilestone`: bool
- `isCapstone`: bool

### CovenantSanctumRenownRewardInfo

Fields:

- `uiOrder`: number
- `itemID`: number?
- `spellID`: number?
- `mountID`: number?
- `transmogID`: number?
- `transmogSetID`: number?
- `titleMaskID`: number?
- `garrFollowerID`: number?
- `transmogIllusionSourceID`: number?
- `icon`: fileID?
- `name`: cstring?
- `description`: cstring?
- `toastDescription`: cstring?
