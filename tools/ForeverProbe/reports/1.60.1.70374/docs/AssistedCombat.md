# AssistedCombat

Namespace `C_AssistedCombat`.

Environment=All, Predicates={}

## Functions

### C_AssistedCombat.GetActionSpell

Returns:

- `spellID`: number?

### C_AssistedCombat.GetNextCastSpell

SecretArguments=AllowedWhenUntainted

Arguments:

- `checkForVisibleButton`: bool [default=false]

Returns:

- `spellID`: number?

### C_AssistedCombat.GetRotationSpells

Returns:

- `spellIDs`: table<number>

### C_AssistedCombat.IsAvailable

Returns:

- `isAvailable`: bool
- `failureReason`: string

## Events

### ASSISTED_COMBAT_ACTION_SPELL_CAST

SynchronousEvent=true
