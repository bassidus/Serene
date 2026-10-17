# PaperDollInfo

Namespace `C_PaperDollInfo`.

Environment=All, Predicates={}

## Functions

### C_PaperDollInfo.AmmoNeeded

Returns:

- `ammoNeeded`: bool

### C_PaperDollInfo.CanAutoEquipCursorItem

Returns:

- `canAutoEquip`: bool

### C_PaperDollInfo.CancelTemporaryEnchantment -- Cancels active temporary enchantments on inventory slot items.

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `slot`: LuaInventorySlot

### C_PaperDollInfo.CursorCanGoInSlot

SecretArguments=AllowedWhenUntainted

Arguments:

- `slotIndex`: luaIndex

Returns:

- `canOccupySlot`: bool

### C_PaperDollInfo.GetArmorEffectiveness

SecretArguments=AllowedWhenUntainted

Arguments:

- `armor`: number
- `attackerLevel`: number

Returns:

- `effectiveness`: number

### C_PaperDollInfo.GetArmorEffectivenessAgainstTarget

SecretArguments=AllowedWhenUntainted

Arguments:

- `armor`: number

Returns:

- `effectiveness`: number?

### C_PaperDollInfo.GetInspectAzeriteItemEmpoweredChoices

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken
- `equipmentSlotIndex`: luaIndex

Returns:

- `azeritePowerIDs`: table<number>

### C_PaperDollInfo.GetInspectGuildInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `unitString`: string

Returns:

- `achievementPoints`: number
- `numMembers`: number
- `guildName`: string
- `realmName`: string

### C_PaperDollInfo.GetInspectItemLevel

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `equippedItemLevel`: number

### C_PaperDollInfo.GetInspectRatedBGBlitzData

Returns:

- `ratedBGBlitzData`: InspectPVPData

### C_PaperDollInfo.GetInspectRatedBGData

Returns:

- `ratedBGData`: InspectRatedBGData

### C_PaperDollInfo.GetInspectRatedSoloShuffleData

Returns:

- `ratedSoloShuffleData`: InspectPVPData

### C_PaperDollInfo.GetInventorySlotInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `slotName`: cstring

Returns:

- `invSlot`: number
- `slotTexture`: fileID
- `checkRelic`: bool

### C_PaperDollInfo.GetInventorySlotInfoForInvSlot

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `invSlotValue`: number -- This is the Lua version of the INVSLOT enum, not a luaIndex

Returns:

- `invSlot`: number
- `slotTexture`: fileID
- `checkRelic`: bool
- `slotName`: cstring

### C_PaperDollInfo.GetMinItemLevel

Returns:

- `minItemLevel`: number?

### C_PaperDollInfo.GetStaggerPercentage

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `stagger`: number
- `staggerAgainstTarget`: number?

### C_PaperDollInfo.GetTemporaryEnchantmentInfo -- Queries information about active temporary enchants on inventory slot items.

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `slot`: LuaInventorySlot -- An appropriate INVSLOT_ constant.

Returns:

- `enchantInfo`: TemporaryItemEnchantInfo -- Returns nothing if no temporary enchantment is active for this slot.

### C_PaperDollInfo.IsInventorySlotEnabled

SecretArguments=AllowedWhenUntainted

Arguments:

- `slotName`: stringView

Returns:

- `isEnabled`: bool

### C_PaperDollInfo.IsRangedSlotShown

Returns:

- `isShown`: bool

### C_PaperDollInfo.OffhandHasShield

Returns:

- `offhandHasShield`: bool

### C_PaperDollInfo.OffhandHasWeapon

Returns:

- `offhandHasWeapon`: bool

## Events

### AVOIDANCE_UPDATE

SynchronousEvent=true

### CHARACTER_POINTS_CHANGED

SynchronousEvent=true

Payload:

- `change`: number

### CHARACTER_UPGRADE_SPELL_TIER_SET

SynchronousEvent=true

Payload:

- `tierIndex`: number

### COMBAT_RATING_UPDATE

SynchronousEvent=true

### DISABLE_XP_GAIN

SynchronousEvent=true

### ENABLE_XP_GAIN

SynchronousEvent=true

### EQUIP_BIND_CONFIRM

SynchronousEvent=true

Payload:

- `slot`: number
- `itemLocation`: ItemLocation (ItemLocationMixin)

### INSPECT_HONOR_UPDATE

SynchronousEvent=true

### INSPECT_READY

SynchronousEvent=true

Payload:

- `inspecteeGUID`: WOWGUID

### LIFESTEAL_UPDATE

SynchronousEvent=true

### MASTERY_UPDATE

SynchronousEvent=true

### PET_STATS_UPDATE

SynchronousEvent=true

### PLAYER_AVG_ITEM_LEVEL_UPDATE

SynchronousEvent=true

### PLAYER_EQUIPMENT_CHANGED

SynchronousEvent=true

Payload:

- `equipmentSlot`: number
- `hasCurrent`: bool

### PROFESSION_EQUIPMENT_CHANGED

SynchronousEvent=true

Payload:

- `skillLineID`: number
- `isTool`: bool

### PVP_POWER_UPDATE

SynchronousEvent=true

### SPEED_UPDATE

SynchronousEvent=true

### SPELL_POWER_CHANGED

SynchronousEvent=true

### STURDINESS_UPDATE

SynchronousEvent=true

### UPDATE_FACTION

SynchronousEvent=true

### UPDATE_INVENTORY_ALERTS

SynchronousEvent=true

### UPDATE_INVENTORY_DURABILITY

SynchronousEvent=true

### WEAPON_SLOT_CHANGED

UniqueEvent=true

## Tables

### InspectGuildInfo

Fields:

- `achievementPoints`: number
- `numMembers`: number
- `guildName`: string
- `realmName`: string

### InspectPVPData

Fields:

- `rating`: number
- `gamesWon`: number
- `gamesPlayed`: number
- `roundsWon`: number
- `roundsPlayed`: number

### InspectRatedBGData

Fields:

- `rating`: number
- `played`: number
- `won`: number

### TemporaryItemEnchantInfo

Fields:

- `enchantID`: number
- `remainingTimeMs`: number
- `chargesRemaining`: number
- `hasExpirationTime`: bool
