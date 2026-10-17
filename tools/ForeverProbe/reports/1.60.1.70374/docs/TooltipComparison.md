# TooltipComparison

Namespace `C_TooltipComparison`.

Environment=All, Predicates={}

## Functions

### C_TooltipComparison.CompareItem

IsProtectedFunction=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `comparisonItem`: TooltipComparisonItem
- `tooltip`: Tooltip
- `anchorFrame`: SimpleFrame?

### C_TooltipComparison.GetItemComparisonDelta

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `comparisonItem`: TooltipComparisonItem
- `equippedItem`: TooltipComparisonItem
- `pairedItem`: TooltipComparisonItem?
- `addPairedStats`: bool? -- Whether the paired item's stats are added or subtracted

Returns:

- `lines`: table<string>

### C_TooltipComparison.GetItemComparisonInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `comparisonItem`: TooltipComparisonItem

Returns:

- `info`: TooltipItemComparisonInfo

## Events

### TOOLTIP_SHOW_ITEM_COMPARISON

CallbackEvent=true

Payload:

- `comparisonItem`: TooltipComparisonItem
- `tooltip`: Tooltip
- `anchorFrame`: SimpleFrame?

## Tables

### TooltipComparisonMethod

MaxValue=3, MinValue=0, NumValues=4

Fields:

- `Single`: TooltipComparisonMethod [= 0]
- `WithBothHands`: TooltipComparisonMethod [= 1]
- `WithBagMainHandItem`: TooltipComparisonMethod [= 2]
- `WithBagOffHandItem`: TooltipComparisonMethod [= 3]

### TooltipItemComparisonInfo

Fields:

- `method`: TooltipComparisonMethod [default=Single]
- `item`: TooltipComparisonItem
- `additionalItems`: table<TooltipComparisonItem>
