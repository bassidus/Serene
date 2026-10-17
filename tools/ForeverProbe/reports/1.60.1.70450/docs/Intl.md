# Intl

Namespace `C_Intl`.

Environment=All, Predicates={1={Documentation={1=Prevents Remove and Null transliterators when used with secret text arguments.}, FailureMode=ReturnNothing, Name=TransliteratorAllowed, Type=Precondition}}

## Functions

### C_Intl.CompareStrings -- Compares two UTF-8 strings using the options specified on a collator.

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `left`: cstring -- The first UTF-8 string passed to collation comparison.
- `right`: cstring -- The second UTF-8 string passed to collation comparison.
- `strength`: CollationStrength -- The comparison level used by the collator for ordering and equality.

Returns:

- `result`: number -- The comparison result: less than, equal to, or greater than zero.

### C_Intl.CreateLocaleContext -- Creates a locale context object for locale-scoped internationalization operations.

SecretArguments=AllowedWhenUntainted

Arguments:

- `locale`: cstring -- The locale ID used to initialize the locale context object.

Returns:

- `context`: LuaLocaleContext -- A locale context userdata object for calling locale-scoped APIs.

### C_Intl.FindBreaks -- Opens a break iterator for locating text boundaries in a specified locale.

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `text`: cstring -- The UTF-8 text whose boundary offsets are requested.
- `breakType`: BreakType -- The break iterator kind to use for boundary analysis.

Returns:

- `byteOffsets`: table<luaIndex> -- The native UTF-8 string indices for the text boundaries (returned with 1-based indexes for lua convenience).

### C_Intl.FindStringMatches -- Creates a string search iterator using a collator and returns every match position.

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `text`: cstring -- The UTF-8 text scanned by the string search iterator.
- `pattern`: cstring -- The UTF-8 pattern whose collation-aware matches are returned.
- `strength`: CollationStrength -- The comparison level used by the collator while searching for matches.

Returns:

- `byteOffsets`: table<luaIndex> -- The UTF-8 byte offsets of matches in the text (returned with 1-based indexes for lua convenience).

### C_Intl.FoldCase -- Case-folds the characters in a string; case-folding is locale-independent and not context-sensitive.

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `text`: cstring -- The UTF-8 text converted with locale-independent case folding.

Returns:

- `result`: string -- The case-folded string, which may be longer or shorter than the original.

### C_Intl.FormatCurrency -- Formats a double as a localized currency value using the provided ISO 4217 currency code.

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `number`: number -- The double value formatted by the locale currency formatter.
- `currencyCode`: cstring -- The 3-letter null-terminated ISO 4217 currency code for currency formatting.

Returns:

- `result`: string -- The localized currency text produced by the formatter.

### C_Intl.FormatDate -- Formats Unix time as localized date text using locale date patterns, symbols, style, and optional time zone.

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `unixTimeSeconds`: number -- The date as seconds since the Unix epoch; this API converts it to milliseconds.
- `style`: DateTimeStyle -- The date format length; None omits the date portion.
- `timeZone`: cstring -- The time zone ID applied to the formatter; empty strings keep the formatter default.

Returns:

- `result`: string -- The formatted date string.

### C_Intl.FormatDateTime -- Formats Unix time as localized date and time text using locale patterns, symbols, styles, and optional time zone.

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `unixTimeSeconds`: number -- The date and time as seconds since the Unix epoch; this API converts it to milliseconds.
- `dateStyle`: DateTimeStyle -- The date format length; None omits the date portion.
- `timeStyle`: DateTimeStyle -- The time format length; None omits the time portion.
- `timeZone`: cstring -- The time zone ID applied to the formatter; empty strings keep the formatter default.

Returns:

- `result`: string -- The formatted date and time string.

### C_Intl.FormatNumber -- Formats a double with locale number formatting using locale symbols, grouping, and the selected non-currency style.

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `number`: number -- The double value formatted according to the selected number formatter.
- `style`: NumberStyle -- The number style to format with; Currency is not accepted here, use FormatCurrency instead.

Returns:

- `result`: string -- The localized number text produced by the formatter.

### C_Intl.FormatTime -- Formats Unix time as localized time text using locale time patterns, symbols, style, and optional time zone.

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `unixTimeSeconds`: number -- The time as seconds since the Unix epoch; this API converts it to milliseconds.
- `style`: DateTimeStyle -- The time format length; None omits the time portion.
- `timeZone`: cstring -- The time zone ID applied to the formatter; empty strings keep the formatter default.

Returns:

- `result`: string -- The formatted time string.

### C_Intl.GetCharacterProperties -- Returns Unicode property values for the first code point in a string.

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `text`: cstring -- The string whose first code point is tested.

Returns:

- `result`: CharacterProperties -- Unicode property values for the first code point.

### C_Intl.GetCurrencyFractionDigits -- Returns the number of fraction digits that should be displayed for the given currency.

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `currencyCode`: cstring -- The null-terminated 3-letter ISO 4217 currency code.

Returns:

- `result`: number -- The non-negative number of fraction digits to be displayed, or 0 if the lookup fails.

### C_Intl.GetCurrencyName -- Returns the display name for a currency in the given locale.

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `currencyCode`: cstring -- The null-terminated 3-letter ISO 4217 currency code.
- `nameStyle`: CurrencyNameStyle -- The selector for which kind of currency name to return.

Returns:

- `result`: string -- The display string for the currency, or the currency code itself if no localized name is available.

### C_Intl.GetCurrentLocale -- Gets the current locale used by C_Intl.

Returns:

- `result`: cstring -- The current locale ID.

### C_Intl.GetDisplayName -- Gets a display name suitable for the specified locale.

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `displayLocale`: cstring -- The locale whose language conventions are used for the display name

Returns:

- `result`: string -- The displayable name for the locale.

### C_Intl.GetSortKey -- Transforms a string into a collation sort key.

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `text`: cstring -- The UTF-8 text converted into collation sort-key bytes.
- `strength`: CollationStrength -- The comparison level used by the collator; lower strengths ignore later-level differences.

Returns:

- `sortKey`: string -- The sort key bytes excluding the terminating zero byte.

### C_Intl.IsNormalized -- Tests if the string is normalized according to the specified normalization form.

SecretArguments=AllowedWhenTainted

Arguments:

- `text`: cstring -- The UTF-8 text checked against the requested normalization form.
- `form`: NormalizationForm -- The normalization form to test against.

Returns:

- `isNormalized`: bool -- True if the string is normalized according to the specified form.

### C_Intl.Length -- Counts character break boundaries in UTF-8 text.

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `text`: cstring -- The UTF-8 text counted by character break iteration.

Returns:

- `result`: number -- The number of character boundaries minus the initial boundary.

### C_Intl.Normalize -- Writes the normalized form of the source string to the destination string.

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `text`: cstring -- The UTF-8 text that is normalized.
- `form`: NormalizationForm -- The normalization form to write.

Returns:

- `result`: string -- The normalized form of the source string.

### C_Intl.ParseCurrency -- Parses an entire localized currency string into a double amount and ISO 4217 currency code.

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `text`: cstring -- The localized currency text to parse for both amount and ISO 4217 code.

Returns:

- `result`: CurrencyParseResult -- The numeric amount and ISO 4217 currency code parsed from the localized currency text.

### C_Intl.ParseNumber -- Parses an entire localized number string into a double using the selected non-currency number formatter.

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `text`: cstring -- The localized numeric text to parse with the selected style.
- `style`: NumberStyle -- The number style to parse with; Currency is not accepted here, use ParseCurrency instead.

Returns:

- `result`: number -- The numeric value parsed from the localized number text.

### C_Intl.SelectPlural -- Returns the keyword of the first plural rule that applies to a number.

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `number`: number -- The number for which the plural rule has to be determined.
- `pluralType`: PluralType -- The plural rule type, cardinal or ordinal.

Returns:

- `result`: string -- The plural keyword for the rule that applies to the number.

### C_Intl.ToLower -- Lowercases the characters in a string; casing is locale-dependent and context-sensitive.

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `text`: cstring -- The UTF-8 text whose characters are lowercased.

Returns:

- `result`: string -- The lowercased string, which may be longer or shorter than the original.

### C_Intl.ToTitle -- Titlecases a string using titlecase positions determined by the default Unicode algorithm.

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `text`: cstring -- The UTF-8 text whose titlecase positions are mapped.

Returns:

- `result`: string -- The titlecased string, which may be longer or shorter than the original.

### C_Intl.ToUpper -- Uppercases the characters in a string; casing is locale-dependent and context-sensitive.

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `text`: cstring -- The UTF-8 text whose characters are uppercased.

Returns:

- `result`: string -- The uppercased string, which may be longer or shorter than the original.

### C_Intl.TransformLocale -- Applies a locale transform to the current locale and returns the transformed locale string.

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `transform`: LocaleTransform -- The locale transform to apply.

Returns:

- `result`: string -- The transformed locale string.

### C_Intl.Transliterate -- Opens a system transliterator by ID and transliterates the text in place.

MayReturnNothing=true, SecretArguments=AllowedWhenTainted, TransliteratorAllowed=true

Arguments:

- `text`: cstring -- The UTF-8 text converted by the opened transliterator.
- `transliteratorID`: cstring -- A registered transliterator ID, such as a source-target system transliterator.

Returns:

- `result`: string -- The UTF-8 text after transliterator rules are applied.
