# Bank

Namespace `C_Bank`.

Environment=All, Predicates={}

## Functions

### C_Bank.AreAnyBankTypesViewable

Returns:

- `areAnyBankTypesViewable`: bool

### C_Bank.AutoDepositItemsIntoBank

SecretArguments=AllowedWhenUntainted

Arguments:

- `bankType`: BankType

### C_Bank.BankBagTypeAndIDToInvSlot

SecretArguments=AllowedWhenUntainted

Arguments:

- `bankType`: BankType
- `slotIndex`: luaIndex

Returns:

- `slot`: number?

### C_Bank.CanDepositMoney

SecretArguments=AllowedWhenUntainted

Arguments:

- `bankType`: BankType

Returns:

- `canDepositMoney`: bool

### C_Bank.CanPurchaseBankTab

SecretArguments=AllowedWhenUntainted

Arguments:

- `bankType`: BankType

Returns:

- `canPurchaseBankTab`: bool

### C_Bank.CanUseBank

SecretArguments=AllowedWhenUntainted

Arguments:

- `bankType`: BankType

Returns:

- `canUseBank`: bool

### C_Bank.CanViewBank

SecretArguments=AllowedWhenUntainted

Arguments:

- `bankType`: BankType

Returns:

- `canViewBank`: bool

### C_Bank.CanWithdrawMoney

SecretArguments=AllowedWhenUntainted

Arguments:

- `bankType`: BankType

Returns:

- `canWithdrawMoney`: bool

### C_Bank.CloseBankFrame

### C_Bank.DepositMoney

SecretArguments=AllowedWhenUntainted

Arguments:

- `bankType`: BankType
- `amount`: WOWMONEY

### C_Bank.DoesBankTypeSupportAutoDeposit

SecretArguments=AllowedWhenUntainted

Arguments:

- `bankType`: BankType

Returns:

- `doesBankTypeSupportAutoDeposit`: bool

### C_Bank.DoesBankTypeSupportMoneyTransfer

SecretArguments=AllowedWhenUntainted

Arguments:

- `bankType`: BankType

Returns:

- `doesBankTypeSupportMoneyTransfer`: bool

### C_Bank.FetchBankLockedReason

SecretArguments=AllowedWhenUntainted

Arguments:

- `bankType`: BankType

Returns:

- `reason`: BankLockedReason?

### C_Bank.FetchDepositedMoney

SecretArguments=AllowedWhenUntainted

Arguments:

- `bankType`: BankType

Returns:

- `amount`: WOWMONEY

### C_Bank.FetchMaxNumBankTabs

SecretArguments=AllowedWhenUntainted

Arguments:

- `bankType`: BankType

Returns:

- `numPurchasedBankTabs`: number

### C_Bank.FetchNextPurchasableBankTabData

SecretArguments=AllowedWhenUntainted

Arguments:

- `bankType`: BankType

Returns:

- `nextPurchasableTabData`: PurchasableBankTabData?

### C_Bank.FetchNumPurchasedBankTabs

SecretArguments=AllowedWhenUntainted

Arguments:

- `bankType`: BankType

Returns:

- `numPurchasedBankTabs`: number

### C_Bank.FetchPurchasedBankTabData

SecretArguments=AllowedWhenUntainted

Arguments:

- `bankType`: BankType

Returns:

- `purchasedBankTabData`: table<BankTabData>

### C_Bank.FetchPurchasedBankTabIDs

SecretArguments=AllowedWhenUntainted

Arguments:

- `bankType`: BankType

Returns:

- `purchasedBankTabIDs`: table<BagIndex>

### C_Bank.FetchViewableBankTypes

Returns:

- `viewableBankTypes`: table<BankType>

### C_Bank.HasMaxBankTabs

SecretArguments=AllowedWhenUntainted

Arguments:

- `bankType`: BankType

Returns:

- `hasMaxBankTabs`: bool

### C_Bank.IsItemAllowedInBankType

SecretArguments=AllowedWhenUntainted

Arguments:

- `bankType`: BankType
- `itemLocation`: ItemLocation (ItemLocationMixin)

Returns:

- `isItemAllowedInBankType`: bool

### C_Bank.PurchaseBankTab

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `bankType`: BankType

### C_Bank.ShouldUsePlayerBagsInBank

Returns:

- `shouldUsePlayerBagsInBank`: bool

### C_Bank.UpdateBankTabSettings

SecretArguments=AllowedWhenUntainted

Arguments:

- `bankType`: BankType
- `tabID`: BagIndex
- `tabName`: cstring
- `tabIcon`: cstring
- `depositFlags`: BagSlotFlags

### C_Bank.WithdrawMoney

SecretArguments=AllowedWhenUntainted

Arguments:

- `bankType`: BankType
- `amount`: WOWMONEY

## Events

### BANK_BAG_SLOT_FLAGS_UPDATED

SynchronousEvent=true

Payload:

- `slot`: number

### BANK_TAB_SETTINGS_UPDATED

SynchronousEvent=true

Payload:

- `bankType`: BankType

### BANK_TABS_CHANGED

SynchronousEvent=true

Payload:

- `bankType`: BankType

### BANKFRAME_CLOSED

SynchronousEvent=true

### BANKFRAME_OPENED

SynchronousEvent=true

### PLAYER_ACCOUNT_BANK_TAB_SLOTS_CHANGED

SynchronousEvent=true

Payload:

- `slot`: number

### PLAYERBANKSLOTS_CHANGED

SynchronousEvent=true

Payload:

- `slot`: number

## Tables

### BankLockedReason

MaxValue=3, MinValue=0, NumValues=4

Fields:

- `None`: BankLockedReason [= 0]
- `NoAccountInventoryLock`: BankLockedReason [= 1]
- `BankDisabled`: BankLockedReason [= 2]
- `BankConversionFailed`: BankLockedReason [= 3]

### BankTabData

Fields:

- `ID`: number
- `bankType`: BankType
- `name`: cstring
- `icon`: fileID
- `depositFlags`: BagSlotFlags
- `tabCleanupConfirmation`: cstring
- `tabNameEditBoxHeader`: cstring

### PurchasableBankTabData

Fields:

- `tabCost`: BigUInteger
- `canAfford`: bool
- `purchasePromptTitle`: cstring
- `purchasePromptBody`: cstring
- `purchasePromptConfirmation`: cstring
