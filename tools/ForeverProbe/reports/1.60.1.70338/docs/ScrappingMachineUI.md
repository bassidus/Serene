# ScrappingMachineUI

Namespace `C_ScrappingMachineUI`.

Environment=All, Predicates={}

## Functions

### C_ScrappingMachineUI.CloseScrappingMachine

### C_ScrappingMachineUI.DropPendingScrapItemFromCursor

SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: number

### C_ScrappingMachineUI.GetCurrentPendingScrapItemLocationByIndex

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: number

Returns:

- `itemLoc`: ItemLocation (ItemLocationMixin)

### C_ScrappingMachineUI.GetScrapSpellID

Returns:

- `spellID`: number

### C_ScrappingMachineUI.GetScrappingMachineName

MayReturnNothing=true

Returns:

- `name`: string

### C_ScrappingMachineUI.HasScrappableItems

Returns:

- `hasScrappableItems`: bool

### C_ScrappingMachineUI.RemoveAllScrapItems

### C_ScrappingMachineUI.RemoveCurrentScrappingItem

### C_ScrappingMachineUI.RemoveItemToScrap

SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: number

### C_ScrappingMachineUI.ScrapItems

### C_ScrappingMachineUI.ValidateScrappingList

## Events

### SCRAPPING_MACHINE_ITEM_ADDED

SynchronousEvent=true

Payload:

- `index`: number

### SCRAPPING_MACHINE_ITEM_REMOVED

SynchronousEvent=true

Payload:

- `index`: number

### SCRAPPING_MACHINE_PENDING_ITEM_CHANGED

SynchronousEvent=true

### SCRAPPING_MACHINE_SCRAPPING_FINISHED

SynchronousEvent=true
