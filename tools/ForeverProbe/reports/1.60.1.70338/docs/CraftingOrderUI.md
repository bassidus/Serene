# CraftingOrderUI

Namespace `C_CraftingOrders`.

Environment=All, Predicates={}

## Functions

### C_CraftingOrders.AreOrderNotesDisabled

Returns:

- `areNotesDisabled`: bool

### C_CraftingOrders.CalculateCraftingOrderPostingFee

SecretArguments=AllowedWhenUntainted

Arguments:

- `skillLineAbilityID`: number
- `orderType`: CraftingOrderType
- `orderDuration`: CraftingOrderDuration

Returns:

- `deposit`: WOWMONEY

### C_CraftingOrders.CanOrderSkillAbility

SecretArguments=AllowedWhenUntainted

Arguments:

- `skillLineAbilityID`: number

Returns:

- `canOrder`: bool

### C_CraftingOrders.CancelOrder

SecretArguments=AllowedWhenUntainted

Arguments:

- `orderID`: BigUInteger

### C_CraftingOrders.ClaimOrder

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `orderID`: BigUInteger
- `profession`: Profession

### C_CraftingOrders.CloseCrafterCraftingOrders

### C_CraftingOrders.CloseCustomerCraftingOrders

### C_CraftingOrders.FulfillOrder

SecretArguments=AllowedWhenUntainted

Arguments:

- `orderID`: BigUInteger
- `crafterNote`: string
- `profession`: Profession

### C_CraftingOrders.GetClaimedOrder

Returns:

- `order`: CraftingOrderInfo?

### C_CraftingOrders.GetCrafterBuckets

Returns:

- `buckets`: table<CraftingOrderBucketInfo>

### C_CraftingOrders.GetCrafterOrders

Returns:

- `orders`: table<CraftingOrderInfo>

### C_CraftingOrders.GetCraftingOrderTime

Returns:

- `time`: BigUInteger

### C_CraftingOrders.GetCustomerCategories

Returns:

- `categories`: table<CraftingOrderCustomerCategory>

### C_CraftingOrders.GetCustomerOptions

SecretArguments=AllowedWhenUntainted

Arguments:

- `params`: CraftingOrderCustomerSearchParams

Returns:

- `results`: CraftingOrderCustomerSearchResults

### C_CraftingOrders.GetCustomerOrders

Returns:

- `customerOrders`: table<CraftingOrderInfo>

### C_CraftingOrders.GetDefaultOrdersSkillLine

Returns:

- `skillLineID`: number?

### C_CraftingOrders.GetMyOrders

Returns:

- `myOrders`: table<CraftingOrderInfo>

### C_CraftingOrders.GetNumFavoriteCustomerOptions

Returns:

- `numFavorites`: BigUInteger

### C_CraftingOrders.GetOrderClaimInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `profession`: Profession

Returns:

- `claimInfo`: CraftingOrderClaimsRemainingInfo

### C_CraftingOrders.GetPersonalOrdersInfo

Returns:

- `infos`: table<CraftingOrderPersonalOrdersInfo>

### C_CraftingOrders.HasFavoriteCustomerOptions

Returns:

- `hasFavorites`: bool

### C_CraftingOrders.IsCustomerOptionFavorited

SecretArguments=AllowedWhenUntainted

Arguments:

- `recipeID`: number

Returns:

- `favorited`: bool

### C_CraftingOrders.ListMyOrders

SecretArguments=AllowedWhenUntainted

Arguments:

- `request`: CraftingOrderRequestMyOrdersInfo

### C_CraftingOrders.OpenCrafterCraftingOrders

### C_CraftingOrders.OpenCustomerCraftingOrders

### C_CraftingOrders.OrderCanBeRecrafted

SecretArguments=AllowedWhenUntainted

Arguments:

- `orderID`: BigUInteger

Returns:

- `recraftable`: bool

### C_CraftingOrders.ParseCustomerOptions

### C_CraftingOrders.PlaceNewOrder

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `orderInfo`: NewCraftingOrderInfo

### C_CraftingOrders.RejectOrder

SecretArguments=AllowedWhenUntainted

Arguments:

- `orderID`: BigUInteger
- `crafterNote`: string
- `profession`: Profession

### C_CraftingOrders.ReleaseOrder

SecretArguments=AllowedWhenUntainted

Arguments:

- `orderID`: BigUInteger
- `profession`: Profession

### C_CraftingOrders.RequestCrafterOrders

SecretArguments=AllowedWhenUntainted

Arguments:

- `request`: CraftingOrderRequestInfo

### C_CraftingOrders.RequestCustomerOrders

SecretArguments=AllowedWhenUntainted

Arguments:

- `request`: CraftingOrderRequestInfo

### C_CraftingOrders.SetCustomerOptionFavorited

SecretArguments=AllowedWhenUntainted

Arguments:

- `recipeID`: number
- `favorited`: bool

### C_CraftingOrders.ShouldShowCraftingOrderTab

Returns:

- `showTab`: bool

### C_CraftingOrders.SkillLineHasOrders

SecretArguments=AllowedWhenUntainted

Arguments:

- `skillLineID`: number

Returns:

- `hasOrders`: bool

### C_CraftingOrders.UpdateIgnoreList

## Events

### CRAFTING_HOUSE_DISABLED

SynchronousEvent=true

### CRAFTINGORDERS_CAN_REQUEST

SynchronousEvent=true

### CRAFTINGORDERS_CLAIM_ORDER_RESPONSE

SynchronousEvent=true

Payload:

- `result`: CraftingOrderResult
- `orderID`: BigUInteger

### CRAFTINGORDERS_CLAIMED_ORDER_ADDED

SynchronousEvent=true

### CRAFTINGORDERS_CLAIMED_ORDER_REMOVED

SynchronousEvent=true

### CRAFTINGORDERS_CLAIMED_ORDER_UPDATED

SynchronousEvent=true

Payload:

- `orderID`: BigUInteger

### CRAFTINGORDERS_CRAFT_ORDER_RESPONSE

SynchronousEvent=true

Payload:

- `result`: CraftingOrderResult
- `orderID`: BigUInteger

### CRAFTINGORDERS_CUSTOMER_FAVORITES_CHANGED

SynchronousEvent=true

### CRAFTINGORDERS_CUSTOMER_OPTIONS_PARSED

SynchronousEvent=true

### CRAFTINGORDERS_DISPLAY_CRAFTER_FULFILLED_MSG

SynchronousEvent=true

Payload:

- `orderTypeString`: cstring
- `itemNameString`: cstring
- `playerNameString`: cstring
- `tipAmount`: WOWMONEY
- `quantityCrafted`: number

### CRAFTINGORDERS_FULFILL_ORDER_RESPONSE

SynchronousEvent=true

Payload:

- `result`: CraftingOrderResult
- `orderID`: BigUInteger

### CRAFTINGORDERS_HIDE_CRAFTER

SynchronousEvent=true

### CRAFTINGORDERS_HIDE_CUSTOMER

SynchronousEvent=true

### CRAFTINGORDERS_ORDER_CANCEL_RESPONSE

SynchronousEvent=true

Payload:

- `result`: CraftingOrderResult

### CRAFTINGORDERS_ORDER_PLACEMENT_RESPONSE

SynchronousEvent=true

Payload:

- `result`: CraftingOrderResult

### CRAFTINGORDERS_REJECT_ORDER_RESPONSE

SynchronousEvent=true

Payload:

- `result`: CraftingOrderResult
- `orderID`: BigUInteger

### CRAFTINGORDERS_RELEASE_ORDER_RESPONSE

SynchronousEvent=true

Payload:

- `result`: CraftingOrderResult
- `orderID`: BigUInteger

### CRAFTINGORDERS_SHOW_CRAFTER

SynchronousEvent=true

### CRAFTINGORDERS_SHOW_CUSTOMER

SynchronousEvent=true

### CRAFTINGORDERS_UNEXPECTED_ERROR

SynchronousEvent=true

### CRAFTINGORDERS_UPDATE_CUSTOMER_NAME

SynchronousEvent=true

Payload:

- `customerName`: cstring
- `orderID`: BigUInteger

### CRAFTINGORDERS_UPDATE_ORDER_COUNT

SynchronousEvent=true

Payload:

- `orderType`: CraftingOrderType
- `numOrders`: number

### CRAFTINGORDERS_UPDATE_PERSONAL_ORDER_COUNTS

SynchronousEvent=true

### CRAFTINGORDERS_UPDATE_REWARDS

SynchronousEvent=true

Payload:

- `npcOrderRewards`: table<CraftingOrderRewardInfo>
- `orderID`: BigUInteger

## Tables

### CraftingOrderRequestInfo

Fields:

- `orderType`: CraftingOrderType
- `selectedSkillLineAbility`: number?
- `searchFavorites`: bool
- `initialNonPublicSearch`: bool
- `primarySort`: CraftingOrderSortInfo
- `secondarySort`: CraftingOrderSortInfo
- `forCrafter`: bool
- `offset`: number
- `callback`: CraftingOrderRequestCallback
- `profession`: Profession?

### CraftingOrderRequestMyOrdersInfo

Fields:

- `primarySort`: CraftingOrderSortInfo
- `secondarySort`: CraftingOrderSortInfo
- `offset`: number
- `callback`: CraftingOrderRequestMyOrdersCallback
