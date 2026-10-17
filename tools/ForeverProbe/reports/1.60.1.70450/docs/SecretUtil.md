# SecretUtil

Namespace `C_Secrets`.

Environment=All, Predicates={}

## Functions

### C_Secrets.CanCompareUnitTokens -- Returns true if queries to compare two input unit tokens are permitted. If this returns false, APIs guarded by the RequiresComparableUnitTokens predicate will fail.

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit1`: UnitToken
- `unit2`: UnitToken

Returns:

- `isUnitComparisonPermitted`: bool

### C_Secrets.GetPowerTypeSecrecy -- Queries the base secrecy for a power type.

SecretArguments=AllowedWhenUntainted

Arguments:

- `powerType`: PowerType

Returns:

- `secrecy`: SecrecyLevel

### C_Secrets.GetSpellAuraSecrecy -- Queries the base secrecy for a spell if queried as an aura.

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellIdentifier`: SpellIdentifier

Returns:

- `secrecy`: SecrecyLevel

### C_Secrets.GetSpellCastSecrecy -- Queries the base secrecy for a spell if queried as a cast.

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellIdentifier`: SpellIdentifier

Returns:

- `secrecy`: SecrecyLevel

### C_Secrets.GetSpellCooldownSecrecy -- Queries the base secrecy for a spell if queried as a cooldown.

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellIdentifier`: SpellIdentifier

Returns:

- `secrecy`: SecrecyLevel

### C_Secrets.HasSecretRestrictions -- Returns true if this client build has secret value restrictions enabled. If false, all APIs that are tagged as potentially returning secrets will never do so.

Returns:

- `hasSecretRestrictions`: bool

### C_Secrets.ShouldActionCooldownBeSecret -- Returns true if a given action bar slot ID will produce secret values for cooldowns if queried.

SecretArguments=AllowedWhenUntainted

Arguments:

- `actionID`: luaIndex

Returns:

- `isCooldownSecret`: bool

### C_Secrets.ShouldAurasBeSecret -- Returns true if queries for aura data will generally produce secret values.

Returns:

- `hasSecretAuras`: bool

### C_Secrets.ShouldCooldownsBeSecret -- Returns true if queries for cooldown data will generally produce secret values.

Returns:

- `hasSecretCooldowns`: bool

### C_Secrets.ShouldSpellAuraBeSecret -- Returns true if a given spell identifier would, if applied as an aura, produce secret values when queried.

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellIdentifier`: SpellIdentifier

Returns:

- `isAuraSecret`: bool

### C_Secrets.ShouldSpellBookItemCooldownBeSecret -- Returns true if a given spellbook item will produce secret values for cooldowns if queried.

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellBookItemSlotIndex`: luaIndex
- `spellBookItemSpellBank`: SpellBookSpellBank

Returns:

- `isCooldownSecret`: bool

### C_Secrets.ShouldSpellCooldownBeSecret -- Returns true if a given spell identifier will produce secret values for cooldowns if queried.

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellIdentifier`: SpellIdentifier

Returns:

- `isCooldownSecret`: bool

### C_Secrets.ShouldTotemSlotBeSecret -- Returns true if information about a totem slot will produce secret values if queried.

SecretArguments=AllowedWhenUntainted

Arguments:

- `slot`: luaIndex

Returns:

- `isTotemSecret`: bool

### C_Secrets.ShouldTotemSpellBeSecret -- Returns true if information about a spell when associated with a totem slot will produce secret values if queried.

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellID`: number

Returns:

- `isTotemSecret`: bool

### C_Secrets.ShouldUnitAuraIndexBeSecret -- Returns true if a given aura index will produce secret values if queried.

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken
- `index`: luaIndex
- `filter`: AuraFilters?

Returns:

- `isAuraSecret`: bool

### C_Secrets.ShouldUnitAuraInstanceBeSecret -- Returns true if a given aura instance ID will produce secret values if queried.

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken
- `auraInstanceID`: number

Returns:

- `isAuraSecret`: bool

### C_Secrets.ShouldUnitAuraSlotBeSecret -- Returns true if a given aura slot ID will produce secret values if queried.

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken
- `slot`: number

Returns:

- `isAuraSecret`: bool

### C_Secrets.ShouldUnitComparisonBeSecret -- Returns true if queries that compare units will produce secret values.

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit1`: UnitToken
- `unit2`: UnitToken

Returns:

- `isUnitComparisonSecret`: bool

### C_Secrets.ShouldUnitHealthMaxBeSecret -- Returns true if queries for maximum unit health will produce secret values.

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `isUnitHealthMaxSecret`: bool

### C_Secrets.ShouldUnitIdentityBeSecret -- Returns true if queries for unit identity (such as name or GUID) will produce secret values.

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `isUnitIdentitySecret`: bool

### C_Secrets.ShouldUnitPowerBeSecret -- Returns true if queries for unit power will produce secret values.

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken
- `powerType`: PowerType?

Returns:

- `isUnitPowerSecret`: bool

### C_Secrets.ShouldUnitPowerMaxBeSecret -- Returns true if queries for maximum unit power will produce secret values.

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken
- `powerType`: PowerType?

Returns:

- `isUnitPowerMaxSecret`: bool

### C_Secrets.ShouldUnitSpellCastBeSecret -- Returns true if queries for spell casting information for a unit would produce secret values when queried.

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken
- `spellIdentifier`: SpellIdentifier

Returns:

- `isSpellCastSecret`: bool

### C_Secrets.ShouldUnitSpellCastingBeSecret -- Returns true if queries for spell casting information for a specific unit will generally produce secret values.

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `isSpellCastingSecret`: bool

### C_Secrets.ShouldUnitStatsBeSecret -- Returns true if queries for unit statistics will produce secret values.

Returns:

- `hasSecretStats`: bool

### C_Secrets.ShouldUnitThreatStateBeSecret -- Returns true if queries for unit threat status will produce secret values.

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken
- `mobUnit`: UnitToken?

Returns:

- `isUnitThreatSecret`: bool

### C_Secrets.ShouldUnitThreatValuesBeSecret -- Returns true if queries for unit threat values will produce secret values.

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken
- `mobUnit`: UnitToken

Returns:

- `isUnitThreatSecret`: bool
