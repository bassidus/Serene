# AuctionHouse

Namespace `C_AuctionHouse`.

Environment=All, Predicates={}

## Functions

### C_AuctionHouse.CalculateCommodityDeposit

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemID`: number
- `duration`: luaIndex
- `quantity`: number

Returns:

- `depositCost`: number?

### C_AuctionHouse.CalculateItemDeposit

SecretArguments=AllowedWhenUntainted

Arguments:

- `item`: ItemLocation (ItemLocationMixin)
- `duration`: luaIndex
- `quantity`: number

Returns:

- `depositCost`: number?

### C_AuctionHouse.CanCancelAuction

SecretArguments=AllowedWhenUntainted

Arguments:

- `ownedAuctionID`: number

Returns:

- `canCancelAuction`: bool

### C_AuctionHouse.CancelAuction

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `ownedAuctionID`: number

### C_AuctionHouse.CancelCommoditiesPurchase

### C_AuctionHouse.CancelSell

### C_AuctionHouse.CloseAuctionHouse

### C_AuctionHouse.ConfirmCommoditiesPurchase

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemID`: number
- `quantity`: number

### C_AuctionHouse.ConfirmPostCommodity

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `item`: ItemLocation (ItemLocationMixin)
- `duration`: luaIndex
- `quantity`: number
- `unitPrice`: BigUInteger

### C_AuctionHouse.ConfirmPostItem

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `item`: ItemLocation (ItemLocationMixin)
- `duration`: luaIndex
- `quantity`: number
- `bid`: BigUInteger?
- `buyout`: BigUInteger?

### C_AuctionHouse.FavoritesAreAvailable

Returns:

- `favoritesAreAvailable`: bool

### C_AuctionHouse.GetAuctionInfoByID

SecretArguments=AllowedWhenUntainted

Arguments:

- `auctionID`: number

Returns:

- `priceInfo`: AuctionInfo?

### C_AuctionHouse.GetAuctionItemSubClasses

SecretArguments=AllowedWhenUntainted

Arguments:

- `classID`: number

Returns:

- `subClasses`: table<number>

### C_AuctionHouse.GetAvailablePostCount

SecretArguments=AllowedWhenUntainted

Arguments:

- `item`: ItemLocation (ItemLocationMixin)

Returns:

- `listCount`: number

### C_AuctionHouse.GetBidInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `bidIndex`: luaIndex

Returns:

- `bid`: BidInfo?

### C_AuctionHouse.GetBidType

SecretArguments=AllowedWhenUntainted

Arguments:

- `bidTypeIndex`: luaIndex

Returns:

- `typeItemKey`: ItemKey?

### C_AuctionHouse.GetBids

Returns:

- `bids`: table<BidInfo>

### C_AuctionHouse.GetBrowseResults

Returns:

- `browseResults`: table<BrowseResultInfo>

### C_AuctionHouse.GetCancelCost

SecretArguments=AllowedWhenUntainted

Arguments:

- `ownedAuctionID`: number

Returns:

- `cancelCost`: BigUInteger

### C_AuctionHouse.GetCommoditySearchResultInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemID`: number
- `commoditySearchResultIndex`: luaIndex

Returns:

- `result`: CommoditySearchResultInfo?

### C_AuctionHouse.GetCommoditySearchResultsQuantity

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemID`: number

Returns:

- `totalQuantity`: number

### C_AuctionHouse.GetExtraBrowseInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `itemKey`: ItemKey

Returns:

- `extraInfo`: number

### C_AuctionHouse.GetFilterGroups

Returns:

- `filterGroups`: table<AuctionHouseFilterGroup>

### C_AuctionHouse.GetItemCommodityStatus

SecretArguments=AllowedWhenUntainted

Arguments:

- `item`: ItemLocation (ItemLocationMixin)

Returns:

- `isCommodity`: ItemCommodityStatus

### C_AuctionHouse.GetItemKeyFromItem

SecretArguments=AllowedWhenUntainted

Arguments:

- `item`: ItemLocation (ItemLocationMixin)

Returns:

- `itemKey`: ItemKey

### C_AuctionHouse.GetItemKeyInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemKey`: ItemKey
- `restrictQualityToFilter`: bool [default=false]

Returns:

- `itemKeyInfo`: ItemKeyInfo?

### C_AuctionHouse.GetItemKeyRequiredLevel

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `itemKey`: ItemKey

Returns:

- `requiredLevel`: number

### C_AuctionHouse.GetItemKeySampleLink -- Returns a link for an item in this key's results with player-applied enchants, gems and reforges stripped

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemKey`: ItemKey

Returns:

- `sampleItemLink`: string?

### C_AuctionHouse.GetItemSearchResultInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemKey`: ItemKey
- `itemSearchResultIndex`: luaIndex

Returns:

- `result`: ItemSearchResultInfo?

### C_AuctionHouse.GetItemSearchResultsQuantity

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemKey`: ItemKey

Returns:

- `totalQuantity`: number

### C_AuctionHouse.GetMaxBidItemBid

Returns:

- `maxBid`: BigUInteger?

### C_AuctionHouse.GetMaxBidItemBuyout

Returns:

- `maxBuyout`: BigUInteger?

### C_AuctionHouse.GetMaxCommoditySearchResultPrice

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemID`: number

Returns:

- `maxUnitPrice`: BigUInteger?

### C_AuctionHouse.GetMaxItemSearchResultBid

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemKey`: ItemKey

Returns:

- `maxBid`: BigUInteger?

### C_AuctionHouse.GetMaxItemSearchResultBuyout

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemKey`: ItemKey

Returns:

- `maxBuyout`: BigUInteger?

### C_AuctionHouse.GetMaxOwnedAuctionBid

Returns:

- `maxBid`: BigUInteger?

### C_AuctionHouse.GetMaxOwnedAuctionBuyout

Returns:

- `maxBuyout`: BigUInteger?

### C_AuctionHouse.GetNumBidTypes

Returns:

- `numBidTypes`: number

### C_AuctionHouse.GetNumBids

Returns:

- `numBids`: number

### C_AuctionHouse.GetNumCommoditySearchResults

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemID`: number

Returns:

- `numSearchResults`: number

### C_AuctionHouse.GetNumItemSearchResults

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemKey`: ItemKey

Returns:

- `numItemSearchResults`: number

### C_AuctionHouse.GetNumOwnedAuctionTypes

Returns:

- `numOwnedAuctionTypes`: number

### C_AuctionHouse.GetNumOwnedAuctions

Returns:

- `numOwnedAuctions`: number

### C_AuctionHouse.GetNumReplicateItems

Returns:

- `numReplicateItems`: number

### C_AuctionHouse.GetOwnedAuctionInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `ownedAuctionIndex`: luaIndex

Returns:

- `ownedAuction`: OwnedAuctionInfo?

### C_AuctionHouse.GetOwnedAuctionType

SecretArguments=AllowedWhenUntainted

Arguments:

- `ownedAuctionTypeIndex`: luaIndex

Returns:

- `typeItemKey`: ItemKey?

### C_AuctionHouse.GetOwnedAuctions

Returns:

- `ownedAuctions`: table<OwnedAuctionInfo>

### C_AuctionHouse.GetQuoteDurationRemaining

Returns:

- `quoteDurationSeconds`: number

### C_AuctionHouse.GetReplicateItemBattlePetInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: number

Returns:

- `creatureID`: number
- `displayID`: number

### C_AuctionHouse.GetReplicateItemInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: number

Returns:

- `name`: string?
- `texture`: fileID?
- `count`: number
- `qualityID`: number
- `usable`: bool?
- `level`: number
- `levelType`: string?
- `minBid`: BigUInteger
- `minIncrement`: BigUInteger
- `buyoutPrice`: BigUInteger
- `bidAmount`: BigUInteger
- `highBidder`: string?
- `bidderFullName`: string?
- `owner`: string?
- `ownerFullName`: string?
- `saleStatus`: number
- `itemID`: number
- `hasAllInfo`: bool?

### C_AuctionHouse.GetReplicateItemLink

SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: number

Returns:

- `itemLink`: string?

### C_AuctionHouse.GetReplicateItemTimeLeft

SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: number

Returns:

- `timeLeft`: number

### C_AuctionHouse.GetTimeLeftBandInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `timeLeftBand`: AuctionHouseTimeLeftBand

Returns:

- `timeLeftMinSeconds`: number
- `timeLeftMaxSeconds`: number

### C_AuctionHouse.HasFavorites

Returns:

- `hasFavorites`: bool

### C_AuctionHouse.HasFullBidResults

Returns:

- `hasFullBidResults`: bool

### C_AuctionHouse.HasFullBrowseResults

Returns:

- `hasFullBrowseResults`: bool

### C_AuctionHouse.HasFullCommoditySearchResults

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemID`: number

Returns:

- `hasFullResults`: bool

### C_AuctionHouse.HasFullItemSearchResults

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemKey`: ItemKey

Returns:

- `hasFullResults`: bool

### C_AuctionHouse.HasFullOwnedAuctionResults

Returns:

- `hasFullOwnedAuctionResults`: bool

### C_AuctionHouse.HasMaxFavorites

Returns:

- `hasMaxFavorites`: bool

### C_AuctionHouse.HasSearchResults

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemKey`: ItemKey

Returns:

- `hasSearchResults`: bool

### C_AuctionHouse.IsFavoriteItem

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemKey`: ItemKey

Returns:

- `isFavorite`: bool

### C_AuctionHouse.IsSellItemValid

SecretArguments=AllowedWhenUntainted

Arguments:

- `item`: ItemLocation (ItemLocationMixin)
- `displayError`: bool [default=true]

Returns:

- `valid`: bool

### C_AuctionHouse.IsThrottledMessageSystemReady

Returns:

- `canSendThrottledMessage`: bool

### C_AuctionHouse.MakeItemKey

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemID`: number
- `itemLevel`: number [default=0]
- `itemSuffix`: number [default=0]
- `battlePetSpeciesID`: number [default=0]

Returns:

- `itemKey`: ItemKey

### C_AuctionHouse.PlaceBid

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `auctionID`: number
- `bidAmount`: BigUInteger

### C_AuctionHouse.PostCommodity

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `item`: ItemLocation (ItemLocationMixin)
- `duration`: luaIndex
- `quantity`: number
- `unitPrice`: BigUInteger

Returns:

- `needsConfirmation`: bool

### C_AuctionHouse.PostItem

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `item`: ItemLocation (ItemLocationMixin)
- `duration`: luaIndex
- `quantity`: number
- `bid`: BigUInteger?
- `buyout`: BigUInteger?

Returns:

- `needsConfirmation`: bool

### C_AuctionHouse.QueryBids

SecretArguments=AllowedWhenUntainted

Arguments:

- `sorts`: table<AuctionHouseSortType>
- `auctionIDs`: table<number>

### C_AuctionHouse.QueryOwnedAuctions

SecretArguments=AllowedWhenUntainted

Arguments:

- `sorts`: table<AuctionHouseSortType>

### C_AuctionHouse.RefreshCommoditySearchResults

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemID`: number

### C_AuctionHouse.RefreshItemSearchResults

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemKey`: ItemKey
- `minLevelFilter`: number?
- `maxLevelFilter`: number?

### C_AuctionHouse.ReplicateItems -- This function should be used in place of an 'allItem' QueryAuctionItems call to query the entire auction house.

### C_AuctionHouse.RequestMoreBrowseResults

### C_AuctionHouse.RequestMoreCommoditySearchResults

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemID`: number

Returns:

- `hasFullResults`: bool

### C_AuctionHouse.RequestMoreItemSearchResults

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemKey`: ItemKey

Returns:

- `hasFullResults`: bool

### C_AuctionHouse.RequestOwnedAuctionBidderInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `auctionID`: number

Returns:

- `bidderName`: cstring

### C_AuctionHouse.SearchForFavorites

SecretArguments=AllowedWhenUntainted

Arguments:

- `sorts`: table<AuctionHouseSortType>

### C_AuctionHouse.SearchForItemKeys

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemKeys`: table<ItemKey>
- `sorts`: table<AuctionHouseSortType>

### C_AuctionHouse.SendBrowseQuery

SecretArguments=AllowedWhenUntainted

Arguments:

- `query`: AuctionHouseBrowseQuery

### C_AuctionHouse.SendSearchQuery -- Search queries are restricted to 100 calls per minute. These should not be used to query the entire auction house. See ReplicateItems

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemKey`: ItemKey
- `sorts`: table<AuctionHouseSortType>
- `separateOwnerItems`: bool
- `minLevelFilter`: number [default=0]
- `maxLevelFilter`: number [default=0]

### C_AuctionHouse.SendSellSearchQuery -- Search queries are restricted to 100 calls per minute. These should not be used to query the entire auction house. See ReplicateItems. ItemKey should have its iLVL and suffix cleared before calling.

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemKey`: ItemKey
- `sorts`: table<AuctionHouseSortType>
- `separateOwnerItems`: bool

### C_AuctionHouse.SetFavoriteItem

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemKey`: ItemKey
- `setFavorite`: bool

### C_AuctionHouse.ShouldAutoPopulatePrice

Returns:

- `shouldAutoPopulatePrice`: bool

### C_AuctionHouse.StartCommoditiesPurchase

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `itemID`: number
- `quantity`: number

### C_AuctionHouse.SupportsCopperValues

Returns:

- `supportsCopperValues`: bool

## Events

### AUCTION_CANCELED

SynchronousEvent=true

Payload:

- `auctionID`: number

### AUCTION_HOUSE_AUCTION_CREATED -- This signal is not used in the base UI but is included for AddOn ease-of-use.

SynchronousEvent=true

Payload:

- `auctionID`: number

### AUCTION_HOUSE_AUCTIONS_EXPIRED

SynchronousEvent=true

Payload:

- `auctionID`: number

### AUCTION_HOUSE_BROWSE_FAILURE

SynchronousEvent=true

### AUCTION_HOUSE_BROWSE_RESULTS_ADDED

SynchronousEvent=true

Payload:

- `addedBrowseResults`: table<BrowseResultInfo>

### AUCTION_HOUSE_BROWSE_RESULTS_UPDATED

SynchronousEvent=true

### AUCTION_HOUSE_CLOSED

SynchronousEvent=true

### AUCTION_HOUSE_DISABLED

SynchronousEvent=true

### AUCTION_HOUSE_FAVORITES_UPDATED

SynchronousEvent=true

### AUCTION_HOUSE_ITEM_DELIVERY_DELAY_UPDATE

SynchronousEvent=true

Payload:

- `purchasedItemDeliveryDelay`: number
- `cancelledItemDeliveryDelay`: number

### AUCTION_HOUSE_NEW_BID_RECEIVED

SynchronousEvent=true

Payload:

- `auctionID`: number

### AUCTION_HOUSE_NEW_RESULTS_RECEIVED -- This signal is not used in the base UI but is included for AddOn ease-of-use. Payload is nil for browse queries.

SynchronousEvent=true

Payload:

- `itemKey`: ItemKey?

### AUCTION_HOUSE_POST_ERROR

SynchronousEvent=true

### AUCTION_HOUSE_POST_WARNING

SynchronousEvent=true

### AUCTION_HOUSE_PURCHASE_COMPLETED

SynchronousEvent=true

Payload:

- `auctionID`: number

### AUCTION_HOUSE_SCRIPT_DEPRECATED

SynchronousEvent=true

### AUCTION_HOUSE_SHOW

SynchronousEvent=true

### AUCTION_HOUSE_SHOW_COMMODITY_WON_NOTIFICATION

SynchronousEvent=true

Payload:

- `commodityName`: string
- `commodityQuantity`: number

### AUCTION_HOUSE_SHOW_ERROR

SynchronousEvent=true

Payload:

- `error`: AuctionHouseError

### AUCTION_HOUSE_SHOW_FORMATTED_NOTIFICATION

SynchronousEvent=true

Payload:

- `notification`: AuctionHouseNotification
- `text`: string
- `auctionID`: number?

### AUCTION_HOUSE_SHOW_NOTIFICATION

SynchronousEvent=true

Payload:

- `notification`: AuctionHouseNotification

### AUCTION_HOUSE_THROTTLED_MESSAGE_DROPPED

SynchronousEvent=true

### AUCTION_HOUSE_THROTTLED_MESSAGE_QUEUED

SynchronousEvent=true

### AUCTION_HOUSE_THROTTLED_MESSAGE_RESPONSE_RECEIVED

SynchronousEvent=true

### AUCTION_HOUSE_THROTTLED_MESSAGE_SENT

SynchronousEvent=true

### AUCTION_HOUSE_THROTTLED_SYSTEM_READY

SynchronousEvent=true

### AUCTION_MULTISELL_FAILURE

SynchronousEvent=true

### AUCTION_MULTISELL_START

SynchronousEvent=true

Payload:

- `numRepetitions`: number

### AUCTION_MULTISELL_UPDATE

SynchronousEvent=true

Payload:

- `createdCount`: number
- `totalToCreate`: number

### BID_ADDED

SynchronousEvent=true

Payload:

- `bidID`: number

### BIDS_UPDATED

SynchronousEvent=true

### COMMODITY_PRICE_UNAVAILABLE

SynchronousEvent=true

### COMMODITY_PRICE_UPDATED

SynchronousEvent=true

Payload:

- `updatedUnitPrice`: BigUInteger
- `updatedTotalPrice`: BigUInteger

### COMMODITY_PURCHASE_FAILED

SynchronousEvent=true

### COMMODITY_PURCHASE_SUCCEEDED

SynchronousEvent=true

### COMMODITY_PURCHASED

SynchronousEvent=true

Payload:

- `itemID`: number
- `quantity`: number

### COMMODITY_SEARCH_RESULTS_ADDED

SynchronousEvent=true

Payload:

- `itemID`: number

### COMMODITY_SEARCH_RESULTS_RECEIVED

UniqueEvent=true

### COMMODITY_SEARCH_RESULTS_UPDATED

UniqueEvent=true

Payload:

- `itemID`: number

### EXTRA_BROWSE_INFO_RECEIVED

SynchronousEvent=true

Payload:

- `itemID`: number

### ITEM_KEY_ITEM_INFO_RECEIVED

SynchronousEvent=true

Payload:

- `itemID`: number

### ITEM_PURCHASED

SynchronousEvent=true

Payload:

- `itemID`: number

### ITEM_SEARCH_RESULTS_ADDED

SynchronousEvent=true

Payload:

- `itemKey`: ItemKey

### ITEM_SEARCH_RESULTS_UPDATED

UniqueEvent=true

Payload:

- `itemKey`: ItemKey
- `newAuctionID`: number?

### OWNED_AUCTION_BIDDER_INFO_RECEIVED

SynchronousEvent=true

Payload:

- `auctionID`: number
- `bidderName`: cstring

### OWNED_AUCTIONS_UPDATED

SynchronousEvent=true

### REPLICATE_ITEM_LIST_UPDATE

SynchronousEvent=true

## Tables

### AuctionHouseFilterCategory

MaxValue=2, MinValue=0, NumValues=3

Fields:

- `Uncategorized`: AuctionHouseFilterCategory [= 0]
- `Equipment`: AuctionHouseFilterCategory [= 1]
- `Rarity`: AuctionHouseFilterCategory [= 2]

### AuctionStatus

MaxValue=1, MinValue=0, NumValues=2

Fields:

- `Active`: AuctionStatus [= 0]
- `Sold`: AuctionStatus [= 1]

### ItemCommodityStatus

MaxValue=2, MinValue=0, NumValues=3

Fields:

- `Unknown`: ItemCommodityStatus [= 0]
- `Item`: ItemCommodityStatus [= 1]
- `Commodity`: ItemCommodityStatus [= 2]

### AuctionHouseBrowseQuery

Fields:

- `searchString`: string
- `sorts`: table<AuctionHouseSortType>
- `minLevel`: number?
- `maxLevel`: number?
- `filters`: table<AuctionHouseFilter>?
- `itemClassFilters`: table<AuctionHouseItemClassFilter>?

### AuctionHouseFilterGroup

Fields:

- `category`: AuctionHouseFilterCategory
- `filters`: table<AuctionHouseFilter>

### AuctionHouseItemClassFilter

Fields:

- `classID`: number
- `subClassID`: number?
- `inventoryType`: InventoryType?

### AuctionHouseSortType

Fields:

- `sortOrder`: AuctionHouseSortOrder
- `reverseSort`: bool

### AuctionInfo

Fields:

- `itemKey`: ItemKey
- `itemLink`: string?
- `minBid`: WOWMONEY?
- `bidAmount`: WOWMONEY?
- `buyoutAmount`: WOWMONEY?
- `bidder`: WOWGUID?

### BidInfo

Fields:

- `auctionID`: number
- `itemKey`: ItemKey
- `itemLink`: string?
- `timeLeft`: AuctionHouseTimeLeftBand
- `minBid`: BigUInteger?
- `bidAmount`: BigUInteger?
- `buyoutAmount`: BigUInteger?
- `bidder`: WOWGUID?

### BrowseResultInfo

Fields:

- `itemKey`: ItemKey
- `appearanceLink`: string?
- `totalQuantity`: number
- `minPrice`: BigUInteger
- `containsOwnerItem`: bool

### CommoditySearchResultInfo

Fields:

- `itemID`: number
- `quantity`: number
- `unitPrice`: BigUInteger
- `auctionID`: number
- `owners`: table<string>
- `totalNumberOfOwners`: number
- `timeLeftSeconds`: number?
- `numOwnerItems`: number
- `containsOwnerItem`: bool
- `containsAccountItem`: bool

### ItemKey

Fields:

- `itemID`: number
- `itemLevel`: number [default=0]
- `itemSuffix`: number [default=0]
- `battlePetSpeciesID`: number [default=0]

### ItemKeyInfo

Fields:

- `itemID`: number
- `battlePetSpeciesID`: number
- `itemName`: string
- `battlePetLink`: string?
- `appearanceLink`: string?
- `quality`: ItemQuality
- `iconFileID`: number
- `isPet`: bool
- `isCommodity`: bool
- `isEquipment`: bool

### ItemSearchResultInfo

Fields:

- `itemKey`: ItemKey
- `owners`: table<string>
- `totalNumberOfOwners`: number
- `timeLeft`: AuctionHouseTimeLeftBand
- `auctionID`: number
- `quantity`: number
- `itemLink`: string?
- `containsOwnerItem`: bool
- `containsAccountItem`: bool
- `containsSocketedItem`: bool
- `bidder`: WOWGUID?
- `minBid`: BigUInteger?
- `bidAmount`: BigUInteger?
- `buyoutAmount`: BigUInteger?
- `timeLeftSeconds`: number?

### OwnedAuctionInfo

Fields:

- `auctionID`: number
- `itemKey`: ItemKey
- `itemLink`: string?
- `status`: AuctionStatus
- `quantity`: number
- `timeLeftSeconds`: number?
- `timeLeft`: AuctionHouseTimeLeftBand?
- `bidAmount`: BigUInteger?
- `buyoutAmount`: BigUInteger?
- `bidder`: string?

### ReplicateItemInfo

Fields:

- `name`: string?
- `texture`: fileID?
- `count`: number
- `qualityID`: number
- `usable`: bool?
- `level`: number
- `levelType`: string?
- `minBid`: BigUInteger
- `minIncrement`: BigUInteger
- `buyoutPrice`: BigUInteger
- `bidAmount`: BigUInteger
- `highBidder`: string?
- `bidderFullName`: string?
- `owner`: string?
- `ownerFullName`: string?
- `saleStatus`: number
- `itemID`: number
- `hasAllInfo`: bool?
