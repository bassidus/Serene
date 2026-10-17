# AdventureJournal

Namespace `C_AdventureJournal`.

Environment=All, Predicates={}

## Events

### AJ_DUNGEON_ACTION

SynchronousEvent=true

Payload:

- `lfgDungeonID`: number

### AJ_OPEN

SynchronousEvent=true

### AJ_OPEN_COLLECTIONS_ACTION

SynchronousEvent=true

### AJ_PVE_LFG_ACTION

SynchronousEvent=true

### AJ_PVP_ACTION

SynchronousEvent=true

Payload:

- `battleMasterListID`: number

### AJ_PVP_LFG_ACTION

SynchronousEvent=true

### AJ_PVP_RBG_ACTION

SynchronousEvent=true

### AJ_PVP_SKIRMISH_ACTION

SynchronousEvent=true

### AJ_PVP_SPECIAL_BG_ACTION

SynchronousEvent=true

### AJ_PVP_TRAINING_GROUNDS_ACTION

SynchronousEvent=true

### AJ_QUEST_LOG_OPEN

SynchronousEvent=true

Payload:

- `questID`: number
- `uiMapID`: number

### AJ_RAID_ACTION

SynchronousEvent=true

Payload:

- `lfgDungeonID`: number

### AJ_REFRESH_DISPLAY

SynchronousEvent=true

Payload:

- `newAdventureNotice`: bool

### AJ_REWARD_DATA_RECEIVED

UniqueEvent=true
