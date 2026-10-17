# AreaPoiInfo

Namespace `C_AreaPoiInfo`.

Environment=All, Predicates={}

## Functions

### C_AreaPoiInfo.GetAreaPOIForMap

SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

Returns:

- `areaPoiIDs`: table<number>

### C_AreaPoiInfo.GetAreaPOIInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number?
- `areaPoiID`: number

Returns:

- `poiInfo`: AreaPOIInfo

### C_AreaPoiInfo.GetAreaPOISecondsLeft -- Returns the number of seconds until the POI expires.

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `areaPoiID`: number

Returns:

- `secondsLeft`: number

### C_AreaPoiInfo.GetDelvesForMap -- Returns all area POIInfos flagged as delves for the given map.

SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

Returns:

- `areaPoiIDs`: table<number>

### C_AreaPoiInfo.GetDragonridingRacesForMap -- Returns all area POIInfos flagged as dragonriding races for the given map.

SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

Returns:

- `areaPoiIDs`: table<number>

### C_AreaPoiInfo.GetEventsForMap -- Returns all area POIInfos flagged as events for the given map.

SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

Returns:

- `areaPoiIDs`: table<number>

### C_AreaPoiInfo.GetQuestHubsForMap -- Returns all area POIInfos flagged as quest hubs for the given map.

SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

Returns:

- `areaPoiIDs`: table<number>

### C_AreaPoiInfo.IsAreaPOITimed -- This statically determines if the POI is timed, GetAreaPOITimeLeft retrieves the value from the server and may return nothing for long intervals

SecretArguments=AllowedWhenUntainted

Arguments:

- `areaPoiID`: number

Returns:

- `isTimed`: bool
- `hideTimerInTooltip`: bool?

## Events

### AREA_POIS_UPDATED

UniqueEvent=true

## Tables

### AreaPOIInfo

Fields:

- `areaPoiID`: number
- `position`: vector2 (Vector2DMixin)
- `name`: cstring
- `description`: cstring?
- `linkedUiMapID`: number?
- `textureIndex`: number?
- `tooltipWidgetSet`: number?
- `iconWidgetSet`: number?
- `atlasName`: string?
- `uiTextureKit`: textureKit?
- `shouldGlow`: bool
- `factionID`: number?
- `isPrimaryMapForPOI`: bool
- `isAlwaysOnFlightmap`: bool
- `addPaddingAboveTooltipWidgets`: bool?
- `highlightWorldQuestsOnHover`: bool
- `highlightVignettesOnHover`: bool
- `isCurrentEvent`: bool
- `isSuppressible`: bool
- `isLocked`: bool [default=false]
