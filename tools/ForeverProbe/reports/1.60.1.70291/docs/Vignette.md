# Vignette

Namespace `C_VignetteInfo`.

Environment=All, Predicates={}

## Functions

### C_VignetteInfo.FindBestUniqueVignette

SecretArguments=AllowedWhenUntainted

Arguments:

- `vignetteGUIDs`: table<WOWGUID>

Returns:

- `bestUniqueVignetteIndex`: luaIndex?

### C_VignetteInfo.GetHealthPercent

SecretArguments=AllowedWhenUntainted

Arguments:

- `vignetteGUID`: WOWGUID

Returns:

- `healthPct`: number?

### C_VignetteInfo.GetRecommendedGroupSize

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `vignetteGUID`: WOWGUID

Returns:

- `minGroupSize`: number
- `maxGroupSize`: number

### C_VignetteInfo.GetVignetteInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `vignetteGUID`: WOWGUID

Returns:

- `vignetteInfo`: VignetteInfo?

### C_VignetteInfo.GetVignettePosition

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `vignetteGUID`: WOWGUID
- `uiMapID`: number

Returns:

- `vignettePosition`: vector2 (Vector2DMixin)
- `vignetteFacing`: number?

### C_VignetteInfo.GetVignettes

Returns:

- `vignetteGUIDs`: table<WOWGUID>

## Events

### VIGNETTE_MINIMAP_UPDATED

UniqueEvent=true

Payload:

- `vignetteGUID`: WOWGUID
- `onMinimap`: bool

### VIGNETTES_UPDATED

SynchronousEvent=true

## Tables

### VignetteInfo

Fields:

- `vignetteGUID`: WOWGUID
- `objectGUID`: WOWGUID
- `name`: cstring
- `isDead`: bool
- `onWorldMap`: bool
- `zoneInfiniteAOI`: bool
- `onMinimap`: bool
- `isUnique`: bool
- `inFogOfWar`: bool
- `atlasName`: textureAtlas
- `hasTooltip`: bool
- `vignetteID`: number
- `type`: VignetteType
- `rewardQuestID`: number
- `tooltipWidgetSet`: number?
- `iconWidgetSet`: number?
- `addPaddingAboveTooltipWidgets`: bool?
- `mapPin`: UIMapPinInfo?
- `objectiveType`: VignetteObjectiveType?
