# LuaMathExtensions

Namespace `math`.

Environment=All, Predicates={}

## Functions

### math.clamp -- Clamps a value to the inclusive range defined by the minimum and maximum values.

SecretArguments=AllowedWhenUntainted

Arguments:

- `value`: number -- The value to clamp.
- `minimum`: number -- The inclusive lower bound.
- `maximum`: number -- The inclusive upper bound.

Returns:

- `clampedValue`: number -- The clamped value.

### math.isfinite -- Returns whether a value is finite.

SecretArguments=AllowedWhenUntainted

Arguments:

- `value`: number -- The value to inspect.

Returns:

- `finite`: bool -- True if the value is neither infinite nor NaN; otherwise false.

### math.isinf -- Returns whether a value is positive or negative infinity.

SecretArguments=AllowedWhenUntainted

Arguments:

- `value`: number -- The value to inspect.

Returns:

- `infinite`: bool -- True if the value is positive or negative infinity; otherwise false.

### math.isnan -- Returns whether a value is NaN.

SecretArguments=AllowedWhenUntainted

Arguments:

- `value`: number -- The value to inspect.

Returns:

- `nan`: bool -- True if the value is NaN; otherwise false.

### math.lerp -- Linearly interpolates between two values.

SecretArguments=AllowedWhenUntainted

Arguments:

- `startValue`: number -- The value returned when the interpolation amount is 0.
- `endValue`: number -- The value returned when the interpolation amount is 1.
- `amount`: number -- The interpolation amount. Values outside [0, 1] extrapolate beyond the two values.

Returns:

- `interpolatedValue`: number -- The interpolated value.

### math.normalize -- Returns the relative position of a value within a range, where the minimum maps to 0 and the maximum maps to 1.

SecretArguments=AllowedWhenUntainted

Arguments:

- `value`: number -- The value to normalize.
- `minimum`: number -- The value that maps to 0.
- `maximum`: number -- The value that maps to 1.

Returns:

- `normalizedValue`: number -- The normalized value. Values outside the input range produce results outside [0, 1].

### math.remap -- Maps a value from one range to the corresponding position in another range.

SecretArguments=AllowedWhenUntainted

Arguments:

- `value`: number -- The value to map.
- `sourceMinimum`: number -- The lower endpoint of the source range.
- `sourceMaximum`: number -- The upper endpoint of the source range.
- `destinationMinimum`: number -- The lower endpoint of the destination range.
- `destinationMaximum`: number -- The upper endpoint of the destination range.

Returns:

- `remappedValue`: number -- The mapped value. Values outside the source range are extrapolated beyond the destination range.

### math.round -- Rounds a value to the specified number of decimal places, with halfway values rounded away from zero.

SecretArguments=AllowedWhenUntainted

Arguments:

- `value`: number -- The value to round.
- `decimalPlaces`: number [default=0] -- The number of decimal places to preserve. Negative values round to positions left of the decimal point.

Returns:

- `roundedValue`: number -- The rounded value.

### math.saturate -- Clamps a value to the inclusive range [0, 1].

SecretArguments=AllowedWhenUntainted

Arguments:

- `value`: number -- The value to clamp.

Returns:

- `saturatedValue`: number -- The value clamped to the inclusive range [0, 1].

### math.sign -- Returns -1 for negative values, 0 for zero, and 1 for positive values.

SecretArguments=AllowedWhenUntainted

Arguments:

- `value`: number -- The value whose sign will be returned.

Returns:

- `sign`: number -- The sign of the value.

### math.wrap -- Wraps a value into the half-open range [minimum, maximum).

SecretArguments=AllowedWhenUntainted

Arguments:

- `value`: number -- The value to wrap.
- `minimum`: number -- The inclusive lower bound of the range.
- `maximum`: number -- The exclusive upper bound of the range.

Returns:

- `wrapped`: number -- The wrapped value, greater than or equal to minimum and less than maximum. If minimum equals maximum, returns minimum.
