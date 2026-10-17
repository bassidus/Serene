# Localization

Environment=All, Predicates={}

## Functions

### AbbreviateLargeNumbers

SecretArguments=AllowedWhenTainted

Arguments:

- `number`: number
- `options`: NumberAbbrevOptions?

Returns:

- `result`: string

### AbbreviateNumbers

SecretArguments=AllowedWhenTainted

Arguments:

- `number`: number
- `options`: NumberAbbrevOptions?

Returns:

- `result`: string

### BreakUpLargeNumbers

SecretArguments=AllowedWhenTainted

Arguments:

- `largeNumber`: number
- `natural`: bool [default=false, NeverSecret=true]

Returns:

- `result`: string

### CaseAccentInsensitiveParse

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: cstring

Returns:

- `result`: string

### CreateAbbreviateConfig

RequiresRestrictedAbbreviationBreakpoints=true, SecretArguments=NotAllowed

Arguments:

- `data`: table<NumberAbbreviationBreakpoint>

Returns:

- `config`: AbbreviateConfig

### DeclineName

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: cstring
- `gender`: UnitSex?
- `declensionSet`: luaIndex
- `namePartType`: NamePartType?

Returns:

- `declinedNames`: string [StrideIndex=1]

### GetDefaultAbbreviationBreakpoints

SecretArguments=AllowedWhenUntainted

Arguments:

- `locale`: WowLocale?

Returns:

- `breakpoints`: table<NumberAbbreviationBreakpoint>

### GetNumDeclensionSets

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: cstring
- `gender`: UnitSex?
- `namePartType`: NamePartType?

Returns:

- `numDeclensionSets`: number

### IsEuropeanNumbers

Returns:

- `enabled`: bool

### LocalizedClassList

SecretArguments=AllowedWhenUntainted

Arguments:

- `isFemale`: bool [default=false]

Returns:

- `result`: LuaValueVariant

### SetEuropeanNumbers

SecretArguments=AllowedWhenUntainted

Arguments:

- `enabled`: bool

## Tables

### NumberAbbrevOptions

Fields:

- `breakpointData`: table<NumberAbbreviationBreakpoint>? -- Order these from largest to smallest.
- `locale`: cstring? -- Locale controls whether standard asian abbreviation data will be used along with a small change in behavior for large number abbreviation when fractionDivisor is greater than zero.
- `config`: AbbreviateConfig? -- Provides a cached config object for optimal performance when calling abbreviation functions multiple times with the same options.
