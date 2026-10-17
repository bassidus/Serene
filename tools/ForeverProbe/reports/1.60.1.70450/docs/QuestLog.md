# QuestLog

Namespace `C_QuestLog`.

Environment=All, Predicates={}

## Functions

### C_QuestLog.AbandonQuest

### C_QuestLog.AddQuestWatch

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `wasWatched`: bool

### C_QuestLog.AddWorldQuestWatch

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number
- `watchType`: QuestWatchType?

Returns:

- `wasWatched`: bool

### C_QuestLog.CanAbandonQuest

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `canAbandon`: bool

### C_QuestLog.DoesQuestAwardReputationWithFaction

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number
- `targetFactionID`: number

Returns:

- `awardsReputation`: bool

### C_QuestLog.GetAbandonQuest

Returns:

- `questID`: number

### C_QuestLog.GetAbandonQuestItems

MayReturnNothing=true

Returns:

- `itemIDs`: table<number>

### C_QuestLog.GetActivePreyQuest

MayReturnNothing=true

Returns:

- `questID`: number

### C_QuestLog.GetActiveThreatMaps

MayReturnNothing=true

Returns:

- `uiMapIDs`: table<number>

### C_QuestLog.GetAllCompletedQuestIDs

Returns:

- `quests`: table<number>

### C_QuestLog.GetBountiesForMapID

SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

Returns:

- `bounties`: table<BountyInfo>?

### C_QuestLog.GetBountySetInfoForMapID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

Returns:

- `displayLocation`: MapOverlayDisplayLocation
- `lockQuestID`: number
- `bountySetID`: number
- `isActivitySet`: bool

### C_QuestLog.GetDistanceSqToQuest

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `distanceSq`: number
- `onContinent`: bool

### C_QuestLog.GetHeaderIndexForQuest

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `index`: luaIndex?

### C_QuestLog.GetInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `questLogIndex`: luaIndex

Returns:

- `info`: QuestInfo?

### C_QuestLog.GetLogIndexForQuestID -- Only returns a log index for actual quests, not headers

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `questLogIndex`: luaIndex?

### C_QuestLog.GetMapForQuestPOIs

Returns:

- `uiMapID`: number

### C_QuestLog.GetMaxNumQuests -- This is the maximum number of quests a player can be on, including hidden quests, world quests, emissaries etc

Returns:

- `maxNumQuests`: number

### C_QuestLog.GetMaxNumQuestsCanAccept -- This is the maximum number of standard quests a player can accept. These are quests that are normally visible in the quest log.

Returns:

- `maxNumQuestsCanAccept`: number

### C_QuestLog.GetNextWaypoint

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `mapID`: number
- `x`: number
- `y`: number

### C_QuestLog.GetNextWaypointForMap

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number
- `uiMapID`: number

Returns:

- `x`: number
- `y`: number

### C_QuestLog.GetNextWaypointText

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `waypointText`: string

### C_QuestLog.GetNumQuestLogEntries

Returns:

- `numShownEntries`: number
- `numQuests`: number

### C_QuestLog.GetNumQuestObjectives

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `leaderboardCount`: number

### C_QuestLog.GetNumQuestWatches

Returns:

- `numQuestWatches`: number

### C_QuestLog.GetNumWorldQuestWatches

Returns:

- `numQuestWatches`: number

### C_QuestLog.GetQuestAdditionalHighlights

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `uiMapID`: number
- `worldQuests`: bool
- `worldQuestsElite`: bool
- `dungeons`: bool
- `treasures`: bool

### C_QuestLog.GetQuestDetailsTheme

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `theme`: QuestTheme?

### C_QuestLog.GetQuestDifficultyLevel

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `level`: number

### C_QuestLog.GetQuestIDForLogIndex -- Only returns a questID for actual quests, not headers

SecretArguments=AllowedWhenUntainted

Arguments:

- `questLogIndex`: luaIndex

Returns:

- `questID`: number?

### C_QuestLog.GetQuestIDForQuestWatchIndex

SecretArguments=AllowedWhenUntainted

Arguments:

- `questWatchIndex`: luaIndex

Returns:

- `questID`: number?

### C_QuestLog.GetQuestIDForWorldQuestWatchIndex

SecretArguments=AllowedWhenUntainted

Arguments:

- `questWatchIndex`: luaIndex

Returns:

- `questID`: number?

### C_QuestLog.GetQuestLogMajorFactionReputationRewards

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `reputationRewards`: table<QuestRewardReputationInfo>

### C_QuestLog.GetQuestLogPortraitGiver

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `questLogIndex`: luaIndex?

Returns:

- `portraitGiver`: number
- `portraitGiverText`: cstring
- `portraitGiverName`: cstring
- `portraitGiverMount`: number
- `portraitGiverModelSceneID`: number?

### C_QuestLog.GetQuestObjectives

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `objectives`: table<QuestObjectiveInfo>

### C_QuestLog.GetQuestRewardCurrencies

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `questRewardCurrencies`: table<QuestRewardCurrencyInfo>

### C_QuestLog.GetQuestRewardCurrencyInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number
- `currencyIndex`: luaIndex
- `isChoice`: bool

Returns:

- `questRewardCurrencyInfo`: QuestRewardCurrencyInfo?

### C_QuestLog.GetQuestTagInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `info`: QuestTagInfo?

### C_QuestLog.GetQuestTimers

Returns:

- `questTimers`: table<QuestTimerInfo>

### C_QuestLog.GetQuestType

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `questType`: number?

### C_QuestLog.GetQuestWatchType

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `watchType`: QuestWatchType?

### C_QuestLog.GetQuestsOnMap

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

Returns:

- `quests`: table<QuestPOIMapInfo>

### C_QuestLog.GetRequiredMoney -- Uses the selected quest if no questID is provided

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number?

Returns:

- `requiredMoney`: number

### C_QuestLog.GetSelectedQuest

Returns:

- `questID`: number

### C_QuestLog.GetSuggestedGroupSize

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `suggestedGroupSize`: number

### C_QuestLog.GetTimeAllowed

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `totalTime`: number
- `elapsedTime`: number

### C_QuestLog.GetTitleForLogIndex -- Returns a valid title for anything that is in the quest log.

SecretArguments=AllowedWhenUntainted

Arguments:

- `questLogIndex`: luaIndex

Returns:

- `title`: cstring?

### C_QuestLog.GetTitleForQuestID -- Only returns a valid title for quests, header titles cannot be discovered using this.

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `title`: cstring?

### C_QuestLog.GetTrivialRange

Returns:

- `range`: number

### C_QuestLog.GetZoneStoryInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

Returns:

- `achievementID`: number
- `storyMapID`: number

### C_QuestLog.HasActiveThreats

Returns:

- `hasActiveThreats`: bool

### C_QuestLog.IsAccountQuest

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `isAccountQuest`: bool

### C_QuestLog.IsComplete

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `isComplete`: bool

### C_QuestLog.IsEliteQuest

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `isEliteQuest`: bool

### C_QuestLog.IsFailed

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `isFailed`: bool

### C_QuestLog.IsImportantQuest

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `isImportant`: bool

### C_QuestLog.IsMetaQuest

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `isMeta`: bool

### C_QuestLog.IsOnMap

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `onMap`: bool
- `hasLocalPOI`: bool

### C_QuestLog.IsOnQuest

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `isOnQuest`: bool

### C_QuestLog.IsPushableQuest

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `isPushable`: bool

### C_QuestLog.IsQuestBounty

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `isBounty`: bool

### C_QuestLog.IsQuestCalling

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `isCalling`: bool

### C_QuestLog.IsQuestCriteriaForBounty

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number
- `bountyQuestID`: number

Returns:

- `isCriteriaForBounty`: bool

### C_QuestLog.IsQuestDisabledForSession

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `isDisabled`: bool

### C_QuestLog.IsQuestFlaggedCompleted

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `isCompleted`: bool

### C_QuestLog.IsQuestFlaggedCompletedOnAccount

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `isCompletedOnAccount`: bool

### C_QuestLog.IsQuestFromContentPush

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `isFromContentPush`: bool

### C_QuestLog.IsQuestInvasion

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `isInvasion`: bool

### C_QuestLog.IsQuestReplayable

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `isReplayable`: bool

### C_QuestLog.IsQuestReplayedRecently

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `recentlyReplayed`: bool

### C_QuestLog.IsQuestTask

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `isTask`: bool

### C_QuestLog.IsQuestTrivial

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `isTrivial`: bool

### C_QuestLog.IsRepeatableQuest

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `isRepeatable`: bool

### C_QuestLog.IsThreatQuest

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `isThreat`: bool

### C_QuestLog.IsUnitOnQuest

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken
- `questID`: number

Returns:

- `isOnQuest`: bool

### C_QuestLog.IsWorldQuest

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `isWorldQuest`: bool

### C_QuestLog.QuestCanHaveWarModeBonus -- Tests whether a quest is eligible for warmode bonuses (e.g. most world quests, some daily quests

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `hasBonus`: bool

### C_QuestLog.QuestContainsFirstTimeRepBonusForPlayer

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `questContainsFirstTimeRepBonusForPlayer`: bool

### C_QuestLog.QuestHasQuestSessionBonus

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `hasBonus`: bool

### C_QuestLog.QuestHasWarModeBonus -- Tests whether a quest in the player's quest log that is eligible for warmode bonuses (see 'QuestCanHaveWarModeBOnus') has been completed in warmode (including accepting it)

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `hasBonus`: bool

### C_QuestLog.QuestIgnoresAccountCompletedFiltering

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `questIgnoresAccountCompletedFiltering`: bool

### C_QuestLog.ReadyForTurnIn

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `readyForTurnIn`: bool?

### C_QuestLog.RemoveQuestWatch

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `wasRemoved`: bool

### C_QuestLog.RemoveWorldQuestWatch

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `wasRemoved`: bool

### C_QuestLog.RequestLoadQuestByID

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

### C_QuestLog.SetAbandonQuest

### C_QuestLog.SetMapForQuestPOIs

SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

### C_QuestLog.SetSelectedQuest

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

### C_QuestLog.ShouldDisplayTimeRemaining

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `displayTimeRemaining`: bool

### C_QuestLog.ShouldShowQuestRewards

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `shouldShow`: bool

### C_QuestLog.SortQuestWatches

### C_QuestLog.UnitIsRelatedToActiveQuest

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `isRelatedToActiveQuest`: bool

### C_QuestLog.UpdateCampaignHeaders

## Events

### QUEST_ACCEPTED

SynchronousEvent=true

Payload:

- `questId`: number

### QUEST_AUTOCOMPLETE

SynchronousEvent=true

Payload:

- `questId`: number

### QUEST_COMPLETE

SynchronousEvent=true

### QUEST_DATA_LOAD_RESULT

SynchronousEvent=true

Payload:

- `questID`: number
- `success`: bool

### QUEST_DETAIL

SynchronousEvent=true

Payload:

- `questStartItemID`: number?

### QUEST_LOG_CRITERIA_UPDATE

SynchronousEvent=true

Payload:

- `questID`: number
- `specificTreeID`: number
- `description`: cstring
- `numFulfilled`: number
- `numRequired`: number

### QUEST_LOG_UPDATE

UniqueEvent=true

### QUEST_POI_UPDATE

UniqueEvent=true

### QUEST_REMOVED

SynchronousEvent=true

Payload:

- `questID`: number
- `wasReplayQuest`: bool

### QUEST_TURNED_IN

SynchronousEvent=true

Payload:

- `questID`: number
- `xpReward`: number
- `moneyReward`: number

### QUEST_WATCH_LIST_CHANGED

SynchronousEvent=true, UniqueEvent=true

Payload:

- `questID`: number?
- `added`: bool?

### QUEST_WATCH_UPDATE

SynchronousEvent=true

Payload:

- `questID`: number

### QUESTLINE_UPDATE

SynchronousEvent=true

Payload:

- `requestRequired`: bool

### TASK_PROGRESS_UPDATE

SynchronousEvent=true

### TREASURE_PICKER_CACHE_FLUSH

SynchronousEvent=true

### WAYPOINT_UPDATE

SynchronousEvent=true

### WORLD_QUEST_COMPLETED_BY_SPELL

SynchronousEvent=true

Payload:

- `questID`: number

## Tables

### MapOverlayDisplayLocation

MaxValue=5, MinValue=0, NumValues=6

Fields:

- `Default`: MapOverlayDisplayLocation [= 0]
- `BottomLeft`: MapOverlayDisplayLocation [= 1]
- `TopLeft`: MapOverlayDisplayLocation [= 2]
- `BottomRight`: MapOverlayDisplayLocation [= 3]
- `TopRight`: MapOverlayDisplayLocation [= 4]
- `Hidden`: MapOverlayDisplayLocation [= 5]

### QuestFrequency

MaxValue=3, MinValue=0, NumValues=4

Fields:

- `Default`: QuestFrequency [= 0]
- `Daily`: QuestFrequency [= 1]
- `Weekly`: QuestFrequency [= 2]
- `ResetByScheduler`: QuestFrequency [= 3]

### QuestTag

MaxValue=288, MinValue=1, NumValues=12

Fields:

- `Group`: QuestTag [= 1]
- `PvP`: QuestTag [= 41]
- `Raid`: QuestTag [= 62]
- `Dungeon`: QuestTag [= 81]
- `Legendary`: QuestTag [= 83]
- `Heroic`: QuestTag [= 85]
- `Raid10`: QuestTag [= 88]
- `Raid25`: QuestTag [= 89]
- `Scenario`: QuestTag [= 98]
- `Account`: QuestTag [= 102]
- `CombatAlly`: QuestTag [= 266]
- `Delve`: QuestTag [= 288]

### QuestWatchType

MaxValue=1, MinValue=0, NumValues=2

Fields:

- `Automatic`: QuestWatchType [= 0]
- `Manual`: QuestWatchType [= 1]

### WorldQuestQuality

MaxValue=2, MinValue=0, NumValues=3

Fields:

- `Common`: WorldQuestQuality [= 0]
- `Rare`: WorldQuestQuality [= 1]
- `Epic`: WorldQuestQuality [= 2]

### QuestInfo

Fields:

- `title`: string
- `questLogIndex`: luaIndex
- `questID`: number
- `campaignID`: number?
- `level`: number
- `difficultyLevel`: number
- `suggestedGroup`: number
- `frequency`: QuestFrequency?
- `isHeader`: bool
- `useMinimalHeader`: bool
- `sortAsNormalQuest`: bool
- `isCollapsed`: bool
- `startEvent`: bool
- `isTask`: bool
- `isBounty`: bool
- `isStory`: bool
- `isScaling`: bool
- `isOnMap`: bool
- `hasLocalPOI`: bool
- `isHidden`: bool
- `isAutoComplete`: bool
- `overridesSortOrder`: bool
- `readyForTranslation`: bool [default=true]
- `isInternalOnly`: bool
- `isAbandonOnDisable`: bool
- `headerSortKey`: number?
- `questClassification`: QuestClassification

### QuestObjectiveInfo

Fields:

- `text`: string
- `type`: string
- `finished`: bool
- `numFulfilled`: number
- `numRequired`: number
- `objectiveType`: QuestObjectiveType?

### QuestTagInfo

Fields:

- `tagName`: cstring
- `tagID`: number
- `worldQuestType`: number?
- `quality`: WorldQuestQuality?
- `tradeskillLineID`: number?
- `isElite`: bool?
- `displayExpiration`: bool?

### QuestTheme

Fields:

- `background`: textureAtlas
- `seal`: textureAtlas
- `signature`: cstring
- `poiIcon`: textureAtlas
- `mapPinInfo`: UIMapPinInfo?

### QuestTimerInfo

Fields:

- `questID`: number
- `questTimer`: number
