# DyeColorInfo

Namespace `C_DyeColor`.

Environment=All, Predicates={}

## Functions

### C_DyeColor.GetAllDyeColorCategories

Returns:

- `dyeColorCategoryIDs`: table<number>

### C_DyeColor.GetAllDyeColors

SecretArguments=AllowedWhenUntainted

Arguments:

- `ownedColorsOnly`: bool [default=false]

Returns:

- `dyeColorIDs`: table<number>

### C_DyeColor.GetDyeColorCategoryInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `dyeColorCategoryID`: number

Returns:

- `dyeColorCategoryInfo`: DyeColorCategoryDisplayInfo?

### C_DyeColor.GetDyeColorInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `dyeColorID`: number

Returns:

- `dyeColorInfo`: DyeColorDisplayInfo?

### C_DyeColor.GetDyeColorsForItem

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemLinkOrID`: ItemInfo

Returns:

- `dyeColorIDs`: table<number>

### C_DyeColor.GetDyeColorsForItemLocation

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemLocation`: ItemLocation (ItemLocationMixin)

Returns:

- `dyeColorIDs`: table<number>

### C_DyeColor.GetDyeColorsInCategory

SecretArguments=AllowedWhenUntainted

Arguments:

- `dyeColorCategory`: number
- `ownedColorsOnly`: bool [default=false]

Returns:

- `dyeColorIDs`: table<number>

### C_DyeColor.IsDyeColorOwned -- True if the player owns any of the consumable item used to apply the specified dye

SecretArguments=AllowedWhenUntainted

Arguments:

- `dyeColorID`: number

Returns:

- `isOwned`: bool

## Events

### DYE_COLOR_CATEGORY_UPDATED

SynchronousEvent=true

Payload:

- `dyeColorCategoryID`: number

### DYE_COLOR_UPDATED

SynchronousEvent=true

Payload:

- `dyeColorID`: number
