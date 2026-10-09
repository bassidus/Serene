# LuaStringExtensions

Namespace `string`.

Environment=All, Predicates={}

## Functions

### string.ltrim -- Returns a string with all bytes in the specified character set removed from the start.

SecretArguments=AllowedWhenUntainted

Arguments:

- `str`: stringView -- The string to trim.
- `characters`: stringView [default= \r\n\t] -- The set of bytes to remove.

Returns:

- `trimmed`: stringView -- The left-trimmed string.

### string.rtrim -- Returns a string with all bytes in the specified character set removed from the end.

SecretArguments=AllowedWhenUntainted

Arguments:

- `str`: stringView -- The string to trim.
- `characters`: stringView [default= \r\n\t] -- The set of bytes to remove.

Returns:

- `trimmed`: stringView -- The right-trimmed string.

### string.contains -- Returns true if a string contains the specified literal substring.

SecretArguments=AllowedWhenUntainted

Arguments:

- `str`: stringView -- The string to search.
- `substring`: stringView -- The literal substring for which to search.

Returns:

- `contains`: bool -- True if the string contains the specified substring; otherwise false.

### string.endswith -- Returns true if a string ends with the specified suffix.

SecretArguments=AllowedWhenUntainted

Arguments:

- `str`: stringView -- The string to inspect.
- `suffix`: stringView -- The suffix for which to search.

Returns:

- `endsWith`: bool -- True if the string ends with the specified suffix; otherwise false.

### string.startswith -- Returns true if a string starts with the specified prefix.

SecretArguments=AllowedWhenUntainted

Arguments:

- `str`: stringView -- The string to inspect.
- `prefix`: stringView -- The prefix for which to search.

Returns:

- `startsWith`: bool -- True if the string starts with the specified prefix; otherwise false.

### string.trim -- Returns a string with all bytes in the specified character set removed from both ends.

SecretArguments=AllowedWhenUntainted

Arguments:

- `str`: stringView -- The string to trim.
- `characters`: stringView [default= \r\n\t] -- The set of bytes to remove.

Returns:

- `trimmed`: stringView -- The trimmed string.
