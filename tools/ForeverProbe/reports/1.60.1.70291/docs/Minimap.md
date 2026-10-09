# Minimap

Namespace `C_Minimap`.

Environment=All, Predicates={}

## Functions

### C_Minimap.CanTrackBattlePets

Returns:

- `CanTrackBattlePets`: bool

### C_Minimap.ClearAllTracking

### C_Minimap.ClearMinimapInsetInfo

### C_Minimap.GetDefaultTrackingValue

SecretArguments=AllowedWhenUntainted

Arguments:

- `filterType`: MinimapTrackingFilter

Returns:

- `defaultValue`: bool

### C_Minimap.GetDrawGroundTextures

Returns:

- `draw`: bool

### C_Minimap.GetNumQuestPOIWorldEffects

Returns:

- `worldEffectCount`: number

### C_Minimap.GetNumTrackingTypes

Returns:

- `numTrackingTypes`: number

### C_Minimap.GetPOITextureCoords

SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: number?

Returns:

- `textureCoordsX`: number
- `textureCoordsY`: number
- `textureCoordsZ`: number
- `textureCoordsW`: number

### C_Minimap.GetTrackingFilter

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellIndex`: luaIndex

Returns:

- `trackingType`: MinimapScriptTrackingFilter

### C_Minimap.GetTrackingInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellIndex`: luaIndex

Returns:

- `trackingInfo`: MinimapScriptTrackingInfo?

### C_Minimap.GetUiMapID

Returns:

- `uiMapID`: number?

### C_Minimap.GetViewRadius

Returns:

- `yards`: number

### C_Minimap.IsFilteredOut

SecretArguments=AllowedWhenUntainted

Arguments:

- `filterType`: MinimapTrackingFilter

Returns:

- `isFiltered`: bool

### C_Minimap.IsInsideQuestBlob

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `isInside`: bool

### C_Minimap.IsRotateMinimapIgnored

Returns:

- `isIgnored`: bool

### C_Minimap.IsTrackingAccountCompletedQuests

Returns:

- `IsTrackingAccountCompletedQuests`: bool

### C_Minimap.IsTrackingBattlePets

Returns:

- `isTrackingBattlePets`: bool

### C_Minimap.IsTrackingHiddenQuests

Returns:

- `isTrackingHiddenQuests`: bool

### C_Minimap.SetDrawGroundTextures

SecretArguments=AllowedWhenUntainted

Arguments:

- `draw`: bool

### C_Minimap.SetIgnoreRotateMinimap

SecretArguments=AllowedWhenUntainted

Arguments:

- `ignore`: bool

### C_Minimap.SetMinimapInsetInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `minAngle`: number
- `maxAngle`: number
- `scalar`: number

### C_Minimap.SetTracking

SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex
- `on`: bool

### C_Minimap.ShouldUseHybridMinimap

Returns:

- `shouldUse`: bool

## Events

### MINIMAP_PING

CallbackEvent=true, HasRestrictions=true, SecretPayloads=true

Payload:

- `unitTarget`: UnitTokenVariant
- `y`: number
- `x`: number

### MINIMAP_UPDATE_TRACKING

UniqueEvent=true

### MINIMAP_UPDATE_ZOOM

UniqueEvent=true

### PLAYER_INSIDE_QUEST_BLOB_STATE_CHANGED

SynchronousEvent=true

Payload:

- `questID`: number
- `isInside`: bool

## Tables

### MinimapScriptTrackingFilter

Fields:

- `spellID`: number?
- `filterID`: MinimapTrackingFilter?

### MinimapScriptTrackingInfo

Fields:

- `name`: cstring
- `texture`: fileID
- `active`: bool
- `type`: cstring
- `subType`: number
- `spellID`: number?
