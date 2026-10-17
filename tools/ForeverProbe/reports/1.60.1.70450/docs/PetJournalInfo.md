# PetJournalInfo

Namespace `C_PetJournal`.

Environment=All, Predicates={}

## Functions

### C_PetJournal.ClearHoveredBattlePet

### C_PetJournal.ClearSearchFilter

### C_PetJournal.DismissSummonedPet

SecretArguments=AllowedWhenUntainted

Arguments:

- `petID`: WOWGUID

### C_PetJournal.GetDisplayIDByIndex

SecretArguments=AllowedWhenUntainted

Arguments:

- `speciesID`: number
- `index`: luaIndex

Returns:

- `displayID`: number?

### C_PetJournal.GetDisplayProbabilityByIndex

SecretArguments=AllowedWhenUntainted

Arguments:

- `speciesID`: number
- `index`: luaIndex

Returns:

- `displayProbability`: number?

### C_PetJournal.GetNonBattlePetLinkByIndex

SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex

Returns:

- `link`: cstring

### C_PetJournal.GetNumDisplays

SecretArguments=AllowedWhenUntainted

Arguments:

- `speciesID`: number

Returns:

- `numDisplays`: number?

### C_PetJournal.GetNumPetsInJournal

SecretArguments=AllowedWhenUntainted

Arguments:

- `creatureID`: number

Returns:

- `maxAllowed`: number
- `numPets`: number

### C_PetJournal.GetOwnedPetIDs

Returns:

- `ownedPetIDs`: table<WOWGUID>

### C_PetJournal.GetPetAbilityInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `abilityID`: number

Returns:

- `name`: string
- `icon`: fileID
- `petType`: number

### C_PetJournal.GetPetAbilityListTable

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `speciesID`: number

Returns:

- `info`: table<PetAbilityLevelInfo>

### C_PetJournal.GetPetInfoTableByPetID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `petID`: WOWGUID

Returns:

- `info`: PetJournalPetInfo

### C_PetJournal.GetPetInfoTableBySpeciesID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `speciesID`: number

Returns:

- `petInfo`: PetJournalPetInfo

### C_PetJournal.GetPetLoadOutInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `slot`: luaIndex

Returns:

- `petID`: WOWGUID?
- `ability1ID`: number
- `ability2ID`: number
- `ability3ID`: number
- `locked`: bool

### C_PetJournal.GetPetSummonInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `battlePetGUID`: WOWGUID

Returns:

- `isSummonable`: bool
- `error`: PetJournalError
- `errorText`: cstring

### C_PetJournal.GetSearchFilter

Returns:

- `filterText`: cstring

### C_PetJournal.HasFavoritePets

Returns:

- `hasFavorites`: bool

### C_PetJournal.IsCurrentlySummoned

SecretArguments=AllowedWhenUntainted

Arguments:

- `petID`: WOWGUID

Returns:

- `isSummoned`: bool

### C_PetJournal.IsUsingDefaultFilters

Returns:

- `isUsingDefaultFilters`: bool

### C_PetJournal.PetIsSummonable

SecretArguments=AllowedWhenUntainted

Arguments:

- `battlePetGUID`: WOWGUID

Returns:

- `isSummonable`: bool

### C_PetJournal.PetUsesRandomDisplay

SecretArguments=AllowedWhenUntainted

Arguments:

- `speciesID`: number

Returns:

- `usesRandomDisplay`: bool?

### C_PetJournal.SetDefaultFilters

### C_PetJournal.SetHoveredBattlePet

SecretArguments=AllowedWhenUntainted

Arguments:

- `battlePetGUID`: WOWGUID

### C_PetJournal.SetSearchFilter

SecretArguments=AllowedWhenUntainted

Arguments:

- `filterText`: cstring

### C_PetJournal.SpellTargetBattlePet

SecretArguments=AllowedWhenUntainted

Arguments:

- `battlePetGUID`: WOWGUID

## Events

### BATTLEPET_FORCE_NAME_DECLENSION

SynchronousEvent=true

Payload:

- `name`: cstring
- `battlePetGUID`: WOWGUID

### COMPANION_LEARNED

SynchronousEvent=true

### COMPANION_UNLEARNED

SynchronousEvent=true

### COMPANION_UPDATE

SynchronousEvent=true

Payload:

- `companionType`: cstring?

### NEW_PET_ADDED

SynchronousEvent=true

Payload:

- `battlePetGUID`: WOWGUID

### PET_JOURNAL_AUTO_SLOTTED_PET

SynchronousEvent=true

Payload:

- `slotIndex`: number
- `battlePetGUID`: WOWGUID

### PET_JOURNAL_CAGE_FAILED

SynchronousEvent=true

### PET_JOURNAL_LIST_UPDATE

SynchronousEvent=true, UniqueEvent=true

### PET_JOURNAL_NEW_BATTLE_SLOT

SynchronousEvent=true

### PET_JOURNAL_PET_DELETED

SynchronousEvent=true

Payload:

- `battlePetGUID`: WOWGUID

### PET_JOURNAL_PET_RESTORED

SynchronousEvent=true

Payload:

- `battlePetGUID`: WOWGUID

### PET_JOURNAL_PET_REVOKED

SynchronousEvent=true

Payload:

- `battlePetGUID`: WOWGUID

### PET_JOURNAL_PETS_HEALED

SynchronousEvent=true

### PET_JOURNAL_TRAP_LEVEL_SET

SynchronousEvent=true

Payload:

- `trapLevel`: number

### UPDATE_SUMMONPETS_ACTION

SynchronousEvent=true

## Tables

### PetJournalError

MaxValue=5, MinValue=0, NumValues=6

Fields:

- `None`: PetJournalError [= 0]
- `PetIsDead`: PetJournalError [= 1]
- `JournalIsLocked`: PetJournalError [= 2]
- `InvalidFaction`: PetJournalError [= 3]
- `NoFavoritesToSummon`: PetJournalError [= 4]
- `NoValidRandomSummon`: PetJournalError [= 5]

### PetAbilityLevelInfo

Fields:

- `abilityID`: number
- `level`: number

### PetJournalPetInfo

Fields:

- `speciesID`: number
- `customName`: cstring?
- `petLevel`: number?
- `xp`: number?
- `maxXP`: number?
- `displayID`: number?
- `isFavorite`: bool?
- `icon`: fileID
- `petType`: luaIndex
- `creatureID`: number
- `name`: cstring?
- `sourceText`: cstring
- `description`: cstring
- `isWild`: bool?
- `canBattle`: bool
- `tradable`: bool
- `unique`: bool
- `obtainable`: bool
- `canAttachToDecor`: bool
- `creatureModelScale`: number?
