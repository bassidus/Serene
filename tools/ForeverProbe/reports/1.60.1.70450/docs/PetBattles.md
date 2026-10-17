# PetBattles

Namespace `C_PetBattles`.

Environment=All, Predicates={}

## Functions

### C_PetBattles.GetBreedQuality

SecretArguments=AllowedWhenUntainted

Arguments:

- `petOwner`: BattlePetOwner
- `slot`: number

Returns:

- `quality`: BattlePetBreedQuality

### C_PetBattles.GetIcon

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `petOwner`: BattlePetOwner
- `slot`: number

Returns:

- `iconFileID`: fileID

### C_PetBattles.GetName

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `petOwner`: BattlePetOwner
- `slot`: number

Returns:

- `customName`: string
- `speciesName`: string

### C_PetBattles.IsPlayerNPC

Returns:

- `isPlayerNPC`: bool

### C_PetBattles.IsWildBattle

Returns:

- `isWildBattle`: bool
