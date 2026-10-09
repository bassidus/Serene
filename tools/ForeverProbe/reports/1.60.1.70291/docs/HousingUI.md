# HousingUI

Namespace `C_Housing`.

Environment=All, Predicates={}

## Functions

### C_Housing.AcceptNeighborhoodOwnership

### C_Housing.CanEditCharter

Returns:

- `canEditCharter`: bool

### C_Housing.CanTakeReportScreenshot

SecretArguments=AllowedWhenUntainted

Arguments:

- `plotIndex`: number

Returns:

- `reason`: InvalidPlotScreenshotReason

### C_Housing.CreateGuildNeighborhood

SecretArguments=AllowedWhenUntainted

Arguments:

- `neighborhoodName`: cstring

### C_Housing.CreateNeighborhoodCharter

SecretArguments=AllowedWhenUntainted

Arguments:

- `neighborhoodName`: cstring

### C_Housing.DeclineNeighborhoodOwnership

### C_Housing.DoesFactionMatchNeighborhood

SecretArguments=AllowedWhenUntainted

Arguments:

- `neighborhoodGUID`: WOWGUID

Returns:

- `factionMatches`: bool

### C_Housing.EditNeighborhoodCharter

SecretArguments=AllowedWhenUntainted

Arguments:

- `neighborhoodName`: cstring

### C_Housing.GetCurrentHouseInfo

Returns:

- `houseInfo`: HouseInfo?

### C_Housing.GetCurrentHouseLevelFavor

SecretArguments=AllowedWhenUntainted

Arguments:

- `houseGuid`: WOWGUID

### C_Housing.GetCurrentHouseRefundAmount

Returns:

- `refundAmount`: number

### C_Housing.GetCurrentNeighborhoodGUID

Returns:

- `neighborhoodGUID`: WOWGUID?

### C_Housing.GetHouseLevelFavorForLevel

SecretArguments=AllowedWhenUntainted

Arguments:

- `level`: number

Returns:

- `houseFavor`: number

### C_Housing.GetHouseLevelRewardsForLevel

SecretArguments=AllowedWhenUntainted

Arguments:

- `level`: number

### C_Housing.GetHousingAccessFlags

Returns:

- `accessFlags`: HouseSettingFlags

### C_Housing.GetMaxHouseLevel

Returns:

- `level`: number

### C_Housing.GetNeighborhoodTextureSuffix

SecretArguments=AllowedWhenUntainted

Arguments:

- `neighborhoodGUID`: WOWGUID

Returns:

- `neighborhoodTextureSuffix`: cstring

### C_Housing.GetOthersOwnedHouses

SecretArguments=AllowedWhenUntainted

Arguments:

- `playerGUID`: WOWGUID?
- `bnetID`: number?
- `isInPlayersGuild`: bool

### C_Housing.GetPlayerOwnedHouses

### C_Housing.GetTrackedHouseGuid

Returns:

- `trackedHouse`: WOWGUID?

### C_Housing.GetUIMapIDForNeighborhood

SecretArguments=AllowedWhenUntainted

Arguments:

- `neighborhoodGuid`: WOWGUID

Returns:

- `uiMapID`: number?

### C_Housing.GetVisitCooldownInfo

MayReturnNothing=true

Returns:

- `spellCooldownInfo`: SpellCooldownInfo

### C_Housing.HasHousingExpansionAccess

Returns:

- `hasAccess`: bool

### C_Housing.HouseFinderDeclineNeighborhoodInvitation

### C_Housing.HouseFinderIgnoreNeighborhood

SecretArguments=AllowedWhenUntainted

Arguments:

- `neighborhoodGuid`: WOWGUID

### C_Housing.HouseFinderRequestNeighborhoods

### C_Housing.HouseFinderRequestReservationAndPort

SecretArguments=AllowedWhenUntainted

Arguments:

- `neighborhoodGuid`: WOWGUID
- `plotID`: number

### C_Housing.IsHousingMarketCartFullRemoveEnabled

Returns:

- `isHousingMarketCartFullRemoveEnabled`: bool

### C_Housing.IsHousingMarketEnabled

Returns:

- `isHousingMarketEnabled`: bool

### C_Housing.IsHousingMarketShopEnabled

Returns:

- `isHousingMarketShopEnabled`: bool

### C_Housing.IsHousingServiceEnabled

Returns:

- `isAvailable`: bool

### C_Housing.IsInsideHouse

Returns:

- `isInside`: bool

### C_Housing.IsInsideHouseOrPlot

Returns:

- `isInside`: bool

### C_Housing.IsInsideOwnedHouse

Returns:

- `isInsideOwnedHouse`: bool

### C_Housing.IsInsideOwnedHouseOrPlot

Returns:

- `isInsideOwnedHouseOrPlot`: bool

### C_Housing.IsInsideOwnedPlot

Returns:

- `isInside`: bool

### C_Housing.IsInsidePlot

Returns:

- `isInside`: bool

### C_Housing.IsOnNeighborhoodMap

Returns:

- `isOnNeighborhoodMap`: bool

### C_Housing.LeaveHouse

### C_Housing.OnCharterConfirmationAccepted

### C_Housing.OnCharterConfirmationClosed

### C_Housing.OnCreateCharterNeighborhoodClosed

### C_Housing.OnCreateGuildNeighborhoodClosed

### C_Housing.OnHouseFinderClickPlot

SecretArguments=AllowedWhenUntainted

Arguments:

- `plotID`: number

### C_Housing.OnRequestSignatureClicked

### C_Housing.OnSignCharterClicked

SecretArguments=AllowedWhenUntainted

Arguments:

- `charterOwnerGUID`: WOWGUID

### C_Housing.RelinquishHouse

SecretArguments=AllowedWhenUntainted

Arguments:

- `houseGuid`: WOWGUID

### C_Housing.RequestCurrentHouseInfo

### C_Housing.RequestHouseFinderNeighborhoodData

SecretArguments=AllowedWhenUntainted

Arguments:

- `neighborhoodGuid`: WOWGUID
- `neighborhoodName`: cstring

### C_Housing.RequestPlayerCharacterList

### C_Housing.ResetHouse -- Resets all contents of the house, based on the provided scope; API restricted to ensure this can't be triggered without the player getting ample notice and confirmation

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `resetScope`: HousingHouseScope

### C_Housing.ReturnAfterVisitingHouse

HasRestrictions=true

### C_Housing.SaveHouseSettings

SecretArguments=AllowedWhenUntainted

Arguments:

- `playerGUID`: WOWGUID
- `accessFlags`: HouseSettingFlags

### C_Housing.SearchBNetFriendNeighborhoods

SecretArguments=AllowedWhenUntainted

Arguments:

- `bnetName`: cstring

Returns:

- `isValidBnetFriend`: bool

### C_Housing.SearchBNetFriendNeighborhoodsByID

SecretArguments=AllowedWhenUntainted

Arguments:

- `bnetID`: number

Returns:

- `isValidBnetFriend`: bool

### C_Housing.SetTrackedHouseGuid

SecretArguments=AllowedWhenUntainted

Arguments:

- `trackedHouse`: WOWGUID?

### C_Housing.StartTutorial

### C_Housing.TeleportHome

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `neighborhoodGUID`: WOWGUID
- `houseGUID`: WOWGUID
- `plotID`: number

### C_Housing.TryRenameNeighborhood

SecretArguments=AllowedWhenUntainted

Arguments:

- `neighborhoodName`: cstring

### C_Housing.ValidateCreateGuildNeighborhoodSize

### C_Housing.ValidateNeighborhoodName

SecretArguments=AllowedWhenUntainted

Arguments:

- `neighborhoodName`: cstring

### C_Housing.VisitHouse

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `neighborhoodGUID`: WOWGUID
- `houseGUID`: WOWGUID
- `plotID`: number

## Events

### ADD_NEIGHBORHOOD_CHARTER_SIGNATURE

SynchronousEvent=true

Payload:

- `signature`: cstring

### B_NET_NEIGHBORHOOD_LIST_UPDATED

SynchronousEvent=true

Payload:

- `result`: HousingResult
- `neighborhoodInfos`: table<NeighborhoodInfo>?

### CLOSE_CHARTER_CONFIRMATION_UI

SynchronousEvent=true

### CLOSE_CREATE_CHARTER_NEIGHBORHOOD_UI

SynchronousEvent=true

### CLOSE_CREATE_GUILD_NEIGHBORHOOD_UI

SynchronousEvent=true

### CREATE_NEIGHBORHOOD_RESULT

SynchronousEvent=true

Payload:

- `result`: HousingResult
- `neighborhoodName`: cstring?

### CURRENT_HOUSE_INFO_RECIEVED

SynchronousEvent=true

Payload:

- `houseInfo`: HouseInfo

### CURRENT_HOUSE_INFO_UPDATED

SynchronousEvent=true

Payload:

- `houseInfo`: HouseInfo

### DECLINE_NEIGHBORHOOD_INVITATION_RESPONSE

SynchronousEvent=true

Payload:

- `success`: bool

### FORCE_REFRESH_HOUSE_FINDER

SynchronousEvent=true

### HOUSE_FINDER_NEIGHBORHOOD_DATA_RECIEVED

SynchronousEvent=true

Payload:

- `neighborhoodPlots`: table<NeighborhoodPlotMapInfo>

### HOUSE_INFO_UPDATED

SynchronousEvent=true

### HOUSE_LEVEL_CHANGED

SynchronousEvent=true

Payload:

- `newHouseLevelInfo`: HouseLevelInfo?

### HOUSE_LEVEL_FAVOR_UPDATED

SynchronousEvent=true

Payload:

- `houseLevelFavor`: HouseLevelFavor

### HOUSE_PLOT_ENTERED

SynchronousEvent=true

### HOUSE_PLOT_EXITED

SynchronousEvent=true

### HOUSE_RESERVATION_RESPONSE_RECIEVED

SynchronousEvent=true

Payload:

- `result`: HousingResult

### HOUSE_RESET_COMPLETED

SynchronousEvent=true

### HOUSE_RESET_FAILED

SynchronousEvent=true

Payload:

- `result`: HousingResult

### HOUSING_MARKET_AVAILABILITY_UPDATED

SynchronousEvent=true

### HOUSING_SERVICES_AVAILABILITY_UPDATED

SynchronousEvent=true

### IGNORE_NEIGHBORHOOD_RESPONSE

SynchronousEvent=true

Payload:

- `success`: bool
- `neighborhoodGuid`: WOWGUID

### MOVE_OUT_RESERVATION_UPDATED

SynchronousEvent=true

### NEIGHBORHOOD_GUILD_SIZE_VALIDATED

SynchronousEvent=true

Payload:

- `approved`: bool

### NEIGHBORHOOD_LIST_UPDATED

SynchronousEvent=true

Payload:

- `result`: HousingResult
- `neighborhoodInfos`: table<NeighborhoodInfo>?

### NEIGHBORHOOD_NAME_VALIDATED

SynchronousEvent=true

Payload:

- `approved`: bool

### NEW_HOUSING_ITEM_ACQUIRED

SynchronousEvent=true

Payload:

- `itemType`: HousingItemToastType
- `itemName`: cstring
- `icon`: fileID?

### OPEN_CHARTER_CONFIRMATION_UI

SynchronousEvent=true

Payload:

- `neighborhoodName`: string
- `locationName`: string

### OPEN_CREATE_CHARTER_NEIGHBORHOOD_UI

SynchronousEvent=true

Payload:

- `locationName`: cstring

### OPEN_CREATE_GUILD_NEIGHBORHOOD_UI

SynchronousEvent=true

Payload:

- `locationName`: cstring

### OPEN_NEIGHBORHOOD_CHARTER

SynchronousEvent=true

Payload:

- `neighborhoodInfo`: NeighborhoodInfo
- `signatures`: table<string>
- `requiredSignatures`: number

### OPEN_NEIGHBORHOOD_CHARTER_SIGNATURE_REQUEST

SynchronousEvent=true

Payload:

- `neighborhoodInfo`: NeighborhoodInfo

### PLAYER_CHARACTER_LIST_UPDATED

SynchronousEvent=true

Payload:

- `characterInfos`: table<HouseOwnerCharacterInfo>
- `ownerListIndex`: number

### PLAYER_HOUSE_LIST_UPDATED

SynchronousEvent=true

Payload:

- `houseInfos`: table<HouseInfo>

### RECEIVED_HOUSE_LEVEL_REWARDS

SynchronousEvent=true

Payload:

- `level`: number
- `rewards`: table<HouseLevelReward>

### REMOVE_NEIGHBORHOOD_CHARTER_SIGNATURE

SynchronousEvent=true

Payload:

- `signature`: cstring

### SHOW_NEIGHBORHOOD_OWNERSHIP_TRANSFER_DIALOG

SynchronousEvent=true

Payload:

- `neighborhoodName`: cstring
- `cosmeticOwnerName`: cstring

### TRACKED_HOUSE_CHANGED

SynchronousEvent=true

Payload:

- `trackedHouse`: WOWGUID?

### VIEW_HOUSES_LIST_RECIEVED

SynchronousEvent=true

Payload:

- `houseInfos`: table<HouseInfo>

## Tables

### CreateNeighborhoodErrorType

MaxValue=3, MinValue=0, NumValues=4

Fields:

- `None`: CreateNeighborhoodErrorType [= 0]
- `Profanity`: CreateNeighborhoodErrorType [= 1]
- `UndersizedGuild`: CreateNeighborhoodErrorType [= 2]
- `OversizedGuild`: CreateNeighborhoodErrorType [= 3]

### HousingItemToastType

MaxValue=4, MinValue=0, NumValues=5

Fields:

- `Room`: HousingItemToastType [= 0]
- `Fixture`: HousingItemToastType [= 1]
- `Customization`: HousingItemToastType [= 2]
- `Decor`: HousingItemToastType [= 3]
- `HouseType`: HousingItemToastType [= 4]
