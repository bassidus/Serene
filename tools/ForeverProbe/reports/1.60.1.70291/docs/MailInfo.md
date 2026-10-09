# MailInfo

Namespace `C_Mail`.

Environment=All, Predicates={}

## Functions

### C_Mail.CanCheckInbox

Returns:

- `canCheckInbox`: bool
- `secondsUntilAllowed`: number

### C_Mail.GetCraftingOrderMailInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `inboxIndex`: luaIndex

Returns:

- `info`: CraftingOrderMailInfo?

### C_Mail.HasInboxMoney

SecretArguments=AllowedWhenUntainted

Arguments:

- `inboxIndex`: luaIndex

Returns:

- `inboxItemHasMoneyAttached`: bool

### C_Mail.IsCommandPending

Returns:

- `isCommandPending`: bool

### C_Mail.SetOpeningAll

SecretArguments=AllowedWhenUntainted

Arguments:

- `openingAll`: bool

## Events

### CLOSE_INBOX_ITEM

SynchronousEvent=true

Payload:

- `mailIndex`: luaIndex

### MAIL_CLOSED

SynchronousEvent=true

### MAIL_FAILED

SynchronousEvent=true

Payload:

- `itemID`: number?

### MAIL_INBOX_UPDATE

SynchronousEvent=true, UniqueEvent=true

### MAIL_LOCK_SEND_ITEMS

SynchronousEvent=true

Payload:

- `attachSlot`: luaIndex
- `itemLink`: cstring

### MAIL_SEND_INFO_UPDATE

SynchronousEvent=true, UniqueEvent=true

### MAIL_SEND_SUCCESS

SynchronousEvent=true

### MAIL_SHOW

SynchronousEvent=true

### MAIL_SUCCESS

SynchronousEvent=true

Payload:

- `itemID`: number?

### MAIL_UNLOCK_SEND_ITEMS

SynchronousEvent=true

### SEND_MAIL_COD_CHANGED

SynchronousEvent=true

### SEND_MAIL_MONEY_CHANGED

SynchronousEvent=true

### UPDATE_PENDING_MAIL

SynchronousEvent=true
