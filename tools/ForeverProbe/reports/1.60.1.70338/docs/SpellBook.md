# SpellBook

Namespace `C_SpellBook`.

Environment=All, Predicates={}

## Functions

### C_SpellBook.AbortSpellIntro

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellID`: number

### C_SpellBook.CastSpellBookItem

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellBookItemSlotIndex`: luaIndex
- `spellBookItemSpellBank`: SpellBookSpellBank
- `targetSelf`: bool [default=false] -- If true, spell will target the current player; Otherwise, targets the player's current target

### C_SpellBook.ContainsAnyDisenchantSpell -- Returns true if player knows any Disenchant spells

Returns:

- `contains`: bool

### C_SpellBook.FindBaseSpellByID

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellID`: number

Returns:

- `baseSpellID`: number?

### C_SpellBook.FindFlyoutSlotBySpellID

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellID`: number

Returns:

- `flyoutSlot`: luaIndex

### C_SpellBook.FindSpellBookSlotForSpell -- If found, returns the first slot position of a SpellBookItem matching the specified spell and criteria

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `spellIdentifier`: SpellIdentifier
- `includeHidden`: bool [default=false] -- If true, search includes SpellBookItems that are hidden from the SpellBook UI (ex: spells that have been replaced, are also in a Flyout, etc)
- `includeFlyouts`: bool [default=true] -- If true, search includes Flyout SpellBookItems containing the specified spell
- `includeFutureSpells`: bool [default=false] -- If true, search includes SpellBookItems for spells that have not yet been learned
- `includeOffSpec`: bool [default=false] -- If true, search includes SpellBookItems belonging to non-active specializations; If spell is in active and inactive spec, the active spec slot will always be returned

Returns:

- `spellBookItemSlotIndex`: luaIndex
- `spellBookItemSpellBank`: SpellBookSpellBank

### C_SpellBook.FindSpellOverrideByID

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellID`: number

Returns:

- `overrideSpellID`: number?

### C_SpellBook.GetClassSkillLineInfo

MayReturnNothing=true

Returns:

- `skillLineInfo`: SpellBookSkillLineInfo

### C_SpellBook.GetCurrentLevelSpells -- Returns general, class, and active spec spells that are learned at the specified level

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `level`: number

Returns:

- `spellIDs`: table<number>

### C_SpellBook.GetNumSpellBookSkillLines

Returns:

- `numSpellBookSkillLines`: number

### C_SpellBook.GetSkillLineIndexByID

SecretArguments=AllowedWhenUntainted

Arguments:

- `skillLineID`: number

Returns:

- `skillIndex`: luaIndex? -- Will be nil if the specified SkillLine could not be found, or if it is not one of the player's tracked skill lines

### C_SpellBook.GetSpellBookItemAutoCast -- Returns nothing if item doesn't exist or isn't a spell

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `spellBookItemSlotIndex`: luaIndex
- `spellBookItemSpellBank`: SpellBookSpellBank

Returns:

- `autoCastAllowed`: bool -- True if this spell is allowed to be auto-cast
- `autoCastEnabled`: bool -- True if auto-casting this spell is currently enabled (usually by the player)

### C_SpellBook.GetSpellBookItemCastCount -- Returns number of times a SpellBookItem can be cast, typically based on availability of things like required reagent items; Always returns 0 if item is not found or is not a spell

SecretArguments=AllowedWhenUntainted, SecretWhenCooldownsRestricted=true

Arguments:

- `spellBookItemSlotIndex`: luaIndex
- `spellBookItemSpellBank`: SpellBookSpellBank

Returns:

- `castCount`: number

### C_SpellBook.GetSpellBookItemChargeDuration -- Returns a duration object describing the active recharge time for a spellbook item.

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `spellBookItemSlotIndex`: luaIndex
- `spellBookItemSpellBank`: SpellBookSpellBank

Returns:

- `duration`: LuaDurationObject

### C_SpellBook.GetSpellBookItemCharges -- Returns a table of info about the charges of a charge-accumulating SpellBookItem; May return nil if item is not found or is not charge-based

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted, SecretWhenCooldownsRestricted=true

Arguments:

- `spellBookItemSlotIndex`: luaIndex
- `spellBookItemSpellBank`: SpellBookSpellBank

Returns:

- `chargeInfo`: SpellChargeInfo

### C_SpellBook.GetSpellBookItemCooldown -- Returns nil if item doesn't exist or if this kind of item doesn't display cooldowns (ex: future or offspec spells)

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted, SecretWhenCooldownsRestricted=true

Arguments:

- `spellBookItemSlotIndex`: luaIndex
- `spellBookItemSpellBank`: SpellBookSpellBank

Returns:

- `spellCooldownInfo`: SpellCooldownInfo

### C_SpellBook.GetSpellBookItemCooldownDuration -- Returns a duration object describing the active cooldown duration for a spellbook item.

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `spellBookItemSlotIndex`: luaIndex
- `spellBookItemSpellBank`: SpellBookSpellBank
- `ignoreGCD`: bool [default=false]

Returns:

- `duration`: LuaDurationObject

### C_SpellBook.GetSpellBookItemDescription

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `spellBookItemSlotIndex`: luaIndex
- `spellBookItemSpellBank`: SpellBookSpellBank

Returns:

- `description`: string -- May be empty if spell's data isn't loaded yet; Listen for SPELL_TEXT_UPDATE event, or use SpellMixin to load asynchronously

### C_SpellBook.GetSpellBookItemInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `spellBookItemSlotIndex`: luaIndex
- `spellBookItemSpellBank`: SpellBookSpellBank

Returns:

- `spellBookItemInfo`: SpellBookItemInfo

### C_SpellBook.GetSpellBookItemLevelLearned -- Returns the level the spell is learned at; May return a different value if the player is currently Level Linked with another player; Returns 0 if item is not a Spell

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellBookItemSlotIndex`: luaIndex
- `spellBookItemSpellBank`: SpellBookSpellBank

Returns:

- `levelLearned`: number

### C_SpellBook.GetSpellBookItemLink

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `spellBookItemSlotIndex`: luaIndex
- `spellBookItemSpellBank`: SpellBookSpellBank
- `glyphID`: number?

Returns:

- `spellLink`: string

### C_SpellBook.GetSpellBookItemLossOfControlCooldownDuration -- Returns a duration object describing the active loss of control cooldown duration for a spellbook item.

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `spellBookItemSlotIndex`: luaIndex
- `spellBookItemSpellBank`: SpellBookSpellBank

Returns:

- `duration`: LuaDurationObject

### C_SpellBook.GetSpellBookItemLossOfControlCooldownInfo -- Returns nil if item doesn't exist or if this kind of item doesn't display cooldowns (ex: future or offspec spells)

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted, SecretWhenCooldownsRestricted=true

Arguments:

- `spellBookItemSlotIndex`: luaIndex
- `spellBookItemSpellBank`: SpellBookSpellBank

Returns:

- `lossOfControlInfo`: SpellLossOfControlInfo

### C_SpellBook.GetSpellBookItemName

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `spellBookItemSlotIndex`: luaIndex
- `spellBookItemSpellBank`: SpellBookSpellBank

Returns:

- `name`: string
- `subName`: string -- May be empty if spell's data isn't loaded yet; Listen for SPELL_TEXT_UPDATE event, or use SpellMixin to load asynchronously

### C_SpellBook.GetSpellBookItemPowerCost -- Returns a table containing one or more SpellPowerCostInfos, one for each power type a SpellBookItem costs; May return nil if item is not found or has no resource costs

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `spellBookItemSlotIndex`: luaIndex
- `spellBookItemSpellBank`: SpellBookSpellBank

Returns:

- `powerCosts`: table<SpellPowerCostInfo>

### C_SpellBook.GetSpellBookItemSkillLineIndex -- Get the index of the SkillLine this SpellBookItem is part of

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellBookItemSlotIndex`: luaIndex
- `spellBookItemSpellBank`: SpellBookSpellBank

Returns:

- `skillLineIndex`: luaIndex? -- Will be nil if the specified SpellBookItem doesn't exist or isn't part of a SkillLine

### C_SpellBook.GetSpellBookItemTexture

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `spellBookItemSlotIndex`: luaIndex
- `spellBookItemSpellBank`: SpellBookSpellBank

Returns:

- `iconID`: fileID

### C_SpellBook.GetSpellBookItemTradeSkillLink -- Returns nil if SpellBookItem is not associated with a trade skill

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `spellBookItemSlotIndex`: luaIndex
- `spellBookItemSpellBank`: SpellBookSpellBank

Returns:

- `spellLink`: string

### C_SpellBook.GetSpellBookItemType

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `spellBookItemSlotIndex`: luaIndex
- `spellBookItemSpellBank`: SpellBookSpellBank

Returns:

- `itemType`: SpellBookItemType
- `actionID`: number -- Represents a base spellID for spells, flyoutID for flyouts, or petActionID for pet actions
- `spellID`: number? -- May be nil if item is not a spell; Will be the overriding spellID if spell is overriden, otherwise will match actionID

### C_SpellBook.GetSpellBookSkillLineInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `skillLineIndex`: luaIndex

Returns:

- `skillLineInfo`: SpellBookSkillLineInfo

### C_SpellBook.HasPetSpells -- Returns nothing if player has no pet spells

MayReturnNothing=true

Returns:

- `numPetSpells`: number
- `petNameToken`: string

### C_SpellBook.IsAutoAttackSpellBookItem -- Returns true if the SpellBookItem is the player's melee Auto Attack spell

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellBookItemSlotIndex`: luaIndex
- `spellBookItemSpellBank`: SpellBookSpellBank

Returns:

- `isAutoAttack`: bool

### C_SpellBook.IsClassTalentSpellBookItem -- Returns true if the SpellBookItem comes from a Class Talent

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellBookItemSlotIndex`: luaIndex
- `spellBookItemSpellBank`: SpellBookSpellBank

Returns:

- `isClassTalent`: bool

### C_SpellBook.IsPvPTalentSpellBookItem -- Returns true if the SpellBookItem comes from a PvP Talent

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellBookItemSlotIndex`: luaIndex
- `spellBookItemSpellBank`: SpellBookSpellBank

Returns:

- `isPvPTalent`: bool

### C_SpellBook.IsRangedAutoAttackSpellBookItem -- Returns true if the SpellBookItem is the player's ranged Auto Attack spell (ex: Shoot, Auto Shot, etc)

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellBookItemSlotIndex`: luaIndex
- `spellBookItemSpellBank`: SpellBookSpellBank

Returns:

- `isRangedAutoAttack`: bool

### C_SpellBook.IsSpellBookItemHarmful -- Returns true if the SpellBookIem can be cast on hostile targets

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellBookItemSlotIndex`: luaIndex
- `spellBookItemSpellBank`: SpellBookSpellBank

Returns:

- `isHarmful`: bool

### C_SpellBook.IsSpellBookItemHelpful -- Returns true if the SpellBookIem can be cast on the player or other friendly targets

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellBookItemSlotIndex`: luaIndex
- `spellBookItemSpellBank`: SpellBookSpellBank

Returns:

- `isHelpful`: bool

### C_SpellBook.IsSpellBookItemInRange -- Returns true if the current target is within range of the SpellBookIem; False if out of range; Nil if range check was invalid

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellBookItemSlotIndex`: luaIndex
- `spellBookItemSpellBank`: SpellBookSpellBank
- `targetUnit`: UnitToken? -- Optional specific target; If not supplied, player's current target (if any) will be used

Returns:

- `inRange`: bool? -- May be nil if the range check was invalid, ie due to unknown/invalid spell, missing/invalid target, etc

### C_SpellBook.IsSpellBookItemLooseFlyoutMember -- Returns true if the SpellBookItem is represented in a Flyout.

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellBookItemSlotIndex`: luaIndex
- `spellBookItemSpellBank`: SpellBookSpellBank

Returns:

- `isFlyoutMember`: bool

### C_SpellBook.IsSpellBookItemLowRank -- Returns true if the SpellBookItem is a lower rank of a known higher rank spell.  Returns false if there is only a single rank or it is the highest rank known.

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellBookItemSlotIndex`: luaIndex
- `spellBookItemSpellBank`: SpellBookSpellBank

Returns:

- `isLowRank`: bool

### C_SpellBook.IsSpellBookItemOffSpec -- Returns true if the SpellBookItem belongs to a non-active class specialization

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellBookItemSlotIndex`: luaIndex
- `spellBookItemSpellBank`: SpellBookSpellBank

Returns:

- `isOffSpec`: bool

### C_SpellBook.IsSpellBookItemPassive -- Returns true if the SpellBookItem is a passive spell; Will always return false if it is not a spell

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellBookItemSlotIndex`: luaIndex
- `spellBookItemSpellBank`: SpellBookSpellBank

Returns:

- `isPassive`: bool

### C_SpellBook.IsSpellBookItemUsable -- Returns whether the SpellBookIem is currently castable; Typically based on things like learned status, required resources, etc

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellBookItemSlotIndex`: luaIndex
- `spellBookItemSpellBank`: SpellBookSpellBank

Returns:

- `isUsable`: bool
- `insufficientPower`: bool -- True if SpellBookIem is specifically unusable due to insufficient power (ie MANA, RAGE, etc)

### C_SpellBook.IsSpellInSpellBook -- Returns true if a spell should be found in the spellbook. This function can also return true for spells that aren't known, such as override spells granted by an aura linked to class talents

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellID`: number
- `spellBank`: SpellBookSpellBank [default=Player]
- `includeOverrides`: bool [default=true]

Returns:

- `isInSpellBook`: bool

### C_SpellBook.IsSpellKnown -- Returns true if a player knows a spell. This function can also return true for spells that aren't in the spellbook, such as temporarily-granted abilities

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellID`: number
- `spellBank`: SpellBookSpellBank [default=Player]

Returns:

- `isKnown`: bool

### C_SpellBook.IsSpellKnownOrInSpellBook -- Returns true if a spell is considered to be known or present in the spellbook

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellID`: number
- `spellBank`: SpellBookSpellBank [default=Player]
- `includeOverrides`: bool [default=true]

Returns:

- `isKnownOrInSpellBook`: bool

### C_SpellBook.PickupSpellBookItem

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellBookItemSlotIndex`: luaIndex
- `spellBookItemSpellBank`: SpellBookSpellBank

### C_SpellBook.SetBarSlotFromIntro

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellID`: number
- `slotIndex`: luaIndex

### C_SpellBook.SetSpellBookItemAutoCastEnabled

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellBookItemSlotIndex`: luaIndex
- `spellBookItemSpellBank`: SpellBookSpellBank
- `enabled`: bool

### C_SpellBook.SpellBookItemHasRange -- Returns true if the SpellBookIem has a min and/or max range greater than 0; Will always return false if it is not a spell

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellBookItemSlotIndex`: luaIndex
- `spellBookItemSpellBank`: SpellBookSpellBank

Returns:

- `hasRange`: bool

### C_SpellBook.ToggleSpellBookItemAutoCast

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellBookItemSlotIndex`: luaIndex
- `spellBookItemSpellBank`: SpellBookSpellBank

## Events

### CURRENT_SPELL_CAST_CHANGED

SynchronousEvent=true

Payload:

- `cancelledCast`: bool

### LEARNED_SPELL_IN_SKILL_LINE

SynchronousEvent=true

Payload:

- `spellID`: number
- `skillLineIndex`: luaIndex
- `isGuildPerkSpell`: bool

### MAX_SPELL_START_RECOVERY_OFFSET_CHANGED

SynchronousEvent=true

Payload:

- `clampedNewQueueWindowMs`: number

### PLAYER_TOTEM_UPDATE

SynchronousEvent=true

Payload:

- `totemSlot`: luaIndex

### SPELL_FLYOUT_UPDATE

SynchronousEvent=true, UniqueEvent=true

Payload:

- `flyoutID`: number?
- `spellID`: number?
- `isLearned`: bool?

### SPELL_PUSHED_TO_ACTIONBAR

SynchronousEvent=true

Payload:

- `spellID`: number
- `slot`: luaIndex
- `page`: luaIndex

### SPELL_PUSHED_TO_FLYOUT_ON_ACTIONBAR

SynchronousEvent=true

Payload:

- `spellID`: number
- `flyoutSlot`: luaIndex
- `flyoutPage`: luaIndex

### SPELL_UPDATE_CHARGES

SynchronousEvent=true, UniqueEvent=true

### SPELL_UPDATE_COOLDOWN

UniqueEvent=true

Payload:

- `spellID`: number? -- Can be a base spell or an override spell. A nil value indicates that all cooldowns should be updated, rather than just a specific one.
- `baseSpellID`: number? -- Will be set to the base spell if the spellID parameter is an override spell.
- `category`: number? -- If the spellID parameter is set, the cooldown category of the spell. A nil value indicates the spell does not have a cooldown category.
- `startRecoveryCategory`: number? -- If the spellID parameter is set, the cooldown start recovery category of the spell. A nil value indicates the spell does not have a cooldown start recovery category.
- `itemID`: number? -- If the itemID parameter is set, it's the itemID associated with the cast of the spell.

### SPELL_UPDATE_ICON

UniqueEvent=true

Payload:

- `spellID`: number? -- Always refers to the base spell. A nil value indicates that all icons should be updated, rather than just a specific one.

### SPELL_UPDATE_USABLE

UniqueEvent=true

### SPELL_UPDATE_USES

UniqueEvent=true

Payload:

- `spellID`: number -- Can be a base spell or override spell.
- `baseSpellID`: number? -- Will be set to the base spell if the spellID parameter is an override spell.

### SPELLS_CHANGED

UniqueEvent=true

### START_AUTOREPEAT_SPELL

SynchronousEvent=true

### STOP_AUTOREPEAT_SPELL

SynchronousEvent=true

### UPDATE_SHAPESHIFT_COOLDOWN

UniqueEvent=true

### UPDATE_SHAPESHIFT_FORM

SynchronousEvent=true

### UPDATE_SHAPESHIFT_FORMS

UniqueEvent=true

### UPDATE_SHAPESHIFT_USABLE

UniqueEvent=true

## Tables

### SpellBookItemInfo

Fields:

- `actionID`: number -- Represents a base spellID for spells, flyoutID for flyouts, or petActionID for pet actions
- `spellID`: number? -- May be nil if item is not a spell; Will be the overriding spellID if spell is overriden, otherwise will match actionID
- `itemType`: SpellBookItemType
- `name`: string
- `subName`: string -- May be empty if flyout, or if spell's data isn't loaded yet; Listen for SPELL_TEXT_UPDATE event, or use SpellMixin to load asynchronously
- `iconID`: fileID
- `isPassive`: bool -- True if the item is a passive spell; Will always be false if it is not a spell
- `isOffSpec`: bool -- True if the item belongs to a non-active specialization
- `skillLineIndex`: luaIndex? -- Index of the SkillLine this SpellBookItem is part of; Nil this SpellBookItem isn't part of a SkillLine

### SpellBookSkillLineInfo

Fields:

- `name`: string
- `iconID`: fileID
- `itemIndexOffset`: number -- This value + 1 is the first Spell Book Item slotIndex within this skill line
- `numSpellBookItems`: number
- `isGuild`: bool
- `shouldHide`: bool
- `specID`: number? -- Will be nil if this skill line is not associated with a specialization
- `offSpecID`: number? -- Will be nil if this skill line is not associated with a non-active specialization
