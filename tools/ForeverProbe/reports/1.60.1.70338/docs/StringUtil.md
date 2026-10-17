# StringUtil

Namespace `C_StringUtil`.

Environment=All, Predicates={}

## Functions

### C_StringUtil.CreateAbbreviatedNumberFormatter -- Creates a numeric formatter that converts numbers to abbreviated strings, eg. 123456 -> '123k'.

Returns:

- `formatter`: AbbreviatedNumberFormatter

### C_StringUtil.CreateNumericRuleFormatter -- Creates a numeric formatter that converts numbers to strings with flexible rulesets.

Returns:

- `formatter`: NumericRuleFormatter

### C_StringUtil.CreateSecondsFormatter -- Creates a numeric formatter that converts numbers measuring durations in seconds to strings, eg. 93 -> '1m 33s'.

Returns:

- `formatter`: SecondsFormatter

### C_StringUtil.EscapeDecimalNonPrintables -- Returns a string with ASCII control characters (except 
, , and 	) and invalid UTF-8 bytes replaced by decimal escape sequences (e.g. \127).

SecretArguments=AllowedWhenTainted

Arguments:

- `text`: stringView

Returns:

- `escapedText`: string

### C_StringUtil.EscapeLuaFormatString -- Returns a string with Lua format string tokens ('%') escaped.

SecretArguments=AllowedWhenTainted

Arguments:

- `text`: string

Returns:

- `escapedText`: stringView

### C_StringUtil.EscapeLuaPatterns -- Returns a string with all Lua pattern characters escaped.

SecretArguments=AllowedWhenTainted

Arguments:

- `text`: stringView

Returns:

- `escapedText`: string

### C_StringUtil.EscapeQuotedCodes -- Returns a string with all quoted code sequences ('|' characters) escaped.

SecretArguments=AllowedWhenTainted

Arguments:

- `text`: string

Returns:

- `escaped`: stringView

### C_StringUtil.FloorToNearestString

SecretArguments=AllowedWhenTainted

Arguments:

- `number`: number

Returns:

- `text`: string

### C_StringUtil.RemoveContiguousSpaces -- Returns a string with all contiguous occurrences of ASCII space characters truncated.

SecretArguments=AllowedWhenTainted

Arguments:

- `text`: stringView
- `maxAllowedSpaces`: number [NeverSecret=true] -- Maximum number of permitted contiguous space characters; excessive spaces will be truncated to this count.

Returns:

- `trimmedText`: string

### C_StringUtil.RoundToNearestString

SecretArguments=AllowedWhenTainted

Arguments:

- `number`: number

Returns:

- `text`: string

### C_StringUtil.StripHyperlinks

SecretArguments=AllowedWhenTainted

Arguments:

- `text`: string
- `maintainColor`: bool [default=false] -- If true, preserve all '|c' and '|r' quoted code sequences.
- `maintainBrackets`: bool [default=false] -- If true, preserve all '[' and ']' characters.
- `stripNewlines`: bool [default=false] -- If true, remove all '|n' quoted code sequences.
- `maintainAtlases`: bool [default=false] -- If true, preserve all balanced '|A' and '|a' quoted code sequences.
- `maintainTextures`: bool [default=false] -- If true, preserve all balanced '|T' and '|t' quoted code sequences.

Returns:

- `stripped`: stringView

### C_StringUtil.StripTextureMarkupForLooseFiles

SecretArguments=AllowedWhenTainted

Arguments:

- `text`: string

Returns:

- `stripped`: stringView

### C_StringUtil.TruncateWhenZero -- Formats the given number to a string as an integer (rounding down). If the integer is zero, returns an empty string.

SecretArguments=AllowedWhenTainted

Arguments:

- `number`: number

Returns:

- `text`: string

### C_StringUtil.WrapString -- Returns a string with 'prefix' and 'suffix' joined to 'infix' iif 'infix' is not an empty string. Else, an empty string is returned.

SecretArguments=AllowedWhenTainted

Arguments:

- `infix`: stringView
- `prefix`: stringView?
- `suffix`: stringView?

Returns:

- `text`: string

## Tables

### StripHyperlinkOptions

Fields:

- `maintainColor`: bool [default=false] -- If true, preserve all '|c' and '|r' quoted code sequences.
- `maintainBrackets`: bool [default=false] -- If true, preserve all '[' and ']' characters.
- `stripNewlines`: bool [default=false] -- If true, remove all '|n' quoted code sequences.
- `maintainAtlases`: bool [default=false] -- If true, preserve all balanced '|A' and '|a' quoted code sequences.
- `maintainTextures`: bool [default=false] -- If true, preserve all balanced '|T' and '|t' quoted code sequences.
