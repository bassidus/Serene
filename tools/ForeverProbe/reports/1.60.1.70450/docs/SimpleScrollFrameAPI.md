# SimpleScrollFrameAPI

Environment=All, Predicates={}

## Functions

### GetHorizontalScroll

SecretReturnsForAspect={1=4194304}

Returns:

- `offset`: uiUnit

### GetHorizontalScrollRange

SecretReturnsForAspect={1=512}

Returns:

- `range`: uiUnit

### GetScrollChild

Returns:

- `scrollChild`: SimpleFrame

### GetVerticalScroll

SecretReturnsForAspect={1=4194304}

Returns:

- `offset`: uiUnit

### GetVerticalScrollRange

SecretReturnsForAspect={1=512}

Returns:

- `range`: uiUnit

### SetHorizontalScroll

IsProtectedFunction=true, SecretArguments=AllowedWhenUntainted, SecretArgumentsAddAspect={1=4194304}

Arguments:

- `offset`: uiUnit

### SetScrollChild

CheckAllowChangeParent=true, IsProtectedFunction=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `scrollChild`: SimpleFrame

### SetVerticalScroll

IsProtectedFunction=true, SecretArguments=AllowedWhenUntainted, SecretArgumentsAddAspect={1=4194304}

Arguments:

- `offset`: uiUnit

### UpdateScrollChildRect
