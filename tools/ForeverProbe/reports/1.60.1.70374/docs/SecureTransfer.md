# SecureTransfer

Namespace `C_SecureTransfer`.

Environment=All, Predicates={}

## Functions

### C_SecureTransfer.AcceptTrade

HasRestrictions=true

### C_SecureTransfer.Cancel

HasRestrictions=true

### C_SecureTransfer.CompleteHousingPurchase

HasRestrictions=true

### C_SecureTransfer.CompleteHousingVCPurchase

HasRestrictions=true

### C_SecureTransfer.GetHousingPurchaseCost

HasRestrictions=true

Returns:

- `totalCost`: number

### C_SecureTransfer.GetHousingPurchaseQuantity

HasRestrictions=true

Returns:

- `quantity`: number

### C_SecureTransfer.GetHousingVCPurchaseProductID

HasRestrictions=true

Returns:

- `productID`: number

### C_SecureTransfer.GetMailInfo

HasRestrictions=true

Returns:

- `mailInfo`: MailInfo

### C_SecureTransfer.GetTradePartner

HasRestrictions=true

Returns:

- `name`: string?

### C_SecureTransfer.SendMail

HasRestrictions=true

### C_SecureTransfer.ShouldShowTradeOfferWarning

HasRestrictions=true

Returns:

- `shouldShow`: bool

## Events

### SECURE_TRANSFER_CANCEL

SynchronousEvent=true

### SECURE_TRANSFER_CONFIRM_HOUSING_PURCHASE

SynchronousEvent=true

### SECURE_TRANSFER_CONFIRM_SEND_MAIL

SynchronousEvent=true

### SECURE_TRANSFER_CONFIRM_TRADE_ACCEPT

SynchronousEvent=true

### SECURE_TRANSFER_HOUSING_CURRENCY_PURCHASE_CONFIRMATION

SynchronousEvent=true

## Tables

### MailInfo

Fields:

- `target`: string
- `sendMoney`: number
