# PvpInfo

Namespace `C_PvP`.

Environment=All, Predicates={}

## Functions

### C_PvP.ArePvpTalentsUnlocked

Returns:

- `arePvpTalentsUnlocked`: bool

### C_PvP.AreTrainingGroundsEnabled

Returns:

- `areTrainingGroundsEnabled`: bool

### C_PvP.CanDisplayDeaths

Returns:

- `canDisplay`: bool

### C_PvP.CanDisplayHonorableKills

Returns:

- `canDisplay`: bool

### C_PvP.CanPlayerUseRatedPVPUI

Returns:

- `canUse`: bool
- `failureReason`: string

### C_PvP.CanPlayerUseTrainingGroundsUI

Returns:

- `canUseTrainingGroundsUI`: bool
- `failureReason`: string

### C_PvP.CanSurrenderArena

Returns:

- `CanSurrenderArena`: bool

### C_PvP.CanToggleWarMode

SecretArguments=AllowedWhenUntainted

Arguments:

- `toggle`: bool

Returns:

- `canTogglePvP`: bool

### C_PvP.CanToggleWarModeInArea

Returns:

- `canTogglePvPInArea`: bool

### C_PvP.DoesMatchOutcomeAffectRating

Returns:

- `doesAffect`: bool

### C_PvP.GetActiveBrawlInfo

Returns:

- `brawlInfo`: PvpBrawlInfo?

### C_PvP.GetActiveMatchBracket

Returns:

- `bracket`: number

### C_PvP.GetActiveMatchDuration

Returns:

- `seconds`: time_t

### C_PvP.GetActiveMatchState

Returns:

- `state`: PvPMatchState

### C_PvP.GetActiveMatchWinner

Returns:

- `winner`: number

### C_PvP.GetArenaCrowdControlDuration

SecretArguments=AllowedWhenUntainted

Arguments:

- `playerToken`: UnitToken

Returns:

- `duration`: LuaDurationObject

### C_PvP.GetArenaCrowdControlInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted, SecretWhenLossOfControlInfoRestricted=true

Arguments:

- `playerToken`: UnitToken

Returns:

- `spellID`: number
- `startTime`: number
- `duration`: number

### C_PvP.GetArenaOpponentSpec

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted, SecretReturns=true

Arguments:

- `index`: luaIndex

Returns:

- `specializationID`: number
- `gender`: number

### C_PvP.GetArenaRewards

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `teamSize`: number

Returns:

- `honor`: number
- `experience`: number
- `itemRewards`: table<BattlefieldItemReward>?
- `currencyRewards`: table<BattlefieldCurrencyReward>?
- `roleShortageBonus`: RoleShortageReward?

### C_PvP.GetArenaSkirmishRewards

Returns:

- `honor`: number
- `experience`: number
- `itemRewards`: table<BattlefieldItemReward>?
- `currencyRewards`: table<BattlefieldCurrencyReward>?
- `roleShortageBonus`: RoleShortageReward?

### C_PvP.GetAssignedSpecForBattlefieldQueue

SecretArguments=AllowedWhenUntainted

Arguments:

- `queueID`: number

Returns:

- `specializationID`: number?

### C_PvP.GetAvailableBrawlInfo -- If nil is returned, PVP_BRAWL_INFO_UPDATED event will be sent when the data is ready.

Returns:

- `brawlInfo`: PvpBrawlInfo?

### C_PvP.GetBattlefieldFlagPosition

SecretArguments=AllowedWhenUntainted

Arguments:

- `flagIndex`: luaIndex
- `uiMapId`: number

Returns:

- `uiPosx`: number?
- `uiPosy`: number?
- `flagTexture`: number

### C_PvP.GetBattlefieldVehicleInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `vehicleIndex`: luaIndex
- `uiMapID`: number

Returns:

- `info`: BattlefieldVehicleInfo

### C_PvP.GetBattlefieldVehicles

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

Returns:

- `vehicles`: table<BattlefieldVehicleInfo>

### C_PvP.GetBattlegroundInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `battlegroundIndex`: luaIndex

Returns:

- `battlegroundInfo`: BattlegroundInfo?

### C_PvP.GetBrawlRewards

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `brawlType`: BrawlType

Returns:

- `honor`: number
- `experience`: number
- `itemRewards`: table<BattlefieldItemReward>?
- `currencyRewards`: table<BattlefieldCurrencyReward>?
- `roleShortageBonus`: RoleShortageReward?
- `hasWon`: bool

### C_PvP.GetBrawlSoloRBGMinItemLevel

Returns:

- `minItemLevel`: number

### C_PvP.GetCustomVictoryStatID

Returns:

- `statID`: number

### C_PvP.GetGlobalPvpScalingInfoForSpecID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `specializationID`: number

Returns:

- `pvpScalingData`: table<PvpScalingData>

### C_PvP.GetHonorRewardInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `honorLevel`: number

Returns:

- `info`: HonorRewardInfo?

### C_PvP.GetLevelUpBattlegrounds

SecretArguments=AllowedWhenUntainted

Arguments:

- `level`: number

Returns:

- `battlefields`: table<LevelUpBattlegroundInfo>

### C_PvP.GetMatchPVPStatColumn

SecretArguments=AllowedWhenUntainted

Arguments:

- `pvpStatID`: number

Returns:

- `info`: MatchPVPStatColumn?

### C_PvP.GetMatchPVPStatColumns

Returns:

- `columns`: table<MatchPVPStatColumn>

### C_PvP.GetNextHonorLevelForReward

SecretArguments=AllowedWhenUntainted

Arguments:

- `honorLevel`: number

Returns:

- `nextHonorLevelWithReward`: number?

### C_PvP.GetOutdoorPvPWaitTime

SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

Returns:

- `pvpWaitTime`: time_t

### C_PvP.GetPVPActiveMatchPersonalRatedInfo

Returns:

- `info`: PVPPersonalRatedInfo?

### C_PvP.GetPVPActiveRatedMatchDeserterPenalty

Returns:

- `deserterPenalty`: RatedMatchDeserterPenalty?

### C_PvP.GetPVPSeasonRewardAchievementID

MayReturnNothing=true

Returns:

- `achievementID`: number

### C_PvP.GetPersonalRatedBGBlitzSpecStats

Returns:

- `specStats`: RatedBGBlitzSpecStats?

### C_PvP.GetPersonalRatedSoloShuffleSpecStats

Returns:

- `specStats`: RatedSoloShuffleSpecStats?

### C_PvP.GetPostMatchCurrencyRewards

Returns:

- `rewards`: table<PVPPostMatchCurrencyReward>

### C_PvP.GetPostMatchItemRewards

Returns:

- `rewards`: table<PVPPostMatchItemReward>

### C_PvP.GetPvpTalentsUnlockedLevel

Returns:

- `unlockLevel`: number

### C_PvP.GetPvpTierID

SecretArguments=AllowedWhenUntainted

Arguments:

- `tierEnum`: number
- `bracketEnum`: luaIndex

Returns:

- `id`: number?

### C_PvP.GetPvpTierInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `tierID`: number

Returns:

- `pvpTierInfo`: PvpTierInfo?

### C_PvP.GetRandomBGInfo

Returns:

- `info`: RandomBGInfo

### C_PvP.GetRandomBGRewards

Returns:

- `honor`: number
- `experience`: number
- `itemRewards`: table<BattlefieldItemReward>?
- `currencyRewards`: table<BattlefieldCurrencyReward>?
- `roleShortageBonus`: RoleShortageReward?

### C_PvP.GetRandomEpicBGInfo

Returns:

- `info`: RandomBGInfo

### C_PvP.GetRandomEpicBGRewards

Returns:

- `honor`: number
- `experience`: number
- `itemRewards`: table<BattlefieldItemReward>?
- `currencyRewards`: table<BattlefieldCurrencyReward>?
- `roleShortageBonus`: RoleShortageReward?

### C_PvP.GetRandomTrainingGroundArenaRewards

Returns:

- `honor`: number
- `experience`: number
- `itemRewards`: table<BattlefieldItemReward>?
- `currencyRewards`: table<BattlefieldCurrencyReward>?
- `roleShortageBonus`: RoleShortageReward?

### C_PvP.GetRandomTrainingGroundBGRewards

Returns:

- `honor`: number
- `experience`: number
- `itemRewards`: table<BattlefieldItemReward>?
- `currencyRewards`: table<BattlefieldCurrencyReward>?
- `roleShortageBonus`: RoleShortageReward?

### C_PvP.GetRatedBGRewards

Returns:

- `honor`: number
- `experience`: number
- `itemRewards`: table<BattlefieldItemReward>?
- `currencyRewards`: table<BattlefieldCurrencyReward>?
- `roleShortageBonus`: RoleShortageReward?

### C_PvP.GetRatedSoloRBGMinItemLevel

Returns:

- `minItemLevel`: number

### C_PvP.GetRatedSoloRBGRewards

Returns:

- `honor`: number
- `experience`: number
- `itemRewards`: table<BattlefieldItemReward>?
- `currencyRewards`: table<BattlefieldCurrencyReward>?
- `roleShortageBonus`: RoleShortageReward?

### C_PvP.GetRatedSoloShuffleMinItemLevel

Returns:

- `minItemLevel`: number

### C_PvP.GetRatedSoloShuffleRewards

Returns:

- `honor`: number
- `experience`: number
- `itemRewards`: table<BattlefieldItemReward>?
- `currencyRewards`: table<BattlefieldCurrencyReward>?
- `roleShortageBonus`: RoleShortageReward?

### C_PvP.GetRewardItemLevelsByTierEnum

SecretArguments=AllowedWhenUntainted

Arguments:

- `pvpTierEnum`: number

Returns:

- `activityItemLevel`: number
- `weeklyItemLevel`: number

### C_PvP.GetScoreInfo

SecretArguments=AllowedWhenUntainted, SecretInActivePvPMatch=true

Arguments:

- `offsetIndex`: luaIndex

Returns:

- `info`: PVPScoreInfo?

### C_PvP.GetScoreInfoByPlayerGuid

SecretArguments=AllowedWhenUntainted, SecretInActivePvPMatch=true

Arguments:

- `guid`: WOWGUID

Returns:

- `info`: PVPScoreInfo?

### C_PvP.GetSeasonBestInfo

Returns:

- `tierID`: number
- `nextTierID`: number?

### C_PvP.GetSkirmishInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `pvpBracket`: number

Returns:

- `battlemasterListInfo`: BattlemasterListInfo

### C_PvP.GetSpecialEventBrawlInfo

Returns:

- `brawlInfo`: PvpBrawlInfo?

### C_PvP.GetTeamInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `factionIndex`: number

Returns:

- `info`: PVPTeamInfo?

### C_PvP.GetTrainingGrounds

Returns:

- `trainingGrounds`: table<BattlegroundInfo>

### C_PvP.GetUIDisplaySeason

Returns:

- `uiDisplaySeason`: number

### C_PvP.GetWarModeRewardBonus

Returns:

- `rewardBonus`: number

### C_PvP.GetWarModeRewardBonusDefault

Returns:

- `defaultBonus`: number

### C_PvP.GetWeeklyChestInfo

Returns:

- `rewardAchieved`: bool
- `lastWeekRewardAchieved`: bool
- `lastWeekRewardClaimed`: bool
- `pvpTierMaxFromWins`: number

### C_PvP.GetZonePVPInfo

MayReturnNothing=true

Returns:

- `pvpType`: cstring
- `isSubZonePvP`: bool
- `factionName`: cstring?

### C_PvP.HasArenaSkirmishWinToday

Returns:

- `hasArenaSkirmishWinToday`: bool

### C_PvP.HasMatchStarted -- Returns true if a match is either active or complete.

Returns:

- `hasStarted`: bool

### C_PvP.HasRandomTrainingGroundArenaWinToday

Returns:

- `hasRandomTrainingGroundArenaWinToday`: bool

### C_PvP.HasRandomTrainingGroundBGWinToday

Returns:

- `hasRandomTrainingGroundBGWinToday`: bool

### C_PvP.IsActiveBattlefield

Returns:

- `isActiveBattlefield`: bool

### C_PvP.IsActiveMatchRegistered

Returns:

- `registered`: bool

### C_PvP.IsArena

Returns:

- `isArena`: bool

### C_PvP.IsBattleground

Returns:

- `isBattleground`: bool

### C_PvP.IsBattlegroundEnlistmentBonusActive

Returns:

- `battlegroundActive`: bool
- `brawlActive`: bool

### C_PvP.IsBrawlSoloRBG

Returns:

- `isBrawlSoloRBG`: bool

### C_PvP.IsBrawlSoloShuffle

Returns:

- `isBrawlSoloShuffle`: bool

### C_PvP.IsInBrawl

Returns:

- `isInBrawl`: bool

### C_PvP.IsInRatedMatchWithDeserterPenalty

Returns:

- `isInRatedMatchWithDeserterPenalty`: bool

### C_PvP.IsMatchActive

Returns:

- `isActive`: bool

### C_PvP.IsMatchComplete

Returns:

- `isComplete`: bool

### C_PvP.IsMatchConsideredArena

Returns:

- `asArena`: bool

### C_PvP.IsMatchFactional

Returns:

- `isFactional`: bool

### C_PvP.IsPVPMap

Returns:

- `isPVPMap`: bool

### C_PvP.IsRatedArena

Returns:

- `isRatedArena`: bool

### C_PvP.IsRatedBattleground

Returns:

- `isRatedBattleground`: bool

### C_PvP.IsRatedMap

Returns:

- `isRatedMap`: bool

### C_PvP.IsRatedSoloRBG

Returns:

- `isRatedSoloRBG`: bool

### C_PvP.IsRatedSoloShuffle

Returns:

- `isRatedSoloShuffle`: bool

### C_PvP.IsSoloRBG

Returns:

- `isSoloRBG`: bool

### C_PvP.IsSoloShuffle

Returns:

- `isSoloShuffle`: bool

### C_PvP.IsSubZonePVPPOI

Returns:

- `result`: bool

### C_PvP.IsTrainingGroundsArena

SecretArguments=AllowedWhenUntainted

Arguments:

- `lfgDungeonsID`: number

Returns:

- `isTrainingGroundsArena`: bool

### C_PvP.IsTrainingGroundsBG

SecretArguments=AllowedWhenUntainted

Arguments:

- `lfgDungeonsID`: number

Returns:

- `isTrainingGroundsBG`: bool

### C_PvP.IsWarModeActive

Returns:

- `warModeActive`: bool

### C_PvP.IsWarModeDesired

Returns:

- `warModeDesired`: bool

### C_PvP.IsWarModeFeatureEnabled

Returns:

- `warModeEnabled`: bool

### C_PvP.JoinBattlefield

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `battlemasterListId`: number

### C_PvP.JoinBrawl

SecretArguments=AllowedWhenUntainted

Arguments:

- `isSpecialBrawl`: bool [default=false]

### C_PvP.JoinRandomTrainingGroundArena

### C_PvP.JoinRandomTrainingGroundBG

### C_PvP.JoinRatedBGBlitz

### C_PvP.JoinTrainingGround

SecretArguments=AllowedWhenUntainted

Arguments:

- `trainingGroundID`: number

### C_PvP.RequestCrowdControlSpell

SecretArguments=AllowedWhenUntainted

Arguments:

- `playerToken`: UnitToken

### C_PvP.SetPVP

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `enablePVP`: bool [default=false]

### C_PvP.SetWarModeDesired

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `warModeDesired`: bool

### C_PvP.StartSoloRBGWarGameByName

SecretArguments=AllowedWhenUntainted

Arguments:

- `args`: cstring

Returns:

- `success`: number

### C_PvP.StartSpectatorSoloRBGWarGame

SecretArguments=AllowedWhenUntainted

Arguments:

- `opaqueID1`: number
- `opaqueID2`: number
- `specifiedMap`: cstring
- `tournamentRules`: bool

Returns:

- `success`: number

### C_PvP.TogglePVP

HasRestrictions=true

### C_PvP.ToggleWarMode

HasRestrictions=true

## Events

### ARENA_OPPONENT_UPDATE

SynchronousEvent=true

Payload:

- `unitToken`: cstring
- `updateReason`: cstring

### ARENA_PREP_OPPONENT_SPECIALIZATIONS

SynchronousEvent=true

### ARENA_SEASON_WORLD_STATE

SynchronousEvent=true

### BATTLEFIELD_AUTO_QUEUE

SynchronousEvent=true

### BATTLEFIELD_AUTO_QUEUE_EJECT

SynchronousEvent=true

### BATTLEFIELD_QUEUE_TIMEOUT

SynchronousEvent=true

### BATTLEFIELDS_CLOSED

SynchronousEvent=true

### BATTLEFIELDS_SHOW

SynchronousEvent=true

Payload:

- `isArena`: bool?
- `battleMasterListID`: number?

### BATTLEGROUND_OBJECTIVES_UPDATE

SynchronousEvent=true

### BATTLEGROUND_POINTS_UPDATE

SynchronousEvent=true

### GDF_SIM_COMPLETE

SynchronousEvent=true

### HONOR_LEVEL_UPDATE

SynchronousEvent=true

Payload:

- `isHigherLevel`: bool

### NOTIFY_PVP_AFK_RESULT

SynchronousEvent=true

Payload:

- `offender`: cstring
- `numBlackMarksOnOffender`: number
- `numPlayersIHaveReported`: number

### PLAYER_ENTERING_BATTLEGROUND

SynchronousEvent=true

### PLAYER_JOINED_PVP_MATCH

SynchronousEvent=true

### PLAYER_PVP_FLAG_CHANGED

SynchronousEvent=true

Payload:

- `isPvpFlagged`: bool

### POST_MATCH_CURRENCY_REWARD_UPDATE

SynchronousEvent=true

Payload:

- `reward`: PVPPostMatchCurrencyReward

### POST_MATCH_ITEM_REWARD_UPDATE

SynchronousEvent=true

### PVP_BRAWL_INFO_UPDATED

SynchronousEvent=true

### PVP_MATCH_ACTIVE

SynchronousEvent=true

### PVP_MATCH_COMPLETE

SynchronousEvent=true

Payload:

- `winner`: number
- `duration`: time_t

### PVP_MATCH_INACTIVE

SynchronousEvent=true

### PVP_MATCH_STATE_CHANGED

SynchronousEvent=true

### PVP_RATED_STATS_UPDATE

SynchronousEvent=true

### PVP_REWARDS_UPDATE

SynchronousEvent=true

### PVP_ROLE_POPUP_HIDE

SynchronousEvent=true

Payload:

- `readyCheckInfo`: PvpReadyCheckInfo?

### PVP_ROLE_POPUP_SHOW

SynchronousEvent=true

Payload:

- `readyCheckInfo`: PvpReadyCheckInfo

### PVP_ROLE_UPDATE

SynchronousEvent=true

### PVP_SPECIAL_EVENT_INFO_UPDATED

SynchronousEvent=true

### PVP_TYPES_ENABLED

SynchronousEvent=true

Payload:

- `wargameBattlegrounds`: bool
- `ratedBattlegrounds`: bool
- `ratedArenas`: bool
- `ratedSoloShuffle`: bool
- `ratedBGBlitz`: bool

### PVP_VEHICLE_INFO_UPDATED

UniqueEvent=true

### PVP_WORLDSTATE_UPDATE

SynchronousEvent=true

### PVPQUEUE_ANYWHERE_SHOW

SynchronousEvent=true

### PVPQUEUE_ANYWHERE_UPDATE_AVAILABLE

SynchronousEvent=true

### TRAINING_GROUNDS_ENABLED_STATUS_UPDATED

SynchronousEvent=true

### UPDATE_ACTIVE_BATTLEFIELD

SynchronousEvent=true

### UPDATE_BATTLEFIELD_SCORE

SynchronousEvent=true

### UPDATE_BATTLEFIELD_STATUS

SynchronousEvent=true

Payload:

- `battleFieldIndex`: number

### WAR_MODE_STATUS_UPDATE

SynchronousEvent=true

Payload:

- `warModeEnabled`: bool

### WARGAME_INVITE_SENT

SynchronousEvent=true

### WARGAME_REQUEST_RESPONSE

SynchronousEvent=true

Payload:

- `responderGUID`: WOWGUID
- `responderName`: cstring?
- `accepted`: bool

### WARGAME_REQUESTED

SynchronousEvent=true

Payload:

- `opposingPartyMemberName`: cstring
- `battlegroundName`: cstring
- `timeoutSeconds`: time_t
- `tournamentRules`: bool

### WORLD_PVP_QUEUE

SynchronousEvent=true

## Tables

### BrawlType

MaxValue=5, MinValue=0, NumValues=6

Fields:

- `None`: BrawlType [= 0]
- `Battleground`: BrawlType [= 1]
- `Arena`: BrawlType [= 2]
- `LFG`: BrawlType [= 3]
- `SoloShuffle`: BrawlType [= 4]
- `SoloRbg`: BrawlType [= 5]

### PvPMatchState

MaxValue=5, MinValue=0, NumValues=6

Fields:

- `Inactive`: PvPMatchState [= 0]
- `Waiting`: PvPMatchState [= 1]
- `StartUp`: PvPMatchState [= 2]
- `Engaged`: PvPMatchState [= 3]
- `PostRound`: PvPMatchState [= 4]
- `Complete`: PvPMatchState [= 5]

### BattlefieldCurrencyReward

Fields:

- `id`: number
- `quantity`: number

### BattlefieldItemReward

Fields:

- `id`: number
- `name`: cstring
- `texture`: fileID
- `quantity`: number

### BattlefieldRewards

Fields:

- `honor`: number
- `experience`: number
- `itemRewards`: table<BattlefieldItemReward>?
- `currencyRewards`: table<BattlefieldCurrencyReward>?
- `roleShortageBonus`: RoleShortageReward?

### BattlefieldVehicleInfo

Fields:

- `x`: number
- `y`: number
- `name`: cstring
- `isOccupied`: bool
- `atlas`: textureAtlas
- `textureWidth`: number
- `textureHeight`: number
- `facing`: number
- `isPlayer`: bool
- `isAlive`: bool
- `shouldDrawBelowPlayerBlips`: bool

### BattlegroundInfo

Fields:

- `name`: cstring
- `icon`: fileID?
- `gameType`: cstring
- `shortDescription`: cstring
- `longDescription`: cstring
- `mapDescription`: cstring
- `maxPlayers`: number
- `battlegroundID`: number?
- `lfgDungeonID`: number?
- `mapID`: number?
- `isHoliday`: bool
- `isRandom`: bool
- `canEnter`: bool
- `isTrainingGround`: bool

### BattlemasterListInfo

Fields:

- `name`: string
- `matchmakingType`: PvPMatchmakingType
- `minPlayers`: number
- `maxPlayers`: number
- `icon`: fileID
- `longDescription`: string
- `shortDescription`: string

### HonorRewardInfo

Fields:

- `honorLevelName`: string
- `badgeFileDataID`: fileID
- `achievementRewardedID`: number

### LevelUpBattlegroundInfo

Fields:

- `id`: number
- `icon`: fileID
- `name`: string
- `isEpic`: bool

### MatchPVPStatColumn

Fields:

- `pvpStatID`: number
- `columnHeaderID`: number
- `orderIndex`: number
- `name`: string
- `tooltipTitle`: string
- `tooltip`: string

### PvpBrawlInfo

Fields:

- `brawlID`: number
- `name`: string
- `shortDescription`: string
- `longDescription`: string
- `canQueue`: bool
- `minLevel`: number
- `maxLevel`: number
- `groupsAllowed`: bool
- `crossFactionAllowed`: bool [default=false]
- `timeLeftUntilNextChange`: number?
- `brawlType`: BrawlType
- `mapNames`: table<string>
- `includesAllArenas`: bool [default=false]
- `minItemLevel`: number [default=0]
- `shouldHideRewardIcon`: bool [default=false]

### PVPPersonalRatedInfo

Fields:

- `personalRating`: number
- `bestSeasonRating`: number
- `bestWeeklyRating`: number
- `seasonPlayed`: number
- `seasonWon`: number
- `weeklyPlayed`: number
- `weeklyWon`: number
- `lastWeeksBestRating`: number
- `hasWonBracketToday`: bool
- `tier`: number
- `ranking`: number?
- `roundsSeasonPlayed`: number
- `roundsSeasonWon`: number
- `roundsWeeklyPlayed`: number
- `roundsWeeklyWon`: number

### PVPPostMatchCurrencyReward

Fields:

- `currencyType`: number
- `quantityChanged`: number

### PVPPostMatchItemReward

Fields:

- `type`: string
- `link`: string
- `quantity`: number
- `specID`: number
- `sex`: number
- `isUpgraded`: bool

### PvpReadyCheckInfo

Fields:

- `roles`: table<PvpRoleQueueInfo>
- `numPlayersAccepted`: number
- `numPlayersDeclined`: number
- `totalNumPlayers`: number

### PvpRoleQueueInfo

Fields:

- `role`: cstring
- `totalRole`: number
- `totalAccepted`: number
- `totalDeclined`: number

### PvpScalingData

Fields:

- `scalingDataID`: number
- `specializationID`: number
- `name`: cstring
- `value`: number

### PVPScoreInfo

Fields:

- `name`: string [NeverSecret=true]
- `guid`: WOWGUID
- `killingBlows`: number
- `honorableKills`: number
- `deaths`: number
- `honorGained`: number
- `faction`: number [NeverSecret=true]
- `raceName`: string [NeverSecret=true]
- `gender`: number [NeverSecret=true]
- `className`: string [NeverSecret=true]
- `classToken`: string [NeverSecret=true]
- `damageDone`: number
- `healingDone`: number
- `rating`: number
- `ratingChange`: number
- `prematchMMR`: number
- `mmrChange`: number
- `postmatchMMR`: number
- `talentSpec`: string
- `honorLevel`: number [NeverSecret=true]
- `roleAssigned`: number
- `stats`: table<PVPStatInfo>

### PVPStatInfo

Fields:

- `pvpStatID`: number [NeverSecret=true]
- `pvpStatValue`: number
- `orderIndex`: number [NeverSecret=true]
- `name`: string [NeverSecret=true]
- `tooltip`: string [NeverSecret=true]
- `iconName`: string [NeverSecret=true]

### PVPTeamInfo

Fields:

- `name`: string
- `size`: number
- `rating`: number
- `ratingNew`: number
- `ratingMMR`: number

### PvpTierInfo

Fields:

- `name`: string
- `descendRating`: number
- `ascendRating`: number
- `descendTier`: number
- `ascendTier`: number
- `pvpTierEnum`: number
- `tierIconID`: fileID

### RandomBGInfo

Fields:

- `canQueue`: bool
- `bgID`: number
- `bgIndex`: luaIndex
- `hasRandomWinToday`: bool
- `minLevel`: number
- `maxLevel`: number
- `name`: string

### RatedBGBlitzSpecStats

Fields:

- `weeklyMostPlayedSpecID`: number
- `weeklyMostPlayedSpecGames`: number
- `seasonMostPlayedSpecID`: number
- `seasonMostPlayedSpecGames`: number

### RatedMatchDeserterPenalty

Fields:

- `personalRatingChange`: number
- `queuePenaltySpellID`: number
- `queuePenaltyDuration`: number

### RatedSoloShuffleSpecStats

Fields:

- `weeklyMostPlayedSpecID`: number
- `weeklyMostPlayedSpecRounds`: number
- `seasonMostPlayedSpecID`: number
- `seasonMostPlayedSpecRounds`: number

### RoleShortageReward

Fields:

- `validRoles`: table<cstring>
- `rewardSpellID`: number
- `rewardItemID`: number

### WorldPVPBattlegroundInfo

Fields:

- `bgID`: number
- `name`: string
- `isActive`: bool
- `canQueue`: bool
- `canEnter`: bool
- `startTime`: time_t
- `minLevel`: number
- `maxLevel`: number
