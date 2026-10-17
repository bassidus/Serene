# Loot

Namespace `C_Loot`.

Environment=All, Predicates={}

## Functions

### C_Loot.GetLootRollDuration

SecretArguments=AllowedWhenUntainted

Arguments:

- `rollID`: number

Returns:

- `duration`: number?

### C_Loot.IsLegacyLootModeEnabled

Returns:

- `isLegacyLootModeEnabled`: bool

## Events

### AZERITE_EMPOWERED_ITEM_LOOTED

SynchronousEvent=true

Payload:

- `itemLink`: cstring

### BONUS_ROLL_ACTIVATE

SynchronousEvent=true

### BONUS_ROLL_DEACTIVATE

SynchronousEvent=true

### BONUS_ROLL_FAILED

SynchronousEvent=true

### BONUS_ROLL_RESULT

SynchronousEvent=true

Payload:

- `typeIdentifier`: cstring
- `itemLink`: cstring
- `quantity`: number
- `specID`: number
- `sex`: number
- `personalLootToast`: bool
- `currencyID`: number?
- `isSecondaryResult`: bool
- `corrupted`: bool

### BONUS_ROLL_STARTED

SynchronousEvent=true

### CANCEL_ALL_LOOT_ROLLS

SynchronousEvent=true

### CANCEL_LOOT_ROLL

SynchronousEvent=true

Payload:

- `rollID`: number

### CONFIRM_DISENCHANT_ROLL

SynchronousEvent=true

Payload:

- `rollID`: number
- `rollType`: number

### CONFIRM_LOOT_ROLL

SynchronousEvent=true

Payload:

- `rollID`: number
- `rollType`: number
- `confirmReason`: cstring

### ENCOUNTER_LOOT_RECEIVED

SynchronousEvent=true

Payload:

- `encounterID`: number
- `itemID`: number
- `itemLink`: cstring
- `quantity`: number
- `itemName`: cstring
- `fileName`: cstring

### GARRISON_MISSION_BONUS_ROLL_LOOT

SynchronousEvent=true

Payload:

- `itemID`: number
- `quantity`: number

### ITEM_PUSH

SynchronousEvent=true

Payload:

- `bagSlot`: luaIndex
- `iconFileID`: number

### LEGACY_LOOT_RULES_CHANGED

SynchronousEvent=true

Payload:

- `isLegacyLootModeEnabled`: bool

### LOOT_BIND_CONFIRM

SynchronousEvent=true

Payload:

- `lootSlot`: luaIndex

### LOOT_CLOSED

SynchronousEvent=true

### LOOT_ITEM_AVAILABLE

SynchronousEvent=true

Payload:

- `itemTooltip`: cstring
- `lootHandle`: number

### LOOT_ITEM_ROLL_WON

SynchronousEvent=true

Payload:

- `itemLink`: cstring
- `rollQuantity`: number
- `rollType`: number
- `roll`: number
- `upgraded`: bool

### LOOT_OPENED

SynchronousEvent=true

Payload:

- `autoLoot`: bool
- `isFromItem`: bool

### LOOT_READY

SynchronousEvent=true

Payload:

- `autoloot`: bool

### LOOT_ROLLS_COMPLETE

SynchronousEvent=true

Payload:

- `lootHandle`: number

### LOOT_SLOT_CHANGED

SynchronousEvent=true

Payload:

- `lootSlot`: luaIndex

### LOOT_SLOT_CLEARED

SynchronousEvent=true

Payload:

- `lootSlot`: luaIndex

### MAIN_SPEC_NEED_ROLL

SynchronousEvent=true

Payload:

- `rollID`: number
- `roll`: number
- `isWinning`: bool

### OPEN_MASTER_LOOT_LIST

SynchronousEvent=true

### PET_BATTLE_LOOT_RECEIVED

SynchronousEvent=true

Payload:

- `typeIdentifier`: cstring
- `itemLink`: cstring
- `quantity`: number

### PLAYER_LOOT_SPEC_UPDATED

SynchronousEvent=true

### QUEST_CURRENCY_LOOT_RECEIVED

SynchronousEvent=true

Payload:

- `questID`: number
- `currencyId`: number
- `quantity`: number

### QUEST_LOOT_RECEIVED

SynchronousEvent=true

Payload:

- `questID`: number
- `itemLink`: cstring
- `quantity`: number

### SHOW_LOOT_TOAST

SynchronousEvent=true

Payload:

- `typeIdentifier`: cstring
- `itemLink`: cstring
- `quantity`: number
- `specID`: number
- `sex`: number
- `personalLootToast`: bool
- `toastMethod`: number
- `lessAwesome`: bool
- `upgraded`: bool
- `corrupted`: bool

### SHOW_LOOT_TOAST_LEGENDARY_LOOTED

SynchronousEvent=true

Payload:

- `itemLink`: cstring

### SHOW_LOOT_TOAST_UPGRADE

SynchronousEvent=true

Payload:

- `itemLink`: cstring
- `quantity`: number
- `specID`: number
- `sex`: number
- `baseQuality`: number
- `personalLootToast`: bool
- `lessAwesome`: bool

### SHOW_PVP_FACTION_LOOT_TOAST

SynchronousEvent=true

Payload:

- `typeIdentifier`: cstring
- `itemLink`: cstring
- `quantity`: number
- `specID`: number
- `sex`: number
- `personalLootToast`: bool
- `lessAwesome`: bool

### SHOW_RATED_PVP_REWARD_TOAST

SynchronousEvent=true

Payload:

- `typeIdentifier`: cstring
- `itemLink`: cstring
- `quantity`: number
- `specID`: number
- `sex`: number
- `personalLootToast`: bool
- `lessAwesome`: bool

### START_LOOT_ROLL

SynchronousEvent=true

Payload:

- `rollID`: number
- `rollTime`: number
- `lootHandle`: number?

### TRIAL_CAP_REACHED_MONEY

SynchronousEvent=true

### UPDATE_MASTER_LOOT_LIST

SynchronousEvent=true
