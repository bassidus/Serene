# MountJournal

Namespace `C_MountJournal`.

Environment=All, Predicates={}

## Functions

### C_MountJournal.ApplyMountEquipment

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemLocation`: ItemLocation (ItemLocationMixin)

Returns:

- `canContinue`: bool

### C_MountJournal.AreMountEquipmentEffectsSuppressed

Returns:

- `areEffectsSuppressed`: bool

### C_MountJournal.ClearFanfare

SecretArguments=AllowedWhenUntainted

Arguments:

- `mountID`: number

### C_MountJournal.ClearRecentFanfares

### C_MountJournal.Dismiss

### C_MountJournal.GetAllCreatureDisplayIDsForMountID

SecretArguments=AllowedWhenUntainted

Arguments:

- `mountID`: number

Returns:

- `creatureDisplayIDs`: table<number>

### C_MountJournal.GetAppliedMountEquipmentID

Returns:

- `itemID`: number?

### C_MountJournal.GetCollectedDragonridingMounts

Returns:

- `mountIDs`: table<number>

### C_MountJournal.GetCollectedFilterSetting

SecretArguments=AllowedWhenUntainted

Arguments:

- `filterIndex`: luaIndex

Returns:

- `isChecked`: bool

### C_MountJournal.GetDisplayedMountAllCreatureDisplayInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `mountIndex`: luaIndex

Returns:

- `allDisplayInfo`: table<MountCreatureDisplayInfo>

### C_MountJournal.GetDisplayedMountID

SecretArguments=AllowedWhenUntainted

Arguments:

- `displayIndex`: luaIndex

Returns:

- `mountID`: number

### C_MountJournal.GetDisplayedMountInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `displayIndex`: luaIndex

Returns:

- `name`: cstring
- `spellID`: number
- `icon`: fileID
- `isActive`: bool
- `isUsable`: bool
- `sourceType`: number
- `isFavorite`: bool
- `isFactionSpecific`: bool
- `faction`: PvPFaction?
- `shouldHideOnChar`: bool
- `isCollected`: bool
- `mountID`: number
- `isSteadyFlight`: bool

### C_MountJournal.GetDisplayedMountInfoExtra

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `mountIndex`: luaIndex

Returns:

- `creatureDisplayInfoID`: number?
- `description`: cstring
- `source`: cstring
- `isSelfMount`: bool
- `mountTypeID`: number
- `uiModelSceneID`: number
- `animID`: number
- `spellVisualKitID`: number
- `disablePlayerMountPreview`: bool

### C_MountJournal.GetDynamicFlightModeSpellID

Returns:

- `spellID`: number

### C_MountJournal.GetIsFavorite

SecretArguments=AllowedWhenUntainted

Arguments:

- `mountIndex`: luaIndex

Returns:

- `isFavorite`: bool
- `canSetFavorite`: bool

### C_MountJournal.GetMountAllCreatureDisplayInfoByID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `mountID`: number

Returns:

- `allDisplayInfo`: table<MountCreatureDisplayInfo>

### C_MountJournal.GetMountEquipmentUnlockLevel

Returns:

- `level`: number

### C_MountJournal.GetMountFromItem

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemID`: number

Returns:

- `mountID`: number?

### C_MountJournal.GetMountFromSpell

SecretArguments=AllowedWhenTainted

Arguments:

- `spellID`: SpellIdentifier

Returns:

- `mountID`: number?

### C_MountJournal.GetMountIDs

Returns:

- `mountIDs`: table<number>

### C_MountJournal.GetMountInfoByID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `mountID`: number

Returns:

- `name`: cstring
- `spellID`: number
- `icon`: fileID
- `isActive`: bool
- `isUsable`: bool
- `sourceType`: number
- `isFavorite`: bool
- `isFactionSpecific`: bool
- `faction`: PvPFaction?
- `shouldHideOnChar`: bool
- `isCollected`: bool
- `mountID`: number
- `isSteadyFlight`: bool

### C_MountJournal.GetMountInfoExtraByID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `mountID`: number

Returns:

- `creatureDisplayInfoID`: number?
- `description`: cstring
- `source`: cstring
- `isSelfMount`: bool
- `mountTypeID`: number
- `uiModelSceneID`: number
- `animID`: number
- `spellVisualKitID`: number
- `disablePlayerMountPreview`: bool

### C_MountJournal.GetMountLink

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellID`: number

Returns:

- `mountCreatureDisplayInfoLink`: string?

### C_MountJournal.GetMountUsabilityByID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `mountID`: number
- `checkIndoors`: bool

Returns:

- `isUsable`: bool
- `useError`: cstring?

### C_MountJournal.GetNumDisplayedMounts

Returns:

- `numMounts`: number

### C_MountJournal.GetNumMounts

Returns:

- `numMounts`: number

### C_MountJournal.GetNumMountsNeedingFanfare

Returns:

- `numMountsNeedingFanfare`: number

### C_MountJournal.HasDisplayableMount

Returns:

- `hasMount`: bool

### C_MountJournal.IsDragonridingUnlocked -- Returns whether the player has unlocked the ability to switch between Skyriding and steady flight styles for flying mounts .

Returns:

- `isUnlocked`: bool

### C_MountJournal.IsItemMountEquipment -- Determines if the item is mount equipment based on its class and subclass.

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemLocation`: ItemLocation (ItemLocationMixin)

Returns:

- `isMountEquipment`: bool

### C_MountJournal.IsMountEquipmentApplied

Returns:

- `isApplied`: bool

### C_MountJournal.IsSourceChecked

SecretArguments=AllowedWhenUntainted

Arguments:

- `filterIndex`: luaIndex

Returns:

- `isChecked`: bool

### C_MountJournal.IsTypeChecked

SecretArguments=AllowedWhenUntainted

Arguments:

- `filterIndex`: luaIndex

Returns:

- `isChecked`: bool

### C_MountJournal.IsUsingDefaultFilters

Returns:

- `isUsingDefaultFilters`: bool

### C_MountJournal.IsValidSourceFilter

SecretArguments=AllowedWhenUntainted

Arguments:

- `filterIndex`: luaIndex

Returns:

- `isValid`: bool

### C_MountJournal.IsValidTypeFilter

SecretArguments=AllowedWhenUntainted

Arguments:

- `filterIndex`: luaIndex

Returns:

- `isValid`: bool

### C_MountJournal.MountEquipmentAvailable

Returns:

- `isMountEquipmentAvailable`: bool

### C_MountJournal.NeedsFanfare

SecretArguments=AllowedWhenUntainted

Arguments:

- `mountID`: number

Returns:

- `needsFanfare`: bool

### C_MountJournal.Pickup

SecretArguments=AllowedWhenUntainted

Arguments:

- `displayIndex`: luaIndex

### C_MountJournal.PickupDynamicFlightMode

### C_MountJournal.SetAllSourceFilters

SecretArguments=AllowedWhenUntainted

Arguments:

- `isChecked`: bool

### C_MountJournal.SetAllTypeFilters

SecretArguments=AllowedWhenUntainted

Arguments:

- `isChecked`: bool

### C_MountJournal.SetCollectedFilterSetting

SecretArguments=AllowedWhenUntainted

Arguments:

- `filterIndex`: luaIndex
- `isChecked`: bool

### C_MountJournal.SetDefaultFilters

### C_MountJournal.SetIsFavorite

SecretArguments=AllowedWhenUntainted

Arguments:

- `mountIndex`: luaIndex
- `isFavorite`: bool

### C_MountJournal.SetSearch

SecretArguments=AllowedWhenUntainted

Arguments:

- `searchValue`: cstring

### C_MountJournal.SetSourceFilter

SecretArguments=AllowedWhenUntainted

Arguments:

- `filterIndex`: luaIndex
- `isChecked`: bool

### C_MountJournal.SetTypeFilter

SecretArguments=AllowedWhenUntainted

Arguments:

- `filterIndex`: luaIndex
- `isChecked`: bool

### C_MountJournal.SummonByID

SecretArguments=AllowedWhenUntainted

Arguments:

- `mountID`: number

### C_MountJournal.SwapDynamicFlightMode

## Events

### MOUNT_EQUIPMENT_APPLY_RESULT

SynchronousEvent=true

Payload:

- `success`: bool

### MOUNT_JOURNAL_SEARCH_UPDATED

SynchronousEvent=true

### MOUNT_JOURNAL_USABILITY_CHANGED

SynchronousEvent=true

### NEW_MOUNT_ADDED

SynchronousEvent=true

Payload:

- `mountID`: number

## Tables

### MountCreatureDisplayInfo

Fields:

- `creatureDisplayID`: number
- `isVisible`: bool

### MountInfo

Fields:

- `name`: cstring
- `spellID`: number
- `icon`: fileID
- `isActive`: bool
- `isUsable`: bool
- `sourceType`: number
- `isFavorite`: bool
- `isFactionSpecific`: bool
- `faction`: PvPFaction?
- `shouldHideOnChar`: bool
- `isCollected`: bool
- `mountID`: number
- `isSteadyFlight`: bool

### MountInfoExtra

Fields:

- `creatureDisplayInfoID`: number?
- `description`: cstring
- `source`: cstring
- `isSelfMount`: bool
- `mountTypeID`: number
- `uiModelSceneID`: number
- `animID`: number
- `spellVisualKitID`: number
- `disablePlayerMountPreview`: bool
