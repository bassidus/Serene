# Unit

Environment=All, Predicates={}

## Functions

### CanEjectPassengerFromSeat

SecretArguments=AllowedWhenUntainted

Arguments:

- `virtualSeatIndex`: luaIndex

Returns:

- `result`: bool

### CanSwitchVehicleSeat

Returns:

- `result`: bool

### ClosestGameObjectPosition

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted, SecretReturns=true

Arguments:

- `gameObjectID`: number

Returns:

- `xPos`: number
- `yPos`: number
- `distance`: number

### ClosestUnitPosition

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted, SecretReturns=true

Arguments:

- `creatureID`: number

Returns:

- `xPos`: number
- `yPos`: number
- `distance`: number

### CreateUnitHealPredictionCalculator

Returns:

- `healPredictionCalculator`: UnitHealPredictionCalculator

### EjectPassengerFromSeat

SecretArguments=AllowedWhenUntainted

Arguments:

- `virtualSeatIndex`: luaIndex

### GetComboPoints

SecretArguments=AllowedWhenUntainted, SecretWhenUnitPowerRestricted=true

Arguments:

- `unit`: UnitTokenPvPRestrictedForAddOns
- `target`: UnitTokenPvPRestrictedForAddOns

Returns:

- `result`: number

### GetNegativeCorruptionEffectInfo

Returns:

- `corruptionEffects`: table<CorruptionEffectInfo>

### GetUnitChargedPowerPoints

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted, SecretWhenUnitPowerRestricted=true

Arguments:

- `unit`: UnitToken

Returns:

- `pointIndices`: table<number>

### GetUnitEmpowerHoldAtMaxTime

SecretArguments=AllowedWhenUntainted, SecretWhenUnitSpellCastRestricted=true

Arguments:

- `unit`: UnitToken

Returns:

- `holdAtMaxTime`: number

### GetUnitEmpowerMinHoldTime

SecretArguments=AllowedWhenUntainted, SecretWhenUnitSpellCastRestricted=true

Arguments:

- `unit`: UnitToken

Returns:

- `minHoldTime`: number

### GetUnitEmpowerStageDuration

SecretArguments=AllowedWhenUntainted, SecretWhenUnitSpellCastRestricted=true

Arguments:

- `unit`: UnitToken
- `index`: number

Returns:

- `duration`: number

### GetUnitHealthModifier

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `result`: number

### GetUnitMaxHealthModifier

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `result`: number

### GetUnitPowerBarInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `unitToken`: UnitToken

Returns:

- `info`: UnitPowerBarInfo

### GetUnitPowerBarInfoByID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `barID`: number

Returns:

- `info`: UnitPowerBarInfo

### GetUnitPowerBarStrings

SecretArguments=AllowedWhenUntainted

Arguments:

- `unitToken`: UnitToken

Returns:

- `name`: cstring?
- `tooltip`: cstring?
- `cost`: cstring?

### GetUnitPowerBarStringsByID

SecretArguments=AllowedWhenUntainted

Arguments:

- `barID`: number

Returns:

- `name`: cstring?
- `tooltip`: cstring?
- `cost`: cstring?

### GetUnitPowerBarTextureInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `unitToken`: UnitToken
- `textureIndex`: luaIndex
- `timerIndex`: luaIndex?

Returns:

- `texture`: fileID
- `colorR`: number
- `colorG`: number
- `colorB`: number
- `colorA`: number

### GetUnitPowerBarTextureInfoByID

SecretArguments=AllowedWhenUntainted

Arguments:

- `barID`: number
- `textureIndex`: luaIndex

Returns:

- `texture`: fileID
- `colorR`: number
- `colorG`: number
- `colorB`: number
- `colorA`: number

### GetUnitPowerModifier

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `result`: number

### GetUnitSpeed

SecretArguments=AllowedWhenUntainted, SecretWhenUnitStatsRestricted=true

Arguments:

- `unit`: UnitToken

Returns:

- `currentSpeed`: number
- `runSpeed`: number
- `flightSpeed`: number
- `swimSpeed`: number

### GetUnitTotalModifiedMaxHealthPercent

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `result`: number

### GetVehicleUIIndicator

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `vehicleIndicatorID`: number

Returns:

- `backgroundTextureID`: fileID
- `numSeatIndicators`: number

### GetVehicleUIIndicatorSeat

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `vehicleIndicatorID`: number
- `indicatorSeatIndex`: luaIndex

Returns:

- `virtualSeatIndex`: number
- `xPos`: number
- `yPos`: number

### IsFalling

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken?

Returns:

- `result`: bool

### IsFlying

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken?

Returns:

- `result`: bool

### IsPlayerInGuildFromGUID

SecretArguments=AllowedWhenUntainted

Arguments:

- `playerGUID`: WOWGUID

Returns:

- `IsInGuild`: bool

### IsSubmerged

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken?

Returns:

- `result`: bool

### IsSwimming

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken?

Returns:

- `result`: bool

### IsUnitModelReadyForUI

SecretArguments=AllowedWhenUntainted

Arguments:

- `unitToken`: UnitToken

Returns:

- `isReady`: bool

### PlayerIsPVPInactive

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `result`: bool

### PlayerIsSpellTarget -- If the unit is currently casting a spell, returns whether spell's target unit is the player. Returns false if the unit is not casting a spell or the spell has no target.

SecretArguments=AllowedWhenUntainted, SecretReturns=true

Arguments:

- `unit`: UnitToken

Returns:

- `result`: bool

### PlayerVehicleHasComboPoints

Returns:

- `vehicleHasComboPoints`: bool

### RegionalUniqueNamesEnabled

Returns:

- `result`: bool

### ReportPlayerIsPVPAFK

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

### ResistancePercent

SecretArguments=AllowedWhenUntainted

Arguments:

- `resistance`: number
- `casterLevel`: number

Returns:

- `result`: number

### SetPortraitTexture

SecretArguments=AllowedWhenUntainted

Arguments:

- `textureObject`: SimpleTexture
- `unitToken`: UnitToken
- `disableMasking`: bool [default=false]

### SetPortraitTextureFromCreatureDisplayID

SecretArguments=AllowedWhenUntainted

Arguments:

- `textureObject`: SimpleTexture
- `creatureDisplayID`: number

### SetUnitCursorTexture

SecretArguments=AllowedWhenUntainted

Arguments:

- `textureObject`: SimpleTexture
- `unit`: UnitToken
- `style`: CursorStyle?
- `includeLowPriority`: bool?
- `preferGamepadIcon`: bool?

Returns:

- `hasCursor`: bool

### UnitAffectingCombat

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `result`: bool

### UnitAlliedRaceInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `isAlliedRace`: bool
- `hasHeritageArmorUnlocked`: bool

### UnitArmor

SecretArguments=AllowedWhenUntainted, SecretWhenUnitStatsRestricted=true

Arguments:

- `unit`: UnitToken

Returns:

- `base`: number
- `effective`: number
- `real`: number
- `bonus`: number

### UnitAttackPower

SecretArguments=AllowedWhenUntainted, SecretWhenUnitStatsRestricted=true

Arguments:

- `unit`: UnitToken

Returns:

- `attackPower`: number
- `posBuff`: number
- `negBuff`: number

### UnitAttackSpeed

SecretArguments=AllowedWhenUntainted, SecretWhenUnitStatsRestricted=true

Arguments:

- `unit`: UnitToken

Returns:

- `attackSpeed`: number
- `offhandAttackSpeed`: number?
- `rangedAttackSpeed`: number?

### UnitBattlePetLevel

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `result`: number?

### UnitBattlePetSpeciesID

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `result`: number?

### UnitBattlePetType

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `result`: number?

### UnitCanAssist

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken
- `target`: UnitToken
- `canAssistImmunePC`: bool [default=false]
- `canAssistUninteractable`: bool [default=false]

Returns:

- `result`: bool

### UnitCanAttack

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken
- `target`: UnitToken

Returns:

- `result`: bool

### UnitCanCooperate

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken
- `target`: UnitToken

Returns:

- `result`: bool

### UnitCanPetBattle

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken
- `target`: UnitToken

Returns:

- `result`: bool

### UnitCastingDuration

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted, SecretReturns=true

Arguments:

- `unit`: UnitTokenPvPRestrictedForAddOns

Returns:

- `duration`: LuaDurationObject

### UnitCastingInfo

SecretArguments=AllowedWhenUntainted, SecretWhenUnitSpellCastRestricted=true

Arguments:

- `unit`: UnitTokenPvPRestrictedForAddOns

Returns:

- `name`: cstring
- `displayName`: string
- `textureID`: fileID
- `startTimeMs`: number
- `endTimeMs`: number
- `isTradeskill`: bool [NeverSecret=true]
- `castID`: WOWGUID
- `notInterruptible`: bool?
- `castingSpellID`: number
- `castBarID`: UnitCastBarID? [NeverSecret=true]
- `delayTimeMs`: number [NeverSecret=true]

### UnitChannelDuration

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitTokenPvPRestrictedForAddOns

Returns:

- `duration`: LuaDurationObject

### UnitChannelInfo

SecretArguments=AllowedWhenUntainted, SecretWhenUnitSpellCastRestricted=true

Arguments:

- `unit`: UnitTokenPvPRestrictedForAddOns

Returns:

- `name`: cstring
- `displayName`: cstring
- `textureID`: fileID
- `startTimeMs`: number
- `endTimeMs`: number
- `isTradeskill`: bool [NeverSecret=true]
- `notInterruptible`: bool?
- `spellID`: number
- `isEmpowered`: bool [NeverSecret=true]
- `numEmpowerStages`: number [NeverSecret=true]
- `castBarID`: UnitCastBarID? [NeverSecret=true]

### UnitChromieTimeID

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `ID`: number

### UnitClass

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted, SecretWhenUnitIdentityRestricted=true

Arguments:

- `unit`: UnitToken

Returns:

- `className`: cstring [ConditionalSecret=true]
- `classFilename`: cstring
- `classID`: number

### UnitClassBase

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted, SecretWhenUnitIdentityRestricted=true

Arguments:

- `unit`: UnitToken

Returns:

- `classFilename`: cstring
- `classID`: number

### UnitClassFromGUID

MayReturnNothing=true, SecretArguments=AllowedWhenTainted

Arguments:

- `unitGUID`: WOWGUID

Returns:

- `className`: cstring [ConditionalSecret=true]
- `classFilename`: cstring
- `classID`: number

### UnitClassification

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `result`: cstring

### UnitControllingVehicle

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `result`: bool

### UnitCreatureFamily

SecretArguments=AllowedWhenUntainted, SecretWhenUnitIdentityRestricted=true

Arguments:

- `unit`: UnitToken

Returns:

- `name`: cstring
- `id`: number

### UnitCreatureID

RequiresUnitIdentityAccess=true, SecretArguments=AllowedWhenUntainted, SecretWhenUnitIdentityRestricted=true

Arguments:

- `unit`: UnitToken

Returns:

- `creatureID`: number?

### UnitCreatureType

SecretArguments=AllowedWhenUntainted, SecretWhenUnitIdentityRestricted=true

Arguments:

- `unit`: UnitToken

Returns:

- `name`: cstring
- `id`: number

### UnitDamage

SecretArguments=AllowedWhenUntainted, SecretWhenUnitStatsRestricted=true

Arguments:

- `unit`: UnitToken

Returns:

- `minDamage`: number
- `maxDamage`: number
- `offhandMinDamage`: number
- `offhandMaxDamage`: number
- `posBuff`: number
- `negBuff`: number
- `percent`: number

### UnitDefenseSkill

SecretArguments=AllowedWhenUntainted, SecretWhenUnitStatsRestricted=true

Arguments:

- `unit`: UnitToken

Returns:

- `base`: number
- `modifier`: number

### UnitDetailedThreatSituation

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted, SecretWhenUnitThreatValuesRestricted=true

Arguments:

- `unit`: UnitToken
- `mobGUID`: UnitToken

Returns:

- `isTanking`: bool
- `status`: number
- `scaledPercentage`: number
- `rawPercentage`: number
- `rawThreat`: number

### UnitDistanceSquared

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `distance`: number
- `checkedDistance`: bool

### UnitEffectiveLevel

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: cstring

Returns:

- `result`: number

### UnitEmpoweredChannelDuration -- Returns a duration object that includes the duration of an empowered cast channel.

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken
- `includeHoldAtMaxTime`: bool [default=true] -- If true, include the hold-at-max time of the empowered channel in the total duration.

Returns:

- `duration`: LuaDurationObject

### UnitEmpoweredStageDurations -- Returns a vector of duration objects that measure the time spans for each individual stage in an empowered channel, with hold-at-max time included as the last element.

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `duration`: table<LuaDurationObject>

### UnitEmpoweredStagePercentages -- Returns a vector of percentages that describe how much of the total duration of an empowered channel is occupied by a stage.

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken
- `includeHoldAtMaxTime`: bool [default=true] -- If true, include the hold-at-max time of the empowered channel in the total duration and add a percentage value for it.

Returns:

- `percentages`: table<number>

### UnitExists

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken?

Returns:

- `result`: bool

### UnitFactionGroup

SecretArguments=AllowedWhenUntainted

Arguments:

- `unitName`: cstring
- `checkDisplayRace`: bool [default=false]

Returns:

- `factionGroupTag`: cstring
- `localized`: cstring

### UnitFullName

SecretArguments=AllowedWhenUntainted, SecretWhenUnitIdentityRestricted=true

Arguments:

- `unit`: UnitToken

Returns:

- `unitName`: cstring
- `unitServer`: cstring

### UnitGUID

SecretArguments=AllowedWhenUntainted, SecretWhenUnitIdentityRestricted=true

Arguments:

- `unit`: UnitTokenPvPRestrictedForAddOns

Returns:

- `result`: WOWGUID?

### UnitGetDetailedHealPrediction

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitTokenPvPRestrictedForAddOns
- `healerUnit`: UnitTokenPvPRestrictedForAddOns? -- If specified, a unit to evaluate as the 'healer' for incoming heal values. If nil, healer values will be zero.
- `healPredictionCalculator`: UnitHealPredictionCalculator

### UnitGetIncomingHeals

SecretArguments=AllowedWhenUntainted, SecretReturns=true

Arguments:

- `unit`: UnitTokenPvPRestrictedForAddOns
- `healerGUID`: UnitTokenPvPRestrictedForAddOns?

Returns:

- `result`: number?

### UnitGetTotalAbsorbs

SecretArguments=AllowedWhenUntainted, SecretReturns=true

Arguments:

- `unit`: UnitTokenPvPRestrictedForAddOns

Returns:

- `result`: number

### UnitGetTotalHealAbsorbs

SecretArguments=AllowedWhenUntainted, SecretReturns=true

Arguments:

- `unit`: UnitTokenPvPRestrictedForAddOns

Returns:

- `result`: number

### UnitGroupRolesAssigned

SecretArguments=AllowedWhenUntainted, SecretWhenUnitIdentityRestricted=true

Arguments:

- `unit`: UnitToken?

Returns:

- `result`: cstring

### UnitGroupRolesAssignedEnum

SecretArguments=AllowedWhenUntainted, SecretWhenUnitIdentityRestricted=true

Arguments:

- `unit`: UnitToken?

Returns:

- `result`: number

### UnitHPPerStamina

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `result`: number

### UnitHasEffectivelyTankAura

SecretArguments=AllowedWhenUntainted, SecretWhenUnitIdentityRestricted=true

Arguments:

- `unit`: UnitToken?

Returns:

- `result`: bool

### UnitHasLootInteraction

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `result`: bool

### UnitHasMouseoverHighlight

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `result`: bool

### UnitHasPowerType

SecretArguments=AllowedWhenUntainted

Arguments:

- `unitToken`: UnitTokenPvPRestrictedForAddOns
- `powerType`: PowerType

Returns:

- `hasPower`: bool

### UnitHasRelicSlot

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `result`: bool

### UnitHasVehiclePlayerFrameUI

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken?

Returns:

- `result`: bool

### UnitHasVehicleUI

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken?

Returns:

- `result`: bool

### UnitHealthMax

SecretArguments=AllowedWhenUntainted, SecretWhenUnitHealthMaxRestricted=true

Arguments:

- `unit`: UnitTokenPvPRestrictedForAddOns

Returns:

- `result`: number

### UnitHealthMissing -- Result of UnitHealthMax() - UnitHealth()

SecretArguments=AllowedWhenUntainted, SecretReturns=true

Arguments:

- `unit`: UnitTokenPvPRestrictedForAddOns
- `usePredicted`: bool [default=true]

Returns:

- `result`: number

### UnitHealthPercent -- Returns percent of health remaining - can be scaled via a curve for display purposes

SecretArguments=AllowedWhenUntainted, SecretReturns=true, SecretWhenCurveSecret=true

Arguments:

- `unit`: UnitTokenPvPRestrictedForAddOns
- `usePredicted`: bool [default=true]
- `curve`: LuaCurveObjectBase?

Returns:

- `result`: LuaCurveEvaluatedResult -- If no curve is specified, a floating point percentage value. Else, the result of evaluating the curve with the percentage as the input.

### UnitHealth

SecretArguments=AllowedWhenUntainted, SecretReturns=true

Arguments:

- `unit`: UnitTokenPvPRestrictedForAddOns
- `usePredicted`: bool [default=true]

Returns:

- `result`: number

### UnitHonor

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `result`: number

### UnitHonorLevel

SecretArguments=AllowedWhenUntainted, SecretWhenUnitIdentityRestricted=true

Arguments:

- `unit`: UnitToken

Returns:

- `result`: number

### UnitHonorMax

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `result`: number

### UnitInAnyGroup

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken?
- `partyIndex`: luaIndex?

Returns:

- `result`: bool

### UnitInBattleground

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken?
- `partyIndex`: luaIndex?

Returns:

- `result`: luaIndex?

### UnitInOtherParty -- Checks whether this unit cannot see your party chat because it is in an instance group

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `inOtherParty`: bool

### UnitInParty

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken?
- `partyIndex`: luaIndex?

Returns:

- `result`: bool

### UnitInPartyIsAI

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken?

Returns:

- `result`: bool

### UnitInPartyShard

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `inPartyShard`: bool

### UnitInRaid

SecretArguments=AllowedWhenUntainted, SecretWhenUnitIdentityRestricted=true

Arguments:

- `unit`: UnitToken?
- `partyIndex`: luaIndex?

Returns:

- `result`: luaIndex?

### UnitInRange

SecretArguments=AllowedWhenUntainted, SecretReturns=true

Arguments:

- `unit`: UnitToken

Returns:

- `inRange`: bool
- `checkedRange`: bool

### UnitInSubgroup

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken?
- `partyIndex`: luaIndex?

Returns:

- `result`: bool

### UnitInVehicle

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `result`: bool

### UnitInVehicleControlSeat

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken?

Returns:

- `result`: bool

### UnitInVehicleHidesPetFrame

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken?

Returns:

- `result`: bool

### UnitIsAFK

SecretArguments=AllowedWhenUntainted, SecretInChatMessagingLockdown=true

Arguments:

- `unit`: UnitToken

Returns:

- `result`: bool

### UnitIsBattlePet

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `result`: bool?

### UnitIsBattlePetCompanion

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `result`: bool

### UnitIsBossMob

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `result`: bool

### UnitIsCharmed

SecretArguments=AllowedWhenUntainted, SecretWhenUnitPossessionRestricted=true

Arguments:

- `unit`: UnitToken?

Returns:

- `result`: bool

### UnitIsConnected

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `isConnected`: bool

### UnitIsControlling

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `result`: bool

### UnitIsCorpse

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken?

Returns:

- `result`: bool

### UnitIsDND

SecretArguments=AllowedWhenUntainted, SecretInChatMessagingLockdown=true

Arguments:

- `unit`: UnitToken

Returns:

- `result`: bool

### UnitIsDead

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `result`: bool

### UnitIsDeadOrGhost

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `result`: bool

### UnitIsEnemy

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken
- `target`: UnitToken

Returns:

- `result`: bool

### UnitIsFeignDeath

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `result`: bool

### UnitIsFriend

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken
- `target`: UnitToken

Returns:

- `result`: bool

### UnitIsGameObject

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken?

Returns:

- `result`: bool

### UnitIsGhost

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `result`: bool

### UnitIsGroupAssistant

SecretArguments=AllowedWhenUntainted, SecretWhenUnitIdentityRestricted=true

Arguments:

- `unit`: UnitToken

Returns:

- `isAssistant`: bool

### UnitIsGroupLeader

SecretArguments=AllowedWhenUntainted, SecretWhenUnitIdentityRestricted=true

Arguments:

- `unit`: UnitToken
- `partyCategory`: luaIndex?

Returns:

- `isLeader`: bool

### UnitIsHumanPlayer

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken?
- `partyIndex`: luaIndex?

Returns:

- `result`: bool

### UnitIsInInteractRange

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `result`: bool

### UnitIsInMyGuild

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: cstring

Returns:

- `result`: bool

### UnitIsInteractable

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken?

Returns:

- `result`: bool

### UnitIsLieutenant

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `result`: bool

### UnitIsMercenary

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: cstring

Returns:

- `result`: bool

### UnitIsMinion -- Returns whether the unit is considered a minion of a player, such as a pet, totem, or guardian.

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `result`: bool

### UnitIsNPCAsPlayer

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken?

Returns:

- `result`: bool

### UnitIsOtherPlayersBattlePet

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken?

Returns:

- `result`: bool

### UnitIsOtherPlayersPet

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken?

Returns:

- `result`: bool

### UnitIsOwnerOrControllerOfUnit

SecretArguments=AllowedWhenUntainted, SecretWhenUnitIdentityRestricted=true

Arguments:

- `controllingUnit`: UnitToken
- `controlledUnit`: UnitToken

Returns:

- `unitIsOwnerOrControllerOfUnit`: bool

### UnitIsPVP

SecretArguments=AllowedWhenUntainted, SecretWhenUnitIdentityRestricted=true

Arguments:

- `unit`: UnitToken

Returns:

- `result`: bool

### UnitIsPVPFreeForAll

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `result`: bool

### UnitIsPVPSanctuary

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken?

Returns:

- `result`: bool

### UnitIsPlayer

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken?
- `partyIndex`: luaIndex?

Returns:

- `result`: bool

### UnitIsPlayerControlledOrGroupMember -- Returns true for 'player', 'pet', 'vehicle', or any of 'partyn', 'partypetn', 'raidn', 'raidpetn'

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `result`: bool

### UnitIsPossessed

SecretArguments=AllowedWhenUntainted, SecretWhenUnitPossessionRestricted=true

Arguments:

- `unit`: UnitToken?

Returns:

- `result`: bool

### UnitIsQuestBoss

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `result`: bool

### UnitIsRaidOfficer

SecretArguments=AllowedWhenUntainted, SecretWhenUnitIdentityRestricted=true

Arguments:

- `unit`: UnitToken?

Returns:

- `result`: bool

### UnitIsSameServer

SecretArguments=AllowedWhenUntainted

Arguments:

- `unitName`: cstring

Returns:

- `result`: bool

### UnitIsTapDenied

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `result`: bool

### UnitIsTrivial

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `result`: bool

### UnitIsUnconscious

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `result`: bool

### UnitIsUnit

RequiresComparableUnitTokens=true, SecretArguments=AllowedWhenUntainted, SecretWhenUnitComparisonRestricted=true

Arguments:

- `unit1`: UnitToken
- `unit2`: UnitToken

Returns:

- `result`: bool

### UnitIsVisible

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken?

Returns:

- `result`: bool

### UnitIsWildBattlePet

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `result`: bool

### UnitLeadsAnyGroup

SecretArguments=AllowedWhenUntainted, SecretWhenUnitIdentityRestricted=true

Arguments:

- `unit`: UnitToken

Returns:

- `isLeader`: bool

### UnitLevel

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: cstring

Returns:

- `result`: number

### UnitName

SecretArguments=AllowedWhenTainted, SecretWhenUnitNameIdentityRestricted=true

Arguments:

- `unit`: UnitToken

Returns:

- `unitName`: cstring
- `unitServer`: cstring

### UnitNameFromGUID

SecretArguments=AllowedWhenTainted, SecretWhenUnitIdentityRestricted=true

Arguments:

- `unitGUID`: WOWGUID

Returns:

- `unitName`: cstring
- `unitServer`: cstring

### UnitNameUnmodified

SecretArguments=AllowedWhenUntainted, SecretWhenUnitIdentityRestricted=true

Arguments:

- `unit`: UnitToken

Returns:

- `unitName`: cstring
- `unitServer`: cstring

### UnitNameplateShowsWidgetsOnly

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `nameplateShowsWidgetsOnly`: bool

### UnitNumPowerBarTimers

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `result`: number

### UnitOnTaxi

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `result`: bool

### UnitOwnerGUID

SecretArguments=AllowedWhenUntainted, SecretWhenUnitIdentityRestricted=true

Arguments:

- `unit`: UnitTokenPvPRestrictedForAddOns

Returns:

- `ownerGUID`: WOWGUID

### UnitPVPName

SecretArguments=AllowedWhenUntainted, SecretWhenUnitIdentityRestricted=true

Arguments:

- `unit`: UnitToken

Returns:

- `result`: string

### UnitPartialPower

SecretArguments=AllowedWhenUntainted, SecretWhenUnitPowerRestricted=true

Arguments:

- `unitToken`: UnitTokenPvPRestrictedForAddOns
- `powerType`: PowerType?
- `unmodified`: bool [default=false]

Returns:

- `partialPower`: number

### UnitPercentHealthFromGUID

SecretArguments=AllowedWhenTainted, SecretReturns=true

Arguments:

- `unitGUID`: WOWGUID

Returns:

- `percentHealth`: number?

### UnitPhaseReason

SecretArguments=AllowedWhenUntainted, SecretWhenUnitIdentityRestricted=true

Arguments:

- `unit`: UnitToken

Returns:

- `reason`: PhaseReason?

### UnitPlayerControlled

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken?

Returns:

- `result`: bool

### UnitPlayerOrPetInParty

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken?
- `partyIndex`: luaIndex?

Returns:

- `result`: bool

### UnitPlayerOrPetInRaid

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken?
- `partyIndex`: luaIndex?

Returns:

- `result`: bool

### UnitPosition

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `positionX`: number
- `positionY`: number
- `positionZ`: number
- `mapID`: number

### UnitPower

SecretArguments=AllowedWhenUntainted, SecretWhenUnitPowerRestricted=true

Arguments:

- `unitToken`: UnitTokenPvPRestrictedForAddOns
- `powerType`: PowerType?
- `unmodified`: bool [default=false]

Returns:

- `power`: number

### UnitPowerBarID

SecretArguments=AllowedWhenUntainted

Arguments:

- `unitToken`: UnitToken

Returns:

- `barID`: number

### UnitPowerBarTimerInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted, SecretReturns=true

Arguments:

- `unit`: UnitToken
- `index`: luaIndex [default=0]

Returns:

- `duration`: number
- `expiration`: number
- `barID`: number
- `auraID`: number

### UnitPowerDisplayMod

SecretArguments=AllowedWhenUntainted

Arguments:

- `powerType`: PowerType

Returns:

- `displayMod`: number

### UnitPowerMax

SecretArguments=AllowedWhenUntainted, SecretWhenUnitPowerMaxRestricted=true

Arguments:

- `unitToken`: UnitTokenPvPRestrictedForAddOns
- `powerType`: PowerType?
- `unmodified`: bool [default=false]

Returns:

- `maxPower`: number

### UnitPowerMissing -- Result of UnitPowerMax() - UnitPower()

SecretArguments=AllowedWhenUntainted, SecretWhenUnitPowerRestricted=true

Arguments:

- `unitToken`: UnitTokenPvPRestrictedForAddOns
- `powerType`: PowerType?
- `unmodified`: bool [default=false]

Returns:

- `result`: number

### UnitPowerPercent -- Queries the percent of power remaining, optionally evaluating it against a supplied curve.

SecretArguments=AllowedWhenUntainted, SecretWhenCurveSecret=true, SecretWhenUnitPowerRestricted=true

Arguments:

- `unitToken`: UnitTokenPvPRestrictedForAddOns
- `powerType`: PowerType?
- `unmodified`: bool [default=false]
- `curve`: LuaCurveObjectBase?

Returns:

- `result`: LuaCurveEvaluatedResult -- If no curve is specified, a floating point percentage value. Else, the result of evaluating the curve with the percentage as the input.

### UnitPowerType

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitTokenPvPRestrictedForAddOns
- `index`: number [default=0]

Returns:

- `powerType`: PowerType
- `powerTypeToken`: string
- `rgbX`: number
- `rgbY`: number
- `rgbZ`: number

### UnitPvpClassification

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitTokenPvPRestrictedForAddOns

Returns:

- `classification`: PvPUnitClassification?

### UnitQuestTrivialLevelRange

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `levelRange`: number

### UnitQuestTrivialLevelRangeScaling

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `levelRange`: number

### UnitRace

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted, SecretWhenUnitIdentityRestricted=true

Arguments:

- `unit`: UnitToken

Returns:

- `localizedRaceName`: cstring
- `englishRaceName`: cstring
- `raceID`: number

### UnitRangedAttackPower

SecretArguments=AllowedWhenUntainted, SecretWhenUnitStatsRestricted=true

Arguments:

- `unit`: UnitToken

Returns:

- `attackPower`: number
- `posBuff`: number
- `negBuff`: number

### UnitRangedDamage

SecretArguments=AllowedWhenUntainted, SecretWhenUnitStatsRestricted=true

Arguments:

- `unit`: UnitToken

Returns:

- `speed`: number
- `minDamage`: number
- `maxDamage`: number
- `posBuff`: number
- `negBuff`: number
- `percent`: number

### UnitReaction

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken
- `target`: UnitToken

Returns:

- `result`: luaIndex?

### UnitRealmRelationship

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `realmRelationship`: luaIndex?

### UnitResistance

SecretArguments=AllowedWhenUntainted, SecretWhenUnitIdentityRestricted=true

Arguments:

- `unit`: UnitToken
- `damageClass`: Damageclass

Returns:

- `baseResistance`: number
- `realResistance`: number
- `effectiveResistance`: number
- `bonusResistance`: number

### UnitSelectionColor

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken
- `useExtendedColors`: bool [default=false]

Returns:

- `resultR`: number
- `resultG`: number
- `resultB`: number
- `resultA`: number

### UnitSelectionType

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken
- `useExtendedColors`: bool [default=false]

Returns:

- `result`: number

### UnitSex

SecretArguments=AllowedWhenUntainted, SecretWhenUnitIdentityRestricted=true

Arguments:

- `unit`: UnitToken

Returns:

- `sex`: number?

### UnitSexBase

SecretArguments=AllowedWhenUntainted, SecretWhenUnitIdentityRestricted=true

Arguments:

- `unit`: UnitToken

Returns:

- `sex`: UnitSex?

### UnitShouldDisplayName

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `result`: bool

### UnitShouldDisplaySpellTargetName -- If the unit is currently casting a spell, returns whether the target's name should be displayed. Returns false if the unit is not casting a spell or the spell has no target.

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `result`: bool

### UnitSpellHaste

SecretArguments=AllowedWhenUntainted, SecretWhenUnitStatsRestricted=true

Arguments:

- `unit`: UnitToken

Returns:

- `result`: number

### UnitSpellTargetClass -- If the unit is currently casting a spell, returns the class of the spell's target unit. Returns nil if the unit is not casting a spell or the spell has no target.

SecretArguments=AllowedWhenUntainted, SecretReturns=true

Arguments:

- `unit`: UnitToken

Returns:

- `classFilename`: cstring

### UnitSpellTargetName -- If the unit is currently casting a spell, returns the name of the spell's target unit. Returns nil if the unit is not casting a spell or the spell has no target.

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted, SecretReturns=true

Arguments:

- `unit`: UnitToken

Returns:

- `targetName`: string

### UnitStagger

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitTokenPvPRestrictedForAddOns

Returns:

- `result`: number [ConditionalSecret=true]

### UnitStat

SecretArguments=AllowedWhenUntainted, SecretWhenUnitStatsRestricted=true

Arguments:

- `unit`: UnitToken
- `index`: luaIndex

Returns:

- `currentStat`: number
- `effectiveStat`: number
- `statPositiveBuff`: number
- `statNegativeBuff`: number

### UnitSwitchToVehicleSeat

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken
- `virtualSeatIndex`: luaIndex

### UnitTargetsVehicleInRaidUI

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken?

Returns:

- `result`: bool

### UnitThreatLeadSituation -- Returns a threat state (0-3; representing none, yellow, orange, red) that indicates how far the provided unit is above the secondmost threat on the provided mob. If the unit is not first on threat, will always return red. Can return nil if the provided mob does not exist.

SecretArguments=AllowedWhenUntainted, SecretWhenUnitThreatStateRestricted=true

Arguments:

- `unit`: UnitToken
- `mobGUID`: UnitToken

Returns:

- `result`: number?

### UnitThreatPercentageOfLead

SecretArguments=AllowedWhenUntainted, SecretWhenUnitThreatValuesRestricted=true

Arguments:

- `unit`: UnitToken
- `mobGUID`: UnitToken

Returns:

- `result`: number?

### UnitThreatSituation

SecretArguments=AllowedWhenUntainted, SecretWhenUnitThreatStateRestricted=true

Arguments:

- `unit`: UnitToken
- `mobGUID`: UnitToken?

Returns:

- `result`: number?

### UnitTokenFromGUID

SecretArguments=AllowedWhenTainted, SecretWhenUnitIdentityRestricted=true

Arguments:

- `unitGUID`: WOWGUID

Returns:

- `unitToken`: string?

### UnitTreatAsPlayerForDisplay

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `treatAsPlayer`: bool

### UnitTrialBankedLevels

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `bankedLevels`: number
- `xpIntoCurrentLevel`: number
- `xpForNextLevel`: number

### UnitTrialXP

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `result`: number

### UnitUsesAmmo

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `result`: bool

### UnitUsingVehicle

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `result`: bool

### UnitVehicleSeatCount

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `result`: number

### UnitVehicleSeatInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken
- `virtualSeatIndex`: luaIndex

Returns:

- `controlType`: cstring
- `occupantName`: cstring
- `serverName`: cstring
- `ejectable`: bool
- `canSwitchSeats`: bool

### UnitVehicleSkin

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken?

Returns:

- `result`: fileID

### UnitWeaponAttackPower

SecretArguments=AllowedWhenUntainted, SecretWhenUnitStatsRestricted=true

Arguments:

- `unit`: UnitToken

Returns:

- `mainHandWeaponAttackPower`: number
- `offHandWeaponAttackPower`: number
- `rangedWeaponAttackPower`: number

### UnitWidgetSet

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `uiWidgetSet`: number

### UnitXP

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `result`: number

### UnitXPMax

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `result`: number

### WorldLootObjectExists

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken?

Returns:

- `result`: bool

## Events

### ACTIVE_PLAYER_SPECIALIZATION_CHANGED

SynchronousEvent=true

### ARENA_COOLDOWNS_UPDATE

SynchronousEvent=true

### ARENA_CROWD_CONTROL_SPELL_UPDATE

SecretWhenLossOfControlInfoRestricted=true, SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant
- `spellID`: number

### AUTOFOLLOW_BEGIN

SynchronousEvent=true

Payload:

- `name`: cstring

### AUTOFOLLOW_END

SynchronousEvent=true

### CANCEL_SUMMON

SynchronousEvent=true

### COMBO_TARGET_CHANGED

SynchronousEvent=true

### CONFIRM_BINDER

SynchronousEvent=true

Payload:

- `areaName`: cstring

### CONFIRM_SUMMON

SynchronousEvent=true

Payload:

- `summonReason`: number
- `skippingStartExperience`: bool

### ECLIPSE_DIRECTION_CHANGE

SynchronousEvent=true

Payload:

- `direction`: cstring

### HEARTHSTONE_BOUND

SynchronousEvent=true

### HONOR_XP_UPDATE

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### INCOMING_RESURRECT_CHANGED

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### INCOMING_SUMMON_CHANGED

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### KNOWN_TITLES_UPDATE

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### LOCALPLAYER_PET_RENAMED

SynchronousEvent=true

### MIRROR_TIMER_PAUSE

SynchronousEvent=true

Payload:

- `timerName`: cstring
- `paused`: number

### MIRROR_TIMER_START

SynchronousEvent=true

Payload:

- `timerName`: cstring
- `value`: number
- `maxValue`: number
- `scale`: number
- `paused`: number
- `timerLabel`: cstring

### MIRROR_TIMER_STOP

SynchronousEvent=true

Payload:

- `timerName`: cstring

### NEUTRAL_FACTION_SELECT_RESULT

SynchronousEvent=true

Payload:

- `success`: bool

### OBJECT_ENTERED_AOI

SynchronousEvent=true

Payload:

- `guid`: WOWGUID

### OBJECT_LEFT_AOI

SynchronousEvent=true

Payload:

- `guid`: WOWGUID

### PARTY_KILL

SecretWhenUnitIdentityRestricted=true, SynchronousEvent=true

Payload:

- `attackerGUID`: WOWGUID
- `targetGUID`: WOWGUID

### PET_BAR_UPDATE_USABLE

SynchronousEvent=true

### PET_UI_UPDATE

SynchronousEvent=true

### PLAYER_CAN_GLIDE_CHANGED

SynchronousEvent=true

Payload:

- `canGlide`: bool

### PLAYER_DAMAGE_DONE_MODS

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### PLAYER_ENTER_COMBAT

SynchronousEvent=true

### PLAYER_FARSIGHT_FOCUS_CHANGED

SynchronousEvent=true

### PLAYER_FLAGS_CHANGED

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### PLAYER_FOCUS_CHANGED

SynchronousEvent=true

### PLAYER_IMPULSE_APPLIED

SynchronousEvent=true

### PLAYER_IS_GLIDING_CHANGED

SynchronousEvent=true

Payload:

- `isGliding`: bool

### PLAYER_LEAVE_COMBAT

SynchronousEvent=true

### PLAYER_LEVEL_CHANGED

SynchronousEvent=true

Payload:

- `oldLevel`: number
- `newLevel`: number
- `real`: bool

### PLAYER_LEVEL_UP

SynchronousEvent=true

Payload:

- `level`: number
- `healthDelta`: number
- `powerDelta`: number
- `numNewTalents`: number
- `numNewPvpTalentSlots`: number
- `strengthDelta`: number
- `agilityDelta`: number
- `staminaDelta`: number
- `intellectDelta`: number

### PLAYER_MAX_LEVEL_UPDATE

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### PLAYER_MOUNT_DISPLAY_CHANGED

SynchronousEvent=true

### PLAYER_PVP_KILLS_CHANGED

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### PLAYER_PVP_RANK_CHANGED

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### PLAYER_REGEN_DISABLED

SynchronousEvent=true

### PLAYER_REGEN_ENABLED

SynchronousEvent=true

### PLAYER_SOFT_ENEMY_CHANGED

SynchronousEvent=true

### PLAYER_SOFT_FRIEND_CHANGED

SynchronousEvent=true

### PLAYER_SOFT_INTERACT_CHANGED

SecretWhenUnitIdentityRestricted=true, SynchronousEvent=true

Payload:

- `oldTarget`: WOWGUID
- `newTarget`: WOWGUID

### PLAYER_SOFT_TARGET_INTERACTION

SynchronousEvent=true

### PLAYER_SPECIALIZATION_CHANGED

SynchronousEvent=true, UniqueEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### PLAYER_STARTED_LOOKING

SynchronousEvent=true

### PLAYER_STARTED_MOVING

SynchronousEvent=true

### PLAYER_STARTED_TURNING

SynchronousEvent=true

### PLAYER_STOPPED_LOOKING

SynchronousEvent=true

### PLAYER_STOPPED_MOVING

SynchronousEvent=true

### PLAYER_STOPPED_TURNING

SynchronousEvent=true

### PLAYER_TARGET_CHANGED

SynchronousEvent=true

### PLAYER_TRIAL_XP_UPDATE

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### PLAYER_UPDATE_RESTING

SynchronousEvent=true

### PLAYER_XP_UPDATE

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### PORTRAITS_UPDATED

UniqueEvent=true

### PROVING_GROUNDS_SCORE_UPDATE

SynchronousEvent=true

Payload:

- `points`: number

### PVP_TIMER_UPDATE

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### RUNE_POWER_UPDATE

SecretPayloads=true, SynchronousEvent=true

Payload:

- `runeIndex`: number
- `added`: bool?

### RUNE_TYPE_UPDATE

SecretPayloads=true, SynchronousEvent=true

Payload:

- `runeIndex`: number

### SHOW_FACTION_SELECT_UI

SynchronousEvent=true

### SPELL_CONFIRMATION_PROMPT

SynchronousEvent=true

Payload:

- `spellID`: number
- `effectValue`: number
- `message`: cstring
- `duration`: number
- `currencyTypesID`: number
- `currencyCost`: number
- `currentDifficulty`: number
- `displayItemID`: number
- `itemContext`: number
- `treasureContextLevel`: number

### SPELL_CONFIRMATION_TIMEOUT

SynchronousEvent=true

Payload:

- `spellID`: number
- `effectValue`: number

### UNIT_ABSORB_AMOUNT_CHANGED

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### UNIT_AREA_CHANGED

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### UNIT_ARENA_COOLDOWNS_UPDATE -- Only signaled when the active player is a commentator or spectator.

SynchronousEvent=true, UniqueEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### UNIT_ATTACK

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### UNIT_ATTACK_POWER

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### UNIT_ATTACK_SPEED

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### UNIT_CHEAT_TOGGLE_EVENT

SynchronousEvent=true

### UNIT_CLASSIFICATION_CHANGED

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### UNIT_COMBAT

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant
- `event`: cstring
- `flagText`: cstring
- `amount`: number
- `schoolMask`: number

### UNIT_CONNECTION

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant
- `isConnected`: bool

### UNIT_CTR_OPTIONS

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### UNIT_DAMAGE

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### UNIT_DEFENSE

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### UNIT_DIED

SecretWhenUnitIdentityRestricted=true, SynchronousEvent=true

Payload:

- `unitGUID`: WOWGUID

### UNIT_DISPLAYPOWER

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### UNIT_DISTANCE_CHECK_UPDATE

SecretPayloads=true, SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant
- `isInDistance`: bool

### UNIT_FACTION

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### UNIT_FLAGS

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### UNIT_FORM_CHANGED

SynchronousEvent=true, UniqueEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### UNIT_HAPPINESS

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### UNIT_HEAL_ABSORB_AMOUNT_CHANGED

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### UNIT_HEAL_PREDICTION

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### UNIT_HEALTH

SynchronousEvent=true, UniqueEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### UNIT_IN_RANGE_UPDATE

SecretPayloads=true, SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant
- `isInRange`: bool

### UNIT_INVENTORY_CHANGED

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### UNIT_LEVEL

SynchronousEvent=true, UniqueEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### UNIT_LOOT

SynchronousEvent=true

Payload:

- `unitGUID`: WOWGUID
- `hasLoot`: bool

### UNIT_MANA

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### UNIT_MAX_HEALTH_MODIFIERS_CHANGED

SecretPayloads=true, SynchronousEvent=true, UniqueEvent=true

Payload:

- `unitTarget`: UnitTokenVariant
- `percentMaxHealthAdjusted`: number

### UNIT_MAXHEALTH

SynchronousEvent=true, UniqueEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### UNIT_MAXPOWER

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant
- `powerType`: cstring

### UNIT_MODEL_CHANGED

SynchronousEvent=true, UniqueEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### UNIT_NAME_UPDATE

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### UNIT_OTHER_PARTY_CHANGED

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### UNIT_PET

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### UNIT_PET_EXPERIENCE

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### UNIT_PET_TRAINING_POINTS

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### UNIT_PHASE

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### UNIT_PORTRAIT_UPDATE

SynchronousEvent=true, UniqueEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### UNIT_POWER_BAR_HIDE

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### UNIT_POWER_BAR_SHOW

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### UNIT_POWER_BAR_TIMER_UPDATE

UniqueEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### UNIT_POWER_FREQUENT

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant
- `powerType`: cstring

### UNIT_POWER_POINT_CHARGE

SecretWhenUnitPowerRestricted=true, UniqueEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### UNIT_POWER_UPDATE

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant
- `powerType`: cstring

### UNIT_QUEST_LOG_CHANGED

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### UNIT_RANGED_ATTACK_POWER

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### UNIT_RANGEDDAMAGE

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### UNIT_RESISTANCES

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### UNIT_SPELL_HASTE

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### UNIT_SPELLCAST_CHANNEL_START

SecretWhenUnitSpellCastRestricted=true, SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant
- `castGUID`: WOWGUID
- `spellID`: number
- `castBarID`: UnitCastBarID? [NeverSecret=true]

### UNIT_SPELLCAST_CHANNEL_STOP

SecretWhenUnitSpellCastRestricted=true, SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant
- `castGUID`: WOWGUID
- `spellID`: number
- `interruptedBy`: WOWGUID
- `castBarID`: UnitCastBarID? [NeverSecret=true]

### UNIT_SPELLCAST_CHANNEL_UPDATE

SecretWhenUnitSpellCastRestricted=true, SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant
- `castGUID`: WOWGUID
- `spellID`: number
- `castBarID`: UnitCastBarID? [NeverSecret=true]

### UNIT_SPELLCAST_DELAYED

SecretWhenUnitSpellCastRestricted=true, SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant
- `castGUID`: WOWGUID
- `spellID`: number
- `castBarID`: UnitCastBarID? [NeverSecret=true]

### UNIT_SPELLCAST_EMPOWER_START

SecretWhenUnitSpellCastRestricted=true, SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant
- `castGUID`: WOWGUID
- `spellID`: number
- `castBarID`: UnitCastBarID? [NeverSecret=true]

### UNIT_SPELLCAST_EMPOWER_STOP

SecretWhenUnitSpellCastRestricted=true, SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant
- `castGUID`: WOWGUID
- `spellID`: number
- `complete`: bool
- `interruptedBy`: WOWGUID
- `castBarID`: UnitCastBarID? [NeverSecret=true]

### UNIT_SPELLCAST_EMPOWER_UPDATE

SecretWhenUnitSpellCastRestricted=true, SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant
- `castGUID`: WOWGUID
- `spellID`: number
- `castBarID`: UnitCastBarID? [NeverSecret=true]

### UNIT_SPELLCAST_FAILED

SecretWhenUnitSpellCastRestricted=true, SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant
- `castGUID`: WOWGUID
- `spellID`: number
- `castBarID`: UnitCastBarID? [NeverSecret=true]

### UNIT_SPELLCAST_FAILED_QUIET

SecretWhenUnitSpellCastRestricted=true, SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant
- `castGUID`: WOWGUID
- `spellID`: number
- `castBarID`: UnitCastBarID? [NeverSecret=true]

### UNIT_SPELLCAST_INTERRUPTED

SecretWhenUnitSpellCastRestricted=true, SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant
- `castGUID`: WOWGUID
- `spellID`: number
- `interruptedBy`: WOWGUID
- `castBarID`: UnitCastBarID? [NeverSecret=true]

### UNIT_SPELLCAST_INTERRUPTIBLE

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### UNIT_SPELLCAST_NOT_INTERRUPTIBLE

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### UNIT_SPELLCAST_RETICLE_CLEAR

SecretWhenUnitSpellCastRestricted=true, SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant
- `castGUID`: WOWGUID
- `spellID`: number

### UNIT_SPELLCAST_RETICLE_TARGET

SecretWhenUnitSpellCastRestricted=true, SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant
- `castGUID`: WOWGUID
- `spellID`: number

### UNIT_SPELLCAST_SENT

SecretWhenUnitSpellCastRestricted=true, SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant
- `target`: cstring [ConditionalSecret=true]
- `castGUID`: WOWGUID
- `spellID`: number

### UNIT_SPELLCAST_START

SecretWhenUnitSpellCastRestricted=true, SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant
- `castGUID`: WOWGUID
- `spellID`: number
- `castBarID`: UnitCastBarID? [NeverSecret=true]

### UNIT_SPELLCAST_STOP

SecretWhenUnitSpellCastRestricted=true, SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant
- `castGUID`: WOWGUID
- `spellID`: number
- `castBarID`: UnitCastBarID? [NeverSecret=true]

### UNIT_SPELLCAST_SUCCEEDED

SecretWhenUnitSpellCastRestricted=true, SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant
- `castGUID`: WOWGUID
- `spellID`: number
- `castBarID`: UnitCastBarID? [NeverSecret=true]

### UNIT_STATS

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### UNIT_TARGET

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### UNIT_TARGETABLE_CHANGED

UniqueEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### UNIT_THREAT_LIST_UPDATE

SynchronousEvent=true, UniqueEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### UNIT_THREAT_SITUATION_UPDATE

SynchronousEvent=true, UniqueEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### UPDATE_EXHAUSTION

SynchronousEvent=true

### UPDATE_MOUSEOVER_UNIT

SynchronousEvent=true

### UPDATE_STEALTH

SynchronousEvent=true

### VEHICLE_ANGLE_UPDATE

SynchronousEvent=true

Payload:

- `normalizedPitch`: number
- `radians`: number

## Tables

### PhaseReason

MaxValue=5, MinValue=0, NumValues=6

Fields:

- `Phasing`: PhaseReason [= 0]
- `Sharding`: PhaseReason [= 1]
- `WarMode`: PhaseReason [= 2]
- `ChromieTime`: PhaseReason [= 3]
- `TimerunningHwt`: PhaseReason [= 4]
- `RuleSet`: PhaseReason [= 5]

### PvPUnitClassification

MaxValue=10, MinValue=0, NumValues=11

Fields:

- `FlagCarrierHorde`: PvPUnitClassification [= 0]
- `FlagCarrierAlliance`: PvPUnitClassification [= 1]
- `FlagCarrierNeutral`: PvPUnitClassification [= 2]
- `CartRunnerHorde`: PvPUnitClassification [= 3]
- `CartRunnerAlliance`: PvPUnitClassification [= 4]
- `AssassinHorde`: PvPUnitClassification [= 5]
- `AssassinAlliance`: PvPUnitClassification [= 6]
- `OrbCarrierBlue`: PvPUnitClassification [= 7]
- `OrbCarrierGreen`: PvPUnitClassification [= 8]
- `OrbCarrierOrange`: PvPUnitClassification [= 9]
- `OrbCarrierPurple`: PvPUnitClassification [= 10]

### CorruptionEffectInfo

Fields:

- `name`: string
- `description`: string
- `minCorruption`: number

### UnitCastingInfoResult

Fields:

- `name`: cstring
- `displayName`: string
- `textureID`: fileID
- `startTimeMs`: number
- `endTimeMs`: number
- `isTradeskill`: bool [NeverSecret=true]
- `castID`: WOWGUID
- `notInterruptible`: bool?
- `castingSpellID`: number
- `castBarID`: UnitCastBarID? [NeverSecret=true]
- `delayTimeMs`: number [NeverSecret=true]

### UnitChannelInfoResult

Fields:

- `name`: cstring
- `displayName`: cstring
- `textureID`: fileID
- `startTimeMs`: number
- `endTimeMs`: number
- `isTradeskill`: bool [NeverSecret=true]
- `notInterruptible`: bool?
- `spellID`: number
- `isEmpowered`: bool [NeverSecret=true]
- `numEmpowerStages`: number [NeverSecret=true]
- `castBarID`: UnitCastBarID? [NeverSecret=true]

### UnitCreatureFamilyResult

Fields:

- `name`: cstring
- `id`: number

### UnitCreatureTypeResult

Fields:

- `name`: cstring
- `id`: number

### UnitPowerBarInfo

Fields:

- `ID`: number
- `barType`: number
- `minPower`: number
- `startInset`: number
- `endInset`: number
- `smooth`: bool
- `hideFromOthers`: bool
- `showOnRaid`: bool
- `opaqueSpark`: bool
- `opaqueFlash`: bool
- `anchorTop`: bool
- `forcePercentage`: bool
- `sparkUnderFrame`: bool
- `flashAtMinPower`: bool
- `fractionalCounter`: bool
- `animateNumbers`: bool
- `attachTooltipToBar`: bool
