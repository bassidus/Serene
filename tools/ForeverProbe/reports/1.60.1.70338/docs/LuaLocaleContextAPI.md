# LuaLocaleContextAPI

Environment=All, ObjectType=Userdata, Predicates={}

## Functions

### CompareStrings -- Compares two UTF-8 strings using the options specified on a collator.

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `left`: cstring -- The first UTF-8 string passed to collation comparison.
- `right`: cstring -- The second UTF-8 string passed to collation comparison.
- `strength`: CollationStrength -- The comparison level used by the collator for ordering and equality.

Returns:

- `result`: number -- The comparison result: less than, equal to, or greater than zero.

### FindBreaks -- Opens a break iterator for locating text boundaries in the context locale.

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `text`: cstring -- The UTF-8 text whose boundary offsets are requested.
- `breakType`: BreakType -- The break iterator kind to use for boundary analysis.

Returns:

- `byteOffsets`: table<luaIndex> -- The native UTF-8 string indices for the text boundaries (returned with 1-based indexes for lua convenience).

### FindStringMatches -- Creates a string search iterator using a collator and returns every match position.

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `text`: cstring -- The UTF-8 text scanned by the string search iterator.
- `pattern`: cstring -- The UTF-8 pattern whose collation-aware matches are returned.
- `strength`: CollationStrength -- The comparison level used by the collator while searching for matches.

Returns:

- `byteOffsets`: table<luaIndex> -- The UTF-8 byte offsets of matches in the text (returned with 1-based indexes for lua convenience).

### FoldCase -- Case-folds the characters in a string; case-folding is locale-independent and not context-sensitive.

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `text`: cstring -- The UTF-8 text converted with locale-independent case folding.

Returns:

- `result`: string -- The case-folded string, which may be longer or shorter than the original.

### FormatCurrency -- Formats a double as a localized currency value using the provided ISO 4217 currency code.

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `number`: number -- The double value formatted by the locale currency formatter.
- `currencyCode`: cstring -- The 3-letter null-terminated ISO 4217 currency code for currency formatting.

Returns:

- `result`: string -- The localized currency text produced by the formatter.

### FormatDate -- Formats Unix time as localized date text using locale date patterns, symbols, style, and optional time zone.

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `unixTimeSeconds`: number -- The date as seconds since the Unix epoch; this API converts it to milliseconds.
- `style`: DateTimeStyle -- The date format length; None omits the date portion.
- `timeZone`: cstring -- The time zone ID applied to the formatter; empty strings keep the formatter default.

Returns:

- `result`: string -- The formatted date string.

### FormatDateTime -- Formats Unix time as localized date and time text using locale patterns, symbols, styles, and optional time zone.

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `unixTimeSeconds`: number -- The date and time as seconds since the Unix epoch; this API converts it to milliseconds.
- `dateStyle`: DateTimeStyle -- The date format length; None omits the date portion.
- `timeStyle`: DateTimeStyle -- The time format length; None omits the time portion.
- `timeZone`: cstring -- The time zone ID applied to the formatter; empty strings keep the formatter default.

Returns:

- `result`: string -- The formatted date and time string.

### FormatNumber -- Formats a double with locale number formatting using locale symbols, grouping, and the selected non-currency style.

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `number`: number -- The double value formatted according to the selected number formatter.
- `style`: NumberStyle -- The number style to format with; Currency is not accepted here, use FormatCurrency instead.

Returns:

- `result`: string -- The localized number text produced by the formatter.

### FormatTime -- Formats Unix time as localized time text using locale time patterns, symbols, style, and optional time zone.

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `unixTimeSeconds`: number -- The time as seconds since the Unix epoch; this API converts it to milliseconds.
- `style`: DateTimeStyle -- The time format length; None omits the time portion.
- `timeZone`: cstring -- The time zone ID applied to the formatter; empty strings keep the formatter default.

Returns:

- `result`: string -- The formatted time string.

### GetCurrencyName -- Returns the display name for a currency in the context locale.

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `currencyCode`: cstring -- The null-terminated 3-letter ISO 4217 currency code.
- `style`: CurrencyNameStyle -- The selector for which kind of currency name to return.

Returns:

- `result`: string -- The display string for the currency, or the currency code itself if no localized name is available.

### GetDisplayName -- Gets a display name suitable for the specified locale.

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `displayLocale`: cstring -- The locale whose language conventions are used for the display name

Returns:

- `result`: string -- The displayable name for the locale.

### GetLocale -- Gets the locale used by this locale context.

Returns:

- `result`: string -- The locale ID of this locale context.

### GetSortKey -- Transforms a string into a collation sort key.

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `text`: cstring -- The UTF-8 text converted into collation sort-key bytes.
- `strength`: CollationStrength -- The comparison level used by the collator; lower strengths ignore later-level differences.

Returns:

- `result`: string -- The sort key bytes excluding the terminating zero byte.

### Length -- Counts character break boundaries in UTF-8 text.

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `text`: cstring -- The UTF-8 text counted by character break iteration.

Returns:

- `result`: number -- The number of character boundaries minus the initial boundary.

### ParseCurrency -- Parses an entire localized currency string into a double amount and ISO 4217 currency code.

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `text`: cstring -- The localized currency text to parse for both amount and ISO 4217 code.

Returns:

- `result`: CurrencyParseResult -- The numeric amount and ISO 4217 currency code parsed from the localized currency text.

### ParseNumber -- Parses an entire localized number string into a double using the selected non-currency number formatter.

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `text`: cstring -- The localized numeric text to parse with the selected style.
- `style`: NumberStyle -- The number style to parse with; Currency is not accepted here, use ParseCurrency instead.

Returns:

- `result`: number -- The numeric value parsed from the localized number text.

### SelectPlural -- Returns the keyword of the first plural rule that applies to a number.

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `number`: number -- The number for which the plural rule has to be determined.
- `pluralType`: PluralType -- The plural rule type, cardinal or ordinal.

Returns:

- `result`: string -- The plural keyword for the rule that applies to the number.

### SetLocale -- Sets the locale used by this locale context.

SecretArguments=AllowedWhenUntainted

Arguments:

- `locale`: cstring -- The locale ID used by subsequent locale context calls.

Returns:

- `success`: bool -- True if the locale was updated.

### ToLower -- Lowercases the characters in a string; casing is locale-dependent and context-sensitive.

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `text`: cstring -- The UTF-8 text whose characters are lowercased.

Returns:

- `result`: string -- The lowercased string, which may be longer or shorter than the original.

### ToTitle -- Titlecases a string using titlecase positions determined by the default Unicode algorithm.

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `text`: cstring -- The UTF-8 text whose titlecase positions are mapped.

Returns:

- `result`: string -- The titlecased string, which may be longer or shorter than the original.

### ToUpper -- Uppercases the characters in a string; casing is locale-dependent and context-sensitive.

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `text`: cstring -- The UTF-8 text whose characters are uppercased.

Returns:

- `result`: string -- The uppercased string, which may be longer or shorter than the original.

### TransformLocale -- Applies a locale transform to the context locale and returns the transformed locale string.

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `transform`: LocaleTransform -- The locale transform to apply.

Returns:

- `result`: string -- The transformed locale string.
