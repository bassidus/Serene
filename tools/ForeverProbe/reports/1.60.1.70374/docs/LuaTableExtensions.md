# LuaTableExtensions

Namespace `table`.

Environment=All, Predicates={}

## Functions

### table.contains -- Returns true if any value in the table compares equal to the specified value.

SecretArguments=AllowedWhenUntainted

Arguments:

- `table`: table -- The table to search.
- `value`: any? -- The value for which to search.

Returns:

- `containsValue`: bool -- True if any entry in the table has the specified value.

### table.count -- Returns the number of entries in the table.

SecretArguments=AllowedWhenUntainted, SecretWhenLuaTableHasSecretKeys=true

Arguments:

- `table`: table -- The table whose entries will be counted.

Returns:

- `count`: number -- The number of entries in the table.

### table.create -- Creates an empty table with storage preallocated for the specified number of array and non-array entries.

SecretArguments=AllowedWhenUntainted

Arguments:

- `arraySizeHint`: number -- The number of array entries for which to preallocate storage.
- `nodeSizeHint`: number [default=0] -- The number of non-array entries for which to preallocate storage.

Returns:

- `table`: table

### table.indexof -- Returns the first integer index whose value compares equal to the specified value, searching consecutively from index 1 until the first nil value.

SecretArguments=AllowedWhenUntainted

Arguments:

- `table`: table -- The table to search.
- `value`: any? -- The value for which to search.

Returns:

- `index`: number? -- The first matching index, or nil if no match is found.

### table.freeze -- Marks a supplied table as frozen, preventing any modifications to its contents, or replacement of its metatable. If the table has a pre-existing metatable with a '__newindex' table or function, assignments will pass through without raising errors. For tainted code, only tables created by the same addon making this function call are permitted to be frozen.

SecretArguments=AllowedWhenUntainted

Arguments:

- `table`: table -- The table to freeze.

Returns:

- `frozen`: table -- The supplied table, passed through.

### table.keys -- Returns an array containing the keys of the specified table.

SecretArguments=AllowedWhenUntainted

Arguments:

- `table`: table -- The table whose keys will be returned.

Returns:

- `keys`: any -- An array containing the table's keys. The order of the returned keys is unspecified.

### table.getcountinfo -- Returns detailed information about the number and distribution of entries in the table.

SecretArguments=AllowedWhenUntainted, SecretWhenLuaTableHasSecretKeys=true

Arguments:

- `table`: table -- The table to inspect.

Returns:

- `numEntries`: number -- The total number of entries in the table.
- `numPositiveIntegerKeys`: number -- The number of entries with positive integral keys.
- `maxPositiveIntegerKey`: number -- The largest positive integral key in the table, or zero if no such keys were found.

### table.values -- Returns an array containing the values of the specified table.

SecretArguments=AllowedWhenUntainted

Arguments:

- `table`: table -- The table whose values will be returned.

Returns:

- `values`: any -- An array containing the table's values. The order of the returned values is unspecified.

### table.isempty -- Returns true if the table contains no entries.

SecretArguments=AllowedWhenUntainted, SecretWhenLuaTableHasSecretKeys=true

Arguments:

- `table`: table

Returns:

- `empty`: bool -- True if the table contains no entries; otherwise false.

### table.isfrozen -- Returns true if a table has been marked as frozen.

SecretArguments=AllowedWhenUntainted

Arguments:

- `table`: table -- The table to inspect.

Returns:

- `frozen`: bool -- True if the table has been made read-only; otherwise false.

### table.removeunordered -- Removes the value at the specified integer index by replacing it with the last value in the array and shortening the array by one element. The order of values in the array is not preserved.

SecretArguments=AllowedWhenUntainted

Arguments:

- `table`: table -- The table from which to remove a value.
- `index`: number? -- The integer index of the value to remove. If omitted, the last value is removed.

Returns:

- `value`: any? -- The removed value, or nil if the index is outside the array bounds.

### table.removevalue -- Removes all values equal to the specified value from the array portion of a table.

SecretArguments=AllowedWhenUntainted

Arguments:

- `table`: table -- The table from which to remove values.
- `value`: any? -- The value to remove.

Returns:

- `removedCount`: number -- The number of values removed.
