# LootHistory

Namespace `C_LootHistory`.

Environment=All, Predicates={}

## Functions

### C_LootHistory.GetAllEncounterInfos

Returns:

- `infos`: table<EncounterLootInfo>

### C_LootHistory.GetInfoForEncounter

SecretArguments=AllowedWhenUntainted

Arguments:

- `encounterID`: number

Returns:

- `info`: EncounterLootInfo?

### C_LootHistory.GetLootHistoryTime

Returns:

- `time`: number

### C_LootHistory.GetSortedDropsForEncounter

SecretArguments=AllowedWhenUntainted

Arguments:

- `encounterID`: number

Returns:

- `drops`: table<EncounterLootDropInfo>?

### C_LootHistory.GetSortedInfoForDrop

SecretArguments=AllowedWhenUntainted

Arguments:

- `encounterID`: number
- `lootListKey`: number

Returns:

- `info`: EncounterLootDropInfo?

## Events

### LOOT_HISTORY_CLEAR_HISTORY

SynchronousEvent=true

### LOOT_HISTORY_GO_TO_ENCOUNTER

UniqueEvent=true

Payload:

- `encounterID`: number

### LOOT_HISTORY_ONE_HUNDRED_ROLL

SynchronousEvent=true

Payload:

- `encounterID`: number
- `lootListKey`: number

### LOOT_HISTORY_UPDATE_DROP

UniqueEvent=true

Payload:

- `encounterID`: number
- `lootListKey`: number

### LOOT_HISTORY_UPDATE_ENCOUNTER

UniqueEvent=true

Payload:

- `encounterID`: number

## Tables

### EncounterLootDropRollState

MaxValue=5, MinValue=0, NumValues=6

Fields:

- `NeedMainSpec`: EncounterLootDropRollState [= 0]
- `NeedOffSpec`: EncounterLootDropRollState [= 1]
- `Transmog`: EncounterLootDropRollState [= 2]
- `Greed`: EncounterLootDropRollState [= 3]
- `NoRoll`: EncounterLootDropRollState [= 4]
- `Pass`: EncounterLootDropRollState [= 5]

### EncounterLootDropInfo

Fields:

- `lootListKey`: number
- `itemHyperlink`: string
- `playerRollState`: EncounterLootDropRollState
- `currentLeader`: EncounterLootDropRollInfo?
- `isTied`: bool [default=false]
- `winner`: EncounterLootDropRollInfo?
- `allPassed`: bool [default=false]
- `rollInfos`: table<EncounterLootDropRollInfo>
- `startTime`: number
- `duration`: number

### EncounterLootDropRollInfo

Fields:

- `playerName`: string
- `playerGUID`: WOWGUID
- `playerClass`: string
- `isSelf`: bool
- `state`: EncounterLootDropRollState
- `isWinner`: bool [default=false]
- `roll`: number?

### EncounterLootDrops

Fields:

- `encounterID`: number
- `drops`: table<EncounterLootDropInfo>

### EncounterLootInfo

Fields:

- `encounterName`: string
- `encounterID`: number
- `startTime`: number
- `duration`: number
