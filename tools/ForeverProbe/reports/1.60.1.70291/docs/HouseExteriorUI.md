# HouseExteriorUI

Namespace `C_HouseExterior`.

Environment=All, Predicates={}

## Functions

### C_HouseExterior.CancelActiveExteriorEditing -- Cancels all in-progress editing of house exterior fixtures, which will deselect any active targets

### C_HouseExterior.GetCoreFixtureOptionsInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `coreFixtureType`: HousingFixtureType

Returns:

- `coreFixtureOptionsInfo`: HousingCoreFixtureInfo?

### C_HouseExterior.GetCurrentHouseExteriorSize

Returns:

- `houseExteriorSize`: HousingFixtureSize?

### C_HouseExterior.GetCurrentHouseExteriorType

Returns:

- `houseExteriorTypeID`: number?
- `houseExteriorTypeName`: cstring?

### C_HouseExterior.GetHouseExteriorSizeOptions

Returns:

- `options`: HouseExteriorSizeOptionsInfo?

### C_HouseExterior.GetHouseExteriorTypeOptions

Returns:

- `options`: HouseExteriorTypeOptionsInfo?

### C_HouseExterior.GetSelectedFixturePointInfo

Returns:

- `fixturePointInfo`: HousingFixturePointInfo?

### C_HouseExterior.HasHoveredFixture

Returns:

- `anyHoveredFixture`: bool

### C_HouseExterior.HasSelectedFixturePoint

Returns:

- `anySelectedFixturePoint`: bool

### C_HouseExterior.IsAnyDecorAttachedToCoreFixture -- Returns true if any decor is attached to the specified core fixture type, OR any child fixtures attached to it; Will also return false if the type provided is not a core fixture type, or if not in Exterior Customization mode on an owned plot

SecretArguments=AllowedWhenUntainted

Arguments:

- `coreFixtureType`: HousingFixtureType

Returns:

- `anyAttachedDecor`: bool

### C_HouseExterior.IsAnyDecorAttachedToDoor -- Returns true if any decor is attached to the current House Exterior's door; Will also return false if not in Exterior Customization mode on an owned plot

Returns:

- `anyAttachedDecor`: bool

### C_HouseExterior.IsAnyDecorAttachedToHouseExterior -- Returns true if any decor is attached to any component of the current House Exterior; Will also return false if not in House Exterior Customization mode on an owned Plot

Returns:

- `anyAttachedDecor`: bool

### C_HouseExterior.IsAnyDecorAttachedToSelectedFixturePoint -- Returns true if any decor is attached to the Fixture occupying the currently selected fixture point; Will also return false if no point is currently selected, or if there is currently no Fixture there

Returns:

- `anyAttachedDecor`: bool

### C_HouseExterior.IsExteriorDecorHidden

Returns:

- `decorHidden`: bool

### C_HouseExterior.RemoveFixtureFromSelectedPoint

SecretArguments=AllowedWhenUntainted

Arguments:

- `attachedDecorAction`: HousingFixtureDecorAction [default=Store] -- What to do with any decor currently attached to the fixture

### C_HouseExterior.SelectCoreFixtureOption

SecretArguments=AllowedWhenUntainted

Arguments:

- `fixtureID`: number
- `attachedDecorAction`: HousingFixtureDecorAction [default=Store] -- What to do with any decor attached to the old core fixture; If the fixture being swapped is a variant (ie recolor) of the existing one, attached decor will always be reparented directly to the new one

### C_HouseExterior.SelectFixtureOption

SecretArguments=AllowedWhenUntainted

Arguments:

- `fixtureID`: number
- `attachedDecorAction`: HousingFixtureDecorAction [default=Store] -- If this fixture choice is replacing an existing one that has decor attached, what to do with any decor attached to the old one

### C_HouseExterior.SetExteriorDecorHidden

SecretArguments=AllowedWhenUntainted

Arguments:

- `decorHidden`: bool

### C_HouseExterior.SetHouseExteriorSize

SecretArguments=AllowedWhenUntainted

Arguments:

- `size`: HousingFixtureSize
- `attachedDecorAction`: HousingFixtureDecorAction [default=Store] -- What to do with decor attached to any of the house's existing exterior components

### C_HouseExterior.SetHouseExteriorType

SecretArguments=AllowedWhenUntainted

Arguments:

- `houseExteriorTypeID`: number
- `attachedDecorAction`: HousingFixtureDecorAction [default=Store] -- What to do with decor attached to any of the house's existing exterior components

## Events

### HOUSE_EXTERIOR_DECOR_HIDDEN_CHANGED

SynchronousEvent=true

Payload:

- `isDecorHidden`: bool

### HOUSE_EXTERIOR_TYPE_UNLOCKED

UniqueEvent=true

Payload:

- `fixtureID`: number

### HOUSING_CORE_FIXTURE_CHANGED

UniqueEvent=true

Payload:

- `coreFixtureType`: HousingFixtureType

### HOUSING_FIXTURE_HOVER_CHANGED

SynchronousEvent=true

Payload:

- `anyHovered`: bool

### HOUSING_FIXTURE_POINT_FRAME_ADDED

SynchronousEvent=true

Payload:

- `pointFrame`: HousingFixturePointFrame

### HOUSING_FIXTURE_POINT_FRAME_RELEASED

SynchronousEvent=true

Payload:

- `pointFrame`: HousingFixturePointFrame

### HOUSING_FIXTURE_POINT_FRAMES_RELEASED

SynchronousEvent=true

### HOUSING_FIXTURE_POINT_SELECTION_CHANGED

SynchronousEvent=true

Payload:

- `hasSelection`: bool

### HOUSING_FIXTURE_UNLOCKED

UniqueEvent=true

Payload:

- `fixtureID`: number

### HOUSING_SET_EXTERIOR_HOUSE_SIZE_RESPONSE

SynchronousEvent=true

Payload:

- `result`: HousingResult

### HOUSING_SET_EXTERIOR_HOUSE_TYPE_RESPONSE

SynchronousEvent=true

Payload:

- `result`: HousingResult

### HOUSING_SET_FIXTURE_RESPONSE

SynchronousEvent=true

Payload:

- `result`: HousingResult
