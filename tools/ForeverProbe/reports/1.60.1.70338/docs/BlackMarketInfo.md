# BlackMarketInfo

Namespace `C_BlackMarketInfo`.

Environment=All, Predicates={}

## Events

### BLACK_MARKET_BID_RESULT

SynchronousEvent=true

Payload:

- `marketID`: number
- `resultCode`: number

### BLACK_MARKET_CLOSE

SynchronousEvent=true

### BLACK_MARKET_ITEM_UPDATE

SynchronousEvent=true

### BLACK_MARKET_OPEN

SynchronousEvent=true

### BLACK_MARKET_OUTBID

SynchronousEvent=true

Payload:

- `marketID`: number
- `itemID`: number

### BLACK_MARKET_UNAVAILABLE

SynchronousEvent=true

### BLACK_MARKET_WON

SynchronousEvent=true

Payload:

- `marketID`: number
- `itemID`: number
