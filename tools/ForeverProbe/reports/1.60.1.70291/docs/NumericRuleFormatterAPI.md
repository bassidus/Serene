# NumericRuleFormatterAPI

Environment=All, ObjectType=Userdata, Predicates={}

## Functions

### AddBreakpoint -- Adds a new breakpoint to the formatter.

SecretArguments=AllowedWhenUntainted

Arguments:

- `breakpoint`: NumericRuleFormatBreakpoint

### ClearBreakpoints -- Removes all configured breakpoints from the formatter.

### Copy -- Returns a new copy of this formatter.

ReturnsNeverSecret=true

Returns:

- `copy`: NumericRuleFormatter

### GetBreakpoints -- Returns a list of all configured breakpoints on this formatter.

Returns:

- `breakpoints`: table<NumericRuleFormatBreakpoint>

### SetBreakpoints -- Replaces all breakpoints on the formatter.

SecretArguments=AllowedWhenUntainted

Arguments:

- `breakpoints`: table<NumericRuleFormatBreakpoint>
