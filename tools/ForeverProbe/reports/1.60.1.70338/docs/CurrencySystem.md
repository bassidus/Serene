# CurrencySystem

Namespace `C_CurrencyInfo`.

Environment=All, Predicates={}

## Functions

### C_CurrencyInfo.CanTransferCurrency

SecretArguments=AllowedWhenUntainted

Arguments:

- `currencyID`: number

Returns:

- `canTransferCurrency`: bool
- `failureReason`: AccountCurrencyTransferResult?

### C_CurrencyInfo.DoesCurrentFilterRequireAccountCurrencyData

Returns:

- `doesCurrentFilterRequireAccountCurrencyData`: bool

### C_CurrencyInfo.DoesWarModeBonusApply

SecretArguments=AllowedWhenUntainted

Arguments:

- `currencyID`: number

Returns:

- `warModeApplies`: bool?
- `limitOncePerTooltip`: bool?

### C_CurrencyInfo.ExpandCurrencyList

SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex
- `expand`: bool

### C_CurrencyInfo.FetchCurrencyDataFromAccountCharacters

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `currencyID`: number

Returns:

- `accountCurrencyData`: table<CharacterCurrencyData>

### C_CurrencyInfo.FetchCurrencyTransferTransactions

Returns:

- `currencyTransferTransactions`: table<CurrencyTransferTransaction>

### C_CurrencyInfo.GetAzeriteCurrencyID

Returns:

- `azeriteCurrencyID`: number

### C_CurrencyInfo.GetBackpackCurrencyInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex

Returns:

- `info`: BackpackCurrencyInfo

### C_CurrencyInfo.GetBasicCurrencyInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `currencyType`: number
- `quantity`: number?

Returns:

- `info`: CurrencyDisplayInfo

### C_CurrencyInfo.GetCoinIcon

SecretArguments=AllowedWhenUntainted

Arguments:

- `amount`: WOWMONEY

Returns:

- `result`: fileID

### C_CurrencyInfo.GetCoinText

SecretArguments=AllowedWhenUntainted

Arguments:

- `amount`: WOWMONEY
- `separator`: cstring [default=, ]

Returns:

- `result`: cstring

### C_CurrencyInfo.GetCoinTextureString

SecretArguments=AllowedWhenUntainted

Arguments:

- `amount`: WOWMONEY
- `fontHeight`: number [default=14]

Returns:

- `result`: cstring

### C_CurrencyInfo.GetCostToTransferCurrency

SecretArguments=AllowedWhenUntainted

Arguments:

- `currencyID`: number
- `quantity`: number

Returns:

- `totalQuantityConsumed`: number?

### C_CurrencyInfo.GetCurrencyContainerInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `currencyType`: number
- `quantity`: number

Returns:

- `info`: CurrencyDisplayInfo

### C_CurrencyInfo.GetCurrencyDescription

SecretArguments=AllowedWhenUntainted

Arguments:

- `type`: number

Returns:

- `description`: cstring

### C_CurrencyInfo.GetCurrencyFilter

Returns:

- `filterType`: CurrencyFilterType

### C_CurrencyInfo.GetCurrencyIDFromLink

SecretArguments=AllowedWhenUntainted

Arguments:

- `currencyLink`: cstring

Returns:

- `currencyID`: number

### C_CurrencyInfo.GetCurrencyInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `type`: number

Returns:

- `info`: CurrencyInfo

### C_CurrencyInfo.GetCurrencyInfoFromLink

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `link`: string

Returns:

- `info`: CurrencyInfo

### C_CurrencyInfo.GetCurrencyLink

SecretArguments=AllowedWhenUntainted

Arguments:

- `type`: number
- `amount`: number?

Returns:

- `link`: cstring

### C_CurrencyInfo.GetCurrencyListInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex

Returns:

- `info`: CurrencyInfo

### C_CurrencyInfo.GetCurrencyListLink

SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex

Returns:

- `link`: cstring

### C_CurrencyInfo.GetCurrencyListSize

Returns:

- `currencyListSize`: number

### C_CurrencyInfo.GetDragonIslesSuppliesCurrencyID

Returns:

- `dragonIslesSuppliesCurrencyID`: number

### C_CurrencyInfo.GetFactionGrantedByCurrency -- Gets the faction ID for currency that is immediately converted into reputation with that faction instead.

SecretArguments=AllowedWhenUntainted

Arguments:

- `currencyID`: number

Returns:

- `factionID`: number?

### C_CurrencyInfo.GetMaxTransferableAmountFromQuantity

SecretArguments=AllowedWhenUntainted

Arguments:

- `currencyID`: number
- `requestedQuantity`: number

Returns:

- `maxTransferableAmount`: number?

### C_CurrencyInfo.GetPlayerCurrencyCategoryInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `categoryID`: number
- `includeAccountWide`: bool [default=true]

Returns:

- `info`: PlayerCurrencyCategoryInfo

### C_CurrencyInfo.GetWarResourcesCurrencyID

Returns:

- `warResourceCurrencyID`: number

### C_CurrencyInfo.IsAccountCharacterCurrencyDataReady

Returns:

- `isReady`: bool

### C_CurrencyInfo.IsAccountTransferableCurrency

SecretArguments=AllowedWhenUntainted

Arguments:

- `currencyID`: number

Returns:

- `isAccountTransferableCurrency`: bool

### C_CurrencyInfo.IsAccountWideCurrency

SecretArguments=AllowedWhenUntainted

Arguments:

- `currencyID`: number

Returns:

- `isAccountWideCurrency`: bool

### C_CurrencyInfo.IsCurrencyContainer

SecretArguments=AllowedWhenUntainted

Arguments:

- `currencyID`: number
- `quantity`: number

Returns:

- `isCurrencyContainer`: bool

### C_CurrencyInfo.IsCurrencyTransferInProgress

Returns:

- `currencyTransferInProgress`: bool

### C_CurrencyInfo.IsCurrencyTransferTransactionDataReady

Returns:

- `isReady`: bool

### C_CurrencyInfo.PickupCurrency

SecretArguments=AllowedWhenUntainted

Arguments:

- `type`: number

### C_CurrencyInfo.PlayerHasMaxQuantity

SecretArguments=AllowedWhenUntainted

Arguments:

- `currencyID`: number

Returns:

- `hasMaxQuantity`: bool

### C_CurrencyInfo.PlayerHasMaxWeeklyQuantity

SecretArguments=AllowedWhenUntainted

Arguments:

- `currencyID`: number

Returns:

- `hasMaxWeeklyQuantity`: bool

### C_CurrencyInfo.RequestCurrencyDataForAccountCharacters

### C_CurrencyInfo.RequestCurrencyFromAccountCharacter

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `sourceCharacterGUID`: WOWGUID
- `currencyID`: number
- `quantity`: number

### C_CurrencyInfo.SetCurrencyBackpack

SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex
- `backpack`: bool

### C_CurrencyInfo.SetCurrencyBackpackByID

SecretArguments=AllowedWhenUntainted

Arguments:

- `currencyType`: number
- `backpack`: bool

### C_CurrencyInfo.SetCurrencyFilter

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `filterType`: CurrencyFilterType

### C_CurrencyInfo.SetCurrencyUnused

SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex
- `unused`: bool

## Events

### ACCOUNT_CHARACTER_CURRENCY_DATA_RECEIVED

SynchronousEvent=true

### ACCOUNT_MONEY

SynchronousEvent=true

### CURRENCY_DISPLAY_UPDATE

SynchronousEvent=true

Payload:

- `currencyType`: number?
- `quantity`: number?
- `quantityChange`: number?
- `quantityGainSource`: number?
- `destroyReason`: number?

### CURRENCY_TRANSFER_FAILED

SynchronousEvent=true

Payload:

- `failureReason`: AccountCurrencyTransferResult

### CURRENCY_TRANSFER_INITIATED

SynchronousEvent=true

### CURRENCY_TRANSFER_LOG_UPDATE

SynchronousEvent=true

### CURRENCY_TRANSFER_SUCCESS

SynchronousEvent=true

### PLAYER_MONEY

SynchronousEvent=true

## Tables

### BackpackCurrencyInfo

Fields:

- `name`: string
- `quantity`: number
- `iconFileID`: fileID
- `currencyTypesID`: number

### CharacterCurrencyData

Fields:

- `characterGUID`: WOWGUID
- `characterName`: string
- `fullCharacterName`: string
- `currencyID`: number
- `quantity`: number

### CurrencyDisplayInfo

Fields:

- `name`: string
- `description`: string
- `icon`: number
- `quality`: number
- `displayAmount`: number
- `actualAmount`: number

### CurrencyInfo

Fields:

- `name`: cstring
- `description`: cstring
- `currencyID`: number
- `isHeader`: bool
- `isHeaderExpanded`: bool
- `currencyListDepth`: number
- `isTypeUnused`: bool
- `isShowInBackpack`: bool
- `quantity`: number
- `trackedQuantity`: number
- `iconFileID`: fileID
- `maxQuantity`: number
- `canEarnPerWeek`: bool
- `quantityEarnedThisWeek`: number
- `isTradeable`: bool
- `quality`: ItemQuality
- `maxWeeklyQuantity`: number
- `totalEarned`: number
- `discovered`: bool
- `useTotalEarnedForMaxQty`: bool
- `isAccountWide`: bool
- `isAccountTransferable`: bool
- `transferPercentage`: number?
- `rechargingCycleDurationMS`: number
- `rechargingAmountPerCycle`: number

### CurrencyTransferTransaction

Fields:

- `sourceCharacterGUID`: WOWGUID
- `sourceCharacterName`: string [default=]
- `fullSourceCharacterName`: string [default=]
- `destinationCharacterGUID`: WOWGUID
- `destinationCharacterName`: string [default=]
- `fullDestinationCharacterName`: string [default=]
- `currencyType`: number
- `quantityTransferred`: number
- `totalQuantityConsumed`: number
- `timestamp`: time_t

### PlayerCurrencyCategoryInfo

Fields:

- `categoryName`: cstring
- `currencyTypes`: table<number>
- `childCategories`: table<number>
