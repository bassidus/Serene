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

### C_SecureTransfer.GetMailReceiveInfo

HasRestrictions=true

Returns:

- `mailInfo`: MailReceiveInfo

### C_SecureTransfer.GetMailSendInfo

HasRestrictions=true

Returns:

- `mailInfo`: MailSendInfo

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

### C_SecureTransfer.ShouldShowTradeRMTWarning

HasRestrictions=true

Returns:

- `shouldShow`: bool

### C_SecureTransfer.TakeMailMoney

HasRestrictions=true

## Events

### SECURE_TRANSFER_CANCEL

SynchronousEvent=true

### SECURE_TRANSFER_CONFIRM_HOUSING_PURCHASE

SynchronousEvent=true

### SECURE_TRANSFER_CONFIRM_SEND_MAIL

SynchronousEvent=true

### SECURE_TRANSFER_CONFIRM_TAKE_MAIL_MONEY

SynchronousEvent=true

### SECURE_TRANSFER_CONFIRM_TRADE_ACCEPT

SynchronousEvent=true

### SECURE_TRANSFER_HOUSING_CURRENCY_PURCHASE_CONFIRMATION

SynchronousEvent=true

## Tables

### MailReceiveInfo

Fields:

- `sender`: string
- `money`: number

### MailSendInfo

Fields:

- `target`: string
- `sendMoney`: number
