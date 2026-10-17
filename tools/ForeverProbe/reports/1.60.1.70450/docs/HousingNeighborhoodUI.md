# HousingNeighborhoodUI

Namespace `C_HousingNeighborhood`.

Environment=All, Predicates={}

## Functions

### C_HousingNeighborhood.CanReturnAfterVisitingHouse

Returns:

- `canReturn`: bool

### C_HousingNeighborhood.CancelInviteToNeighborhood -- Only available when interacting with a bulletin board game object

SecretArguments=AllowedWhenUntainted

Arguments:

- `playerName`: cstring

### C_HousingNeighborhood.DemoteToResident -- Only available when interacting with a bulletin board game object

SecretArguments=AllowedWhenUntainted

Arguments:

- `playerGUID`: WOWGUID

### C_HousingNeighborhood.GetCornerstoneHouseInfo -- Only available when interacting with a cornerstone game object

Returns:

- `houseInfo`: HouseInfo

### C_HousingNeighborhood.GetCornerstoneNeighborhoodInfo -- Only available when interacting with a cornerstone game object

Returns:

- `neighborhoodInfo`: NeighborhoodInfo

### C_HousingNeighborhood.GetCornerstonePurchaseMode -- Only available when interacting with a cornerstone game object

Returns:

- `purchaseMode`: CornerstonePurchaseMode

### C_HousingNeighborhood.GetCurrentNeighborhoodTextureSuffix

Returns:

- `neighborhoodTextureSuffix`: cstring

### C_HousingNeighborhood.GetDiscountedMovePrice -- Only available when interacting with a cornerstone game object

Returns:

- `movePrice`: number -- Can be negative if the refund from moving is more than the cost of the new house

### C_HousingNeighborhood.GetMoveCooldownTime -- Only available when interacting with a cornerstone game object

Returns:

- `movecooldownTime`: number

### C_HousingNeighborhood.GetNeighborhoodMapData

Returns:

- `neighborhoodPlots`: table<NeighborhoodPlotMapInfo>

### C_HousingNeighborhood.GetNeighborhoodName

Returns:

- `neighborhoodName`: string

### C_HousingNeighborhood.GetNeighborhoodPlotName

SecretArguments=AllowedWhenUntainted

Arguments:

- `plotIndex`: number

Returns:

- `neighborhoodName`: string

### C_HousingNeighborhood.GetPreviousHouseIdentifier -- Only available when interacting with a cornerstone game object

Returns:

- `previousHouseIdentifier`: string

### C_HousingNeighborhood.HasPermissionToPurchase -- Only available when interacting with a cornerstone game object

Returns:

- `cantPurchaseReason`: PurchaseHouseDisabledReason

### C_HousingNeighborhood.InvitePlayerToNeighborhood -- Only available when interacting with a bulletin board game object

SecretArguments=AllowedWhenUntainted

Arguments:

- `playerName`: cstring

### C_HousingNeighborhood.IsNeighborhoodManager

Returns:

- `isManager`: bool

### C_HousingNeighborhood.IsNeighborhoodOwner

Returns:

- `isOwner`: bool

### C_HousingNeighborhood.IsPlayerInOtherPlayersPlot -- This returns true if the player is in a plot that is owned by another player

Returns:

- `isInUnownedPlot`: bool

### C_HousingNeighborhood.IsPlotAvailableForPurchase -- Only available when interacting with a cornerstone game object

Returns:

- `isAvailable`: bool

### C_HousingNeighborhood.IsPlotOwnedByPlayer -- Only available when interacting with a cornerstone game object

Returns:

- `isPlayerOwned`: bool

### C_HousingNeighborhood.OnBulletinBoardClosed

### C_HousingNeighborhood.OnCornerstoneClosed

### C_HousingNeighborhood.PromoteToManager -- Only available when interacting with a bulletin board game object

SecretArguments=AllowedWhenUntainted

Arguments:

- `playerGUID`: WOWGUID

### C_HousingNeighborhood.RequestNeighborhoodInfo

### C_HousingNeighborhood.RequestNeighborhoodRoster -- Only available when interacting with a bulletin board game object

### C_HousingNeighborhood.RequestPendingNeighborhoodInvites -- Only available when interacting with a bulletin board game object

### C_HousingNeighborhood.TransferNeighborhoodOwnership -- Only available when interacting with a bulletin board game object

SecretArguments=AllowedWhenUntainted

Arguments:

- `playerGUID`: WOWGUID

### C_HousingNeighborhood.TryEvictPlayer -- Only available when interacting with a bulletin board game object

SecretArguments=AllowedWhenUntainted

Arguments:

- `plotID`: number

### C_HousingNeighborhood.TryMoveHouse -- Only available when interacting with a cornerstone game object

### C_HousingNeighborhood.TryPurchasePlot -- Only available when interacting with a cornerstone game object

## Events

### CANCEL_NEIGHBORHOOD_INVITE_RESPONSE

SynchronousEvent=true

Payload:

- `result`: NeighborhoodInviteResult
- `playerName`: cstring?

### CLOSE_PLOT_CORNERSTONE

SynchronousEvent=true

### NEIGHBORHOOD_INFO_UPDATED

SynchronousEvent=true

Payload:

- `neighborhoodInfo`: NeighborhoodInfo

### NEIGHBORHOOD_INVITE_RESPONSE

SynchronousEvent=true

Payload:

- `result`: NeighborhoodInviteResult

### NEIGHBORHOOD_MAP_DATA_UPDATED

UniqueEvent=true

### NEIGHBORHOOD_NAME_UPDATED

UniqueEvent=true

Payload:

- `neighborhoodGuid`: WOWGUID
- `neighborhoodName`: cstring

### OPEN_PLOT_CORNERSTONE

SynchronousEvent=true

### PENDING_NEIGHBORHOOD_INVITES_RECIEVED

SynchronousEvent=true

Payload:

- `result`: NeighborhoodInviteResult
- `pendingInviteList`: table<string>?

### PURCHASE_PLOT_RESULT

SynchronousEvent=true

Payload:

- `result`: number

### SHOW_PLAYER_EVICTED_DIALOG

SynchronousEvent=true

### UPDATE_BULLETIN_BOARD_MEMBER_TYPE

SynchronousEvent=true

Payload:

- `player`: WOWGUID
- `residentType`: ResidentType

### UPDATE_BULLETIN_BOARD_ROSTER

SynchronousEvent=true

Payload:

- `neighborhoodInfo`: NeighborhoodInfo
- `rosterMemberList`: table<NeighborhoodRosterMemberInfo>

### UPDATE_BULLETIN_BOARD_ROSTER_STATUSES

SynchronousEvent=true

Payload:

- `rosterMemberList`: table<NeighborhoodRosterMemberUpdateInfo>

## Tables

### CornerstonePurchaseMode

MaxValue=2, MinValue=0, NumValues=3

Fields:

- `Basic`: CornerstonePurchaseMode [= 0]
- `Import`: CornerstonePurchaseMode [= 1]
- `Move`: CornerstonePurchaseMode [= 2]
