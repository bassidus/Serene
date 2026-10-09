# MerchantFrame

Namespace `C_MerchantFrame`.

Environment=All, Predicates={}

## Functions

### C_MerchantFrame.GetBuybackItemID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `buybackSlotIndex`: luaIndex

Returns:

- `buybackItemID`: number

### C_MerchantFrame.GetItemInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex

Returns:

- `info`: MerchantItemInfo

### C_MerchantFrame.GetMerchantCurrencies

MayReturnNothing=true

Returns:

- `currencies`: table<number>

### C_MerchantFrame.GetNumJunkItems

Returns:

- `numJunkItems`: number

### C_MerchantFrame.IsMerchantItemRefundable

SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex

Returns:

- `refundable`: bool

### C_MerchantFrame.IsSellAllJunkEnabled

Returns:

- `enabled`: bool

### C_MerchantFrame.SellAllJunkItems

## Events

### MERCHANT_CLOSED

SynchronousEvent=true

### MERCHANT_FILTER_ITEM_UPDATE

SynchronousEvent=true

Payload:

- `itemID`: number

### MERCHANT_SHOW

SynchronousEvent=true

### MERCHANT_UPDATE

SynchronousEvent=true

## Tables

### MerchantItemInfo

Fields:

- `name`: string?
- `texture`: fileID
- `price`: number [default=0]
- `stackCount`: number [default=0]
- `numAvailable`: number [default=0]
- `isPurchasable`: bool [default=false]
- `isUsable`: bool [default=false]
- `hasExtendedCost`: bool [default=false]
- `currencyID`: number?
- `spellID`: number?
- `isQuestStartItem`: bool [default=false]
