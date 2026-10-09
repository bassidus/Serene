# LFGList

Namespace `C_LFGList`.

Environment=All, Predicates={}

## Functions

### C_LFGList.CanActiveEntryUseAutoAccept

Returns:

- `canUseAutoAccept`: bool

### C_LFGList.CanCreateQuestGroup

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `canCreate`: bool

### C_LFGList.CanCreateScenarioGroup

SecretArguments=AllowedWhenUntainted

Arguments:

- `scenarioID`: number

Returns:

- `canCreate`: bool

### C_LFGList.ClearApplicationTextFields

### C_LFGList.ClearCreationTextFields

### C_LFGList.ClearSearchTextFields

### C_LFGList.ConfirmCensoredActiveEntry

### C_LFGList.CopyActiveEntryInfoToCreationFields

### C_LFGList.CreateListing

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `createData`: LfgListingCreateData

Returns:

- `success`: bool

### C_LFGList.CreateScenarioListing

SecretArguments=AllowedWhenUntainted

Arguments:

- `activityID`: number
- `itemLevel`: number
- `autoAccept`: bool
- `privateGroup`: bool
- `scenarioID`: number

Returns:

- `canCreate`: bool

### C_LFGList.DoesCensoredTextMatch

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: cstring
- `comment`: cstring

Returns:

- `isMatch`: bool

### C_LFGList.DoesEntryTitleMatchPrebuiltTitle

SecretArguments=AllowedWhenUntainted

Arguments:

- `activityID`: number
- `groupID`: number
- `playstyle`: LFGEntryPlaystyle?
- `generalPlaystyle`: LFGEntryGeneralPlaystyle?

Returns:

- `matches`: bool

### C_LFGList.GetActiveEntryInfo

MayReturnNothing=true, SecretInChatMessagingLockdown=true

Returns:

- `entryData`: LfgEntryData

### C_LFGList.GetActivityFullName

SecretArguments=AllowedWhenUntainted

Arguments:

- `activityID`: number
- `questID`: number?
- `showWarmode`: bool?

Returns:

- `fullName`: string

### C_LFGList.GetActivityGroupInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `groupID`: number

Returns:

- `name`: string
- `orderIndex`: number

### C_LFGList.GetActivityInfoTable

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `activityID`: number
- `questID`: number?
- `showWarmode`: bool?

Returns:

- `activityInfo`: GroupFinderActivityInfo

### C_LFGList.GetAdvancedFilter

Returns:

- `options`: AdvancedFilterOptions

### C_LFGList.GetApplicantBestDungeonScore

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `localID`: number
- `applicantIndex`: luaIndex

Returns:

- `bestDungeonScoreForListing`: BestDungeonScoreMapInfo

### C_LFGList.GetApplicantDungeonScoreForListing

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `localID`: number
- `applicantIndex`: luaIndex
- `activityID`: number

Returns:

- `bestDungeonScoreForListing`: BestDungeonScoreMapInfo

### C_LFGList.GetApplicantInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted, SecretInChatMessagingLockdown=true

Arguments:

- `applicantID`: number

Returns:

- `applicantData`: LfgApplicantData

### C_LFGList.GetApplicantPvpRatingInfoForListing

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `localID`: number
- `applicantIndex`: luaIndex
- `activityID`: number

Returns:

- `pvpRatingInfo`: PvpRatingInfo

### C_LFGList.GetAvailableActivityGroups

SecretArguments=AllowedWhenUntainted

Arguments:

- `categoryID`: number
- `filter`: number [default=0]

Returns:

- `activityIDs`: table<number>

### C_LFGList.GetFilteredSearchResults

Returns:

- `totalResultsFound`: number [default=0]
- `filteredResults`: table<number>

### C_LFGList.GetGroupLeaverCountsByRole

Returns:

- `tankLeavers`: number
- `healerLeavers`: number
- `damageLeavers`: number

### C_LFGList.GetKeystoneForActivity

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `activityID`: number

Returns:

- `level`: number

### C_LFGList.GetLfgCategoryInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `categoryID`: number

Returns:

- `categoryData`: LfgCategoryData

### C_LFGList.GetOwnedKeystoneActivityAndGroupAndLevel

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `getTimewalking`: bool [default=false]

Returns:

- `activityID`: number
- `groupID`: number
- `keystoneLevel`: number

### C_LFGList.GetPlaystyleString

SecretArguments=AllowedWhenUntainted

Arguments:

- `playstyle`: LFGEntryPlaystyle
- `generalPlaystyle`: LFGEntryGeneralPlaystyle
- `activityInfo`: GroupFinderActivityInfo

Returns:

- `playstyleString`: string

### C_LFGList.GetPremadeGroupFinderStyle

Returns:

- `style`: PremadeGroupFinderStyle

### C_LFGList.GetSearchResultInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted, SecretInChatMessagingLockdown=true

Arguments:

- `searchResultID`: number

Returns:

- `searchResultData`: LfgSearchResultData

### C_LFGList.GetSearchResultLeaderInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted, SecretInChatMessagingLockdown=true

Arguments:

- `searchResultID`: number

Returns:

- `leaderInfo`: LfgSearchResultPlayerInfo

### C_LFGList.GetSearchResultPlayerInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted, SecretInChatMessagingLockdown=true

Arguments:

- `searchResultID`: number
- `memberIndex`: luaIndex

Returns:

- `playerInfo`: LfgSearchResultPlayerInfo

### C_LFGList.GetSearchResults

Returns:

- `totalResultsFound`: number [default=0]
- `results`: table<number>

### C_LFGList.HasActiveEntryInfo

Returns:

- `hasActiveEntryInfo`: bool

### C_LFGList.HasSearchResultInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `searchResultID`: number

Returns:

- `hasSearchResultInfo`: bool

### C_LFGList.IsCensoredActiveEntryUnresolved

Returns:

- `isUnresolved`: bool

### C_LFGList.IsPlayerAuthenticatedForLFG

SecretArguments=AllowedWhenUntainted

Arguments:

- `activityCategoryID`: number?

Returns:

- `isAuthenticated`: bool

### C_LFGList.IsPlayerValidForEndgameFieldEdits

Returns:

- `isValid`: bool

### C_LFGList.IsPremadeGroupFinderEnabled

Returns:

- `enabled`: bool

### C_LFGList.ListingUsesEndgameEditRestrictions

SecretArguments=AllowedWhenUntainted

Arguments:

- `activityID`: number

Returns:

- `isEndgameListing`: bool

### C_LFGList.ReportGroupAsAdvertisement

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `searchResultID`: number

### C_LFGList.RevealCensoredActiveEntry

### C_LFGList.RevealCensoredSearchResult

SecretArguments=AllowedWhenUntainted

Arguments:

- `searchResultID`: number

### C_LFGList.SaveAdvancedFilter

SecretArguments=AllowedWhenUntainted

Arguments:

- `options`: AdvancedFilterOptions

### C_LFGList.Search

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `categoryID`: number
- `filter`: number [default=0]
- `preferredFilters`: number [default=0]
- `languageFilter`: WowLocale?
- `searchCrossFactionListings`: bool? [default=false]
- `advancedFilter`: AdvancedFilterOptions?
- `activityIDsFilter`: table<number>? -- Activity IDs to filter by.

### C_LFGList.SetEntryTitle

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `activityID`: number
- `groupID`: number
- `playstyle`: LFGEntryPlaystyle?
- `generalPlaystyle`: LFGEntryGeneralPlaystyle?

### C_LFGList.SetSearchToActivity

SecretArguments=AllowedWhenUntainted

Arguments:

- `activityID`: number

### C_LFGList.SetSearchToQuestID

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

### C_LFGList.SetSearchToScenarioID

SecretArguments=AllowedWhenUntainted

Arguments:

- `scenarioID`: number

### C_LFGList.UpdateListing

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `createData`: LfgListingCreateData

Returns:

- `success`: bool

### C_LFGList.ValidateRequiredDungeonScore

SecretArguments=AllowedWhenUntainted

Arguments:

- `dungeonScore`: number

Returns:

- `passes`: bool

### C_LFGList.ValidateRequiredPvpRatingForActivity

SecretArguments=AllowedWhenUntainted

Arguments:

- `activityID`: number
- `rating`: number

Returns:

- `passes`: bool

## Events

### LFG_GROUP_DELISTED_LEADERSHIP_CHANGE

SynchronousEvent=true

Payload:

- `listingName`: string
- `automaticDelistTimeRemaining`: number

### LFG_LIST_ACTIVE_ENTRY_UPDATE

SynchronousEvent=true

Payload:

- `created`: bool?

### LFG_LIST_APPLICANT_LIST_UPDATED

SynchronousEvent=true

Payload:

- `newPendingEntry`: bool?
- `newPendingEntryWithData`: bool?

### LFG_LIST_APPLICANT_UPDATED

SynchronousEvent=true

Payload:

- `applicantID`: number

### LFG_LIST_APPLICATION_STATUS_UPDATED

SynchronousEvent=true

Payload:

- `searchResultID`: number
- `newStatus`: cstring
- `oldStatus`: cstring
- `groupName`: kstringLfgListChat

### LFG_LIST_AVAILABILITY_UPDATE

SynchronousEvent=true

### LFG_LIST_CENSORED_ACTIVE_ENTRY_UPDATE

SynchronousEvent=true

Payload:

- `isCensored`: bool

### LFG_LIST_ENTRY_CREATION_FAILED

SynchronousEvent=true

### LFG_LIST_ENTRY_EXPIRED_TIMEOUT

SynchronousEvent=true

### LFG_LIST_ENTRY_EXPIRED_TOO_MANY_PLAYERS

SynchronousEvent=true

### LFG_LIST_JOINED_GROUP

SynchronousEvent=true

Payload:

- `searchResultID`: number
- `groupName`: kstringLfgListChat

### LFG_LIST_REVEALED_CENSORED_ACTIVE_ENTRY

SynchronousEvent=true

### LFG_LIST_SEARCH_FAILED

SynchronousEvent=true

Payload:

- `reason`: cstring?

### LFG_LIST_SEARCH_RESULT_UPDATED

SynchronousEvent=true

Payload:

- `searchResultID`: number

### LFG_LIST_SEARCH_RESULTS_RECEIVED

SynchronousEvent=true

### LFG_LIST_SHOW_SEARCH

SynchronousEvent=true

Payload:

- `activityIDsFilter`: table<number>?
- `showAllLevelRanges`: bool

### LFG_LIST_UPDATE_SEARCH_RESULTS

SynchronousEvent=true

## Tables

### AdvancedFilterOptions

Fields:

- `needsTank`: bool [default=false]
- `needsHealer`: bool [default=false]
- `needsDamage`: bool [default=false]
- `needsMyClass`: bool [default=false]
- `hasTank`: bool [default=false]
- `hasHealer`: bool [default=false]
- `activities`: table<number> -- Activity group IDs to filter by.
- `minimumRating`: number [default=0]
- `difficultyNormal`: bool [default=false]
- `difficultyHeroic`: bool [default=false]
- `difficultyMythic`: bool [default=false]
- `difficultyMythicPlus`: bool [default=false]
- `generalPlaystyle1`: bool [default=false]
- `generalPlaystyle2`: bool [default=false]
- `generalPlaystyle3`: bool [default=false]
- `generalPlaystyle4`: bool [default=false]

### BestDungeonScoreMapInfo

Fields:

- `mapScore`: number
- `mapName`: string
- `bestRunLevel`: number
- `finishedSuccess`: bool
- `bestRunDurationMs`: number
- `bestLevelIncrement`: number

### GroupFinderActivityInfo

Fields:

- `fullName`: string
- `shortName`: string
- `categoryID`: number
- `groupFinderActivityGroupID`: number
- `ilvlSuggestion`: number
- `filters`: number
- `minLevel`: number
- `minLevelSuggestion`: number
- `maxLevelSuggestion`: number
- `maxNumPlayers`: number
- `displayType`: LFGListDisplayType
- `orderIndex`: number
- `useHonorLevel`: bool
- `showQuickJoinToast`: bool
- `isMythicPlusActivity`: bool
- `isRatedPvpActivity`: bool
- `isCurrentRaidActivity`: bool
- `isPvpActivity`: bool
- `isMythicActivity`: bool
- `allowCrossFaction`: bool
- `isHeroicActivity`: bool
- `isNormalActivity`: bool
- `mapID`: number
- `difficultyID`: number
- `redirectedDifficultyID`: number
- `useDungeonRoleExpectations`: bool

### LfgApplicantData

Fields:

- `applicantID`: number
- `applicationStatus`: cstring [NeverSecret=true]
- `pendingApplicationStatus`: cstring? [NeverSecret=true]
- `numMembers`: number [NeverSecret=true]
- `isNew`: bool
- `comment`: kstringLfgListApplicant
- `displayOrderID`: number

### LfgCategoryData

Fields:

- `name`: cstring
- `searchPromptOverride`: cstring?
- `separateRecommended`: bool
- `autoChooseActivity`: bool
- `preferCurrentArea`: bool
- `showPlaystyleDropdown`: bool
- `allowCrossFaction`: bool

### LfgEntryData

Fields:

- `activityIDs`: table<number> [NeverSecret=true]
- `requiredItemLevel`: number
- `requiredHonorLevel`: number
- `name`: kstringLfgListApplicant
- `comment`: kstringLfgListApplicant
- `voiceChat`: kstringLfgListApplicant
- `voiceMode`: LFGEntryVoiceMode
- `censored`: bool
- `duration`: time_t
- `autoAccept`: bool
- `privateGroup`: bool
- `questID`: number?
- `requiredDungeonScore`: number?
- `requiredPvpRating`: number?
- `playstyle`: LFGEntryPlaystyle?
- `generalPlaystyle`: LFGEntryGeneralPlaystyle?
- `isCrossFactionListing`: bool
- `newPlayerFriendly`: bool

### LfgListingCreateData

Fields:

- `activityIDs`: table<number>
- `questID`: number?
- `isAutoAccept`: bool [default=false]
- `isCrossFactionListing`: bool [default=false]
- `isPrivateGroup`: bool [default=false]
- `newPlayerFriendly`: bool [default=false]
- `playstyle`: LFGEntryPlaystyle [default=None]
- `generalPlaystyle`: LFGEntryGeneralPlaystyle [default=None]
- `requiredDungeonScore`: number [default=0]
- `requiredItemLevel`: number [default=0]
- `requiredPvpRating`: number [default=0]
- `voiceMode`: LFGEntryVoiceMode [default=None]

### LfgSearchResultData

Fields:

- `searchResultID`: number
- `activityIDs`: table<number>
- `leaderName`: string?
- `name`: kstringLfgListSearch
- `comment`: kstringLfgListSearch
- `voiceChat`: kstringLfgListSearch
- `voiceMode`: LFGEntryVoiceMode
- `censored`: bool
- `requiredItemLevel`: number
- `requiredHonorLevel`: number
- `hasSelf`: bool
- `numMembers`: number
- `numBNetFriends`: number
- `numCharFriends`: number
- `numGuildMates`: number
- `isDelisted`: bool
- `autoAccept`: bool
- `isWarMode`: bool
- `age`: time_t
- `questID`: number?
- `leaderOverallDungeonScore`: number?
- `leaderDungeonScoreInfo`: table<BestDungeonScoreMapInfo>
- `leaderBestDungeonScoreInfo`: BestDungeonScoreMapInfo?
- `leaderPvpRatingInfo`: table<PvpRatingInfo>
- `requiredDungeonScore`: number?
- `requiredPvpRating`: number?
- `playstyle`: LFGEntryPlaystyle?
- `generalPlaystyle`: LFGEntryGeneralPlaystyle?
- `crossFactionListing`: bool?
- `leaderFactionGroup`: number
- `newPlayerFriendly`: bool?
- `partyGUID`: WOWGUID [NeverSecret=true]

### LfgSearchResultPlayerInfo

Fields:

- `name`: string?
- `level`: number?
- `areaName`: cstring?
- `className`: cstring
- `classFilename`: cstring
- `specName`: cstring?
- `assignedRole`: cstring
- `lfgRoles`: LFGRoles
- `isLeader`: bool
- `isLeaver`: bool [default=false]

### PvpRatingInfo

Fields:

- `bracket`: number
- `rating`: number
- `activityName`: string
- `tier`: number

### WowLocale

Fields:

- `enUS`: bool [default=false]
- `koKR`: bool [default=false]
- `frFR`: bool [default=false]
- `deDE`: bool [default=false]
- `zhCN`: bool [default=false]
- `zhTW`: bool [default=false]
- `esES`: bool [default=false]
- `esMX`: bool [default=false]
- `ruRU`: bool [default=false]
- `ptBR`: bool [default=false]
- `itIT`: bool [default=false]
