# CombatText

Namespace `C_CombatText`.

Environment=All, Predicates={}

## Functions

### C_CombatText.GetActiveUnit

MayReturnNothing=true

Returns:

- `unitTarget`: string

### C_CombatText.GetCurrentEventInfo

SecretReturns=true

### C_CombatText.SetActiveUnit

RequiresDeclassifiedUnitIdentity=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `unitToken`: UnitToken

## Events

### COMBAT_TEXT_UPDATE

SynchronousEvent=true

Payload:

- `combatTextType`: cstring
