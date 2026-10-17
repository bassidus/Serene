# SpellDiminishUI

Namespace `C_SpellDiminish`.

Environment=All, Predicates={1={FailureMode=ReturnNothing, Name=RequiresSpellDiminishUI, Type=Precondition}}

## Functions

### C_SpellDiminish.GetAllSpellDiminishCategories

RequiresSpellDiminishUI=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `ruleset`: SpellDiminishRuleset?

Returns:

- `categories`: table<SpellDiminishCategoryInfo>

### C_SpellDiminish.GetSpellDiminishCategoryInfo

RequiresSpellDiminishUI=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `category`: SpellDiminishCategory

Returns:

- `categoryInfo`: SpellDiminishCategoryInfo?

### C_SpellDiminish.IsSystemSupported

Returns:

- `isSystemSupported`: bool

### C_SpellDiminish.ShouldTrackSpellDiminishCategory

RequiresSpellDiminishUI=true, SecretArguments=AllowedWhenUntainted, SecretReturns=true

Arguments:

- `category`: SpellDiminishCategory
- `ruleset`: SpellDiminishRuleset

Returns:

- `isTracked`: bool

## Events

### UNIT_SPELL_DIMINISH_CATEGORY_STATE_UPDATED

SecretPayloads=true, SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant
- `trackerInfo`: SpellDiminishTrackerInfo

## Tables

### SpellDiminishCategoryInfo

Fields:

- `category`: SpellDiminishCategory
- `name`: cstring
- `icon`: fileID?

### SpellDiminishTrackerInfo

Fields:

- `category`: SpellDiminishCategory
- `startTime`: number
- `duration`: number
- `showCountdown`: bool
- `isImmune`: bool
