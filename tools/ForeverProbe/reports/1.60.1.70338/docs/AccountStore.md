# AccountStore

Namespace `C_AccountStore`.

Environment=All, Predicates={}

## Functions

### C_AccountStore.BeginPurchase

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemID`: number

Returns:

- `purchaseStarted`: bool

### C_AccountStore.GetCategories

SecretArguments=AllowedWhenUntainted

Arguments:

- `storeFrontID`: number

Returns:

- `categories`: table<number>

### C_AccountStore.GetCategoryInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `categoryID`: number

Returns:

- `info`: AccountStoreCategoryInfo

### C_AccountStore.GetCategoryItems

SecretArguments=AllowedWhenUntainted

Arguments:

- `categoryID`: number

Returns:

- `itemIDs`: table<number>

### C_AccountStore.GetCurrencyAvailable

SecretArguments=AllowedWhenUntainted

Arguments:

- `currencyID`: number

Returns:

- `amount`: number

### C_AccountStore.GetCurrencyIDForStore

SecretArguments=AllowedWhenUntainted

Arguments:

- `storeFrontID`: number

Returns:

- `currencyID`: number?

### C_AccountStore.GetCurrencyInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `currencyID`: number

Returns:

- `info`: AccountStoreCurrencyInfo

### C_AccountStore.GetItemInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemID`: number

Returns:

- `info`: AccountStoreItemInfo?

### C_AccountStore.GetStoreFrontState

SecretArguments=AllowedWhenUntainted

Arguments:

- `storeFrontID`: number

Returns:

- `state`: AccountStoreState

### C_AccountStore.RefundItem

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemID`: number

Returns:

- `refundStarted`: bool

### C_AccountStore.RequestStoreFrontInfoUpdate

SecretArguments=AllowedWhenUntainted

Arguments:

- `storeFrontID`: number

## Events

### ACCOUNT_STORE_CURRENCY_AVAILABLE_UPDATED

SynchronousEvent=true

Payload:

- `currencyID`: number

### ACCOUNT_STORE_FRONT_UPDATED

SynchronousEvent=true

Payload:

- `storeFrontID`: number

### ACCOUNT_STORE_ITEM_INFO_UPDATED

SynchronousEvent=true

Payload:

- `itemID`: number

### ACCOUNT_STORE_TRANSACTION_ERROR

SynchronousEvent=true

Payload:

- `result`: AccountStoreTransactionResult

### STORE_FRONT_STATE_UPDATED

SynchronousEvent=true

Payload:

- `storeFrontID`: number

## Tables

### AccountStoreCategoryInfo

Fields:

- `id`: number
- `name`: cstring
- `type`: AccountStoreCategoryType
- `icon`: fileID

### AccountStoreCurrencyInfo

Fields:

- `id`: number
- `amount`: number
- `maxQuantity`: number?
- `name`: cstring
- `icon`: fileID

### AccountStoreItemInfo

Fields:

- `id`: number
- `status`: AccountStoreItemStatus
- `mode`: AccountStoreItemMode
- `currencyID`: number
- `flags`: AccountStoreItemFlag
- `customUIModelSceneID`: number?
- `name`: cstring
- `description`: cstring?
- `price`: number
- `nonrefundable`: bool
- `creatureDisplayID`: number?
- `transmogSetID`: number?
- `displayIcon`: fileID?
- `refundSecondsRemaining`: time_t?
