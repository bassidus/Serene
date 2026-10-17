# PlayerScript

Environment=All, Predicates={}

## Functions

### AcceptAreaSpiritHeal

### AcceptGuild

### AcceptResurrect

### Ambiguate

SecretArguments=AllowedWhenTainted

Arguments:

- `fullName`: cstring
- `context`: cstring [NeverSecret=true]

Returns:

- `result`: string

### AutoEquipCursorItem

### BeginTrade

### CanDualWield

Returns:

- `result`: bool

### CanInspect

SecretArguments=AllowedWhenUntainted

Arguments:

- `targetGUID`: UnitToken

Returns:

- `result`: bool

### CanLootUnit

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `targetUnit`: WOWGUID

Returns:

- `hasLoot`: bool
- `canLoot`: bool

### CanPortGraveyard

Returns:

- `canPortGraveyard`: bool

### CancelAreaSpiritHeal

### CancelPendingEquip

SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: number

### CancelTrade

### CheckInteractDistance

SecretArguments=AllowedWhenUntainted

Arguments:

- `unitGUID`: UnitToken
- `distIndex`: luaIndex

Returns:

- `result`: bool

### CheckTalentMasterDist

Returns:

- `result`: bool

### ClearPendingBindConversionItem

### ConfirmTalentWipe

### ConvertItemToBindToAccount

### DeclineGuild

### DeclineResurrect

### Dismount

### EquipPendingItem

SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: number

### FollowUnit

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: cstring [default=0]
- `exactMatch`: bool [default=false]

### GetAllowLowLevelRaid

Returns:

- `result`: bool

### GetAllowRecentAlliesSeeLocation

Returns:

- `allowRecentAlliesSeeLocation`: bool

### GetAreaSpiritHealerTime

Returns:

- `result`: number

### GetArmorPenetration

SecretWhenUnitStatsRestricted=true

Returns:

- `result`: number

### GetAttackPowerForStat

SecretArguments=AllowedWhenUntainted, SecretWhenUnitStatsRestricted=true

Arguments:

- `stat`: luaIndex
- `value`: number

Returns:

- `result`: number

### GetAutoDeclineGuildInvites

Returns:

- `result`: bool

### GetAutoDeclineNeighborhoodInvites

Returns:

- `result`: bool

### GetAvoidance

SecretWhenUnitStatsRestricted=true

Returns:

- `result`: number

### GetBindLocation

Returns:

- `result`: cstring

### GetBlockChance

SecretWhenUnitStatsRestricted=true

Returns:

- `result`: number

### GetCemeteryPreference

Returns:

- `result`: number

### GetCollapsingStarCost

Returns:

- `cost`: number

### GetCombatRating

SecretArguments=AllowedWhenUntainted, SecretWhenUnitStatsRestricted=true

Arguments:

- `ratingIndex`: luaIndex

Returns:

- `result`: number?

### GetCombatRatingBonus

SecretArguments=AllowedWhenUntainted, SecretWhenUnitStatsRestricted=true

Arguments:

- `ratingIndex`: luaIndex

Returns:

- `result`: number?

### GetCombatRatingBonusForCombatRatingValue

SecretArguments=AllowedWhenUntainted

Arguments:

- `ratingIndex`: luaIndex
- `value`: number

Returns:

- `result`: number?

### GetCorpseRecoveryDelay

Returns:

- `result`: number

### GetCorruption

Returns:

- `result`: number

### GetCorruptionResistance

Returns:

- `result`: number

### GetCritChance

SecretWhenUnitStatsRestricted=true

Returns:

- `result`: number

### GetCritChanceFromStat

SecretArguments=AllowedWhenUntainted, SecretWhenUnitStatsRestricted=true

Arguments:

- `stat`: luaIndex
- `value`: number

Returns:

- `critChance`: number

### GetCritChanceProvidesParryEffect

Returns:

- `result`: bool

### GetDodgeChance

SecretWhenUnitStatsRestricted=true

Returns:

- `result`: number

### GetDodgeChanceFromAttribute

SecretWhenUnitStatsRestricted=true

Returns:

- `result`: number

### GetEvictionTimeRemaining

Returns:

- `result`: number

### GetExpertise

SecretWhenUnitStatsRestricted=true

Returns:

- `mainhandExpertise`: number
- `offhandExpertise`: number
- `rangedExpertise`: number

### GetExpertisePercent

SecretWhenUnitStatsRestricted=true

Returns:

- `mainhandExpertisePercent`: number
- `offhandExpertisePercent`: number
- `rangedExpertisePercent`: number

### GetGlancingBlowChance -- If no playerWeaponSkill value is provided, uses the skill value for the player's main hand weapon/shapeshift form.

SecretArguments=AllowedWhenUntainted, SecretWhenUnitStatsRestricted=true

Arguments:

- `playerWeaponSkill`: number?
- `targetDefenseSkill`: number

Returns:

- `result`: number

### GetGlancingBlowPenalty -- If no playerWeaponSkill value is provided, uses the skill value for the player's main hand weapon/shapeshift form.

SecretArguments=AllowedWhenUntainted, SecretWhenUnitStatsRestricted=true

Arguments:

- `playerWeaponSkill`: number?
- `targetDefenseSkill`: number

Returns:

- `result`: number

### GetHaste

SecretWhenUnitStatsRestricted=true

Returns:

- `result`: number

### GetHealthRegen

Returns:

- `healthRegen`: number
- `combatHealthRegen`: number

### GetHealthRegenFromSpirit

Returns:

- `healthRegen`: number
- `combatHealthRegen`: number

### GetHitModifier

SecretWhenUnitStatsRestricted=true

Returns:

- `result`: number

### GetJailersTowerLevel

Returns:

- `result`: number

### GetLifesteal

SecretWhenUnitStatsRestricted=true

Returns:

- `result`: number

### GetLootSpecialization

Returns:

- `specializationID`: number

### GetManaRegen

SecretWhenUnitStatsRestricted=true

Returns:

- `baseManaRegen`: number
- `castingManaRegen`: number

### GetManaRegenFromSpirit

Returns:

- `powerRegen`: number
- `combatPowerRegen`: number

### GetMastery

SecretWhenUnitStatsRestricted=true

Returns:

- `result`: number

### GetMasteryEffect

SecretWhenUnitStatsRestricted=true

Returns:

- `masteryEffect`: number
- `bonusCoefficient`: number

### GetMaxPlayerLevel

Returns:

- `maxPlayerLevel`: number

### GetMeleeHaste

SecretWhenUnitStatsRestricted=true

Returns:

- `result`: number

### GetModResilienceDamageReduction

SecretWhenUnitStatsRestricted=true

Returns:

- `result`: number

### GetMoney

Returns:

- `result`: number

### GetNormalizedRealmName

Returns:

- `result`: cstring

### GetOverrideAPBySpellPower

SecretWhenUnitStatsRestricted=true

Returns:

- `result`: number

### GetOverrideSpellPowerByAP

SecretWhenUnitStatsRestricted=true

Returns:

- `result`: number

### GetPVPDesired

Returns:

- `result`: bool

### GetPVPGearStatRules

Returns:

- `result`: bool

### GetPVPLifetimeStats

Returns:

- `lifetimeHonorableKills`: number
- `lifetimeMaxPVPRank`: PvPRanks

### GetPVPSessionStats

Returns:

- `honorableKills`: number
- `dishonorableKills`: number

### GetPVPTimer

Returns:

- `result`: number

### GetPVPYesterdayStats

Returns:

- `honorableKills`: number
- `dishonorableKills`: number

### GetParryChance

SecretWhenUnitStatsRestricted=true

Returns:

- `result`: number

### GetParryChanceFromAttribute

SecretWhenUnitStatsRestricted=true

Returns:

- `result`: number

### GetPetHitChanceModifier

SecretWhenUnitStatsRestricted=true

Returns:

- `result`: number

### GetPetMeleeHaste

SecretWhenUnitStatsRestricted=true

Returns:

- `result`: number

### GetPetSpellBonusDamage

SecretWhenUnitStatsRestricted=true

Returns:

- `result`: number

### GetPetSpellHitChanceModifier

SecretWhenUnitStatsRestricted=true

Returns:

- `result`: number

### GetPlayerFacing

Returns:

- `result`: number?

### GetPlayerInfoByGUID

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `guid`: WOWGUID

Returns:

- `localizedClass`: cstring
- `englishClass`: cstring
- `localizedRace`: cstring
- `englishRace`: cstring
- `sex`: number
- `name`: string
- `realmName`: cstring
- `level`: number?

### GetPowerRegen

SecretWhenUnitStatsRestricted=true

Returns:

- `basePowerRegen`: number
- `castingPowerRegen`: number

### GetPowerRegenForPowerType

SecretArguments=AllowedWhenUntainted, SecretWhenUnitStatsRestricted=true

Arguments:

- `powerType`: number

Returns:

- `basePowerRegen`: number
- `castingPowerRegen`: number

### GetPvpPowerDamage

SecretWhenUnitStatsRestricted=true

Returns:

- `result`: number

### GetPvpPowerHealing

SecretWhenUnitStatsRestricted=true

Returns:

- `result`: number

### GetRangedAttackPowerForStat

SecretArguments=AllowedWhenUntainted, SecretWhenUnitStatsRestricted=true

Arguments:

- `stat`: luaIndex
- `value`: number

Returns:

- `result`: number

### GetRangedCritChance

SecretWhenUnitStatsRestricted=true

Returns:

- `result`: number

### GetRangedHaste

SecretWhenUnitStatsRestricted=true

Returns:

- `result`: number
- `quiverHaste`: number

### GetRangedHitModifier

SecretWhenUnitStatsRestricted=true

Returns:

- `result`: number

### GetReleaseTimeRemaining

Returns:

- `result`: number

### GetResSicknessDuration

Returns:

- `result`: string?

### GetRestState

MayReturnNothing=true

Returns:

- `exhaustionID`: number
- `name`: cstring
- `factor`: number

### GetRestrictedAccountData

Returns:

- `maxLevel`: number
- `maxMoney`: WOWMONEY
- `professionCap`: number

### GetRuneCooldown

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `runeIndex`: luaIndex

Returns:

- `startTime`: number
- `duration`: number
- `isRuneReady`: bool

### GetRuneCount

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `runeIndex`: luaIndex

Returns:

- `result`: number

### GetSheathState

Returns:

- `result`: number?

### GetShieldBlock

SecretWhenUnitStatsRestricted=true

Returns:

- `result`: number

### GetSpeed

SecretWhenUnitStatsRestricted=true

Returns:

- `result`: number

### GetSpellBonusDamage

SecretArguments=AllowedWhenUntainted, SecretWhenUnitStatsRestricted=true

Arguments:

- `school`: luaIndex

Returns:

- `result`: number?

### GetSpellBonusHealing

SecretWhenUnitStatsRestricted=true

Returns:

- `result`: number

### GetSpellCritChance

SecretWhenUnitStatsRestricted=true

Returns:

- `result`: number

### GetSpellCritChanceFromStat

SecretArguments=AllowedWhenUntainted, SecretWhenUnitStatsRestricted=true

Arguments:

- `stat`: luaIndex
- `value`: number

Returns:

- `spellCritChance`: number

### GetSpellHitModifier

SecretWhenUnitStatsRestricted=true

Returns:

- `result`: number

### GetSpellPenetration

SecretWhenUnitStatsRestricted=true

Returns:

- `result`: number

### GetSturdiness

SecretWhenUnitStatsRestricted=true

Returns:

- `result`: number

### GetTaxiBenchmarkMode

Returns:

- `result`: bool

### GetVersatilityBonus

SecretArguments=AllowedWhenUntainted, SecretWhenUnitStatsRestricted=true

Arguments:

- `combatRating`: luaIndex

Returns:

- `result`: number

### GetXPExhaustion

Returns:

- `result`: number?

### HasAPEffectsSpellPower

Returns:

- `result`: bool

### HasDualWieldPenalty

Returns:

- `result`: bool

### HasFullControl

Returns:

- `result`: bool

### HasIgnoreDualWieldWeapon

Returns:

- `result`: bool

### HasKey

Returns:

- `hasKey`: bool

### HasNoReleaseAura

Returns:

- `hasCannotReleaseEffect`: bool
- `longestDuration`: number
- `hasUntilCancelledDuration`: bool

### HasSPEffectsAttackPower

Returns:

- `result`: bool

### InitiateTrade

SecretArguments=AllowedWhenUntainted

Arguments:

- `guid`: UnitToken

### IsAccountSecured

Returns:

- `result`: bool

### IsAdvancedFlyableArea

Returns:

- `result`: bool

### IsCemeterySelectionAvailable

Returns:

- `result`: bool

### IsCharacterNewlyBoosted

Returns:

- `newlyBoosted`: bool

### IsDrivableArea

Returns:

- `result`: bool

### IsDualWielding

Returns:

- `result`: bool

### IsFlyableArea

Returns:

- `result`: bool

### IsGuildLeader

Returns:

- `result`: bool

### IsInGuild

Returns:

- `result`: bool

### IsInJailersTower

Returns:

- `result`: bool

### IsIndoors

Returns:

- `result`: bool

### IsInsane

Returns:

- `result`: bool

### IsItemPreferredArmorType

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemLocation`: ItemLocation (ItemLocationMixin)

Returns:

- `isItemPreferredArmorType`: bool

### IsJailersTowerLayerTimeLocked

SecretArguments=AllowedWhenUntainted

Arguments:

- `layerLevel`: number

Returns:

- `result`: cstring

### IsLoggedIn

Returns:

- `result`: bool

### IsMounted

Returns:

- `result`: bool

### IsOnGroundFloorInJailersTower

Returns:

- `result`: bool

### IsOutOfBounds

Returns:

- `result`: bool

### IsOutdoors

Returns:

- `result`: bool

### IsPVPTimerRunning

Returns:

- `result`: bool

### IsPlayerInWorld

Returns:

- `result`: bool

### IsPlayerMoving

Returns:

- `result`: bool

### IsRangedWeapon

Returns:

- `result`: bool

### IsResting

Returns:

- `result`: bool

### IsRestrictedAccount

Returns:

- `result`: bool

### IsStealthed

Returns:

- `result`: bool

### IsXPUserDisabled

Returns:

- `result`: bool

### NoPlayTime

Returns:

- `result`: bool?

### NotifyInspect

SecretArguments=AllowedWhenUntainted

Arguments:

- `targetGUID`: UnitToken

### PartialPlayTime

Returns:

- `result`: bool?

### PlayerCanTeleport

Returns:

- `result`: bool

### PlayerEffectiveAttackPower

MayReturnNothing=true, SecretWhenUnitStatsRestricted=true

Returns:

- `mainHandAttackPower`: number
- `offHandAttackPower`: number
- `rangedAttackPower`: number
- `baseAttackPower`: number
- `baseRangedAttackPower`: number

### PlayerGetTimerunningSeasonID

Returns:

- `timerunningSeasonID`: number?

### PlayerIsInCombat

Returns:

- `playerIsInCombat`: bool

### PlayerIsTimerunning

Returns:

- `playerIsTimerunning`: bool

### PortGraveyard

### RandomRoll

SecretArguments=AllowedWhenUntainted

Arguments:

- `min`: number
- `max`: number

### ReagentsFromBankAllowed

Returns:

- `allowed`: bool

### RepopMe

### RequestTimePlayed

### RespondInstanceLock

SecretArguments=AllowedWhenUntainted

Arguments:

- `acceptLock`: bool

### ResurrectGetOfferer

Returns:

- `name`: cstring

### ResurrectHasSickness

Returns:

- `result`: bool

### ResurrectHasTimer

Returns:

- `result`: bool

### RetrieveCorpse

### SetAllowLowLevelRaid

SecretArguments=AllowedWhenUntainted

Arguments:

- `allow`: bool [default=false]

### SetAllowRecentAlliesSeeLocation

SecretArguments=AllowedWhenUntainted

Arguments:

- `allowRecentAlliesSeeLocation`: bool

### SetAutoDeclineGuildInvites

SecretArguments=AllowedWhenUntainted

Arguments:

- `allow`: bool [default=false]

### SetAutoDeclineNeighborhoodInvites

SecretArguments=AllowedWhenUntainted

Arguments:

- `allow`: bool [default=false]

### SetCemeteryPreference

SecretArguments=AllowedWhenUntainted

Arguments:

- `cemetaryID`: number

### SetLootSpecialization

SecretArguments=AllowedWhenUntainted

Arguments:

- `specializationID`: number

### SetTaxiBenchmarkMode

SecretArguments=AllowedWhenUntainted

Arguments:

- `enable`: bool [default=false]

### ShouldDisplayRaidRolesInSocialFrame

Returns:

- `result`: bool

### ShouldDisplayStoryModeTooltipInSocialFrame

Returns:

- `result`: bool

### ShouldShowIslandsWeeklyPOI

Returns:

- `result`: bool

### ShouldShowSpecialSplashScreen

Returns:

- `result`: bool

### ShowCloak

SecretArguments=AllowedWhenUntainted

Arguments:

- `show`: bool

### ShowHelm

SecretArguments=AllowedWhenUntainted

Arguments:

- `show`: bool

### ShowingCloak

Returns:

- `result`: bool

### ShowingHelm

Returns:

- `result`: bool

### SitStandOrDescendStart

HasRestrictions=true

### SplashFrameCanBeShown

Returns:

- `result`: bool

### StartAttack

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: cstring [default=0]
- `exactMatch`: bool [default=false]

### StopAttack

### Stuck

### TimeoutResurrect

### ToggleSelfHighlight

Returns:

- `enabled`: bool

### ToggleSheath

### ToggleSit

HasRestrictions=true

## Events

### PLAYER_IN_COMBAT_CHANGED

SynchronousEvent=true

Payload:

- `inCombat`: bool

### PLAYER_TARGET_DIED

SynchronousEvent=true

## Tables

### PlayerAttackPowerInfo

Fields:

- `mainHandAttackPower`: number
- `offHandAttackPower`: number
- `rangedAttackPower`: number
- `baseAttackPower`: number
- `baseRangedAttackPower`: number
