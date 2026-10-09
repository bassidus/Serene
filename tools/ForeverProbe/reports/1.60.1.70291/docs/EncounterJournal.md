# EncounterJournal

Namespace `C_EncounterJournal`.

Environment=All, Predicates={}

## Functions

### C_EncounterJournal.GetBaseDifficultyID

SecretArguments=AllowedWhenUntainted

Arguments:

- `difficultyID`: number

Returns:

- `baseDifficultyID`: number

### C_EncounterJournal.GetDungeonEntrancesForMap

SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

Returns:

- `dungeonEntrances`: table<DungeonEntranceMapInfo>

### C_EncounterJournal.GetEncounterJournalLink

SecretArguments=AllowedWhenUntainted

Arguments:

- `linkType`: JournalLinkTypes
- `ID`: number
- `displayText`: string
- `difficultyID`: number

Returns:

- `link`: string

### C_EncounterJournal.GetEncountersOnMap

SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

Returns:

- `encounters`: table<EncounterJournalMapEncounterInfo>

### C_EncounterJournal.GetInstanceForGameMap -- GameMap as opposed to UIMap since we use a mapID not a uiMapID.

SecretArguments=AllowedWhenUntainted

Arguments:

- `mapID`: number

Returns:

- `journalInstanceID`: number?

### C_EncounterJournal.GetLootInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `id`: number

Returns:

- `itemInfo`: EncounterJournalItemInfo

### C_EncounterJournal.GetLootInfoByIndex

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex
- `encounterIndex`: luaIndex?

Returns:

- `itemInfo`: EncounterJournalItemInfo

### C_EncounterJournal.GetSectionIconFlags -- Represents the icon indices for this EJ section.  An icon index can be used to arrive at texture coordinates for specific encounter types, e.g.: EncounterJournal_SetFlagIcon

SecretArguments=AllowedWhenUntainted

Arguments:

- `sectionID`: number

Returns:

- `iconFlags`: table<number>?

### C_EncounterJournal.GetSectionInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `sectionID`: number

Returns:

- `info`: EncounterJournalSectionInfo

### C_EncounterJournal.GetSlotFilter

Returns:

- `filter`: ItemSlotFilterType

### C_EncounterJournal.InitalizeSelectedTier

### C_EncounterJournal.InstanceHasDifficultyID

SecretArguments=AllowedWhenUntainted

Arguments:

- `difficultyID`: number

Returns:

- `hasDifficultyID`: bool

### C_EncounterJournal.InstanceHasLoot

SecretArguments=AllowedWhenUntainted

Arguments:

- `instanceID`: number?

Returns:

- `hasLoot`: bool

### C_EncounterJournal.IsEncounterComplete

SecretArguments=AllowedWhenUntainted

Arguments:

- `journalEncounterID`: number

Returns:

- `isEncounterComplete`: bool

### C_EncounterJournal.OnClose

HasRestrictions=true

### C_EncounterJournal.OnOpen

HasRestrictions=true

### C_EncounterJournal.ResetSlotFilter

### C_EncounterJournal.SetPreviewMythicPlusLevel

SecretArguments=AllowedWhenUntainted

Arguments:

- `level`: number

### C_EncounterJournal.SetPreviewPvpTier

SecretArguments=AllowedWhenUntainted

Arguments:

- `tier`: number

### C_EncounterJournal.SetSlotFilter

SecretArguments=AllowedWhenUntainted

Arguments:

- `filterSlot`: ItemSlotFilterType

### C_EncounterJournal.SetTab

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `tabIdx`: number

### C_EncounterJournal.StartArathiRPE

## Events

### EJ_DIFFICULTY_UPDATE

SynchronousEvent=true

Payload:

- `difficultyID`: number

### EJ_LOOT_DATA_RECIEVED

SynchronousEvent=true, UniqueEvent=true

Payload:

- `itemID`: number?

### SHOW_JOURNEYS_UI -- Signaled when the UI needs to display the journeys dashboard at a specific faction.

SynchronousEvent=true

Payload:

- `factionID`: number

## Tables

### ItemSlotFilterType

MaxValue=15, MinValue=0, NumValues=16

Fields:

- `Head`: ItemSlotFilterType [= 0]
- `Neck`: ItemSlotFilterType [= 1]
- `Shoulder`: ItemSlotFilterType [= 2]
- `Cloak`: ItemSlotFilterType [= 3]
- `Chest`: ItemSlotFilterType [= 4]
- `Wrist`: ItemSlotFilterType [= 5]
- `Hand`: ItemSlotFilterType [= 6]
- `Waist`: ItemSlotFilterType [= 7]
- `Legs`: ItemSlotFilterType [= 8]
- `Feet`: ItemSlotFilterType [= 9]
- `MainHand`: ItemSlotFilterType [= 10]
- `OffHand`: ItemSlotFilterType [= 11]
- `Finger`: ItemSlotFilterType [= 12]
- `Trinket`: ItemSlotFilterType [= 13]
- `Other`: ItemSlotFilterType [= 14]
- `NoFilter`: ItemSlotFilterType [= 15]

### DungeonEntranceMapInfo

Fields:

- `areaPoiID`: number
- `position`: vector2 (Vector2DMixin)
- `name`: cstring
- `description`: cstring
- `atlasName`: string
- `journalInstanceID`: number

### EncounterJournalItemInfo

Fields:

- `itemID`: number
- `encounterID`: number?
- `name`: string?
- `itemQuality`: string?
- `filterType`: ItemSlotFilterType?
- `icon`: fileID?
- `slot`: string?
- `armorType`: string?
- `link`: string?
- `handError`: bool?
- `weaponTypeError`: bool?
- `displayAsPerPlayerLoot`: bool?
- `displayAsVeryRare`: bool?
- `displayAsExtremelyRare`: bool?
- `displaySeasonID`: number?

### EncounterJournalMapEncounterInfo

Fields:

- `encounterID`: number
- `mapX`: number
- `mapY`: number

### EncounterJournalSectionInfo

Fields:

- `spellID`: number
- `title`: cstring
- `description`: string?
- `headerType`: number
- `abilityIcon`: fileID
- `creatureDisplayID`: number
- `uiModelSceneID`: number
- `siblingSectionID`: number?
- `firstChildSectionID`: number?
- `filteredByDifficulty`: bool
- `link`: string
- `startsOpen`: bool
