# MapUI

Namespace `C_Map`.

Environment=All, Predicates={}

## Functions

### C_Map.CanSetUserWaypointOnMap

SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

Returns:

- `canSet`: bool

### C_Map.ClearUserWaypoint

### C_Map.CloseWorldMapInteraction

### C_Map.GetAreaInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `areaID`: number

Returns:

- `name`: cstring

### C_Map.GetBestMapForUnit -- Only works for the player and party members.

SecretArguments=AllowedWhenUntainted

Arguments:

- `unitToken`: UnitToken

Returns:

- `uiMapID`: number?

### C_Map.GetBountySetMaps

SecretArguments=AllowedWhenUntainted

Arguments:

- `bountySetID`: number

Returns:

- `mapIDs`: table<number>

### C_Map.GetFallbackWorldMapID

Returns:

- `uiMapID`: number

### C_Map.GetMapArtBackgroundAtlas

SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

Returns:

- `atlasName`: textureAtlas

### C_Map.GetMapArtHelpTextPosition

SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

Returns:

- `position`: MapCanvasPosition

### C_Map.GetMapArtID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

Returns:

- `uiMapArtID`: number

### C_Map.GetMapArtLayerTextures

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number
- `layerIndex`: luaIndex

Returns:

- `textures`: table<fileID>

### C_Map.GetMapArtLayers

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

Returns:

- `layerInfo`: table<UiMapLayerInfo>

### C_Map.GetMapArtZoneTextPosition

SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

Returns:

- `position`: MapCanvasPosition

### C_Map.GetMapBannersForMap

SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

Returns:

- `mapBanners`: table<MapBannerInfo>

### C_Map.GetMapChildrenInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number
- `mapType`: UIMapType?
- `allDescendants`: bool?

Returns:

- `info`: table<UiMapDetails>

### C_Map.GetMapDisplayInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

Returns:

- `hideIcons`: bool

### C_Map.GetMapGroupID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

Returns:

- `uiMapGroupID`: number

### C_Map.GetMapGroupMembersInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapGroupID`: number

Returns:

- `info`: table<UiMapGroupMemberInfo>

### C_Map.GetMapHighlightInfoAtPosition

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number
- `x`: number
- `y`: number

Returns:

- `fileDataID`: fileID
- `atlasID`: textureAtlas
- `texturePercentageX`: number
- `texturePercentageY`: number
- `textureX`: number
- `textureY`: number
- `scrollChildX`: number
- `scrollChildY`: number

### C_Map.GetMapHighlightPulseInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

Returns:

- `fileDataID`: fileID
- `atlasID`: textureAtlas
- `texturePercentageX`: number
- `texturePercentageY`: number
- `textureX`: number
- `textureY`: number
- `scrollChildX`: number
- `scrollChildY`: number

### C_Map.GetMapInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

Returns:

- `info`: UiMapDetails

### C_Map.GetMapInfoAtPosition

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number
- `x`: number
- `y`: number
- `ignoreZoneMapPositionData`: bool?

Returns:

- `info`: UiMapDetails

### C_Map.GetMapLevels

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

Returns:

- `playerMinLevel`: number
- `playerMaxLevel`: number
- `petMinLevel`: number [default=0]
- `petMaxLevel`: number [default=0]

### C_Map.GetMapLinksForMap

SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

Returns:

- `mapLinks`: table<MapLinkInfo>

### C_Map.GetMapPosFromWorldPos

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `continentID`: number
- `worldPosition`: vector2 (Vector2DMixin)
- `overrideUiMapID`: number?

Returns:

- `uiMapID`: number
- `mapPosition`: vector2 (Vector2DMixin)

### C_Map.GetMapRectOnMap

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number
- `topUiMapID`: number

Returns:

- `minX`: number
- `maxX`: number
- `minY`: number
- `maxY`: number

### C_Map.GetMapWorldSize -- Returns the size in yards of the area represented by the map.

SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

Returns:

- `width`: number
- `height`: number

### C_Map.GetPlayerMapPosition -- Only works for the player and party members.

SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number
- `unitToken`: UnitToken

Returns:

- `position`: vector2 (Vector2DMixin)?

### C_Map.GetUserWaypoint

MayReturnNothing=true

Returns:

- `point`: UiMapPoint

### C_Map.GetUserWaypointFromHyperlink

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `hyperlink`: string

Returns:

- `point`: UiMapPoint

### C_Map.GetUserWaypointHyperlink

MayReturnNothing=true

Returns:

- `hyperlink`: string

### C_Map.GetUserWaypointPositionForMap

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

Returns:

- `mapPosition`: vector2 (Vector2DMixin)

### C_Map.GetWorldPosFromMapPos

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number
- `mapPosition`: vector2 (Vector2DMixin)

Returns:

- `continentID`: number
- `worldPosition`: vector2 (Vector2DMixin)

### C_Map.HasUserWaypoint

Returns:

- `hasUserWaypoint`: bool

### C_Map.IsCityMap

SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

Returns:

- `isCityMap`: bool

### C_Map.IsMapValidForNavBarDropdown

SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

Returns:

- `isValid`: bool

### C_Map.MapHasArt

SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

Returns:

- `hasArt`: bool

### C_Map.OpenWorldMap

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number?

### C_Map.RequestPreloadMap

SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

### C_Map.SetUserWaypoint

SecretArguments=AllowedWhenUntainted

Arguments:

- `point`: UiMapPoint

Returns:

- `wasSet`: bool

## Events

### NEW_WMO_CHUNK

SynchronousEvent=true

### PLAYER_MAP_CHANGED

SynchronousEvent=true

Payload:

- `oldMapID`: number
- `newMapID`: number

### USER_WAYPOINT_UPDATED

SynchronousEvent=true

### WORLD_MAP_OPEN

SynchronousEvent=true

Payload:

- `uiMapID`: number?

### ZONE_CHANGED

SynchronousEvent=true

### ZONE_CHANGED_INDOORS

SynchronousEvent=true

### ZONE_CHANGED_NEW_AREA

SynchronousEvent=true

## Tables

### MapBannerInfo

Fields:

- `areaPoiID`: number
- `name`: cstring
- `atlasName`: string
- `uiTextureKit`: textureKit?

### MapLinkInfo

Fields:

- `areaPoiID`: number
- `position`: vector2 (Vector2DMixin)
- `name`: cstring
- `atlasName`: string
- `linkedUiMapID`: number

### UiMapDetails

Fields:

- `mapID`: number
- `name`: cstring
- `mapType`: UIMapType
- `parentMapID`: number
- `flags`: UIMapFlag

### UiMapGroupMemberInfo

Fields:

- `mapID`: number
- `relativeHeightIndex`: number
- `name`: cstring

### UiMapHighlightInfo

Fields:

- `fileDataID`: fileID
- `atlasID`: textureAtlas
- `texturePercentageX`: number
- `texturePercentageY`: number
- `textureX`: number
- `textureY`: number
- `scrollChildX`: number
- `scrollChildY`: number

### UiMapLayerInfo

Fields:

- `layerWidth`: number
- `layerHeight`: number
- `tileWidth`: number
- `tileHeight`: number
- `minScale`: number
- `maxScale`: number
- `additionalZoomSteps`: number
