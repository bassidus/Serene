# FrameAPISimpleCheckout

Environment=All, Predicates={}

## Functions

### CancelOpenCheckout

HasRestrictions=true

### ClearFocus

### CloseCheckout

HasRestrictions=true

### CopyExternalLink

### OpenCheckout

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `checkoutID`: number

Returns:

- `wasOpened`: bool

### OpenExternalLink

### SetFocus

### SetZoom

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `zoomLevel`: number
