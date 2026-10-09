# Spell

Namespace `C_Spell`.

Environment=All, Predicates={}

## Functions

### C_Spell.CancelAutoRepeatSpell -- Cancels the player's active auto repeat spell, if any

HasRestrictions=true

Returns:

- `wasCancelled`: bool

### C_Spell.CancelItemTempEnchantment -- Cancel a temporary enchantment on an item

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `weaponSlot`: WeaponSlot
- `enchantmentType`: ItemEnchantType

### C_Spell.CancelSpellByID

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `spellID`: number

### C_Spell.DoesSpellExist -- Returns true if the spell exists, regardless of whether the player has learned it

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellIdentifier`: SpellIdentifier -- Spell ID, name, name(subtext), or link; Using name will always check for an override on that spell

Returns:

- `spellExists`: bool

### C_Spell.EnableSpellRangeCheck -- Used in conjunction with SpellRangeCheckUpdate to inform the UI when a spell goes in or out of range with the current target.

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellIdentifier`: SpellIdentifier
- `enable`: bool -- True if changes in range for the spell should dispatch SpellRangeCheckUpdate. False if the spell no longer needs the event.

### C_Spell.GetAuraStatChanges

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellID`: number

Returns:

- `healthChange`: number
- `powerTypeChanges`: table<PowerTypeChange>

### C_Spell.GetBaseSpell

SecretArguments=AllowedWhenTainted

Arguments:

- `spellIdentifier`: SpellIdentifier
- `spec`: number [default=0, NeverSecret=true] -- Which Class Specialization to consider, as overrides may vary by Spec; Defaults to player's current Spec

Returns:

- `baseSpellID`: number -- Returns the spellID passed in if there is no override

### C_Spell.GetDeadlyDebuffInfo

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `spellIdentifier`: SpellIdentifier

Returns:

- `deadlyDebuffInfo`: DeadlyDebuffInfo

### C_Spell.GetItemCooldown -- Returns nil if the item is not found or on cooldown

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `itemID`: number

Returns:

- `spellCooldownInfo`: SpellCooldownInfo

### C_Spell.GetItemModifiedAppearancesApplied

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellID`: number

Returns:

- `itemModifiedAppearanceIDs`: table<number>

### C_Spell.GetLastCategoryCooldownSource -- Searches for the most recent spellID and itemID that started a cooldown in this category

MayReturnNothing=true, SecretArguments=AllowedWhenTainted, SecretWhenCooldownsRestricted=true

Arguments:

- `spellCategory`: number

Returns:

- `spellID`: number? -- The most recent spell associated with the category
- `itemID`: number? -- The item used to trigger this spell

### C_Spell.GetMawPowerLinkBySpellID

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `spellID`: SpellIdentifier

Returns:

- `link`: cstring

### C_Spell.GetMawPowerRarityInfoBySpellID

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `spellID`: SpellIdentifier

Returns:

- `rarityID`: number
- `rarityBorderAtlas`: textureAtlas

### C_Spell.GetOverrideSpell

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellIdentifier`: SpellIdentifier
- `spec`: number [default=0] -- Which Class Specialization to consider, as overrides may vary by Spec; Defaults to player's current Spec
- `onlyKnown`: bool [default=true]
- `ignoreOverrideSpellID`: number [default=0]

Returns:

- `overrideSpellID`: number -- Returns the spellID passed in if there is no override

### C_Spell.GetSchoolString

SecretArguments=AllowedWhenTainted

Arguments:

- `schoolMask`: number

Returns:

- `result`: cstring

### C_Spell.GetSpellAutoCast -- Returns nil if spell is not found

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `spellIdentifier`: SpellIdentifier

Returns:

- `autoCastAllowed`: bool
- `autoCastEnabled`: bool

### C_Spell.GetSpellCastCount -- Returns number of times a spell can be cast, typically based on availability of things like required reagent items; Returns 0 if spell is not found

SecretArguments=AllowedWhenTainted, SecretWhenCooldownsRestricted=true

Arguments:

- `spellIdentifier`: SpellIdentifier

Returns:

- `castCount`: number

### C_Spell.GetSpellChargeDuration -- Returns a duration object describing the active recharge time for a spell.

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `spellIdentifier`: SpellIdentifier

Returns:

- `duration`: LuaDurationObject

### C_Spell.GetSpellCharges -- Returns a table of info about the charges of a charge-accumulating spell; May return nil if spell is not found or is not charge-based

MayReturnNothing=true, SecretArguments=AllowedWhenTainted, SecretWhenCooldownsRestricted=true

Arguments:

- `spellIdentifier`: SpellIdentifier

Returns:

- `chargeInfo`: SpellChargeInfo

### C_Spell.GetSpellCooldown -- Returns nil if spell is not found

MayReturnNothing=true, SecretArguments=AllowedWhenTainted, SecretWhenCooldownsRestricted=true

Arguments:

- `spellIdentifier`: SpellIdentifier

Returns:

- `spellCooldownInfo`: SpellCooldownInfo

### C_Spell.GetSpellCooldownDuration -- Returns a duration object describing the active cooldown duration for a spell.

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `spellIdentifier`: SpellIdentifier
- `ignoreGCD`: bool [default=false]

Returns:

- `duration`: LuaDurationObject

### C_Spell.GetSpellDescription -- Returns nil if spell is not found

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `spellIdentifier`: SpellIdentifier

Returns:

- `description`: string -- May be empty if spell's data isn't loaded yet; Listen for SPELL_TEXT_UPDATE event, or use SpellMixin to load asynchronously

### C_Spell.GetSpellDescriptionForItemLocation -- Returns nil if spell is not found

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `spellIdentifier`: SpellIdentifier
- `itemLocation`: ItemLocation (ItemLocationMixin)

Returns:

- `description`: string -- May be empty if spell's data isn't loaded yet; Listen for SPELL_TEXT_UPDATE event, or use SpellMixin to load asynchronously

### C_Spell.GetSpellDisplayCount -- Depending on the spell, return a string that is either the use count or number of charges. If value is beyond the display count parameter, returns the replacementString (defaults to '*').

SecretArguments=AllowedWhenUntainted, SecretWhenCooldownsRestricted=true

Arguments:

- `spellIdentifier`: SpellIdentifier
- `maxDisplayCount`: number [default=9999]
- `replacementString`: cstring [default=*]

Returns:

- `displayCount`: string

### C_Spell.GetSpellIDForSpellIdentifier -- Meant primarily for getting a spell id from a spell name or link; Returns nothing if spell does not exist

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `spellIdentifier`: SpellIdentifier -- Spell ID, name, name(subtext), or link; Using name will always check for an override on that spell; If passed a spell ID, will return same id as was passed

Returns:

- `spellID`: number

### C_Spell.GetSpellInfo -- Returns nil if spell is not found

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `spellIdentifier`: SpellIdentifier -- Spell ID, name, name(subtext), or link; Using name will always check for an override on that spell

Returns:

- `spellInfo`: SpellInfo

### C_Spell.GetSpellLevelLearned -- Returns the level the spell is learned at; May return a different value if the player is currently Level Linked with another player

SecretArguments=AllowedWhenTainted

Arguments:

- `spellIdentifier`: SpellIdentifier

Returns:

- `levelLearned`: number

### C_Spell.GetSpellLink -- Returns nil if spell is not found

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `spellIdentifier`: SpellIdentifier
- `glyphID`: number? [NeverSecret=true]

Returns:

- `spellLink`: string

### C_Spell.GetSpellLossOfControlCooldownDuration -- Returns a duration object describing the active loss of control cooldown duration for a spell.

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `spellIdentifier`: SpellIdentifier

Returns:

- `duration`: LuaDurationObject

### C_Spell.GetSpellLossOfControlCooldownInfo -- Returns nil if spell is not found

MayReturnNothing=true, SecretArguments=AllowedWhenTainted, SecretWhenCooldownsRestricted=true

Arguments:

- `spellIdentifier`: SpellIdentifier

Returns:

- `lossOfControlInfo`: SpellLossOfControlInfo

### C_Spell.GetSpellMaxCumulativeAuraApplications

SecretArguments=AllowedWhenTainted, SecretWhenUnitAuraRestricted=true

Arguments:

- `spellID`: SpellIdentifier

Returns:

- `cumulativeAura`: number

### C_Spell.GetSpellName -- Returns nil if spell is not found

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `spellIdentifier`: SpellIdentifier

Returns:

- `name`: cstring

### C_Spell.GetSpellPowerCost -- Returns a table containing one or more SpellPowerCostInfos, one for each power type this spell costs; May return nil if spell is not found or has no resource costs

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `spellIdentifier`: SpellIdentifier

Returns:

- `powerCosts`: table<SpellPowerCostInfo>

### C_Spell.GetSpellQueueWindow

Returns:

- `result`: number

### C_Spell.GetSpellSkillLineAbilityRank -- Returns the rank of a spell that corresponds to an ability within a ranked SkillLine (ex: a crafting Recipe); Returns nil if spell is not found, or isn't part of a ranked SkillLine

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `spellIdentifier`: SpellIdentifier

Returns:

- `rank`: number

### C_Spell.GetSpellSubtext -- Returns nil if spell is not found

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `spellIdentifier`: SpellIdentifier

Returns:

- `subtext`: string -- May be empty if spell's data isn't loaded yet; Listen for SPELL_TEXT_UPDATE event, or use SpellMixin to load asynchronously

### C_Spell.GetSpellTexture -- Returns nothing if spell is not found

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `spellIdentifier`: SpellIdentifier

Returns:

- `iconID`: fileID
- `originalIconID`: fileID
- `conditionalIconID`: fileID?

### C_Spell.GetSpellTradeSkillLink -- Returns nil if spell is not associated with a trade skill

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `spellIdentifier`: SpellIdentifier

Returns:

- `spellLink`: string

### C_Spell.GetTargetSpellID

Returns:

- `spellID`: number

### C_Spell.GetVisibilityInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `spellID`: number
- `visibilityType`: SpellAuraVisibilityType

Returns:

- `hasCustom`: bool
- `alwaysShowMine`: bool
- `showForMySpec`: bool

### C_Spell.IsActiveSpell -- Returns true if the spell is a currently active toggled spell

SecretArguments=AllowedWhenTainted, SecretWhenUnitAuraRestricted=true, SecretWhenUnitIdentityRestricted=true

Arguments:

- `spellIdentifier`: SpellIdentifier
- `targetUnit`: UnitToken? -- Optional specific target; If not supplied, the player will be used, or their pet if the spell is a pet spell

Returns:

- `isActiveSpell`: bool

### C_Spell.IsAutoAttackSpell -- Returns true if the spell is the player's melee Auto Attack spell

SecretArguments=AllowedWhenTainted

Arguments:

- `spellIdentifier`: SpellIdentifier

Returns:

- `isAutoAttack`: bool

### C_Spell.IsAutoRepeatSpell -- Returns true if the spell is an auto repeat player spell

SecretArguments=AllowedWhenTainted

Arguments:

- `spellIdentifier`: SpellIdentifier

Returns:

- `isAutoRepeat`: bool

### C_Spell.IsClassTalentSpell -- Returns true if the spell comes from a Class Talent

SecretArguments=AllowedWhenTainted

Arguments:

- `spellIdentifier`: SpellIdentifier

Returns:

- `isAutoRepeat`: bool

### C_Spell.IsConsumableSpell

SecretArguments=AllowedWhenTainted

Arguments:

- `spellIdentifier`: SpellIdentifier

Returns:

- `consumable`: bool

### C_Spell.IsCurrentSpell -- Returns true if the spell is currently being cast or is queued to be cast

SecretArguments=AllowedWhenTainted

Arguments:

- `spellIdentifier`: SpellIdentifier

Returns:

- `isCurrentSpell`: bool

### C_Spell.IsExternalDefensive -- Returns true if an aura is considered an external defensive.

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellID`: number

Returns:

- `isExternalDefensive`: bool

### C_Spell.IsPressHoldReleaseSpell -- Returns true if the spell is an 'empower' type spell that is cast by pressing and holding, with the on-release cast typically being affected by time held

SecretArguments=AllowedWhenTainted

Arguments:

- `spellIdentifier`: SpellIdentifier

Returns:

- `isPressHoldRelease`: bool

### C_Spell.IsPriorityAura -- Returns true if an aura is considered high priority and should be ordered ahead of other auras in the UI.

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellID`: number

Returns:

- `isHighPriority`: bool

### C_Spell.IsPvPTalentSpell -- Returns true if the spell comes from a PvP Talent

SecretArguments=AllowedWhenTainted

Arguments:

- `spellIdentifier`: SpellIdentifier

Returns:

- `isAutoRepeat`: bool

### C_Spell.IsRangedAutoAttackSpell -- Returns true if the spell is the player's ranged Auto Attack spell (ex: Shoot, Auto Shot, etc)

SecretArguments=AllowedWhenTainted

Arguments:

- `spellIdentifier`: SpellIdentifier

Returns:

- `isRangedAutoAttack`: bool

### C_Spell.IsSelfBuff -- Returns true if an aura only applies effects to the player, and no other units.

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellID`: number

Returns:

- `hasSelfEffectsOnly`: bool

### C_Spell.IsSpellCrowdControl -- Returns true if the spell causes a crowd control effect when cast on a valid target.

SecretArguments=AllowedWhenTainted

Arguments:

- `spellIdentifier`: SpellIdentifier

Returns:

- `isCrowdControl`: bool

### C_Spell.IsSpellDataCached -- Returns true if data for the spell has already been loaded and cached this session

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellIdentifier`: SpellIdentifier

Returns:

- `isCached`: bool

### C_Spell.IsSpellDisabled

SecretArguments=AllowedWhenTainted

Arguments:

- `spellIdentifier`: SpellIdentifier

Returns:

- `disabled`: bool

### C_Spell.IsSpellHarmful -- Returns true if the spell can be cast on hostile targets

SecretArguments=AllowedWhenTainted

Arguments:

- `spellIdentifier`: SpellIdentifier

Returns:

- `isHarmful`: bool

### C_Spell.IsSpellHelpful -- Returns true if the spell can be cast on the player or other friendly targets

SecretArguments=AllowedWhenTainted

Arguments:

- `spellIdentifier`: SpellIdentifier

Returns:

- `isHelpful`: bool

### C_Spell.IsSpellImportant -- Returns true if the spell is considered important. For example a spell that's lethal if not interrupted would be considered important.

SecretArguments=AllowedWhenTainted

Arguments:

- `spellIdentifier`: SpellIdentifier

Returns:

- `isImportant`: bool

### C_Spell.IsSpellInRange -- Returns true if the current target is within range of the spell; False if out of range; Nil if range check was invalid

SecretArguments=AllowedWhenTainted

Arguments:

- `spellIdentifier`: SpellIdentifier
- `targetUnit`: UnitToken? -- Optional specific target; If not supplied, player's current target (if any) will be used

Returns:

- `inRange`: bool? -- May be nil if the range check was invalid, ie due to unknown/invalid spell, missing/invalid target, etc

### C_Spell.IsSpellPassive

SecretArguments=AllowedWhenTainted

Arguments:

- `spellIdentifier`: SpellIdentifier

Returns:

- `isPassive`: bool

### C_Spell.IsSpellUsable -- Returns whether the spell is currently castable; Typically based on things like learned status, required resources, etc

SecretArguments=AllowedWhenTainted

Arguments:

- `spellIdentifier`: SpellIdentifier

Returns:

- `isUsable`: bool
- `insufficientPower`: bool -- True if spell is specifically unusable due to insufficient power (ie MANA, RAGE, etc)

### C_Spell.PickupSpell

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellIdentifier`: SpellIdentifier

### C_Spell.PlaceTargetingSpellAtCursor

HasRestrictions=true

### C_Spell.RequestLoadSpellData -- Requests data for the spell be loaded; Listen for SPELL_DATA_LOAD_RESULT to be notified when load is finished

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellIdentifier`: SpellIdentifier

### C_Spell.SetSpellAutoCastEnabled

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellIdentifier`: SpellIdentifier
- `enabled`: bool

### C_Spell.SpellHasRange -- Returns true if the spell has a min and/or max range greater than 0

SecretArguments=AllowedWhenTainted

Arguments:

- `spellIdentifier`: SpellIdentifier

Returns:

- `hasRange`: bool

### C_Spell.TargetSpellChecksItemCondition

Returns:

- `result`: bool

### C_Spell.TargetSpellIsEnchanting

Returns:

- `isEnchanting`: bool

### C_Spell.TargetSpellJumpsUpgradeTrack

Returns:

- `jumpsUpgradeTrack`: bool

### C_Spell.TargetSpellReplacesBonusTree

Returns:

- `result`: bool

### C_Spell.ToggleSpellAutoCast -- Toggles whether spell's autoCast is enabled

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellIdentifier`: SpellIdentifier

## Events

### ENCHANT_SPELL_COMPLETED

SynchronousEvent=true

Payload:

- `successful`: bool
- `enchantedItem`: ItemLocation (ItemLocationMixin)?

### ENCHANT_SPELL_SELECTED

SynchronousEvent=true

### SPELL_DATA_LOAD_RESULT

SynchronousEvent=true

Payload:

- `spellID`: number
- `success`: bool

### SPELL_RANGE_CHECK_UPDATE -- Used in conjunction with EnableSpellRangeCheck to inform the UI when a spell goes in or out of range with the current target.

SynchronousEvent=true

Payload:

- `spellIdentifier`: SpellIdentifier
- `isInRange`: bool -- Whether or not the current target is in range of the spell. Should not be used if the 'checksRange' parameter is false.
- `checksRange`: bool -- Can be false if a range check was not made for any reason, for example there is not a current target.

### SPELL_TEXT_UPDATE

SynchronousEvent=true

Payload:

- `spellID`: number

### UPDATE_SPELL_TARGET_ITEM_CONTEXT

SynchronousEvent=true

## Tables

### DeadlyDebuffInfo

Fields:

- `criticalTimeRemainingMs`: number?
- `criticalStacks`: number?
- `priority`: number
- `warningText`: string
- `soundKitID`: number?

### PowerTypeChange

Fields:

- `powerType`: PowerType
- `amount`: number

### SpellInfo

Fields:

- `name`: string
- `iconID`: fileID -- Icon for this spell; If spell has been overriden, this may be the icon for the overriding spell; See originalIconID for spell's non-overriden icon
- `originalIconID`: fileID
- `castTime`: number
- `minRange`: number
- `maxRange`: number
- `spellID`: number
