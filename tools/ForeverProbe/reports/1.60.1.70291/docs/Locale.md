# Locale

Environment=All, Predicates={}

## Functions

### GetAvailableLocaleInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `ignoreLocaleRestrictions`: bool [default=false]

Returns:

- `localeInfos`: table<LocaleInfo>

### GetAvailableLocales

SecretArguments=AllowedWhenUntainted

Arguments:

- `ignoreLocaleRestrictions`: bool [default=false]

Returns:

- `localeName`: cstring [StrideIndex=1]

### GetCurrentRegion

Returns:

- `region`: number

### GetLocale

Returns:

- `localeName`: cstring

### GetOSLocale

Returns:

- `localeName`: cstring

## Tables

### LocaleInfo

Fields:

- `localeId`: number
- `localeName`: cstring
