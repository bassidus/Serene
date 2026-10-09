# ClubFinderInfo

Namespace `C_ClubFinder`.

Environment=All, Predicates={}

## Functions

### C_ClubFinder.ApplicantAcceptClubInvite

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubFinderGUID`: WOWGUID

### C_ClubFinder.ApplicantDeclineClubInvite

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubFinderGUID`: WOWGUID

### C_ClubFinder.CancelMembershipRequest

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubFinderGUID`: WOWGUID

### C_ClubFinder.CheckAllPlayerApplicantSettings

### C_ClubFinder.ClearAllFinderCache

### C_ClubFinder.ClearClubApplicantsCache

### C_ClubFinder.ClearClubFinderPostingsCache

### C_ClubFinder.DoesPlayerBelongToClubFromClubGUID

SecretArguments=AllowedWhenUntainted

Arguments:

- `clubFinderGUID`: WOWGUID

Returns:

- `belongsToClub`: bool

### C_ClubFinder.GetClubFinderDisableReason

Returns:

- `disableReason`: ClubFinderDisableReason?

### C_ClubFinder.GetClubRecruitmentSettings

Returns:

- `settings`: ClubSettingsInfo

### C_ClubFinder.GetClubTypeFromFinderGUID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubFinderGUID`: WOWGUID

Returns:

- `clubType`: ClubFinderRequestType

### C_ClubFinder.GetFocusIndexFromFlag

SecretArguments=AllowedWhenUntainted

Arguments:

- `flags`: number

Returns:

- `index`: number

### C_ClubFinder.GetPlayerApplicantLocaleFlags

Returns:

- `localeFlags`: number

### C_ClubFinder.GetPlayerApplicantSettings

Returns:

- `settings`: ClubSettingsInfo

### C_ClubFinder.GetPlayerClubApplicationStatus

SecretArguments=AllowedWhenUntainted

Arguments:

- `clubFinderGUID`: WOWGUID

Returns:

- `clubStatus`: PlayerClubRequestStatus

### C_ClubFinder.GetPlayerSettingsFocusFlagsSelectedCount

Returns:

- `focusCount`: number

### C_ClubFinder.GetPostingIDFromClubFinderGUID

SecretArguments=AllowedWhenUntainted

Arguments:

- `clubFinderGUID`: WOWGUID

Returns:

- `postingID`: number?

### C_ClubFinder.GetRecruitingClubInfoFromClubID

SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId

Returns:

- `clubInfo`: RecruitingClubInfo?

### C_ClubFinder.GetRecruitingClubInfoFromFinderGUID

SecretArguments=AllowedWhenUntainted

Arguments:

- `clubFinderGUID`: WOWGUID

Returns:

- `clubInfo`: RecruitingClubInfo

### C_ClubFinder.GetStatusOfPostingFromClubId

SecretArguments=AllowedWhenUntainted

Arguments:

- `postingID`: ClubId

Returns:

- `postingFlags`: table<ClubFinderClubPostingStatusFlags>

### C_ClubFinder.GetTotalMatchingCommunityListSize

Returns:

- `totalSize`: number

### C_ClubFinder.GetTotalMatchingGuildListSize

Returns:

- `totalSize`: number

### C_ClubFinder.HasAlreadyAppliedToLinkedPosting

SecretArguments=AllowedWhenUntainted

Arguments:

- `clubFinderGUID`: WOWGUID

Returns:

- `hasAlreadyApplied`: bool

### C_ClubFinder.HasPostingBeenDelisted

SecretArguments=AllowedWhenUntainted

Arguments:

- `postingID`: ClubId

Returns:

- `postingDelisted`: bool

### C_ClubFinder.IsCommunityFinderEnabled

Returns:

- `isEnabled`: bool

### C_ClubFinder.IsEnabled

Returns:

- `isEnabled`: bool

### C_ClubFinder.IsListingEnabledFromFlags

SecretArguments=AllowedWhenUntainted

Arguments:

- `flags`: number

Returns:

- `isListed`: bool

### C_ClubFinder.IsPostingBanned

SecretArguments=AllowedWhenUntainted

Arguments:

- `postingID`: ClubId

Returns:

- `postingBanned`: bool

### C_ClubFinder.IsValidSearchString

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: cstring

Returns:

- `isApproved`: bool

### C_ClubFinder.LookupClubPostingFromClubFinderGUID

SecretArguments=AllowedWhenUntainted

Arguments:

- `clubFinderGUID`: WOWGUID
- `isLinkedPosting`: bool

### C_ClubFinder.PlayerGetClubInvitationList

MayReturnNothing=true

Returns:

- `inviteList`: table<RecruitingClubInfo>

### C_ClubFinder.PlayerRequestPendingClubsList

SecretArguments=AllowedWhenUntainted

Arguments:

- `type`: ClubFinderRequestType

### C_ClubFinder.PlayerReturnPendingCommunitiesList

Returns:

- `info`: table<RecruitingClubInfo>

### C_ClubFinder.PlayerReturnPendingGuildsList

Returns:

- `info`: table<RecruitingClubInfo>

### C_ClubFinder.PostClub

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId
- `itemLevelRequirement`: number
- `name`: string
- `description`: string
- `avatarId`: number
- `specs`: table<number>
- `type`: ClubFinderRequestType
- `crossFaction`: bool [default=false]

Returns:

- `succesful`: bool

### C_ClubFinder.RequestApplicantList

SecretArguments=AllowedWhenUntainted

Arguments:

- `type`: ClubFinderRequestType

### C_ClubFinder.RequestClubsList

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `guildListRequested`: bool
- `searchString`: string
- `specIDs`: table<number>

### C_ClubFinder.RequestMembershipToClub

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubFinderGUID`: WOWGUID
- `comment`: string
- `specIDs`: table<number>

### C_ClubFinder.RequestNextCommunityPage

SecretArguments=AllowedWhenUntainted

Arguments:

- `startingIndex`: number
- `pageSize`: number

### C_ClubFinder.RequestNextGuildPage

SecretArguments=AllowedWhenUntainted

Arguments:

- `startingIndex`: number
- `pageSize`: number

### C_ClubFinder.RequestPostingInformationFromClubId

SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId

Returns:

- `success`: bool

### C_ClubFinder.RequestSubscribedClubPostingIDs

### C_ClubFinder.ResetClubPostingMapCache

### C_ClubFinder.RespondToApplicant

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubFinderGUID`: WOWGUID
- `playerGUID`: WOWGUID
- `shouldAccept`: bool
- `requestType`: ClubFinderRequestType
- `playerName`: string
- `forceAccept`: bool
- `reported`: bool?

### C_ClubFinder.ReturnClubApplicantList

SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId

Returns:

- `info`: table<ClubFinderApplicantInfo>

### C_ClubFinder.ReturnMatchingCommunityList

Returns:

- `recruitingClubs`: table<RecruitingClubInfo>

### C_ClubFinder.ReturnMatchingGuildList

Returns:

- `recruitingClubs`: table<RecruitingClubInfo>

### C_ClubFinder.ReturnPendingClubApplicantList

SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId

Returns:

- `info`: table<ClubFinderApplicantInfo>

### C_ClubFinder.SendChatWhisper

SecretArguments=AllowedWhenUntainted

Arguments:

- `clubFinderGUID`: WOWGUID
- `playerGUID`: WOWGUID
- `applicantType`: ClubFinderRequestType
- `name`: string

### C_ClubFinder.SetAllRecruitmentSettings

SecretArguments=AllowedWhenUntainted

Arguments:

- `value`: number

### C_ClubFinder.SetPlayerApplicantLocaleFlags

SecretArguments=AllowedWhenUntainted

Arguments:

- `localeFlags`: number

### C_ClubFinder.SetPlayerApplicantSettings

SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: number
- `checked`: bool

### C_ClubFinder.SetRecruitmentLocale

SecretArguments=AllowedWhenUntainted

Arguments:

- `locale`: number

### C_ClubFinder.SetRecruitmentSettings

SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: number
- `checked`: bool

### C_ClubFinder.ShouldShowClubFinder

Returns:

- `shouldShow`: bool

## Events

### CLUB_FINDER_APPLICANT_INVITE_RECIEVED

SynchronousEvent=true

Payload:

- `clubFinderGUIDs`: table<WOWGUID>

### CLUB_FINDER_APPLICATIONS_UPDATED

SynchronousEvent=true

Payload:

- `type`: ClubFinderRequestType
- `clubFinderGUIDs`: table<WOWGUID>

### CLUB_FINDER_CAN_WHISPER_APPLICANT

SynchronousEvent=true

Payload:

- `applicant`: WOWGUID

### CLUB_FINDER_CLUB_LIST_RETURNED -- Signals when we recieve club data that can be used

SynchronousEvent=true

Payload:

- `type`: ClubFinderRequestType

### CLUB_FINDER_CLUB_REPORTED -- Sends an update to the UI about a reported guild or community.

SynchronousEvent=true

Payload:

- `type`: ClubFinderRequestType
- `clubFinderGUID`: WOWGUID

### CLUB_FINDER_COMMUNITY_OFFLINE_JOIN -- Signals to the UI that you (the player) have joined a community offline.

SynchronousEvent=true

Payload:

- `clubId`: ClubId

### CLUB_FINDER_ENABLED_OR_DISABLED -- Sends an update to the UI that the club finder feature has been enabled or disabled.

SynchronousEvent=true

### CLUB_FINDER_GUILD_REALM_NAME_UPDATED -- Sends an update to the UI if the realm name of a guild was found asynchronously.

SynchronousEvent=true

Payload:

- `clubFinderGUID`: WOWGUID
- `realmName`: string

### CLUB_FINDER_LINKED_CLUB_RETURNED -- When a player clicks a club link, this returns that information back about the club they clicked on

SynchronousEvent=true

Payload:

- `clubInfo`: RecruitingClubInfo

### CLUB_FINDER_MEMBERSHIP_LIST_CHANGED

SynchronousEvent=true

### CLUB_FINDER_PLAYER_PENDING_LIST_RECIEVED

SynchronousEvent=true

Payload:

- `type`: ClubFinderRequestType

### CLUB_FINDER_POST_UPDATED

SynchronousEvent=true

Payload:

- `clubFinderGUIDs`: table<WOWGUID>

### CLUB_FINDER_RECRUIT_LIST_CHANGED

SynchronousEvent=true

### CLUB_FINDER_RECRUITMENT_POST_RETURNED -- Signals when our recruitment post we just requested is returned back to us

SynchronousEvent=true

Payload:

- `type`: ClubFinderRequestType

### CLUB_FINDER_RECRUITS_UPDATED -- Signals when we recieve the recruits list

SynchronousEvent=true

Payload:

- `type`: ClubFinderRequestType

## Tables

### ClubFinderApplicationUpdateType

MaxValue=3, MinValue=0, NumValues=4

Fields:

- `None`: ClubFinderApplicationUpdateType [= 0]
- `AcceptInvite`: ClubFinderApplicationUpdateType [= 1]
- `DeclineInvite`: ClubFinderApplicationUpdateType [= 2]
- `Cancel`: ClubFinderApplicationUpdateType [= 3]

### ClubFinderClubPostingStatusFlags

MaxValue=8, MinValue=0, NumValues=9

Fields:

- `None`: ClubFinderClubPostingStatusFlags [= 0]
- `NeedsCacheUpdate`: ClubFinderClubPostingStatusFlags [= 1]
- `ForceDescriptionChange`: ClubFinderClubPostingStatusFlags [= 2]
- `ForceNameChange`: ClubFinderClubPostingStatusFlags [= 3]
- `UnderReview`: ClubFinderClubPostingStatusFlags [= 4]
- `Banned`: ClubFinderClubPostingStatusFlags [= 5]
- `FakePost`: ClubFinderClubPostingStatusFlags [= 6]
- `PendingDelete`: ClubFinderClubPostingStatusFlags [= 7]
- `PostDelisted`: ClubFinderClubPostingStatusFlags [= 8]

### ClubFinderDisableReason

MaxValue=2, MinValue=0, NumValues=3

Fields:

- `Muted`: ClubFinderDisableReason [= 0]
- `Silenced`: ClubFinderDisableReason [= 1]
- `VeteranTrial`: ClubFinderDisableReason [= 2]

### ClubFinderPostingReportType

MaxValue=4, MinValue=0, NumValues=5

Fields:

- `PostersName`: ClubFinderPostingReportType [= 0]
- `ClubName`: ClubFinderPostingReportType [= 1]
- `PostingDescription`: ClubFinderPostingReportType [= 2]
- `ApplicantsName`: ClubFinderPostingReportType [= 3]
- `JoinNote`: ClubFinderPostingReportType [= 4]

### ClubFinderRequestType

MaxValue=3, MinValue=0, NumValues=4

Fields:

- `None`: ClubFinderRequestType [= 0]
- `Guild`: ClubFinderRequestType [= 1]
- `Community`: ClubFinderRequestType [= 2]
- `All`: ClubFinderRequestType [= 3]

### ClubFinderSettingFlags

MaxValue=25, MinValue=0, NumValues=26

Fields:

- `None`: ClubFinderSettingFlags [= 0]
- `Dungeons`: ClubFinderSettingFlags [= 1]
- `Raids`: ClubFinderSettingFlags [= 2]
- `PvP`: ClubFinderSettingFlags [= 3]
- `RP`: ClubFinderSettingFlags [= 4]
- `Social`: ClubFinderSettingFlags [= 5]
- `Small`: ClubFinderSettingFlags [= 6]
- `Medium`: ClubFinderSettingFlags [= 7]
- `Large`: ClubFinderSettingFlags [= 8]
- `Tank`: ClubFinderSettingFlags [= 9]
- `Healer`: ClubFinderSettingFlags [= 10]
- `Damage`: ClubFinderSettingFlags [= 11]
- `EnableListing`: ClubFinderSettingFlags [= 12]
- `MaxLevelOnly`: ClubFinderSettingFlags [= 13]
- `AutoAccept`: ClubFinderSettingFlags [= 14]
- `FactionHorde`: ClubFinderSettingFlags [= 15]
- `FactionAlliance`: ClubFinderSettingFlags [= 16]
- `FactionNeutral`: ClubFinderSettingFlags [= 17]
- `SortRelevance`: ClubFinderSettingFlags [= 18]
- `SortMemberCount`: ClubFinderSettingFlags [= 19]
- `SortNewest`: ClubFinderSettingFlags [= 20]
- `LanguageReserved1`: ClubFinderSettingFlags [= 21]
- `LanguageReserved2`: ClubFinderSettingFlags [= 22]
- `LanguageReserved3`: ClubFinderSettingFlags [= 23]
- `LanguageReserved4`: ClubFinderSettingFlags [= 24]
- `LanguageReserved5`: ClubFinderSettingFlags [= 25]

### PlayerClubRequestStatus

MaxValue=7, MinValue=0, NumValues=8

Fields:

- `None`: PlayerClubRequestStatus [= 0]
- `Pending`: PlayerClubRequestStatus [= 1]
- `AutoApproved`: PlayerClubRequestStatus [= 2]
- `Declined`: PlayerClubRequestStatus [= 3]
- `Approved`: PlayerClubRequestStatus [= 4]
- `Joined`: PlayerClubRequestStatus [= 5]
- `JoinedAnother`: PlayerClubRequestStatus [= 6]
- `Canceled`: PlayerClubRequestStatus [= 7]

### ClubFinderApplicantInfo

Fields:

- `clubFinderGUID`: WOWGUID
- `playerGUID`: WOWGUID
- `closed`: number
- `name`: string
- `message`: string
- `level`: number
- `classID`: number
- `ilvl`: number
- `specIds`: table<number>
- `requestStatus`: PlayerClubRequestStatus
- `lookupSuccess`: bool
- `lastUpdatedTime`: BigInteger
- `faction`: number

### ClubSettingsInfo

Fields:

- `playStyleDungeon`: bool
- `playStyleRaids`: bool
- `playStylePvp`: bool
- `playStyleRP`: bool
- `playStyleSocial`: bool
- `roleTank`: bool
- `roleHealer`: bool
- `roleDps`: bool
- `sizeSmall`: bool
- `sizeMedium`: bool
- `sizeLarge`: bool
- `maxLevelOnly`: bool
- `enableListing`: bool
- `sortRelevance`: bool
- `sortMembers`: bool
- `sortNewest`: bool
- `autoAccept`: bool
- `crossFaction`: bool

### RecruitingClubInfo

Fields:

- `clubFinderGUID`: WOWGUID
- `numActiveMembers`: number
- `name`: string
- `comment`: string
- `guildLeader`: string
- `isGuild`: bool
- `emblemInfo`: number
- `tabardInfo`: GuildTabardInfo?
- `recruitingSpecIds`: table<number>
- `recruitmentFlags`: number
- `localeSet`: bool
- `recruitmentLocale`: number
- `minILvl`: number
- `cached`: number
- `cacheRequested`: number
- `lastPosterGUID`: WOWGUID
- `clubId`: ClubId
- `lastUpdatedTime`: BigInteger
- `isCrossFaction`: bool
- `realmName`: string?
