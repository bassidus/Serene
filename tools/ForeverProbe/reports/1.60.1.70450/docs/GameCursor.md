# GameCursor

Environment=All, Predicates={}

## Functions

### ClearCursor

### ClearCursorHoveredItem

### CursorHasItem

Returns:

- `result`: bool

### CursorHasMacro

Returns:

- `result`: bool

### CursorHasMoney

Returns:

- `result`: bool

### CursorHasSpell

Returns:

- `result`: bool

### DeleteCursorItem

HasRestrictions=true

### DropCursorMoney

HasRestrictions=true

### EquipCursorItem

SecretArguments=AllowedWhenUntainted

Arguments:

- `slot`: luaIndex

### GetCursorInfo

### GetCursorMoney

Returns:

- `amount`: number

### PickupPlayerMoney

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `amount`: WOWMONEY

### ResetCursor

### SellCursorItem

### SetCursor

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: cstring?

Returns:

- `result`: bool

### SetCursorByMode

SecretArguments=AllowedWhenUntainted

Arguments:

- `mode`: Cursormode

Returns:

- `result`: bool

### SetCursorHoveredItem

SecretArguments=AllowedWhenUntainted

Arguments:

- `item`: ItemLocation (ItemLocationMixin)

### SetCursorHoveredItemTradeItem

SecretArguments=AllowedWhenUntainted

Arguments:

- `enabled`: bool

### SetCursorVirtualItem

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo
- `cursorType`: UICursorType
