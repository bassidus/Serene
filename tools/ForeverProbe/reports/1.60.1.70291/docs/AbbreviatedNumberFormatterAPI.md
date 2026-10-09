# AbbreviatedNumberFormatterAPI

Environment=All, ObjectType=Userdata, Predicates={}

## Functions

### AddBreakpoint -- Adds a new breakpoint to the formatter.

RequiresValidAbbreviationBreakpoints=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `breakpoint`: NumberAbbreviationBreakpoint

### ClearBreakpoints -- Removes all configured breakpoints from the formatter.

### Copy -- Returns a new copy of this formatter.

ReturnsNeverSecret=true

Returns:

- `copy`: AbbreviatedNumberFormatter

### GetBreakpoints -- Returns a list of all configured breakpoints on this formatter.

Returns:

- `breakpoints`: table<NumberAbbreviationBreakpoint>

### ResetBreakpoints -- Removes all configured breakpoints from the formatter and replaces them with appropriate defaults for the client locale.

### SetBreakpoints -- Replaces all breakpoints on the formatter.

RequiresValidAbbreviationBreakpoints=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `breakpoints`: table<NumberAbbreviationBreakpoint>
