# TradeInfo

Namespace `C_TradeInfo`.

Environment=All, Predicates={}

## Functions

### C_TradeInfo.AddTradeMoney -- Adds any cursor-held money to the current trade offer.

HasRestrictions=true

### C_TradeInfo.PickupTradeMoney

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `amount`: WOWMONEY

### C_TradeInfo.SetTradeMoney -- Sets the amount of money in the current trade offer.

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `amount`: WOWMONEY

### C_TradeInfo.ShouldShowTradeOfferWarning

Returns:

- `shouldShow`: bool

## Events

### PLAYER_TRADE_CURRENCY

SynchronousEvent=true

### PLAYER_TRADE_MONEY

SynchronousEvent=true

### TRADE_ACCEPT_UPDATE

SynchronousEvent=true

Payload:

- `playerAccepted`: number
- `targetAccepted`: number

### TRADE_CLOSED

SynchronousEvent=true

### TRADE_CURRENCY_CHANGED

SynchronousEvent=true

### TRADE_MONEY_CHANGED

SynchronousEvent=true

### TRADE_PLAYER_ITEM_CHANGED

SynchronousEvent=true

Payload:

- `tradeSlotIndex`: number

### TRADE_POTENTIAL_BIND_ENCHANT

SynchronousEvent=true

Payload:

- `canBecomeBoundForTrade`: bool

### TRADE_POTENTIAL_REMOVE_TRANSMOG

SynchronousEvent=true

Payload:

- `itemLink`: cstring
- `tradeSlotIndex`: number

### TRADE_REQUEST

SynchronousEvent=true

Payload:

- `name`: cstring

### TRADE_REQUEST_CANCEL

SynchronousEvent=true

### TRADE_SHOW

SynchronousEvent=true

### TRADE_TARGET_ITEM_CHANGED

SynchronousEvent=true

Payload:

- `tradeSlotIndex`: number

### TRADE_UPDATE

SynchronousEvent=true

### TRADE_UPDATE_WARNINGS

SynchronousEvent=true
