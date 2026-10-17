# ZoneAbility

Namespace `C_ZoneAbility`.

Environment=All, Predicates={}

## Functions

### C_ZoneAbility.GetActiveAbilities

Returns:

- `zoneAbilities`: table<ZoneAbilityInfo>

### C_ZoneAbility.GetZoneAbilityIcon

SecretArguments=AllowedWhenUntainted

Arguments:

- `zoneAbilitySpellID`: number

Returns:

- `zoneAbilityIconID`: number?

## Tables

### ZoneAbilityInfo

Fields:

- `zoneAbilityID`: number
- `uiPriority`: number
- `spellID`: number
- `textureKit`: textureKit
- `tutorialText`: cstring?
