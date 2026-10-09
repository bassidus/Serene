# ItemInteractionUI

Namespace `C_ItemInteraction`.

Environment=All, Predicates={}

## Functions

### C_ItemInteraction.ClearPendingItem

### C_ItemInteraction.CloseUI

### C_ItemInteraction.GetChargeInfo

Returns:

- `chargeInfo`: ItemInteractionChargeInfo

### C_ItemInteraction.GetItemConversionCurrencyCost

SecretArguments=AllowedWhenUntainted

Arguments:

- `item`: ItemLocation (ItemLocationMixin)

Returns:

- `conversionCost`: ConversionCurrencyCost

### C_ItemInteraction.GetItemInteractionInfo

Returns:

- `info`: ItemInteractionFrameInfo?

### C_ItemInteraction.GetItemInteractionSpellId

Returns:

- `spellId`: number

### C_ItemInteraction.InitializeFrame

### C_ItemInteraction.PerformItemInteraction

HasRestrictions=true

### C_ItemInteraction.Reset

### C_ItemInteraction.SetPendingItem

SecretArguments=AllowedWhenUntainted

Arguments:

- `item`: ItemLocation (ItemLocationMixin)?

Returns:

- `success`: bool

## Events

### ITEM_INTERACTION_CHARGE_INFO_UPDATED

SynchronousEvent=true

### ITEM_INTERACTION_ITEM_SELECTION_UPDATED

SynchronousEvent=true

Payload:

- `itemLocation`: ItemLocation (ItemLocationMixin)?

## Tables

### ConversionCurrencyCost

Fields:

- `currencyID`: number
- `amount`: number

### ItemInteractionChargeInfo

Fields:

- `newChargeAmount`: number
- `rechargeRate`: number
- `timeToNextCharge`: number

### ItemInteractionFrameInfo

Fields:

- `textureKit`: textureKit
- `openSoundKitID`: number
- `closeSoundKitID`: number
- `titleText`: string
- `tutorialText`: string
- `buttonText`: string
- `interactionType`: UIItemInteractionType
- `flags`: UIItemInteractionFlags
- `description`: string?
- `buttonTooltip`: string?
- `confirmationDescription`: string?
- `slotTooltip`: string?
- `cost`: number?
- `currencyTypeId`: number?
- `dropInSlotSoundKitId`: number?
