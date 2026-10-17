# GuildBank

Namespace `C_GuildBank`.

Environment=All, Predicates={}

## Functions

### C_GuildBank.IsGuildBankEnabled

Returns:

- `enabled`: bool

## Events

### GUILDBANK_ITEM_LOCK_CHANGED

SynchronousEvent=true

### GUILDBANK_TEXT_CHANGED

SynchronousEvent=true

Payload:

- `guildBankTab`: luaIndex

### GUILDBANK_UPDATE_MONEY

SynchronousEvent=true

### GUILDBANK_UPDATE_TABS

SynchronousEvent=true

### GUILDBANK_UPDATE_TEXT

SynchronousEvent=true

Payload:

- `guildBankTab`: number

### GUILDBANK_UPDATE_WITHDRAWMONEY

SynchronousEvent=true

### GUILDBANKBAGSLOTS_CHANGED

SynchronousEvent=true

### GUILDBANKFRAME_CLOSED

SynchronousEvent=true

### GUILDBANKFRAME_OPENED

SynchronousEvent=true

### GUILDBANKLOG_UPDATE

SynchronousEvent=true
