# UnitAuras

Namespace `C_UnitAuras`.

Environment=All, Predicates={}

## Functions

### C_UnitAuras.AddAuraSound -- Registers a sound for an aura event. The sound is stopped after five seconds of playback. The throttleSeconds value must be between 0 and 5 seconds, inclusive.

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `trigger`: UnitAuraSoundTrigger
- `sound`: UnitAuraSoundInfo

Returns:

- `auraSoundID`: number?

### C_UnitAuras.AddBlockedAura

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitTokenRestrictedForAddOns
- `auraInstanceID`: number

### C_UnitAuras.AddPrivateAuraAnchor

SecretArguments=AllowedWhenUntainted

Arguments:

- `args`: AddPrivateAuraAnchorArgs

Returns:

- `anchorID`: number?

### C_UnitAuras.AuraIsBigDefensive

SecretArguments=AllowedWhenTainted

Arguments:

- `spellID`: SpellIdentifier

Returns:

- `isBigDefensive`: bool

### C_UnitAuras.AuraIsPrivate

SecretArguments=AllowedWhenTainted

Arguments:

- `spellID`: SpellIdentifier

Returns:

- `isPrivate`: bool

### C_UnitAuras.CancelAuraByInstanceID

HasRestrictions=true, RequiresUnitAuraAccess=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitTokenRestrictedForAddOns [NeverSecret=true]
- `auraInstanceID`: number

### C_UnitAuras.ClearBlockedAuras

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitTokenRestrictedForAddOns

### C_UnitAuras.DoesAuraHaveExpirationTime -- Returns true if an aura instance will expire after a certain amount of time.

RequiresUnitAuraAccess=true, RequiresValidUnitAuraInstance=true, SecretArguments=AllowedWhenUntainted, SecretWhenUnitAuraRestricted=true

Arguments:

- `auraInstanceUnit`: UnitToken
- `auraInstanceID`: number

Returns:

- `hasExpirationTime`: bool

### C_UnitAuras.GetAuraApplicationDisplayCount -- Formats a string for displaying the number of applications an aura has present.

RequiresUnitAuraAccess=true, RequiresValidUnitAuraInstance=true, SecretArguments=AllowedWhenUntainted, SecretWhenUnitAuraRestricted=true

Arguments:

- `auraInstanceUnit`: UnitToken
- `auraInstanceID`: number
- `minDisplayCount`: number [default=2, NeverSecret=true] -- Minimum number of applications required; if the application count is below this figure an empty string will be returned.
- `maxDisplayCount`: number? [NeverSecret=true] -- Maximum number of applications allowed; if the application count is above this figure then the string '*' will be returned.

Returns:

- `count`: string

### C_UnitAuras.GetAuraBaseDuration -- Returns the base duration of the given spell (or aura). Takes an optional spellID to use as the new duration if that cannot be derived from the aura, if that value isn't supplied the aura's spellID will be used

RequiresUnitAuraAccess=true, RequiresValidUnitAuraInstance=true, SecretArguments=AllowedWhenTainted, SecretWhenUnitAuraRestricted=true

Arguments:

- `auraInstanceUnit`: UnitToken
- `auraInstanceID`: number
- `spellID`: SpellIdentifier?

Returns:

- `newDuration`: number?

### C_UnitAuras.GetAuraCasterGUID

RequiresUnitAuraAccess=true, RequiresValidUnitAuraInstance=true, SecretArguments=AllowedWhenTainted, SecretWhenUnitAuraRestricted=true

Arguments:

- `auraInstanceUnit`: UnitToken
- `auraInstanceID`: number

Returns:

- `casterGUID`: WOWGUID?

### C_UnitAuras.GetAuraDataByAuraInstanceID

RequiresUnitAuraAccess=true, SecretArguments=AllowedWhenUntainted, SecretWhenUnitAuraRestricted=true

Arguments:

- `unit`: UnitTokenRestrictedForAddOns [NeverSecret=true]
- `auraInstanceID`: number

Returns:

- `aura`: AuraData?

### C_UnitAuras.GetAuraDataByIndex

RequiresUnitAuraAccess=true, SecretArguments=AllowedWhenUntainted, SecretWhenUnitAuraRestricted=true

Arguments:

- `unit`: UnitTokenRestrictedForAddOns
- `index`: luaIndex
- `filter`: AuraFilters?

Returns:

- `aura`: AuraData?

### C_UnitAuras.GetAuraDataBySlot

RequiresUnitAuraAccess=true, SecretArguments=AllowedWhenUntainted, SecretWhenUnitAuraRestricted=true

Arguments:

- `unit`: UnitTokenRestrictedForAddOns [NeverSecret=true]
- `slot`: number

Returns:

- `aura`: AuraData?

### C_UnitAuras.GetAuraDataBySpellName

RequiresNonSecretAura=true, SecretArguments=AllowedWhenUntainted, SecretWhenUnitAuraRestricted=true

Arguments:

- `unit`: UnitTokenRestrictedForAddOns [NeverSecret=true]
- `spellName`: cstring
- `filter`: AuraFilters?

Returns:

- `aura`: AuraData?

### C_UnitAuras.GetAuraDispelTypeColor -- Queries the dispel type associated with an aura instance and remaps it to a color via a curve, with the dispel type ID used as the 'x' value.

RequiresUnitAuraAccess=true, RequiresValidUnitAuraInstance=true, SecretArguments=AllowedWhenUntainted, SecretWhenCurveSecret=true, SecretWhenUnitAuraRestricted=true

Arguments:

- `auraInstanceUnit`: UnitToken
- `auraInstanceID`: number
- `curve`: LuaColorCurveObject

Returns:

- `dispelTypeColor`: colorRGBA (ColorMixin)

### C_UnitAuras.GetAuraDuration

RequiresUnitAuraAccess=true, RequiresValidUnitAuraInstance=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `auraInstanceUnit`: UnitToken
- `auraInstanceID`: number

Returns:

- `duration`: LuaDurationObject

### C_UnitAuras.GetAuraSlots

RequiresUnitAuraAccess=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitTokenRestrictedForAddOns
- `filter`: AuraFilters?
- `maxSlots`: number?
- `continuationToken`: number?

Returns:

- `outContinuationToken`: number?
- `slots`: number [StrideIndex=1]

### C_UnitAuras.GetBuffDataByIndex

RequiresUnitAuraAccess=true, SecretArguments=AllowedWhenUntainted, SecretWhenUnitAuraRestricted=true

Arguments:

- `unit`: UnitTokenRestrictedForAddOns
- `index`: luaIndex
- `filter`: AuraFilters?

Returns:

- `aura`: AuraData?

### C_UnitAuras.GetCooldownAuraBySpellID

SecretArguments=AllowedWhenTainted

Arguments:

- `spellID`: SpellIdentifier

Returns:

- `cooldownSpellID`: number?

### C_UnitAuras.GetDebuffDataByIndex

RequiresUnitAuraAccess=true, SecretArguments=AllowedWhenUntainted, SecretWhenUnitAuraRestricted=true

Arguments:

- `unit`: UnitTokenRestrictedForAddOns
- `index`: luaIndex
- `filter`: AuraFilters?

Returns:

- `aura`: AuraData?

### C_UnitAuras.GetGroupBuffVisualAlerts

Returns:

- `visualAlerts`: table<GroupBuffVisualAlertInfo>

### C_UnitAuras.GetHiddenGroupBuffs

Returns:

- `spellIDs`: table<number>

### C_UnitAuras.GetPlayerAuraBySpellID

RequiresNonSecretAura=true, SecretArguments=AllowedWhenTainted, SecretWhenUnitAuraRestricted=true

Arguments:

- `spellID`: SpellIdentifier

Returns:

- `aura`: AuraData?

### C_UnitAuras.GetRefreshCarryOverDuration -- Returns the client-predicted amount of time that a new spellcast of the same spell would carry over to the new application of that aura. Takes an optional spellID to use as the new duration if that cannot be derived from the aura, if that value isn't supplied the aura's spellID will be used

RequiresUnitAuraAccess=true, RequiresValidUnitAuraInstance=true, SecretArguments=AllowedWhenTainted, SecretWhenUnitAuraRestricted=true

Arguments:

- `auraInstanceUnit`: UnitToken
- `auraInstanceID`: number
- `spellID`: SpellIdentifier?

Returns:

- `newDuration`: number?

### C_UnitAuras.GetRefreshExtendedDuration -- Returns the client-predicted new duration of this aura if it were cast again right now. Takes an optional spellID to use as the new duration if that cannot be derived from the aura, if that value isn't supplied the aura's spellID will be used

RequiresUnitAuraAccess=true, RequiresValidUnitAuraInstance=true, SecretArguments=AllowedWhenTainted, SecretWhenUnitAuraRestricted=true

Arguments:

- `auraInstanceUnit`: UnitToken
- `auraInstanceID`: number
- `spellID`: SpellIdentifier?

Returns:

- `newDuration`: number?

### C_UnitAuras.GetUnitAuraBySpellID -- Returns the first instance of an aura on a unit matching a given spell ID. Returns nil if no such aura is found. Additionally can return nil if querying a unit that is not visible (eg. party members on other maps).

RequiresNonSecretAura=true, SecretArguments=AllowedWhenTainted, SecretWhenUnitAuraRestricted=true

Arguments:

- `unit`: UnitTokenRestrictedForAddOns [NeverSecret=true]
- `spellID`: SpellIdentifier

Returns:

- `aura`: AuraData?

### C_UnitAuras.GetUnitAuraInstanceIDs

RequiresUnitAuraAccess=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitTokenRestrictedForAddOns [NeverSecret=true]
- `filter`: AuraFilters
- `maxCount`: number?
- `sortRule`: UnitAuraSortRule [default=Unsorted]
- `sortDirection`: UnitAuraSortDirection [default=Normal]

Returns:

- `auraInstanceIDs`: table<number>

### C_UnitAuras.GetUnitAuras

RequiresUnitAuraAccess=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitTokenRestrictedForAddOns [NeverSecret=true]
- `filter`: AuraFilters
- `maxCount`: number?
- `sortRule`: UnitAuraSortRule [default=Unsorted]
- `sortDirection`: UnitAuraSortDirection [default=Normal]

Returns:

- `auras`: table<AuraData> [ConditionalSecretContents=true]

### C_UnitAuras.IsAuraFilteredOutByInstanceID

RequiresUnitAuraAccess=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitTokenRestrictedForAddOns
- `auraInstanceID`: number
- `filter`: AuraFilters

Returns:

- `isFiltered`: bool

### C_UnitAuras.RemoveAuraSound

SecretArguments=AllowedWhenUntainted

Arguments:

- `auraSoundID`: number

### C_UnitAuras.RemovePrivateAuraAnchor

SecretArguments=AllowedWhenUntainted

Arguments:

- `anchorID`: number

### C_UnitAuras.ResetAuraDataProvider

### C_UnitAuras.SetGroupBuffVisualAlerts

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `visualAlerts`: table<GroupBuffVisualAlertInfo> [NeverSecretContents=true]

### C_UnitAuras.SetHiddenGroupBuffs

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `spellIDs`: table<number> [NeverSecretContents=true]

### C_UnitAuras.SetPrivateWarningTextAnchor

SecretArguments=AllowedWhenUntainted

Arguments:

- `parent`: SimpleFrame
- `anchor`: AnchorBinding?

### C_UnitAuras.SwitchAuraDataProvider

### C_UnitAuras.WantsAlteredForm

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `wantsAlteredForm`: bool

## Events

### AURA_DATA_PROVIDER_SWITCH

SynchronousEvent=true

Payload:

- `useRealDataProvider`: bool

### GROUP_BUFF_VISUAL_ALERTS_CHANGED

SynchronousEvent=true

Payload:

- `visualAlerts`: table<GroupBuffVisualAlertInfo>

### HIDDEN_GROUP_BUFFS_CHANGED

SynchronousEvent=true

Payload:

- `spellIDs`: table<number>

### UNIT_AURA

SecretWhenAurasRestricted=true, SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant
- `updateInfo`: UnitAuraUpdateInfo

### UNIT_AURA_BLOCK_LIST_CLEARED

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### UNIT_AURA_BLOCKED

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant
- `auraInstanceID`: number [SecretValue=true]
