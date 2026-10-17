# ActionBar

Namespace `C_ActionBar`.

Environment=All, Predicates={}

## Functions

### C_ActionBar.EnableActionRangeCheck -- Used in conjunction with ActionRangeCheckUpdate to inform the UI when an action goes in or out of range with its current target.

SecretArguments=AllowedWhenUntainted

Arguments:

- `actionID`: luaIndex
- `enable`: bool -- True if changes in range for the action should dispatch ActionRangeCheckUpdate. False if the action no longer needs the event.

### C_ActionBar.FindAssistedCombatActionButtons -- Returns the list of action bar slots that contain the Assisted Combat action spell.

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `setToSearch`: ActionBarSet [default=All]

Returns:

- `slots`: table<luaIndex>

### C_ActionBar.FindFlyoutActionButtons

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `flyoutID`: number
- `setToSearch`: ActionBarSet [default=All]

Returns:

- `slots`: table<luaIndex>

### C_ActionBar.FindPetActionButtons

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `petActionID`: number
- `setToSearch`: ActionBarSet [default=All]

Returns:

- `slots`: table<luaIndex>

### C_ActionBar.FindSpellActionButtons -- Returns the list of action bar slots that contain a specified spell.

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `spellID`: SpellIdentifier -- Expects a base spell, so if a spell is overridden the base ID should be provided.
- `setToSearch`: ActionBarSet [default=All, NeverSecret=true]

Returns:

- `slots`: table<luaIndex>

### C_ActionBar.ForceUpdateAction -- Force updates some internals for an action button slot.

SecretArguments=AllowedWhenUntainted

Arguments:

- `slotID`: luaIndex
- `suppressEvents`: bool [default=false]

### C_ActionBar.GetActionAutocast

RequiresValidActionSlot=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `actionID`: luaIndex

Returns:

- `autocastAllowed`: bool
- `autocastEnabled`: bool

### C_ActionBar.GetActionBarPage

Returns:

- `currentPage`: luaIndex

### C_ActionBar.GetActionChargeDuration -- Returns a duration object describing the active recharge time for an action.

RequiresValidActionSlot=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `actionID`: luaIndex

Returns:

- `duration`: LuaDurationObject

### C_ActionBar.GetActionCharges

RequiresValidActionSlot=true, SecretArguments=AllowedWhenUntainted, SecretWhenCooldownsRestricted=true

Arguments:

- `actionID`: luaIndex

Returns:

- `chargeInfo`: SpellChargeInfo

### C_ActionBar.GetActionCooldown

RequiresValidActionSlot=true, SecretArguments=AllowedWhenUntainted, SecretWhenCooldownsRestricted=true

Arguments:

- `actionID`: luaIndex

Returns:

- `cooldownInfo`: SpellCooldownInfo

### C_ActionBar.GetActionCooldownDuration -- Returns a duration object describing the active cooldown duration for an action.

RequiresValidActionSlot=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `actionID`: luaIndex
- `ignoreGCD`: bool [default=false]

Returns:

- `duration`: LuaDurationObject

### C_ActionBar.GetActionDisplayCount -- Depending on the action type, return a string that is either the use count or number of charges. If value is beyond the display count parameter, returns the replacementString (defaults to '*').

RequiresValidActionSlot=true, SecretArguments=AllowedWhenUntainted, SecretWhenCooldownsRestricted=true

Arguments:

- `actionID`: luaIndex
- `maxDisplayCount`: number [default=9999]
- `replacementString`: cstring [default=*]

Returns:

- `displayCount`: string

### C_ActionBar.GetActionLossOfControlCooldownDuration -- Returns a duration object describing the active loss of control cooldown duration for an action.

RequiresValidActionSlot=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `actionID`: luaIndex

Returns:

- `duration`: LuaDurationObject

### C_ActionBar.GetActionLossOfControlCooldownInfo

RequiresValidActionSlot=true, SecretArguments=AllowedWhenUntainted, SecretWhenCooldownsRestricted=true

Arguments:

- `actionID`: luaIndex

Returns:

- `lossOfControlInfo`: SpellLossOfControlInfo

### C_ActionBar.GetActionText

MayReturnNothing=true, RequiresValidActionSlot=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `actionID`: luaIndex

Returns:

- `text`: string

### C_ActionBar.GetActionTexture

RequiresValidActionSlot=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `actionID`: luaIndex

Returns:

- `textureFileID`: fileID

### C_ActionBar.GetActionUseCount

RequiresValidActionSlot=true, SecretArguments=AllowedWhenUntainted, SecretWhenCooldownsRestricted=true

Arguments:

- `actionID`: luaIndex

Returns:

- `count`: number

### C_ActionBar.GetBonusBarIndex

Returns:

- `bonusBarIndex`: luaIndex

### C_ActionBar.GetBonusBarIndexForSlot

SecretArguments=AllowedWhenUntainted

Arguments:

- `slotID`: luaIndex

Returns:

- `bonusBarIndex`: luaIndex?

### C_ActionBar.GetBonusBarOffset

Returns:

- `bonusBarOffset`: number

### C_ActionBar.GetExtraBarIndex

Returns:

- `extraBarIndex`: luaIndex

### C_ActionBar.GetItemActionOnEquipSpellID

SecretArguments=AllowedWhenUntainted

Arguments:

- `actionID`: luaIndex

Returns:

- `onEquipSpellID`: number?

### C_ActionBar.GetMultiCastBarIndex

Returns:

- `multiCastBarIndex`: luaIndex

### C_ActionBar.GetOverrideBarIndex

Returns:

- `overrideBarIndex`: luaIndex

### C_ActionBar.GetOverrideBarSkin

Returns:

- `textureFileID`: fileID?

### C_ActionBar.GetPetActionPetBarIndices

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `petActionID`: number
- `setToSearch`: ActionBarSet [default=All]

Returns:

- `slots`: table<luaIndex>

### C_ActionBar.GetProfessionQuality

SecretArguments=AllowedWhenUntainted

Arguments:

- `actionID`: luaIndex

Returns:

- `quality`: number?

### C_ActionBar.GetProfessionQualityInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `actionID`: luaIndex

Returns:

- `info`: CraftingQualityInfo?

### C_ActionBar.GetSpell

SecretArguments=AllowedWhenUntainted

Arguments:

- `actionID`: luaIndex

Returns:

- `spellID`: number

### C_ActionBar.GetTempShapeshiftBarIndex

Returns:

- `tempShapeshiftBarIndex`: luaIndex

### C_ActionBar.GetVehicleBarIndex

Returns:

- `vehicleBarIndex`: luaIndex

### C_ActionBar.HasAction -- Returns true if an actionbar slot is populated with an action.

RequiresValidActionSlot=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `actionID`: luaIndex

Returns:

- `hasAction`: bool

### C_ActionBar.HasAssistedCombatActionButtons

SecretArguments=AllowedWhenUntainted

Arguments:

- `setToSearch`: ActionBarSet [default=All]

Returns:

- `hasButtons`: bool

### C_ActionBar.HasBonusActionBar

Returns:

- `hasBonusActionBar`: bool

### C_ActionBar.HasExtraActionBar

Returns:

- `hasExtraActionBar`: bool

### C_ActionBar.HasFlyoutActionButtons

SecretArguments=AllowedWhenUntainted

Arguments:

- `flyoutID`: number
- `setToSearch`: ActionBarSet [default=All]

Returns:

- `hasFlyoutActionButtons`: bool

### C_ActionBar.HasOverrideActionBar

Returns:

- `hasOverrideActionBar`: bool

### C_ActionBar.HasPetActionButtons

SecretArguments=AllowedWhenUntainted

Arguments:

- `petActionID`: number
- `setToSearch`: ActionBarSet [default=All]

Returns:

- `hasPetActionButtons`: bool

### C_ActionBar.HasPetActionPetBarIndices

SecretArguments=AllowedWhenUntainted

Arguments:

- `petActionID`: number
- `setToSearch`: ActionBarSet [default=All]

Returns:

- `hasPetActionPetBarIndices`: bool

### C_ActionBar.HasRangeRequirements

RequiresValidActionSlot=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `actionID`: luaIndex

Returns:

- `hasRangeRequirements`: bool

### C_ActionBar.HasSpellActionButtons

SecretArguments=AllowedWhenTainted

Arguments:

- `spellID`: SpellIdentifier
- `setToSearch`: ActionBarSet [default=All, NeverSecret=true]

Returns:

- `hasSpellActionButtons`: bool

### C_ActionBar.HasTempShapeshiftActionBar

Returns:

- `hasTempShapeshiftActionBar`: bool

### C_ActionBar.HasVehicleActionBar

Returns:

- `hasVehicleActionBar`: bool

### C_ActionBar.IsActionInRange

RequiresValidActionSlot=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `actionID`: luaIndex
- `target`: UnitToken?

Returns:

- `isInRange`: bool? -- If nil, range cannot be determined (eg. no target is available).

### C_ActionBar.IsAssistedCombatAction -- Returns whether the given action button contains the Assisted Combat action spell.

SecretArguments=AllowedWhenUntainted

Arguments:

- `slotID`: luaIndex

Returns:

- `isAssistedCombatAction`: bool

### C_ActionBar.IsAttackAction

RequiresValidActionSlot=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `actionID`: luaIndex

Returns:

- `isAttackAction`: bool

### C_ActionBar.IsAutoCastPetAction

SecretArguments=AllowedWhenUntainted

Arguments:

- `slotID`: luaIndex

Returns:

- `isAutoCastPetAction`: bool

### C_ActionBar.IsAutoRepeatAction

RequiresValidActionSlot=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `actionID`: luaIndex

Returns:

- `isAutoRepeatAction`: bool

### C_ActionBar.IsConsumableAction

RequiresValidActionSlot=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `actionID`: luaIndex

Returns:

- `isConsumableAction`: bool

### C_ActionBar.IsCurrentAction

RequiresValidActionSlot=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `actionID`: luaIndex

Returns:

- `isCurrentAction`: bool

### C_ActionBar.IsEnabledAutoCastPetAction

SecretArguments=AllowedWhenUntainted

Arguments:

- `slotID`: luaIndex

Returns:

- `isEnabledAutoCastPetAction`: bool

### C_ActionBar.IsEquippedAction

RequiresValidActionSlot=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `actionID`: luaIndex

Returns:

- `isEquippedAction`: bool

### C_ActionBar.IsEquippedGearOutfitAction

SecretArguments=AllowedWhenUntainted

Arguments:

- `slotID`: luaIndex

Returns:

- `isEquippedGearOutfitAction`: bool

### C_ActionBar.IsHarmfulAction

SecretArguments=AllowedWhenUntainted

Arguments:

- `actionID`: luaIndex
- `useNeutral`: bool

Returns:

- `isHarmful`: bool

### C_ActionBar.IsHelpfulAction

SecretArguments=AllowedWhenUntainted

Arguments:

- `actionID`: luaIndex
- `useNeutral`: bool

Returns:

- `isHelpful`: bool

### C_ActionBar.IsInterruptAction -- Returns whether the given action button contains a spell that can interrupt spellcasting.

SecretArguments=AllowedWhenUntainted

Arguments:

- `slotID`: luaIndex

Returns:

- `isInterruptAction`: bool

### C_ActionBar.IsItemAction

RequiresValidActionSlot=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `actionID`: luaIndex

Returns:

- `isItemAction`: bool

### C_ActionBar.IsMacroActionWithShowTooltip -- Returns whether the given action button contains a macro with an explicit #showtooltip directive.

RequiresValidActionSlot=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `actionID`: luaIndex

Returns:

- `isMacroActionWithShowTooltip`: bool

### C_ActionBar.IsOnBarOrSpecialBar

SecretArguments=AllowedWhenTainted

Arguments:

- `spellID`: SpellIdentifier
- `setToSearch`: ActionBarSet [default=All, NeverSecret=true]

Returns:

- `isOnBarOrSpecialBar`: bool

### C_ActionBar.IsPossessBarVisible

Returns:

- `isPossessBarVisible`: bool

### C_ActionBar.IsStackableAction

RequiresValidActionSlot=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `actionID`: luaIndex

Returns:

- `isStackableAction`: bool

### C_ActionBar.IsUsableAction

RequiresValidActionSlot=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `actionID`: luaIndex

Returns:

- `isUsable`: bool
- `isLackingResources`: bool

### C_ActionBar.PutActionInSlot

SecretArguments=AllowedWhenUntainted

Arguments:

- `slotID`: luaIndex

### C_ActionBar.RegisterActionUIButton

RequiresValidActionSlot=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `checkboxFrame`: SimpleCheckbox
- `actionID`: luaIndex
- `cooldownFrame`: CooldownFrame

### C_ActionBar.SetActionBarPage

SecretArguments=AllowedWhenUntainted

Arguments:

- `pageIndex`: luaIndex

### C_ActionBar.ShouldOverrideBarShowHealthBar

Returns:

- `showHealthBar`: bool

### C_ActionBar.ShouldOverrideBarShowManaBar

Returns:

- `showManaBar`: bool

### C_ActionBar.ShouldShowKeyring

Returns:

- `isKeyringEnabled`: bool

### C_ActionBar.ToggleAutoCastPetAction

SecretArguments=AllowedWhenUntainted

Arguments:

- `slotID`: luaIndex

### C_ActionBar.UnregisterActionUIButton

SecretArguments=AllowedWhenUntainted

Arguments:

- `checkboxFrame`: SimpleCheckbox

### C_ActionBar.UsesActionText

RequiresValidActionSlot=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `actionID`: luaIndex

Returns:

- `usesActionText`: bool

## Events

### ACTION_RANGE_CHECK_UPDATE -- Used in conjunction with EnableActionRangeCheck to inform the UI when an action goes in or out of range with its current target.

SynchronousEvent=true

Payload:

- `slot`: luaIndex
- `isInRange`: bool -- Whether or not the current target is in range of the action. Should not be used if the 'checksRange' parameter is false.
- `checksRange`: bool -- Can be false if a range check was not made for any reason, for example there is not a current target.

### ACTION_USABLE_CHANGED

SynchronousEvent=true

Payload:

- `changes`: table<ActionUsableState>

### ACTIONBAR_HIDEGRID

SynchronousEvent=true

### ACTIONBAR_PAGE_CHANGED

SynchronousEvent=true

### ACTIONBAR_SHOW_BOTTOMLEFT

SynchronousEvent=true

### ACTIONBAR_SHOWGRID

SynchronousEvent=true

### ACTIONBAR_SLOT_CHANGED

SynchronousEvent=true

Payload:

- `slot`: number

### ACTIONBAR_UPDATE_COOLDOWN

UniqueEvent=true

### ACTIONBAR_UPDATE_STATE

UniqueEvent=true

### ACTIONBAR_UPDATE_USABLE

UniqueEvent=true

### PET_BAR_UPDATE

SynchronousEvent=true

### UPDATE_BONUS_ACTIONBAR

SynchronousEvent=true, UniqueEvent=true

### UPDATE_EXTRA_ACTIONBAR

UniqueEvent=true

### UPDATE_MULTI_CAST_ACTIONBAR

UniqueEvent=true

### UPDATE_OVERRIDE_ACTIONBAR

UniqueEvent=true

## Tables

### ActionBarSet

MaxValue=3, MinValue=0, NumValues=4

Fields:

- `None`: ActionBarSet [= 0]
- `Mkb`: ActionBarSet [= 1]
- `Gamepad`: ActionBarSet [= 2]
- `All`: ActionBarSet [= 3]
