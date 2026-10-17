# LootJournal

Namespace `C_LootJournal`.

Environment=All, Predicates={}

## Functions

### C_LootJournal.GetItemSetItems

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `setID`: number

Returns:

- `items`: table<LootJournalItemInfo>

### C_LootJournal.GetItemSets

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `classID`: number?
- `specID`: number?

Returns:

- `itemSets`: table<LootJournalItemSetInfo>

## Events

### LOOT_JOURNAL_ITEM_UPDATE

UniqueEvent=true

## Tables

### LootJournalItemInfo

Fields:

- `itemID`: number
- `icon`: fileID
- `invType`: luaIndex

### LootJournalItemSetInfo

Fields:

- `setID`: number
- `itemLevel`: number
- `name`: cstring
