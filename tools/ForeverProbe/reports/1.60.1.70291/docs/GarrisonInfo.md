# GarrisonInfo

Namespace `C_Garrison`.

Environment=All, Predicates={}

## Functions

### C_Garrison.AddFollowerToMission

SecretArguments=AllowedWhenUntainted

Arguments:

- `missionID`: number
- `followerID`: GarrisonFollower
- `boardIndex`: number?

Returns:

- `followerAdded`: bool

### C_Garrison.GetAutoCombatDamageClassValues

Returns:

- `damageClassStrings`: table<AutoCombatDamageClassString>

### C_Garrison.GetAutoMissionBoardState

SecretArguments=AllowedWhenUntainted

Arguments:

- `missionID`: number

Returns:

- `targetInfo`: table<AutoMissionTargetingInfo>

### C_Garrison.GetAutoMissionEnvironmentEffect

SecretArguments=AllowedWhenUntainted

Arguments:

- `missionID`: number

Returns:

- `autoMissionEnvEffect`: AutoMissionEnvironmentEffect?

### C_Garrison.GetAutoMissionTargetingInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `missionID`: number
- `followerID`: GarrisonFollower
- `casterBoardIndex`: number

Returns:

- `targetInfo`: table<AutoMissionTargetingInfo>

### C_Garrison.GetAutoMissionTargetingInfoForSpell

SecretArguments=AllowedWhenUntainted

Arguments:

- `missionID`: number
- `autoCombatSpellID`: number
- `casterBoardIndex`: number

Returns:

- `targetInfo`: table<AutoMissionTargetingInfo>

### C_Garrison.GetAutoTroops

SecretArguments=AllowedWhenUntainted

Arguments:

- `followerType`: number

Returns:

- `autoTroopInfo`: table<AutoCombatTroopInfo>

### C_Garrison.GetCombatLogSpellInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `autoCombatSpellID`: number

Returns:

- `spellInfo`: AutoCombatSpellInfo?

### C_Garrison.GetCurrentCypherEquipmentLevel

Returns:

- `equipmentLevel`: number

### C_Garrison.GetCurrentGarrTalentTreeFriendshipFactionID

Returns:

- `currentGarrTalentTreeFriendshipFactionID`: number?

### C_Garrison.GetCurrentGarrTalentTreeID

Returns:

- `currentGarrTalentTreeID`: number?

### C_Garrison.GetCyphersToNextEquipmentLevel

Returns:

- `cyphersToNext`: number?

### C_Garrison.GetFollowerAutoCombatSpells

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `garrFollowerID`: GarrisonFollower
- `followerLevel`: number

Returns:

- `autoCombatSpells`: table<AutoCombatSpellInfo>
- `autoCombatAutoAttack`: AutoCombatSpellInfo?

### C_Garrison.GetFollowerAutoCombatStats

SecretArguments=AllowedWhenUntainted

Arguments:

- `garrFollowerID`: GarrisonFollower

Returns:

- `autoCombatInfo`: FollowerAutoCombatStatsInfo?

### C_Garrison.GetFollowerMissionCompleteInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `followerID`: GarrisonFollower

Returns:

- `followerMissionCompleteInfo`: FollowerMissionCompleteInfo

### C_Garrison.GetGarrisonPlotsInstancesForMap

SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

Returns:

- `garrisonPlotInstances`: table<GarrisonPlotInstanceMapInfo>

### C_Garrison.GetGarrisonTalentTreeCurrencyTypes

SecretArguments=AllowedWhenUntainted

Arguments:

- `garrTalentTreeID`: number

Returns:

- `garrTalentTreeCurrencyType`: number?

### C_Garrison.GetGarrisonTalentTreeType

SecretArguments=AllowedWhenUntainted

Arguments:

- `garrTalentTreeID`: number

Returns:

- `garrTalentTreeType`: number

### C_Garrison.GetMaxCypherEquipmentLevel

Returns:

- `maxEquipmentLevel`: number

### C_Garrison.GetMissionCompleteEncounters

SecretArguments=AllowedWhenUntainted

Arguments:

- `missionID`: number

Returns:

- `encounters`: table<GarrisonEnemyEncounterInfo>

### C_Garrison.GetMissionDeploymentInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `missionID`: number

Returns:

- `missionDeploymentInfo`: MissionDeploymentInfo

### C_Garrison.GetMissionEncounterIconInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `missionID`: number

Returns:

- `missionEncounterIconInfo`: MissionEncounterIconInfo

### C_Garrison.GetTalentInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `talentID`: number

Returns:

- `info`: GarrisonTalentInfo

### C_Garrison.GetTalentPointsSpentInTalentTree

SecretArguments=AllowedWhenUntainted

Arguments:

- `garrTalentTreeID`: number

Returns:

- `talentPoints`: number

### C_Garrison.GetTalentTreeIDsByClassID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `garrType`: number
- `classID`: number

Returns:

- `treeIDs`: table<number>

### C_Garrison.GetTalentTreeInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `treeID`: number

Returns:

- `info`: GarrisonTalentTreeInfo

### C_Garrison.GetTalentTreeResetInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `garrTalentTreeID`: number

Returns:

- `goldCost`: number
- `currencyCosts`: table<GarrisonTalentCurrencyCostInfo>

### C_Garrison.GetTalentTreeTalentPointResearchInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `garrTalentID`: number
- `researchRank`: number
- `garrTalentTreeID`: number
- `talentPointIndex`: number
- `isRespec`: bool

Returns:

- `goldCost`: number
- `currencyCosts`: table<GarrisonTalentCurrencyCostInfo>
- `durationSecs`: number

### C_Garrison.GetTalentUnlockWorldQuest

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `talentID`: number

Returns:

- `worldQuestID`: number

### C_Garrison.HasAdventures

Returns:

- `hasAdventures`: bool

### C_Garrison.IsAtGarrisonMissionNPC

Returns:

- `atGarrisonMissionNPC`: bool

### C_Garrison.IsEnvironmentCountered

SecretArguments=AllowedWhenUntainted

Arguments:

- `missionID`: number

Returns:

- `environmentCountered`: bool

### C_Garrison.IsFollowerOnCompletedMission

SecretArguments=AllowedWhenUntainted

Arguments:

- `followerID`: GarrisonFollower

Returns:

- `followerOnCompletedMission`: bool

### C_Garrison.IsLandingPageMinimapButtonVisible

SecretArguments=AllowedWhenUntainted

Arguments:

- `garrType`: number

Returns:

- `isLandingPageMinimapButtonVisible`: bool

### C_Garrison.IsTalentConditionMet

SecretArguments=AllowedWhenUntainted

Arguments:

- `talentID`: number

Returns:

- `isMet`: bool
- `failureString`: cstring?

### C_Garrison.RegenerateCombatLog

SecretArguments=AllowedWhenUntainted

Arguments:

- `missionID`: number

Returns:

- `success`: bool

### C_Garrison.RemoveFollowerFromMission

SecretArguments=AllowedWhenUntainted

Arguments:

- `missionID`: number
- `followerID`: GarrisonFollower
- `boardIndex`: number?

### C_Garrison.RushHealAllFollowers

SecretArguments=AllowedWhenUntainted

Arguments:

- `followerType`: number

### C_Garrison.RushHealFollower

SecretArguments=AllowedWhenUntainted

Arguments:

- `garrFollowerID`: GarrisonFollower

### C_Garrison.SetAutoCombatSpellFastForward

SecretArguments=AllowedWhenUntainted

Arguments:

- `state`: bool

## Events

### GARRISON_ARCHITECT_CLOSED

SynchronousEvent=true

### GARRISON_ARCHITECT_OPENED

SynchronousEvent=true

Payload:

- `followerTypeID`: number

### GARRISON_BUILDING_ACTIVATABLE

SynchronousEvent=true

Payload:

- `buildingName`: cstring
- `garrisonType`: number

### GARRISON_BUILDING_ACTIVATED

SynchronousEvent=true

Payload:

- `garrisonPlotInstanceID`: number
- `garrisonBuildingID`: number

### GARRISON_BUILDING_ERROR

SynchronousEvent=true

### GARRISON_BUILDING_LIST_UPDATE

SynchronousEvent=true

Payload:

- `categoryID`: number

### GARRISON_BUILDING_PLACED

SynchronousEvent=true

Payload:

- `garrisonPlotInstanceID`: number
- `newPlacement`: bool

### GARRISON_BUILDING_REMOVED

SynchronousEvent=true

Payload:

- `garrPlotInstanceID`: number
- `garrBuildingID`: number

### GARRISON_BUILDING_UPDATE

SynchronousEvent=true

Payload:

- `garrisonBuildingID`: number
- `garrPlotInstanceID`: number?

### GARRISON_FOLLOWER_ADDED

SynchronousEvent=true

Payload:

- `followerDbID`: GarrisonFollower
- `followerName`: cstring
- `followerClassName`: cstring
- `followerLevel`: number
- `followerQuality`: number
- `isUpgraded`: bool
- `textureKit`: textureKit
- `followerTypeID`: number

### GARRISON_FOLLOWER_CATEGORIES_UPDATED

SynchronousEvent=true

### GARRISON_FOLLOWER_DURABILITY_CHANGED

SynchronousEvent=true

Payload:

- `garrFollowerTypeID`: number
- `followerDbID`: GarrisonFollower
- `followerDurability`: number

### GARRISON_FOLLOWER_HEALED

SynchronousEvent=true

Payload:

- `followerID`: GarrisonFollower

### GARRISON_FOLLOWER_LIST_UPDATE

SynchronousEvent=true

Payload:

- `followerTypeID`: number

### GARRISON_FOLLOWER_REMOVED

SynchronousEvent=true

Payload:

- `followerTypeID`: number

### GARRISON_FOLLOWER_UPGRADED

SynchronousEvent=true

Payload:

- `followerDbID`: GarrisonFollower

### GARRISON_FOLLOWER_XP_CHANGED

SynchronousEvent=true

Payload:

- `garrFollowerTypeID`: number
- `followerDbID`: GarrisonFollower
- `xpChange`: number
- `oldFollowerXp`: number
- `oldFollowerLevel`: number
- `oldFollowerQuality`: number

### GARRISON_HIDE_LANDING_PAGE

SynchronousEvent=true

### GARRISON_INVASION_AVAILABLE

SynchronousEvent=true

### GARRISON_INVASION_UNAVAILABLE

SynchronousEvent=true

### GARRISON_LANDINGPAGE_SHIPMENTS

SynchronousEvent=true, UniqueEvent=true

### GARRISON_MISSION_AREA_BONUS_ADDED

SynchronousEvent=true

Payload:

- `garrisonMissonBonusAbilityID`: number

### GARRISON_MISSION_BONUS_ROLL_COMPLETE

SynchronousEvent=true

Payload:

- `missionID`: number
- `success`: bool

### GARRISON_MISSION_COMPLETE_RESPONSE

SynchronousEvent=true

Payload:

- `missionID`: number
- `canComplete`: bool
- `success`: bool
- `bonusRollSuccess`: bool
- `followerDeaths`: table<GarrisonFollowerDeathInfo>
- `autoCombatResult`: AutoCombatResult?

### GARRISON_MISSION_FINISHED

SynchronousEvent=true

Payload:

- `followerTypeID`: number
- `missionID`: number

### GARRISON_MISSION_LIST_UPDATE

SynchronousEvent=true

Payload:

- `garrFollowerTypeID`: number

### GARRISON_MISSION_NPC_CLOSED

SynchronousEvent=true

### GARRISON_MISSION_NPC_OPENED

SynchronousEvent=true

Payload:

- `followerTypeID`: number

### GARRISON_MISSION_REWARD_INFO

SynchronousEvent=true

Payload:

- `missionID`: number
- `followerDbID`: GarrisonFollower

### GARRISON_MISSION_STARTED

SynchronousEvent=true

Payload:

- `garrFollowerTypeID`: number
- `missionID`: number

### GARRISON_MONUMENT_CLOSE_UI

SynchronousEvent=true

### GARRISON_MONUMENT_LIST_LOADED

SynchronousEvent=true

Payload:

- `success`: bool

### GARRISON_MONUMENT_REPLACED

SynchronousEvent=true

Payload:

- `success`: bool

### GARRISON_MONUMENT_SELECTED_TROPHY_ID_LOADED

SynchronousEvent=true

Payload:

- `success`: bool

### GARRISON_MONUMENT_SHOW_UI

SynchronousEvent=true

### GARRISON_RANDOM_MISSION_ADDED

SynchronousEvent=true

Payload:

- `followerTypeID`: number
- `missionID`: number

### GARRISON_RECALL_PORTAL_LAST_USED_TIME

SynchronousEvent=true

Payload:

- `success`: bool
- `recallPortalLastUsedTime`: number

### GARRISON_RECALL_PORTAL_USED

SynchronousEvent=true

Payload:

- `success`: bool

### GARRISON_RECRUIT_FOLLOWER_RESULT

SynchronousEvent=true

### GARRISON_RECRUITMENT_FOLLOWERS_GENERATED

SynchronousEvent=true

### GARRISON_RECRUITMENT_NPC_CLOSED

SynchronousEvent=true

### GARRISON_RECRUITMENT_NPC_OPENED

SynchronousEvent=true

Payload:

- `followerTypeID`: number

### GARRISON_RECRUITMENT_READY

SynchronousEvent=true

### GARRISON_SHIPMENT_RECEIVED

UniqueEvent=true

### GARRISON_SHIPYARD_NPC_CLOSED

SynchronousEvent=true

### GARRISON_SHIPYARD_NPC_OPENED

SynchronousEvent=true

Payload:

- `followerTypeID`: number

### GARRISON_SHOW_LANDING_PAGE

SynchronousEvent=true

### GARRISON_SPEC_GROUP_UPDATED

SynchronousEvent=true

Payload:

- `garrTypeID`: number
- `specID`: number

### GARRISON_SPEC_GROUPS_CLEARED

SynchronousEvent=true

Payload:

- `garrTypeID`: number

### GARRISON_TALENT_COMPLETE

SynchronousEvent=true

Payload:

- `garrTypeID`: number
- `doAlert`: bool

### GARRISON_TALENT_EVENT_UPDATE

SynchronousEvent=true

Payload:

- `eventType`: number
- `eventID`: number

### GARRISON_TALENT_NPC_CLOSED

SynchronousEvent=true

### GARRISON_TALENT_NPC_OPENED

SynchronousEvent=true

Payload:

- `garrisonTypeID`: number
- `garrisonTalentTreeID`: number

### GARRISON_TALENT_RESEARCH_STARTED

SynchronousEvent=true

Payload:

- `garrTypeID`: number
- `garrisonTalentTreeID`: number
- `garrTalentID`: number

### GARRISON_TALENT_UNLOCKS_RESULT

SynchronousEvent=true

### GARRISON_TALENT_UPDATE

SynchronousEvent=true

Payload:

- `garrTypeID`: number

### GARRISON_TRADESKILL_NPC_CLOSED

SynchronousEvent=true

### GARRISON_UPDATE

SynchronousEvent=true

### GARRISON_UPGRADEABLE_RESULT

SynchronousEvent=true

Payload:

- `garrisonUpgradeable`: bool

### GARRISON_USE_PARTY_GARRISON_CHANGED

SynchronousEvent=true

### SHIPMENT_CRAFTER_CLOSED

SynchronousEvent=true

### SHIPMENT_CRAFTER_INFO

SynchronousEvent=true

Payload:

- `success`: number
- `shipmentCount`: number
- `maxShipments`: number
- `ownedShipments`: number
- `plotInstanceID`: number

### SHIPMENT_CRAFTER_OPENED

SynchronousEvent=true

Payload:

- `charShipmentContainerID`: number

### SHIPMENT_CRAFTER_REAGENT_UPDATE

SynchronousEvent=true

### SHIPMENT_UPDATE

SynchronousEvent=true

Payload:

- `shipmentStarted`: bool?
- `hasAttachedFollower`: bool?

## Tables

### AutoCombatDamageClassString

Fields:

- `damageClassValue`: number
- `locString`: cstring

### AutoCombatResult

Fields:

- `winner`: bool
- `combatLog`: table<AutoMissionRound>

### AutoCombatSpellInfo

Fields:

- `autoCombatSpellID`: number
- `name`: cstring
- `description`: string
- `cooldown`: number
- `duration`: number
- `schoolMask`: number
- `previewMask`: number
- `icon`: fileID
- `spellTutorialFlag`: number
- `hasThornsEffect`: bool

### AutoCombatTroopInfo

Fields:

- `name`: cstring
- `followerID`: GarrisonFollower
- `garrFollowerID`: GarrisonFollower
- `followerTypeID`: number
- `displayIDs`: table<FollowerDisplayID>
- `level`: number
- `quality`: number
- `levelXP`: number
- `maxXP`: number
- `height`: number
- `scale`: number
- `displayScale`: number?
- `displayHeight`: number?
- `classSpec`: number?
- `className`: string?
- `flavorText`: string?
- `classAtlas`: textureAtlas
- `portraitIconID`: fileID
- `textureKit`: textureKit
- `isTroop`: bool
- `raceID`: number
- `health`: number
- `maxHealth`: number
- `role`: number
- `isAutoTroop`: bool
- `isSoulbind`: bool
- `isCollected`: bool
- `autoCombatStats`: FollowerAutoCombatStatsInfo

### AutoMissionCombatEventInfo

Fields:

- `boardIndex`: number
- `oldHealth`: number
- `newHealth`: number
- `maxHealth`: number
- `points`: number?

### AutoMissionEnvironmentEffect

Fields:

- `name`: string
- `autoCombatSpellInfo`: AutoCombatSpellInfo

### AutoMissionEvent

Fields:

- `type`: number
- `spellID`: number
- `schoolMask`: number
- `effectIndex`: number
- `casterBoardIndex`: number
- `auraType`: number
- `targetInfo`: table<AutoMissionCombatEventInfo>

### AutoMissionRound

Fields:

- `events`: table<AutoMissionEvent>

### AutoMissionTargetingInfo

Fields:

- `targetIndex`: number
- `previewType`: number
- `spellID`: number
- `effectIndex`: number

### FollowerAutoCombatStatsInfo

Fields:

- `currentHealth`: number
- `maxHealth`: number
- `attack`: number
- `healingTimestamp`: time_t
- `healCost`: number
- `minutesHealingRemaining`: number

### FollowerDisplayID

Fields:

- `id`: number
- `followerPageScale`: number
- `showWeapon`: bool

### FollowerMissionCompleteInfo

Fields:

- `name`: cstring
- `displayIDs`: table<FollowerDisplayID>
- `level`: number
- `quality`: number
- `currentXP`: number
- `maxXP`: number
- `height`: number
- `scale`: number
- `movementType`: number?
- `impactDelay`: number?
- `castID`: number?
- `castSoundID`: number?
- `impactID`: number?
- `impactSoundID`: number?
- `targetImpactID`: number?
- `targetImpactSoundID`: number?
- `className`: string?
- `classAtlas`: textureAtlas
- `portraitIconID`: fileID
- `textureKit`: textureKit
- `isTroop`: bool
- `boardIndex`: number
- `health`: number
- `maxHealth`: number
- `role`: number

### GarrisonAbilityCounterInfo

Fields:

- `id`: number
- `icon`: fileID
- `name`: cstring
- `factor`: number
- `description`: cstring

### GarrisonAbilityInfo

Fields:

- `id`: number
- `name`: cstring
- `description`: string
- `icon`: fileID
- `isTrait`: bool
- `isSpecialization`: bool
- `temporary`: bool
- `category`: string?
- `counters`: table<GarrisonAbilityCounterInfo>
- `isEmptySlot`: bool

### GarrisonEnemyEncounterInfo

Fields:

- `name`: cstring
- `displayID`: fileID
- `portraitFileDataID`: fileID
- `textureKit`: textureKit
- `scale`: number
- `height`: number
- `mechanics`: table<GarrisonMechanicInfo>
- `autoCombatSpells`: table<AutoCombatSpellInfo>
- `autoCombatAutoAttack`: AutoCombatSpellInfo?
- `role`: number
- `health`: number
- `maxHealth`: number
- `attack`: number
- `boardIndex`: number
- `isElite`: bool

### GarrisonFollowerDeathInfo

Fields:

- `followerID`: GarrisonFollower
- `state`: luaIndex

### GarrisonMechanicInfo

Fields:

- `mechanicTypeID`: number
- `icon`: fileID
- `name`: cstring
- `factor`: number
- `description`: cstring
- `ability`: GarrisonAbilityInfo?

### GarrisonPlotInstanceMapInfo

Fields:

- `buildingPlotInstanceID`: number
- `position`: vector2 (Vector2DMixin)
- `name`: cstring
- `atlasName`: textureAtlas

### MissionDeploymentInfo

Fields:

- `location`: cstring
- `xp`: number
- `environment`: string?
- `environmentDesc`: string?
- `environmentTexture`: fileID
- `locTextureKit`: textureKit
- `isExhausting`: bool
- `enemies`: table<GarrisonEnemyEncounterInfo>

### MissionEncounterIconInfo

Fields:

- `portraitFileDataID`: fileID
- `missionScalar`: number
- `isElite`: bool
- `isRare`: bool
