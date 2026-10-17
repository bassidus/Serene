# AzeriteEssence

Namespace `C_AzeriteEssence`.

Environment=All, Predicates={}

## Functions

### C_AzeriteEssence.ActivateEssence

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `essenceID`: number
- `milestoneID`: number

### C_AzeriteEssence.CanActivateEssence

SecretArguments=AllowedWhenUntainted

Arguments:

- `essenceID`: number
- `milestoneID`: number

Returns:

- `canActivate`: bool

### C_AzeriteEssence.CanDeactivateEssence

SecretArguments=AllowedWhenUntainted

Arguments:

- `milestoneID`: number

Returns:

- `canDeactivate`: bool

### C_AzeriteEssence.CanOpenUI

Returns:

- `canOpen`: bool

### C_AzeriteEssence.ClearPendingActivationEssence

### C_AzeriteEssence.CloseForge

### C_AzeriteEssence.GetEssenceHyperlink

SecretArguments=AllowedWhenUntainted

Arguments:

- `essenceID`: number
- `rank`: number

Returns:

- `link`: cstring

### C_AzeriteEssence.GetEssenceInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `essenceID`: number

Returns:

- `info`: AzeriteEssenceInfo

### C_AzeriteEssence.GetEssences

MayReturnNothing=true

Returns:

- `essences`: table<AzeriteEssenceInfo>

### C_AzeriteEssence.GetMilestoneEssence

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `milestoneID`: number

Returns:

- `essenceID`: number

### C_AzeriteEssence.GetMilestoneInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `milestoneID`: number

Returns:

- `info`: AzeriteMilestoneInfo

### C_AzeriteEssence.GetMilestoneSpell

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `milestoneID`: number

Returns:

- `spellID`: number

### C_AzeriteEssence.GetMilestones

MayReturnNothing=true

Returns:

- `milestones`: table<AzeriteMilestoneInfo>

### C_AzeriteEssence.GetNumUnlockedEssences

Returns:

- `numUnlockedEssences`: number

### C_AzeriteEssence.GetNumUsableEssences

Returns:

- `numUsableEssences`: number

### C_AzeriteEssence.GetPendingActivationEssence

Returns:

- `essenceID`: number

### C_AzeriteEssence.HasNeverActivatedAnyEssences

Returns:

- `hasNeverActivatedAnyEssences`: bool

### C_AzeriteEssence.HasPendingActivationEssence

Returns:

- `hasEssence`: bool

### C_AzeriteEssence.IsAtForge

Returns:

- `isAtForge`: bool

### C_AzeriteEssence.SetPendingActivationEssence

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `essenceID`: number

### C_AzeriteEssence.UnlockMilestone

SecretArguments=AllowedWhenUntainted

Arguments:

- `milestoneID`: number

## Events

### AZERITE_ESSENCE_ACTIVATED

SynchronousEvent=true

Payload:

- `slot`: AzeriteEssenceSlot
- `essenceID`: number

### AZERITE_ESSENCE_ACTIVATION_FAILED

SynchronousEvent=true

Payload:

- `slot`: AzeriteEssenceSlot
- `essenceID`: number

### AZERITE_ESSENCE_CHANGED

SynchronousEvent=true

Payload:

- `essenceID`: number
- `newRank`: number

### AZERITE_ESSENCE_FORGE_CLOSE

SynchronousEvent=true

### AZERITE_ESSENCE_FORGE_OPEN

SynchronousEvent=true

### AZERITE_ESSENCE_MILESTONE_UNLOCKED

SynchronousEvent=true

Payload:

- `milestoneID`: number

### AZERITE_ESSENCE_UPDATE

UniqueEvent=true

### PENDING_AZERITE_ESSENCE_CHANGED

SynchronousEvent=true

Payload:

- `essenceID`: number?

## Tables

### AzeriteEssenceInfo

Fields:

- `ID`: number
- `name`: cstring
- `rank`: number
- `unlocked`: bool
- `valid`: bool
- `icon`: fileID

### AzeriteMilestoneInfo

Fields:

- `ID`: number
- `requiredLevel`: number
- `canUnlock`: bool
- `unlocked`: bool
- `rank`: number?
- `slot`: AzeriteEssenceSlot?
