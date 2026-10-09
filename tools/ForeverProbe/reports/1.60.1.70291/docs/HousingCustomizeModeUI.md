# HousingCustomizeModeUI

Namespace `C_HousingCustomizeMode`.

Environment=All, Predicates={}

## Functions

### C_HousingCustomizeMode.ApplyDyeToSelectedDecor -- If a dyeable decor is selected, applies a specific dye color in a specific slot as a preview; See CommitDyesForSelectedDecor to actually save applied dye changes

SecretArguments=AllowedWhenUntainted

Arguments:

- `dyeSlotID`: number
- `dyeColorID`: number? -- If not provided, clears the dye from the specified dye slot, returning that part of the decor asset to its default color

### C_HousingCustomizeMode.ApplyPetToSelectedDecor -- If a decor is selected that supports pets, applies a specific petID to be shown on that decor

SecretArguments=AllowedWhenUntainted

Arguments:

- `petID`: WOWGUID?
- `petBehavior`: HousingPetBehaviorType

### C_HousingCustomizeMode.ApplyThemeToRoom -- Attempt to apply a specific theme set (aka style) to all applicable room components in the current room

SecretArguments=AllowedWhenUntainted

Arguments:

- `themeSetID`: number

### C_HousingCustomizeMode.ApplyThemeToSelectedRoomComponent -- Attempt to apply a specific theme set (aka style) to the currently selected room component only

SecretArguments=AllowedWhenUntainted

Arguments:

- `themeSetID`: number

### C_HousingCustomizeMode.ApplyWallpaperToAllWalls -- Attempt to apply a specific wallpaper (aka material/texture) to all applicable room components in the current room

SecretArguments=AllowedWhenUntainted

Arguments:

- `roomComponentTextureRecID`: number

### C_HousingCustomizeMode.ApplyWallpaperToSelectedRoomComponent -- Attempt to apply a specific wallpaper (aka material/texture) to the currently selected room component only

SecretArguments=AllowedWhenUntainted

Arguments:

- `roomComponentTextureRecID`: number

### C_HousingCustomizeMode.CancelActiveEditing -- Cancels all in-progress editing of the selected target, which will reset any unapplied customization changes and deselect the active target

### C_HousingCustomizeMode.ClearDyesForSelectedDecor -- Clears all previewed dye changes on the selected decor; Does not clear any already saved dyes that were previously applied

### C_HousingCustomizeMode.ClearTargetRoomComponent -- Deselect the currently selected room component, if there is one

### C_HousingCustomizeMode.CommitDyesForSelectedDecor -- Attempt to save all previewed dye changes made to the selected decor

Returns:

- `hasChanges`: bool -- True if there were any changes to save

### C_HousingCustomizeMode.GetHoveredDecorInfo -- Returns info for the placed decor instance currently being hovered, if there is one

Returns:

- `info`: HousingDecorInstanceInfo?

### C_HousingCustomizeMode.GetHoveredRoomComponentInfo -- Returns info for the room component currently being hovered, if there is one

Returns:

- `info`: HousingRoomComponentInstanceInfo?

### C_HousingCustomizeMode.GetNumDyesToRemoveOnSelectedDecor -- If a dyeable decor instance is selected, returns how many dye slots would be cleared on applying all currently previewed dye changes

Returns:

- `numDyesToRemove`: number

### C_HousingCustomizeMode.GetNumDyesToSpendOnSelectedDecor -- If a dyeable decor instance is selected, returns how many dye items would be spent on applying all currently previewed dye changes

Returns:

- `numDyesToSpend`: number

### C_HousingCustomizeMode.GetPreviewDyesOnSelectedDecor -- If a dyeable decor instance is selected, returns info structs for each new/changed dye currently being previewed

Returns:

- `previewDyes`: table<PreviewDyeSlotInfo>

### C_HousingCustomizeMode.GetRecentlyUsedDyes -- Returns a list of ids for the dyes most recently applied by the player, if any

Returns:

- `recentDyes`: table<number>

### C_HousingCustomizeMode.GetRecentlyUsedThemeSets -- Returns a list of ids for the theme sets (aka styles) most recently applied by the player, if any

Returns:

- `recentThemeSets`: table<number>

### C_HousingCustomizeMode.GetRecentlyUsedWallpapers -- Returns a list of ids for the wallpapers most recently applied by the player, if any

Returns:

- `recentWallpapers`: table<number>

### C_HousingCustomizeMode.GetSelectedDecorInfo -- Returns info for the decor instance that's currently selected, if there is one

Returns:

- `info`: HousingDecorInstanceInfo?

### C_HousingCustomizeMode.GetSelectedDecorPetInfo -- If a decor is selected that supports pets, gets petID and behavior type from decor

Returns:

- `petID`: WOWGUID?
- `petBehavior`: HousingPetBehaviorType

### C_HousingCustomizeMode.GetSelectedRoomComponentInfo -- Returns info for the currently selected room component, if there is one

Returns:

- `info`: HousingRoomComponentInstanceInfo?

### C_HousingCustomizeMode.GetThemeSetInfo -- Returns the name of the specified theme set (aka style) if it exists

SecretArguments=AllowedWhenUntainted

Arguments:

- `themeSetID`: number

Returns:

- `name`: string?

### C_HousingCustomizeMode.GetWallpapersForRoomComponentType -- Get all wallpapers (aka materials/textures) available for the selected room component type, if any

SecretArguments=AllowedWhenUntainted

Arguments:

- `type`: HousingRoomComponentType

Returns:

- `availableWallpapers`: table<RoomComponentWallpaper>

### C_HousingCustomizeMode.IsDecorSelected -- Returns true if a decor instance is currently selected for customization

Returns:

- `hasSelectedDecor`: bool

### C_HousingCustomizeMode.IsHouseExteriorDoorHovered -- Returns true if the entry door of the house's exterior is currently being hovered

Returns:

- `isHouseExteriorDoorHovered`: bool

### C_HousingCustomizeMode.IsHoveringDecor -- Returns true if a placed decor instance is currently being hovered

Returns:

- `isHoveringDecor`: bool

### C_HousingCustomizeMode.IsHoveringRoomComponent -- Returns true if a room component is currently being hovered

Returns:

- `isHovering`: bool

### C_HousingCustomizeMode.IsRoomComponentSelected -- Returns true if a room component is currently selected for customization

Returns:

- `hasSelectedComponent`: bool

### C_HousingCustomizeMode.RoomComponentSupportsVariant -- Check whether a specific room component supports a particular variant; What kind of id or enum 'variant' equates to is complicated, as it depends on the component type

SecretArguments=AllowedWhenUntainted

Arguments:

- `componentID`: number
- `variant`: number

Returns:

- `variantSupported`: bool

### C_HousingCustomizeMode.RoomConnectionSupportsDoorType -- Check whether a specific room component, within a specific room, supports a particular doorType

SecretArguments=AllowedWhenUntainted

Arguments:

- `roomGUID`: WOWGUID
- `componentID`: number
- `newDoortype`: HousingRoomComponentDoorType

Returns:

- `doorTypeSupported`: bool

### C_HousingCustomizeMode.SetRoomComponentCeilingType -- Attempt to set a specific ceiling component, within a specific room, to a specific new ceiling type

SecretArguments=AllowedWhenUntainted

Arguments:

- `roomGUID`: WOWGUID
- `componentID`: number
- `ceilingType`: HousingRoomComponentCeilingType

### C_HousingCustomizeMode.SetRoomComponentDoorType -- Attempt to set a specific door component, within a specific room, to a specific new door type

SecretArguments=AllowedWhenUntainted

Arguments:

- `roomGUID`: WOWGUID
- `componentID`: number
- `newDoortype`: HousingRoomComponentDoorType

## Events

### HOUSING_CUSTOMIZE_MODE_HOVERED_TARGET_CHANGED

SynchronousEvent=true

Payload:

- `hasHoveredTarget`: bool
- `targetType`: HousingCustomizeModeTargetType

### HOUSING_CUSTOMIZE_MODE_SELECTED_TARGET_CHANGED

SynchronousEvent=true

Payload:

- `hasSelectedTarget`: bool
- `targetType`: HousingCustomizeModeTargetType

### HOUSING_DECOR_CUSTOMIZATION_CHANGED

SynchronousEvent=true

Payload:

- `decorGUID`: WOWGUID

### HOUSING_DECOR_DYE_FAILURE

SynchronousEvent=true

Payload:

- `decorGUID`: WOWGUID
- `housingResult`: HousingResult

### HOUSING_ROOM_COMPONENT_CUSTOMIZATION_CHANGE_FAILED

SynchronousEvent=true

Payload:

- `roomGUID`: WOWGUID
- `componentID`: number
- `housingResult`: HousingResult

### HOUSING_ROOM_COMPONENT_CUSTOMIZATION_CHANGED

SynchronousEvent=true

Payload:

- `roomGUID`: WOWGUID
- `componentID`: number

## Tables

### HousingCustomizeModeTargetType

MaxValue=3, MinValue=0, NumValues=4

Fields:

- `None`: HousingCustomizeModeTargetType [= 0]
- `Decor`: HousingCustomizeModeTargetType [= 1]
- `RoomComponent`: HousingCustomizeModeTargetType [= 2]
- `ExteriorHouse`: HousingCustomizeModeTargetType [= 3]

### HousingRoomComponentInstanceInfo

Fields:

- `roomGUID`: WOWGUID
- `type`: HousingRoomComponentType
- `componentID`: number
- `canBeCustomized`: bool
- `currentThemeSet`: number?
- `availableThemeSets`: table<number>
- `currentWallpaper`: number?
- `currentRoomComponentTextureRecID`: number?
- `ceilingType`: HousingRoomComponentCeilingType
- `doorType`: HousingRoomComponentDoorType

### PreviewDyeSlotInfo

Fields:

- `dyeColorID`: number
- `dyeSlotID`: number

### RoomComponentWallpaper

Fields:

- `name`: cstring
- `roomComponentTextureRecID`: number
