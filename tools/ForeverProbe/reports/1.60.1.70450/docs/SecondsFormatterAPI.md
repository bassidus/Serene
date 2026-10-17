# SecondsFormatterAPI

Environment=All, ObjectType=Userdata, Predicates={}

## Functions

### CanApproximate -- Returns true if the given number of seconds is within an appropriate range for approximated formatting.

ConstSecretAccessor=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `seconds`: Seconds

Returns:

- `canApproximate`: bool

### CanRoundUpIntervals -- Returns true if the formatter can promote values to higher interval bands.

Returns:

- `canRound`: bool

### CanRoundUpLastUnit -- Returns true if the formatter should round the final unit up rather than down.

Returns:

- `canRound`: bool

### EvaluateDesiredUnitCount -- Returns the unit count that a given number of seconds will use for formatting.

ConstSecretAccessor=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `seconds`: Seconds

Returns:

- `count`: number

### EvaluateMaxInterval -- Returns the maximum interval band that a given number of seconds will use for formatting.

ConstSecretAccessor=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `seconds`: Seconds

Returns:

- `interval`: SecondsFormatterInterval

### EvaluateMinInterval -- Returns the minimum interval band that a given number of seconds will use for formatting.

ConstSecretAccessor=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `seconds`: Seconds

Returns:

- `interval`: SecondsFormatterInterval

### Format -- Formats a number of seconds and returns the resulting string.

ConstSecretAccessor=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `seconds`: Seconds
- `abbreviation`: SecondsFormatterAbbreviation? -- Optional abbreviation mode to use in-place of the default.

Returns:

- `formattedSeconds`: string

### FormatZero -- Returns formatted string representing a zero second duration.

ConstSecretAccessor=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `abbreviation`: SecondsFormatterAbbreviation? -- Optional abbreviation mode to use in-place of the default.

Returns:

- `formattedSeconds`: string

### GetApproximationSeconds -- Returns the threshold below which numeric values are formatted as approximated strings.

Returns:

- `approximationSeconds`: Seconds

### GetConvertToLower -- Returns true if the formatter should lowercase all unit format strings.

Returns:

- `convert`: bool

### GetDefaultAbbreviation -- Returns the default abbreviation mode used for formatting.

Returns:

- `abbreviation`: SecondsFormatterAbbreviation?

### GetDesiredUnitCount -- Returns the desired unit count for formatting.

Returns:

- `count`: number? -- Nil if configured to use a curve.

### GetDesiredUnitCountCurve -- Returns the desired unit count curve for formatting.

Returns:

- `curve`: LuaCurveObject? -- Nil if configured to static unit count.

### GetMaxInterval -- Returns the maximum interval band permitted for formatting.

Returns:

- `interval`: SecondsFormatterInterval? -- Nil if configured to use a curve.

### GetMaxIntervalCurve -- Returns the maximum interval band curve permitted for formatting.

Returns:

- `curve`: LuaCurveObject? -- Nil if configured to static interval band.

### GetMillisecondsThreshold -- Returns the threshold below which a value will be formatted as a decimal number of seconds with one place for milliseconds (eg. '3.4')

Returns:

- `threshold`: Seconds

### GetMinInterval -- Returns the minimum interval band permitted for formatting.

Returns:

- `interval`: SecondsFormatterInterval? -- Nil if configured to use a curve.

### GetMinIntervalCurve -- Returns the minimum interval band curve permitted for formatting.

Returns:

- `curve`: LuaCurveObject? -- Nil if configured to static interval band.

### GetRounding -- Returns how fractional seconds are rounded when not displaying milliseconds.

Returns:

- `rounding`: SecondsFormatterRounding -- The configured rounding mode.

### GetStripIntervalWhitespace -- Returns the whitespace stripping mode of the formatter.

Returns:

- `strip`: SecondsFormatterIntervalWhitespace

### Reset -- Resets all stored configuration of the formatter.

### SetApproximationSeconds -- Configures the formatter to render numeric values between zero and this value as approximated strings (eg. '< 1m').

SecretArguments=AllowedWhenUntainted

Arguments:

- `seconds`: Seconds

### SetCanRoundUpIntervals -- Configures the formatter to promote intervals if values are large enough (eg. '60m' -> '1h').

SecretArguments=AllowedWhenUntainted

Arguments:

- `canRound`: bool

### SetCanRoundUpLastUnit -- Configures the formatter to round the last formatted unit up, rather than down.

SecretArguments=AllowedWhenUntainted

Arguments:

- `canRound`: bool

### SetConvertToLower -- Configures the formatter to convert all interval format strings to lowercase.

SecretArguments=AllowedWhenUntainted

Arguments:

- `convert`: bool

### SetDefaultAbbreviation -- Sets the default abbreviation mode used for formatting.

SecretArguments=AllowedWhenUntainted

Arguments:

- `abbreviation`: SecondsFormatterAbbreviation

### SetDesiredUnitCount -- Sets the desired unit count used for formatting.

SecretArguments=AllowedWhenUntainted

Arguments:

- `count`: number

### SetDesiredUnitCountCurve -- Sets the desired unit count used for formatting to a curve that will be evaluated with seconds values to produce a desired unit count.

SecretArguments=AllowedWhenUntainted

Arguments:

- `curve`: LuaCurveObject

### SetMaxInterval -- Sets the maximum interval band used for formatting.

SecretArguments=AllowedWhenUntainted

Arguments:

- `interval`: SecondsFormatterInterval

### SetMaxIntervalCurve -- Sets the maximum interval band used for formatting to a curve that will be evaluated with seconds values to produce a value matching a SecondsFormatterInterval enum member.

SecretArguments=AllowedWhenUntainted

Arguments:

- `curve`: LuaCurveObject

### SetMillisecondsThreshold -- Sets the threshold below which a value will be formatted as a decimal number of seconds with one place for milliseconds (eg. '3.4')

SecretArguments=AllowedWhenUntainted

Arguments:

- `threshold`: Seconds

### SetMinInterval -- Sets the minimum interval band used for formatting.

SecretArguments=AllowedWhenUntainted

Arguments:

- `interval`: SecondsFormatterInterval

### SetMinIntervalCurve -- Sets the minimum interval band used for formatting to a curve that will be evaluated with seconds values to produce a value matching a SecondsFormatterInterval enum member.

SecretArguments=AllowedWhenUntainted

Arguments:

- `curve`: LuaCurveObject

### SetRounding -- Sets how fractional seconds are rounded when not displaying milliseconds.

SecretArguments=AllowedWhenUntainted

Arguments:

- `rounding`: SecondsFormatterRounding -- The rounding mode to use.

### SetStripIntervalWhitespace -- Sets the whitespace stripping mode for the formatter.

SecretArguments=AllowedWhenUntainted

Arguments:

- `strip`: SecondsFormatterIntervalWhitespace
