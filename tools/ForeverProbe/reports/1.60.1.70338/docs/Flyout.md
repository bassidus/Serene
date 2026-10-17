# Flyout

Namespace `C_Flyout`.

Environment=All, Predicates={}

## Functions

### C_Flyout.FlyoutHasSpell

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `flyoutID`: number
- `spellID`: number

Returns:

- `hasSpell`: bool

### C_Flyout.GetFlyoutID

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `index`: luaIndex

Returns:

- `flyoutID`: number

### C_Flyout.GetFlyoutInfo

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `flyoutID`: number

Returns:

- `info`: FlyoutInfo

### C_Flyout.GetFlyoutSlotInfo

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `flyoutID`: number
- `slotIndex`: luaIndex

Returns:

- `slotInfo`: FlyoutSlotInfo

### C_Flyout.GetFlyoutTexture

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `flyoutID`: number

Returns:

- `textureID`: fileID

### C_Flyout.GetNumFlyouts

Returns:

- `numFlyouts`: number

## Tables

### FlyoutInfo

Fields:

- `name`: string
- `description`: string
- `numSlots`: number
- `isKnown`: bool

### FlyoutSlotInfo

Fields:

- `spellID`: number
- `overrideSpellID`: number
- `isKnown`: bool
- `name`: string?
- `specID`: number?
