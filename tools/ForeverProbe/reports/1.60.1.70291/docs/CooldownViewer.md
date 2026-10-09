# CooldownViewer

Namespace `C_CooldownViewer`.

Environment=All, Predicates={}

## Functions

### C_CooldownViewer.GetCooldownViewerCategorySet

SecretArguments=AllowedWhenUntainted

Arguments:

- `category`: CooldownViewerCategory
- `allowUnlearned`: bool [default=false]

Returns:

- `cooldownIDs`: table<number>

### C_CooldownViewer.GetCooldownViewerCooldownInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `cooldownID`: number

Returns:

- `cooldownInfo`: CooldownViewerCooldown

### C_CooldownViewer.GetGroupBuffItems

Returns:

- `groupBuffItems`: table<GroupBuffItem>

### C_CooldownViewer.GetLayoutData

Returns:

- `data`: cstring

### C_CooldownViewer.GetValidAlertTypes

SecretArguments=AllowedWhenUntainted

Arguments:

- `cooldownID`: number

Returns:

- `validAlertTypes`: table<CooldownViewerAlertEventType>

### C_CooldownViewer.IsCooldownViewerAvailable

Returns:

- `isAvailable`: bool
- `failureReason`: string

### C_CooldownViewer.SetLayoutData

SecretArguments=AllowedWhenUntainted

Arguments:

- `data`: cstring

## Events

### COOLDOWN_VIEWER_DATA_LOADED

SynchronousEvent=true

### COOLDOWN_VIEWER_SPELL_OVERRIDE_UPDATED

SynchronousEvent=true

Payload:

- `baseSpellID`: number -- The base spell that is either being overridden or losing its override spell.
- `overrideSpellID`: number? -- The spell overriding the base spell. A nil value indicates that the override spell is being removed from the base spell.

### COOLDOWN_VIEWER_TABLE_HOTFIXED

SynchronousEvent=true

## Tables

### CooldownViewerCooldown

Fields:

- `cooldownID`: number
- `spellID`: number?
- `spellCategoryID`: number?
- `overrideSpellID`: number?
- `overrideTooltipSpellID`: number?
- `equipSlot`: luaIndex?
- `buffSlot`: luaIndex?
- `linkedSpellIDs`: table<number>
- `selfAura`: bool
- `hasAura`: bool
- `charges`: bool
- `isKnown`: bool
- `isInvisible`: bool
- `flags`: CooldownSetSpellFlags
- `category`: CooldownViewerCategory

### GroupBuffItem

Fields:

- `spellID`: number
- `name`: cstring
- `iconID`: fileID
- `flags`: GroupBuffItemFlags
- `isKnown`: bool
