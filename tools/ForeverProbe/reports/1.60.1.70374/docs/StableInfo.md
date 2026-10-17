# StableInfo

Namespace `C_StableInfo`.

Environment=All, Predicates={}

## Functions

### C_StableInfo.BuyStableSlot

### C_StableInfo.ClosePetStables

### C_StableInfo.GetActivePetList

Returns:

- `activePets`: table<PetInfo>

### C_StableInfo.GetAvailablePetSpecInfos

Returns:

- `petSpecInfos`: table<PetSpecInfo>

### C_StableInfo.GetNextStableSlotCost

Returns:

- `cost`: number

### C_StableInfo.GetNumActivePets

Returns:

- `numActivePets`: number

### C_StableInfo.GetNumStablePets

Returns:

- `numStablePets`: number

### C_StableInfo.GetNumStableSlots

Returns:

- `numSlots`: number

### C_StableInfo.GetStablePetFoodTypes

SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex

Returns:

- `foodTypes`: table<string>

### C_StableInfo.GetStablePetInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex

Returns:

- `petInfo`: PetInfo?

### C_StableInfo.GetStabledPetList

Returns:

- `stabledPets`: table<PetInfo>

### C_StableInfo.IsAtStableMaster

Returns:

- `isAtStableMaster`: bool

### C_StableInfo.IsBonusPetSlotAvailable

Returns:

- `isAvailable`: bool

### C_StableInfo.IsPetFavorite

SecretArguments=AllowedWhenUntainted

Arguments:

- `slot`: luaIndex

Returns:

- `isFavorite`: bool

### C_StableInfo.PickupStablePet

SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex

### C_StableInfo.SetPetFavorite

SecretArguments=AllowedWhenUntainted

Arguments:

- `slot`: luaIndex
- `isFavorite`: bool

### C_StableInfo.SetPetSlot

SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex
- `slot`: luaIndex

## Events

### PET_INFO_UPDATE

UniqueEvent=true

### PET_STABLE_CLOSED

SynchronousEvent=true

### PET_STABLE_FAVORITES_UPDATED

SynchronousEvent=true

### PET_STABLE_SHOW

SynchronousEvent=true

### PET_STABLE_UPDATE

SynchronousEvent=true

## Tables

### PetInfo

Fields:

- `slotID`: number
- `icon`: fileID
- `name`: string
- `level`: number
- `familyName`: string
- `specialization`: string
- `type`: string
- `petAbilities`: table<number>
- `specAbilities`: table<number>
- `displayID`: number
- `isFavorite`: bool
- `isExotic`: bool
- `uiModelSceneID`: number [default=718]
- `petNumber`: number
- `creatureID`: number
- `specID`: number
- `loyaltyLevel`: number
- `loyaltyName`: string
- `happinessLevel`: number
- `experience`: number
- `experienceNeeded`: number

### PetSpecInfo

Fields:

- `specID`: number
- `specIndex`: luaIndex
- `specializationName`: string
