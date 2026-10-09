# LegendaryCrafting

Namespace `C_LegendaryCrafting`.

Environment=All, Predicates={}

## Functions

### C_LegendaryCrafting.CloseRuneforgeInteraction

### C_LegendaryCrafting.CraftRuneforgeLegendary

SecretArguments=AllowedWhenUntainted

Arguments:

- `description`: RuneforgeLegendaryCraftDescription

### C_LegendaryCrafting.GetRuneforgeItemPreviewInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `baseItem`: ItemLocation (ItemLocationMixin)
- `runeforgePowerID`: number?
- `modifiers`: table<number>?

Returns:

- `info`: RuneforgeItemPreviewInfo?

### C_LegendaryCrafting.GetRuneforgeLegendaryComponentInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `runeforgeLegendary`: ItemLocation (ItemLocationMixin)

Returns:

- `componentInfo`: RuneforgeLegendaryComponentInfo

### C_LegendaryCrafting.GetRuneforgeLegendaryCost

SecretArguments=AllowedWhenUntainted

Arguments:

- `baseItem`: ItemLocation (ItemLocationMixin)

Returns:

- `cost`: table<CurrencyCost>

### C_LegendaryCrafting.GetRuneforgeLegendaryCraftSpellID

Returns:

- `spellID`: number

### C_LegendaryCrafting.GetRuneforgeLegendaryCurrencies

Returns:

- `currencies`: table<number>

### C_LegendaryCrafting.GetRuneforgeLegendaryUpgradeCost

SecretArguments=AllowedWhenUntainted

Arguments:

- `runeforgeLegendary`: ItemLocation (ItemLocationMixin)
- `upgradeItem`: ItemLocation (ItemLocationMixin)

Returns:

- `cost`: table<CurrencyCost>

### C_LegendaryCrafting.GetRuneforgeModifierInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `baseItem`: ItemLocation (ItemLocationMixin)
- `powerID`: number?
- `addedModifierIndex`: luaIndex
- `modifiers`: table<number>

Returns:

- `name`: string
- `description`: table<string>

### C_LegendaryCrafting.GetRuneforgeModifiers

Returns:

- `modifiedReagentItemIDs`: table<number>

### C_LegendaryCrafting.GetRuneforgePowerInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `runeforgePowerID`: number

Returns:

- `power`: RuneforgePower

### C_LegendaryCrafting.GetRuneforgePowerSlots

SecretArguments=AllowedWhenUntainted

Arguments:

- `runeforgePowerID`: number

Returns:

- `slotNames`: table<cstring>

### C_LegendaryCrafting.GetRuneforgePowers

SecretArguments=AllowedWhenUntainted

Arguments:

- `baseItem`: ItemLocation (ItemLocationMixin)?
- `filter`: RuneforgePowerFilter?

Returns:

- `primaryRuneforgePowerIDs`: table<number>
- `otherRuneforgePowerIDs`: table<number>

### C_LegendaryCrafting.GetRuneforgePowersByClassSpecAndCovenant

SecretArguments=AllowedWhenUntainted

Arguments:

- `classID`: number?
- `specID`: number?
- `covenantID`: number?
- `filter`: RuneforgePowerFilter?

Returns:

- `runeforgePowerIDs`: table<number>

### C_LegendaryCrafting.IsRuneforgeLegendary

SecretArguments=AllowedWhenUntainted

Arguments:

- `item`: ItemLocation (ItemLocationMixin)

Returns:

- `isRuneforgeLegendary`: bool

### C_LegendaryCrafting.IsRuneforgeLegendaryMaxLevel

SecretArguments=AllowedWhenUntainted

Arguments:

- `runeforgeLegendary`: ItemLocation (ItemLocationMixin)

Returns:

- `isMaxLevel`: bool

### C_LegendaryCrafting.IsUpgradeItemValidForRuneforgeLegendary

SecretArguments=AllowedWhenUntainted

Arguments:

- `runeforgeLegendary`: ItemLocation (ItemLocationMixin)
- `upgradeItem`: ItemLocation (ItemLocationMixin)

Returns:

- `isValid`: bool

### C_LegendaryCrafting.IsValidRuneforgeBaseItem

SecretArguments=AllowedWhenUntainted

Arguments:

- `baseItem`: ItemLocation (ItemLocationMixin)

Returns:

- `isValid`: bool

### C_LegendaryCrafting.MakeRuneforgeCraftDescription

SecretArguments=AllowedWhenUntainted

Arguments:

- `baseItem`: ItemLocation (ItemLocationMixin)
- `runeforgePowerID`: number
- `modifiers`: table<number>

Returns:

- `description`: RuneforgeLegendaryCraftDescription

### C_LegendaryCrafting.UpgradeRuneforgeLegendary

SecretArguments=AllowedWhenUntainted

Arguments:

- `runeforgeLegendary`: ItemLocation (ItemLocationMixin)
- `upgradeItem`: ItemLocation (ItemLocationMixin)

## Events

### NEW_RUNEFORGE_POWER_ADDED

SynchronousEvent=true

Payload:

- `powerID`: number

### RUNEFORGE_LEGENDARY_CRAFTING_CLOSED

SynchronousEvent=true

### RUNEFORGE_LEGENDARY_CRAFTING_OPENED

SynchronousEvent=true

Payload:

- `isUpgrade`: bool

### RUNEFORGE_POWER_INFO_UPDATED

SynchronousEvent=true

Payload:

- `powerID`: number
