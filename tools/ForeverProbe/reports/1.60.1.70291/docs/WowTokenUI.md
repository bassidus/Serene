# WowTokenUI

Namespace `C_WowTokenUI`.

Environment=All, Predicates={}

## Functions

### C_WowTokenUI.ShouldDisplayInAuctionHouse

Returns:

- `displayInAH`: bool

### C_WowTokenUI.StartTokenSell

SecretArguments=AllowedWhenUntainted

Arguments:

- `tokenGUID`: WOWGUID

## Events

### TOKEN_AUCTION_SOLD

SynchronousEvent=true

### TOKEN_BUY_CONFIRM_REQUIRED

SynchronousEvent=true

### TOKEN_BUY_RESULT

SynchronousEvent=true

Payload:

- `result`: number

### TOKEN_CAN_VETERAN_BUY_UPDATE

SynchronousEvent=true

Payload:

- `result`: number

### TOKEN_DISTRIBUTIONS_UPDATED

SynchronousEvent=true

Payload:

- `result`: number

### TOKEN_MARKET_PRICE_UPDATED

SynchronousEvent=true

Payload:

- `result`: number

### TOKEN_REDEEM_BALANCE_UPDATED

SynchronousEvent=true

### TOKEN_REDEEM_CONFIRM_REQUIRED

SynchronousEvent=true

Payload:

- `choiceType`: luaIndex

### TOKEN_REDEEM_FRAME_SHOW

SynchronousEvent=true

### TOKEN_REDEEM_GAME_TIME_UPDATED

SynchronousEvent=true

### TOKEN_REDEEM_RESULT

SynchronousEvent=true

Payload:

- `result`: luaIndex
- `choiceType`: luaIndex

### TOKEN_SELL_CONFIRM_REQUIRED

SynchronousEvent=true

### TOKEN_SELL_CONFIRMED

SynchronousEvent=true

### TOKEN_SELL_RESULT

SynchronousEvent=true

Payload:

- `result`: number

### TOKEN_STATUS_CHANGED

SynchronousEvent=true
