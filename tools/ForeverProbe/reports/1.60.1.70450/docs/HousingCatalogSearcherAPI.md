# HousingCatalogSearcherAPI

Environment=All, ObjectType=Userdata, Predicates={}

## Functions

### GetAllSearchItems -- Returns all catalog entries being searched (note these are NOT search results, this is the source collection of what's being searched)

Returns:

- `matchingEntryVariantIDs`: table<HousingCatalogEntryVariantID>

### GetCatalogSearchResults -- Returns the most recent search result entries

Returns:

- `matchingEntryVariantIDs`: table<HousingCatalogEntryVariantID>

### GetEditorModeContext

Returns:

- `editorModeContext`: HouseEditorMode?

### GetFilterTagStatus

SecretArguments=AllowedWhenUntainted

Arguments:

- `groupID`: number
- `tagID`: number

Returns:

- `active`: bool

### GetFilteredCategoryID

Returns:

- `categoryID`: number?

### GetFilteredSubcategoryID

Returns:

- `subcategoryID`: number?

### GetNumSearchItems -- Returns the total number of entries being searched through

Returns:

- `numSearchItems`: number

### GetSearchCount -- Returns the total number of owned instances across all most recent search result entries

Returns:

- `searchCount`: number

### GetSearchText

Returns:

- `searchText`: string?

### GetSortType

Returns:

- `sortType`: HousingCatalogSortType

### IsAllowedIndoorsActive

Returns:

- `isActive`: bool

### IsAllowedOutdoorsActive

Returns:

- `isActive`: bool

### IsBaseVariantOnlyActive

Returns:

- `isActive`: bool

### IsCollectedActive

Returns:

- `isActive`: bool

### IsCustomizableOnlyActive

Returns:

- `isActive`: bool

### IsFirstAcquisitionBonusOnlyActive

Returns:

- `isActive`: bool

### IsSearchInProgress

Returns:

- `isSearchInProgress`: bool

### IsStoredOnlyActive

Returns:

- `isActive`: bool

### IsUncollectedActive

Returns:

- `isActive`: bool

### RunSearch -- Run search with all current param values

### SetAllInFilterTagGroup -- Set the toggle state of all filter tags within a specific group; If active, only entries that match Any of the tags in the group will be included in search results

SecretArguments=AllowedWhenUntainted

Arguments:

- `groupID`: number
- `active`: bool

### SetAllowedIndoors -- Search parameter; If true, entries that can be placed in house interiors will be included in the search; Note many decor objects can be placed both indoors and outdoors, so having only this toggled on may still include decor that can also be placed outdoors

SecretArguments=AllowedWhenUntainted

Arguments:

- `isActive`: bool

### SetAllowedOutdoors -- Search parameter; If true, entries that can be placed outside in plots will be included in the search; Note many decor objects can be placed both indoors and outdoors, so having only this toggled on may still include decor that can also be placed indoors

SecretArguments=AllowedWhenUntainted

Arguments:

- `isActive`: bool

### SetAutoUpdateOnParamChanges -- If true, searcher automatically updates results whenever search param values are changed

SecretArguments=AllowedWhenUntainted

Arguments:

- `autoUpdateActive`: bool

### SetBaseVariantOnly -- Search parameter; If true, only the base variant of each decor entry will be included

SecretArguments=AllowedWhenUntainted

Arguments:

- `isActive`: bool

### SetCollected -- Search parameter; If true, includes all owned entries, including those that are in storage OR placed in an owned house or plot; See IsStoredOnlyActive for a more exclusive toggle

SecretArguments=AllowedWhenUntainted

Arguments:

- `isActive`: bool

### SetCustomizableOnly -- Search parameter; If true, catalog entries that cannot be customized (ie dyed) will be excluded from the search

SecretArguments=AllowedWhenUntainted

Arguments:

- `isActive`: bool

### SetEditorModeContext -- Search parameter; If set, limits search results to only entries that are used/valid in the specified editor mode

SecretArguments=AllowedWhenUntainted

Arguments:

- `editorModeContext`: HouseEditorMode?

### SetFilterTagStatus -- Set the toggle state of a single filter tag within a specific group

SecretArguments=AllowedWhenUntainted

Arguments:

- `groupID`: number
- `tagID`: number
- `active`: bool

### SetFilteredCategoryID -- Search parameter; If set, limits search results to only those within the specified category

SecretArguments=AllowedWhenUntainted

Arguments:

- `categoryID`: number?

### SetFilteredSubcategoryID -- Search parameter; If set, limits search results to only those within the specified subcategory

SecretArguments=AllowedWhenUntainted

Arguments:

- `subcategoryID`: number?

### SetFirstAcquisitionBonusOnly -- Search parameter; If true, excludes any entries that do not reward house xp when acquired for the first time

SecretArguments=AllowedWhenUntainted

Arguments:

- `isActive`: bool

### SetResultsUpdatedCallback

SecretArguments=AllowedWhenUntainted

Arguments:

- `callback`: HousingCatalogSearchResultsUpdatedCallback

### SetSearchText -- Search parameter; If set, multiple text fields are checked for instances of the text, including name, category, subcategory, and data tags

SecretArguments=AllowedWhenUntainted

Arguments:

- `searchText`: string? -- Supports advanced search tokens ('"' '-' and '|'), case and accent insensitive; Set nil to clear out the search text

### SetSortType

SecretArguments=AllowedWhenUntainted

Arguments:

- `sortType`: HousingCatalogSortType

### SetStoredOnly -- Search parameter; If true, only entries that you have instances of available in storage will be included; This does not include entries that you own but have all been placed in a house; See IsCollectedActive for param that includes placed entries

SecretArguments=AllowedWhenUntainted

Arguments:

- `isActive`: bool

### SetUncollected -- Search parameter; If true, includes entries that are not owned, meaning not available in storage nor placed in any owned houses or plots

SecretArguments=AllowedWhenUntainted

Arguments:

- `isActive`: bool

### ToggleAllowedIndoors

### ToggleAllowedOutdoors

### ToggleBaseVariantOnly

### ToggleCollected

### ToggleCustomizableOnly

### ToggleFilterTag

SecretArguments=AllowedWhenUntainted

Arguments:

- `groupID`: number
- `tagID`: number

### ToggleFirstAcquisitionBonusOnly

### ToggleStoredOnly

### ToggleUncollected

## Tables

### HousingCatalogSearchResultsUpdatedCallback
