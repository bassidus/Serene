# TargetScript

Environment=All, Predicates={}

## Functions

### AssistUnit

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: cstring [default=]
- `exactMatch`: bool [default=false]

### AttackTarget

### ClearFocus

### ClearTarget

Returns:

- `willMakeChange`: bool

### FocusUnit

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: cstring [default=]

### IsTargetLoose

Returns:

- `isTargetLoose`: bool

### SetPreferredGamepadInteractTarget

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken?

### TargetDirectionEnemy

SecretArguments=AllowedWhenUntainted

Arguments:

- `facing`: number
- `coneAngle`: number?

### TargetDirectionFinished

### TargetDirectionFriend

SecretArguments=AllowedWhenUntainted

Arguments:

- `facing`: number
- `coneAngle`: number?

### TargetLastEnemy

### TargetLastFriend

### TargetLastTarget

### TargetNearest

SecretArguments=AllowedWhenUntainted

Arguments:

- `reverse`: bool [default=false]

### TargetNearestEnemy

SecretArguments=AllowedWhenUntainted

Arguments:

- `reverse`: bool [default=false]

### TargetNearestEnemyPlayer

SecretArguments=AllowedWhenUntainted

Arguments:

- `reverse`: bool [default=false]

### TargetNearestFriend

SecretArguments=AllowedWhenUntainted

Arguments:

- `reverse`: bool [default=false]

### TargetNearestFriendPlayer

SecretArguments=AllowedWhenUntainted

Arguments:

- `reverse`: bool [default=false]

### TargetNearestPartyMember

SecretArguments=AllowedWhenUntainted

Arguments:

- `reverse`: bool [default=false]

### TargetNearestRaidMember

SecretArguments=AllowedWhenUntainted

Arguments:

- `reverse`: bool [default=false]

### TargetPriorityHighlightEnd

### TargetPriorityHighlightStart

SecretArguments=AllowedWhenUntainted

Arguments:

- `useStartDelay`: bool [default=false]

### TargetToggle

HasRestrictions=true

### TargetUnit

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: cstring [default=]
- `exactMatch`: bool [default=false]
