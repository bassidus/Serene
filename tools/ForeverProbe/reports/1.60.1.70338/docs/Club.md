# Club

Namespace `C_Club`.

Environment=All, Predicates={1={FailureMode=ReturnNothing, Name=RequiresClubsInitialized, Type=Precondition}}

## Functions

### C_Club.AcceptInvitation

HasRestrictions=true, RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId

### C_Club.AddClubStreamChatChannel

RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId
- `streamId`: ClubStreamId

### C_Club.AdvanceStreamViewMarker

RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId
- `streamId`: ClubStreamId

### C_Club.AreMembersReady

RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId

Returns:

- `membersReady`: bool

### C_Club.AssignMemberRole

HasRestrictions=true, RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId
- `memberId`: ClubMemberOpaqueId
- `roleId`: ClubRoleIdentifier

### C_Club.CanResolvePlayerLocationFromClubMessageData

RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId
- `streamId`: ClubStreamId
- `epoch`: BigUInteger
- `position`: BigUInteger

Returns:

- `canResolve`: bool

### C_Club.ClearAutoAdvanceStreamViewMarker

RequiresClubsInitialized=true

### C_Club.ClearClubPresenceSubscription

RequiresClubsInitialized=true

### C_Club.CompareBattleNetDisplayName

RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId
- `lhsMemberId`: number
- `rhsMemberId`: number

Returns:

- `comparison`: number

### C_Club.CreateClub

HasRestrictions=true, RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: string
- `shortName`: string?
- `description`: string
- `clubType`: ClubType -- Valid types are BattleNet or Character
- `avatarId`: number
- `isCrossFaction`: bool?

### C_Club.CreateStream -- Check the canCreateStream privilege.

HasRestrictions=true, RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId
- `name`: string
- `subject`: string
- `leadersAndModeratorsOnly`: bool

### C_Club.CreateTicket -- Check canCreateTicket privilege.

HasRestrictions=true, RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId
- `allowedRedeemCount`: number? -- Number of uses. nil means unlimited
- `duration`: number? -- Duration in seconds. nil never expires
- `defaultStreamId`: ClubStreamId?
- `isCrossFaction`: bool?

### C_Club.DeclineInvitation

HasRestrictions=true, RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId

### C_Club.DestroyClub -- Check the canDestroy privilege.

HasRestrictions=true, RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId

### C_Club.DestroyMessage

HasRestrictions=true, RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId
- `streamId`: ClubStreamId
- `messageId`: ClubMessageIdentifier

### C_Club.DestroyStream -- Check canDestroyStream privilege.

HasRestrictions=true, RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId
- `streamId`: ClubStreamId

### C_Club.DestroyTicket -- Check canDestroyTicket privilege.

HasRestrictions=true, RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId
- `ticketId`: string

### C_Club.DoesAnyCommunityHaveUnreadMessages

RequiresClubsInitialized=true

Returns:

- `hasUnreadMessages`: bool

### C_Club.DoesCommunityHaveMembersOfTheOppositeFaction

RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId

Returns:

- `hasMembersOfOppositeFaction`: bool

### C_Club.EditClub -- nil arguments will not change existing club data

HasRestrictions=true, RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId
- `name`: string?
- `shortName`: string?
- `description`: string?
- `avatarId`: number?
- `broadcast`: string?
- `crossFaction`: bool?

### C_Club.EditMessage

HasRestrictions=true, RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId
- `streamId`: ClubStreamId
- `messageId`: ClubMessageIdentifier
- `message`: string

### C_Club.EditStream -- Check the canSetStreamName, canSetStreamSubject, canSetStreamAccess privileges. nil arguments will not change existing stream data.

HasRestrictions=true, RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId
- `streamId`: ClubStreamId
- `name`: string?
- `subject`: string?
- `leadersAndModeratorsOnly`: bool?

### C_Club.Flush

RequiresClubsInitialized=true

### C_Club.FocusCommunityStreams

RequiresClubsInitialized=true

### C_Club.FocusMembers

RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId

### C_Club.FocusStream

RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId
- `streamId`: ClubStreamId

Returns:

- `focused`: bool

### C_Club.GetAssignableRoles

RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId
- `memberId`: ClubMemberOpaqueId

Returns:

- `assignableRoles`: table<ClubRoleIdentifier>

### C_Club.GetAvatarIdList -- listen for AVATAR_LIST_UPDATED event. This can happen if we haven't downloaded the battle.net avatar list yet

RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubType`: ClubType

Returns:

- `avatarIds`: table<number>?

### C_Club.GetClubCapacity

RequiresClubsInitialized=true

Returns:

- `capacity`: number

### C_Club.GetClubInfo

RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted, SecretInChatMessagingLockdown=true

Arguments:

- `clubId`: ClubId

Returns:

- `info`: ClubInfo?

### C_Club.GetClubLimits

RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubType`: ClubType

Returns:

- `clubLimits`: ClubLimits

### C_Club.GetClubMembers

RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted, SecretInChatMessagingLockdown=true

Arguments:

- `clubId`: ClubId
- `streamId`: ClubStreamId?

Returns:

- `members`: table<ClubMemberOpaqueId>

### C_Club.GetClubPrivileges -- The privileges for the logged in user for this club

RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId

Returns:

- `privilegeInfo`: ClubPrivilegeInfo

### C_Club.GetClubStreamNotificationSettings

RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId

Returns:

- `settings`: table<ClubStreamNotificationSetting>

### C_Club.GetCommunityNameResultText

RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `result`: ValidateNameResult

Returns:

- `errorCode`: cstring?

### C_Club.GetGuildClubId

RequiresClubsInitialized=true

Returns:

- `guildClubId`: ClubId?

### C_Club.GetInfoFromLastCommunityChatLine

MayReturnNothing=true, RequiresClubsInitialized=true, SecretInChatMessagingLockdown=true

Returns:

- `messageInfo`: ClubMessageInfo
- `clubId`: ClubId
- `streamId`: ClubStreamId
- `clubType`: ClubType

### C_Club.GetInvitationCandidates -- Returns a list of players that you can send a request to a Battle.net club. Returns an empty list for Character based clubs

RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `filter`: string?
- `maxResults`: number?
- `cursorPosition`: number?
- `allowFullMatch`: bool?
- `clubId`: ClubId

Returns:

- `candidates`: table<ClubInvitationCandidateInfo>

### C_Club.GetInvitationInfo -- Get info about a specific club the active player has been invited to.

RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId

Returns:

- `invitation`: ClubSelfInvitationInfo?

### C_Club.GetInvitationsForClub -- Get the pending invitations for this club. Call RequestInvitationsForClub() to retrieve invitations from server.

RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId

Returns:

- `invitations`: table<ClubInvitationInfo>

### C_Club.GetInvitationsForSelf -- These are the clubs the active player has been invited to.

RequiresClubsInitialized=true

Returns:

- `invitations`: table<ClubSelfInvitationInfo>

### C_Club.GetLastTicketResponse

HasRestrictions=true, MayReturnNothing=true, RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `ticket`: string

Returns:

- `error`: ClubErrorType
- `info`: ClubInfo?
- `showError`: bool

### C_Club.GetMemberInfo

RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted, SecretInChatMessagingLockdown=true

Arguments:

- `clubId`: ClubId
- `memberId`: ClubMemberOpaqueId

Returns:

- `info`: ClubMemberInfo?

### C_Club.GetMemberInfoForSelf -- Info for the logged in user for this club

RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId

Returns:

- `info`: ClubMemberInfo?

### C_Club.GetMessageInfo -- Get info about a particular message.

RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted, SecretInChatMessagingLockdown=true

Arguments:

- `clubId`: ClubId
- `streamId`: ClubStreamId
- `messageId`: ClubMessageIdentifier

Returns:

- `message`: ClubMessageInfo?

### C_Club.GetMessageRanges -- Get the ranges of the messages currently downloaded.

RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted, SecretInChatMessagingLockdown=true

Arguments:

- `clubId`: ClubId
- `streamId`: ClubStreamId

Returns:

- `ranges`: table<ClubMessageRange>

### C_Club.GetMessagesBefore -- Get downloaded messages before (and including) the specified messageId limited by count. These are filtered by ignored players

RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted, SecretInChatMessagingLockdown=true

Arguments:

- `clubId`: ClubId
- `streamId`: ClubStreamId
- `newest`: ClubMessageIdentifier
- `count`: number

Returns:

- `messages`: table<ClubMessageInfo>

### C_Club.GetMessagesInRange -- Get downloaded messages in the given range. These are filtered by ignored players

RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted, SecretInChatMessagingLockdown=true

Arguments:

- `clubId`: ClubId
- `streamId`: ClubStreamId
- `oldest`: ClubMessageIdentifier
- `newest`: ClubMessageIdentifier

Returns:

- `messages`: table<ClubMessageInfo>

### C_Club.GetStreamInfo

RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted, SecretInChatMessagingLockdown=true

Arguments:

- `clubId`: ClubId
- `streamId`: ClubStreamId

Returns:

- `streamInfo`: ClubStreamInfo?

### C_Club.GetStreamViewMarker

RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId
- `streamId`: ClubStreamId

Returns:

- `lastReadTime`: BigUInteger? -- nil if stream view is at current

### C_Club.GetStreams

RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted, SecretInChatMessagingLockdown=true

Arguments:

- `clubId`: ClubId

Returns:

- `streams`: table<ClubStreamInfo>

### C_Club.GetSubscribedClubs

RequiresClubsInitialized=true, SecretInChatMessagingLockdown=true

Returns:

- `clubs`: table<ClubInfo>

### C_Club.GetTickets -- Get the existing tickets for this club. Call RequestTickets() to retrieve tickets from server.

RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId

Returns:

- `tickets`: table<ClubTicketInfo>

### C_Club.IsAccountMuted

RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId

Returns:

- `accountMuted`: bool

### C_Club.IsBeginningOfStream -- Returns whether the given message is the first message in the stream, taking into account ignored messages

RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted, SecretInChatMessagingLockdown=true

Arguments:

- `clubId`: ClubId
- `streamId`: ClubStreamId
- `messageId`: ClubMessageIdentifier

Returns:

- `isBeginningOfStream`: bool

### C_Club.IsEnabled

RequiresClubsInitialized=true

Returns:

- `clubsEnabled`: bool

### C_Club.IsRestricted

RequiresClubsInitialized=true

Returns:

- `restrictionReason`: ClubRestrictionReason

### C_Club.IsSubscribedToStream

RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId
- `streamId`: ClubStreamId

Returns:

- `subscribed`: bool

### C_Club.KickMember -- Check kickableRoleIds privilege.

HasRestrictions=true, RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId
- `memberId`: ClubMemberOpaqueId

### C_Club.LeaveClub

HasRestrictions=true, RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId

### C_Club.RedeemTicket

HasRestrictions=true, RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `ticketId`: string

### C_Club.RequestInvitationsForClub -- Request invitations for this club from server. Check canGetInvitation privilege.

RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId

### C_Club.RequestMoreMessagesBefore -- Call this when the user scrolls near the top of the message view, and more need to be displayed. The history will be downloaded backwards (newest to oldest).

RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted, SecretInChatMessagingLockdown=true

Arguments:

- `clubId`: ClubId
- `streamId`: ClubStreamId
- `messageId`: ClubMessageIdentifier?
- `count`: number?

Returns:

- `alreadyHasMessages`: bool

### C_Club.RequestTicket

RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `ticketId`: string

### C_Club.RequestTickets -- Request tickets from server. Check canGetTicket privilege.

RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId

### C_Club.RevokeInvitation -- Check canRevokeOwnInvitation or canRevokeOtherInvitation

HasRestrictions=true, RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId
- `memberId`: ClubMemberOpaqueId

### C_Club.SendBattleTagFriendRequest

RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `guildClubId`: ClubId
- `memberId`: ClubMemberOpaqueId

### C_Club.SendCharacterInvitation

HasRestrictions=true, RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId
- `character`: string

### C_Club.SendInvitation -- Check the canSendInvitation privilege.

HasRestrictions=true, RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId
- `memberId`: ClubMemberOpaqueId

### C_Club.SendMessage

HasRestrictions=true, RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId
- `streamId`: ClubStreamId
- `message`: string

### C_Club.SendTitleFriendRequest

HasRestrictions=true, RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `guildClubId`: ClubId
- `memberId`: ClubMemberOpaqueId

### C_Club.SetAutoAdvanceStreamViewMarker -- Only one stream can be set for auto-advance at a time. Focused streams will have their view times advanced automatically.

RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId
- `streamId`: ClubStreamId

### C_Club.SetAvatarTexture

HasRestrictions=true, RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `texture`: SimpleTexture
- `avatarId`: number
- `clubType`: ClubType

### C_Club.SetClubMemberNote -- Check the canSetOwnMemberNote and canSetOtherMemberNote privileges.

HasRestrictions=true, RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId
- `memberId`: ClubMemberOpaqueId
- `note`: string

### C_Club.SetClubPresenceSubscription -- You can only be subscribed to 0 or 1 clubs for presence.  Subscribing to a new club automatically unsuscribes you to existing subscription.

RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId

### C_Club.SetClubStreamNotificationSettings

RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId
- `settings`: table<ClubStreamNotificationSetting>

### C_Club.SetCommunityID

RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `communityID`: BigUInteger

### C_Club.SetFavorite

RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId
- `isFavorite`: bool

### C_Club.SetSocialQueueingEnabled

RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId
- `enabled`: bool

### C_Club.ShouldAllowClubType

RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubType`: ClubType

Returns:

- `clubTypeIsAllowed`: bool

### C_Club.UnfocusAllStreams

RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `unsubscribe`: bool

### C_Club.UnfocusMembers

RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId

### C_Club.UnfocusStream

RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId
- `streamId`: ClubStreamId

### C_Club.ValidateText

RequiresClubsInitialized=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `clubType`: ClubType
- `text`: string
- `clubFieldType`: ClubFieldType

Returns:

- `result`: ValidateNameResult

## Events

### AVATAR_LIST_UPDATED

SynchronousEvent=true

Payload:

- `clubType`: ClubType

### CLUB_ADDED

SynchronousEvent=true

Payload:

- `clubId`: ClubId

### CLUB_ERROR

SynchronousEvent=true

Payload:

- `action`: ClubActionType
- `error`: ClubErrorType
- `clubType`: ClubType

### CLUB_INVITATION_ADDED_FOR_SELF

SynchronousEvent=true

Payload:

- `invitation`: ClubSelfInvitationInfo

### CLUB_INVITATION_REMOVED_FOR_SELF

SynchronousEvent=true

Payload:

- `invitationId`: ClubInvitationId

### CLUB_INVITATIONS_RECEIVED_FOR_CLUB

SynchronousEvent=true

Payload:

- `clubId`: ClubId

### CLUB_MEMBER_ADDED

SynchronousEvent=true

Payload:

- `clubId`: ClubId
- `memberId`: ClubMemberOpaqueId

### CLUB_MEMBER_PRESENCE_UPDATED

SynchronousEvent=true

Payload:

- `clubId`: ClubId
- `memberId`: ClubMemberOpaqueId
- `presence`: ClubMemberPresence

### CLUB_MEMBER_REMOVED

SynchronousEvent=true

Payload:

- `clubId`: ClubId
- `memberId`: ClubMemberOpaqueId

### CLUB_MEMBER_ROLE_UPDATED

SynchronousEvent=true

Payload:

- `clubId`: ClubId
- `memberId`: ClubMemberOpaqueId
- `roleId`: number

### CLUB_MEMBER_UPDATED

SynchronousEvent=true

Payload:

- `clubId`: ClubId
- `memberId`: ClubMemberOpaqueId

### CLUB_MEMBERS_UPDATED

UniqueEvent=true

Payload:

- `clubId`: ClubId

### CLUB_MESSAGE_ADDED

SynchronousEvent=true

Payload:

- `clubId`: ClubId
- `streamId`: ClubStreamId
- `messageId`: ClubMessageIdentifier

### CLUB_MESSAGE_HISTORY_RECEIVED

SynchronousEvent=true

Payload:

- `clubId`: ClubId
- `streamId`: ClubStreamId
- `downloadedRange`: ClubMessageRange -- Range of history messages received.
- `contiguousRange`: ClubMessageRange -- Range of contiguous messages that the received messages are in.

### CLUB_MESSAGE_UPDATED

SynchronousEvent=true

Payload:

- `clubId`: ClubId
- `streamId`: ClubStreamId
- `messageId`: ClubMessageIdentifier

### CLUB_REMOVED

SynchronousEvent=true

Payload:

- `clubId`: ClubId

### CLUB_REMOVED_MESSAGE

SynchronousEvent=true

Payload:

- `clubName`: string
- `clubRemovedReason`: ClubRemovedReason

### CLUB_SELF_MEMBER_ROLE_UPDATED

SynchronousEvent=true

Payload:

- `clubId`: ClubId
- `roleId`: number

### CLUB_STREAM_ADDED

SynchronousEvent=true, UniqueEvent=true

Payload:

- `clubId`: ClubId
- `streamId`: ClubStreamId

### CLUB_STREAM_REMOVED

SynchronousEvent=true, UniqueEvent=true

Payload:

- `clubId`: ClubId
- `streamId`: ClubStreamId

### CLUB_STREAM_SUBSCRIBED

SynchronousEvent=true

Payload:

- `clubId`: ClubId
- `streamId`: ClubStreamId

### CLUB_STREAM_UNSUBSCRIBED

SynchronousEvent=true

Payload:

- `clubId`: ClubId
- `streamId`: ClubStreamId

### CLUB_STREAM_UPDATED

SynchronousEvent=true, UniqueEvent=true

Payload:

- `clubId`: ClubId
- `streamId`: ClubStreamId

### CLUB_STREAMS_LOADED

SynchronousEvent=true

Payload:

- `clubId`: ClubId

### CLUB_TICKET_CREATED

SynchronousEvent=true

Payload:

- `clubId`: ClubId
- `ticketInfo`: ClubTicketInfo

### CLUB_TICKET_RECEIVED

SynchronousEvent=true

Payload:

- `ticket`: string

### CLUB_TICKETS_RECEIVED

SynchronousEvent=true

Payload:

- `clubId`: ClubId

### CLUB_UPDATED

SynchronousEvent=true

Payload:

- `clubId`: ClubId

### INITIAL_CLUBS_LOADED

SynchronousEvent=true

### STREAM_VIEW_MARKER_UPDATED

SynchronousEvent=true, UniqueEvent=true

Payload:

- `clubId`: ClubId
- `streamId`: ClubStreamId
- `lastReadTime`: BigUInteger? -- nil if stream view is at current

## Tables

### ClubActionType

MaxValue=26, MinValue=0, NumValues=27

Fields:

- `ErrorClubActionSubscribe`: ClubActionType [= 0]
- `ErrorClubActionCreate`: ClubActionType [= 1]
- `ErrorClubActionEdit`: ClubActionType [= 2]
- `ErrorClubActionDestroy`: ClubActionType [= 3]
- `ErrorClubActionLeave`: ClubActionType [= 4]
- `ErrorClubActionCreateTicket`: ClubActionType [= 5]
- `ErrorClubActionDestroyTicket`: ClubActionType [= 6]
- `ErrorClubActionRedeemTicket`: ClubActionType [= 7]
- `ErrorClubActionGetTicket`: ClubActionType [= 8]
- `ErrorClubActionGetTickets`: ClubActionType [= 9]
- `ErrorClubActionGetBans`: ClubActionType [= 10]
- `ErrorClubActionGetInvitations`: ClubActionType [= 11]
- `ErrorClubActionRevokeInvitation`: ClubActionType [= 12]
- `ErrorClubActionAcceptInvitation`: ClubActionType [= 13]
- `ErrorClubActionDeclineInvitation`: ClubActionType [= 14]
- `ErrorClubActionCreateStream`: ClubActionType [= 15]
- `ErrorClubActionEditStream`: ClubActionType [= 16]
- `ErrorClubActionDestroyStream`: ClubActionType [= 17]
- `ErrorClubActionInviteMember`: ClubActionType [= 18]
- `ErrorClubActionEditMember`: ClubActionType [= 19]
- `ErrorClubActionEditMemberNote`: ClubActionType [= 20]
- `ErrorClubActionKickMember`: ClubActionType [= 21]
- `ErrorClubActionAddBan`: ClubActionType [= 22]
- `ErrorClubActionRemoveBan`: ClubActionType [= 23]
- `ErrorClubActionCreateMessage`: ClubActionType [= 24]
- `ErrorClubActionEditMessage`: ClubActionType [= 25]
- `ErrorClubActionDestroyMessage`: ClubActionType [= 26]

### ClubErrorType

MaxValue=41, MinValue=0, NumValues=42

Fields:

- `ErrorCommunitiesNone`: ClubErrorType [= 0]
- `ErrorCommunitiesUnknown`: ClubErrorType [= 1]
- `ErrorCommunitiesNeutralFaction`: ClubErrorType [= 2]
- `ErrorCommunitiesUnknownRealm`: ClubErrorType [= 3]
- `ErrorCommunitiesBadTarget`: ClubErrorType [= 4]
- `ErrorCommunitiesWrongFaction`: ClubErrorType [= 5]
- `ErrorCommunitiesRestricted`: ClubErrorType [= 6]
- `ErrorCommunitiesIgnored`: ClubErrorType [= 7]
- `ErrorCommunitiesGuild`: ClubErrorType [= 8]
- `ErrorCommunitiesWrongRegion`: ClubErrorType [= 9]
- `ErrorCommunitiesUnknownTicket`: ClubErrorType [= 10]
- `ErrorCommunitiesMissingShortName`: ClubErrorType [= 11]
- `ErrorCommunitiesProfanity`: ClubErrorType [= 12]
- `ErrorCommunitiesTrial`: ClubErrorType [= 13]
- `ErrorCommunitiesVeteranTrial`: ClubErrorType [= 14]
- `ErrorCommunitiesChatMute`: ClubErrorType [= 15]
- `ErrorClubFull`: ClubErrorType [= 16]
- `ErrorClubNoClub`: ClubErrorType [= 17]
- `ErrorClubNotMember`: ClubErrorType [= 18]
- `ErrorClubAlreadyMember`: ClubErrorType [= 19]
- `ErrorClubNoSuchMember`: ClubErrorType [= 20]
- `ErrorClubNoSuchInvitation`: ClubErrorType [= 21]
- `ErrorClubInvitationAlreadyExists`: ClubErrorType [= 22]
- `ErrorClubInvalidRoleID`: ClubErrorType [= 23]
- `ErrorClubInsufficientPrivileges`: ClubErrorType [= 24]
- `ErrorClubTooManyClubsJoined`: ClubErrorType [= 25]
- `ErrorClubVoiceFull`: ClubErrorType [= 26]
- `ErrorClubStreamNoStream`: ClubErrorType [= 27]
- `ErrorClubStreamInvalidName`: ClubErrorType [= 28]
- `ErrorClubStreamCountAtMin`: ClubErrorType [= 29]
- `ErrorClubStreamCountAtMax`: ClubErrorType [= 30]
- `ErrorClubMemberHasRequiredRole`: ClubErrorType [= 31]
- `ErrorClubSentInvitationCountAtMax`: ClubErrorType [= 32]
- `ErrorClubReceivedInvitationCountAtMax`: ClubErrorType [= 33]
- `ErrorClubTargetIsBanned`: ClubErrorType [= 34]
- `ErrorClubBanAlreadyExists`: ClubErrorType [= 35]
- `ErrorClubBanCountAtMax`: ClubErrorType [= 36]
- `ErrorClubTicketCountAtMax`: ClubErrorType [= 37]
- `ErrorClubTicketNoSuchTicket`: ClubErrorType [= 38]
- `ErrorClubTicketHasConsumedAllowedRedeemCount`: ClubErrorType [= 39]
- `ErrorClubDoesntAllowCrossFaction`: ClubErrorType [= 40]
- `ErrorClubEditHasCrossFactionMembers`: ClubErrorType [= 41]

### ClubFieldType

MaxValue=6, MinValue=0, NumValues=7

Fields:

- `ClubName`: ClubFieldType [= 0]
- `ClubShortName`: ClubFieldType [= 1]
- `ClubDescription`: ClubFieldType [= 2]
- `ClubBroadcast`: ClubFieldType [= 3]
- `ClubStreamName`: ClubFieldType [= 4]
- `ClubStreamSubject`: ClubFieldType [= 5]
- `NumTypes`: ClubFieldType [= 6]

### ClubInvitationCandidateStatus

MaxValue=2, MinValue=0, NumValues=3

Fields:

- `Available`: ClubInvitationCandidateStatus [= 0]
- `InvitePending`: ClubInvitationCandidateStatus [= 1]
- `AlreadyMember`: ClubInvitationCandidateStatus [= 2]

### ClubMemberPresence

MaxValue=5, MinValue=0, NumValues=6

Fields:

- `Unknown`: ClubMemberPresence [= 0]
- `Online`: ClubMemberPresence [= 1]
- `OnlineMobile`: ClubMemberPresence [= 2]
- `Offline`: ClubMemberPresence [= 3]
- `Away`: ClubMemberPresence [= 4]
- `Busy`: ClubMemberPresence [= 5]

### ClubRemovedReason

MaxValue=3, MinValue=0, NumValues=4

Fields:

- `None`: ClubRemovedReason [= 0]
- `Banned`: ClubRemovedReason [= 1]
- `Removed`: ClubRemovedReason [= 2]
- `ClubDestroyed`: ClubRemovedReason [= 3]

### ClubRestrictionReason

MaxValue=1, MinValue=0, NumValues=2

Fields:

- `None`: ClubRestrictionReason [= 0]
- `Unavailable`: ClubRestrictionReason [= 1]

### ClubStreamNotificationFilter

MaxValue=2, MinValue=0, NumValues=3

Fields:

- `None`: ClubStreamNotificationFilter [= 0]
- `Mention`: ClubStreamNotificationFilter [= 1]
- `All`: ClubStreamNotificationFilter [= 2]

### ClubStreamType

MaxValue=4, MinValue=0, NumValues=5

Fields:

- `General`: ClubStreamType [= 0]
- `Guild`: ClubStreamType [= 1]
- `Officer`: ClubStreamType [= 2]
- `Discord`: ClubStreamType [= 3]
- `Other`: ClubStreamType [= 4]

### ClubType

MaxValue=3, MinValue=0, NumValues=4

Fields:

- `BattleNet`: ClubType [= 0]
- `Character`: ClubType [= 1]
- `Guild`: ClubType [= 2]
- `Other`: ClubType [= 3]

### ClubInfo

Fields:

- `clubId`: ClubId [NeverSecret=true]
- `name`: string
- `shortName`: string?
- `description`: string
- `broadcast`: string
- `clubType`: ClubType [NeverSecret=true]
- `avatarId`: number
- `memberCount`: number? [NeverSecret=true]
- `favoriteTimeStamp`: BigUInteger?
- `joinTime`: BigUInteger?
- `socialQueueingEnabled`: bool?
- `crossFaction`: bool?

### ClubInvitationCandidateInfo

Fields:

- `memberId`: ClubMemberOpaqueId
- `name`: string
- `priority`: luaIndex
- `status`: ClubInvitationCandidateStatus

### ClubInvitationInfo

Fields:

- `invitationId`: ClubInvitationId
- `isMyInvitation`: bool
- `invitee`: ClubMemberInfo

### ClubLimits

Fields:

- `maximumNumberOfStreams`: number

### ClubMemberInfo

Fields:

- `isSelf`: bool [NeverSecret=true]
- `memberId`: ClubMemberOpaqueId
- `name`: string? -- name may be encoded as a Kstring
- `role`: ClubRoleIdentifier?
- `presence`: ClubMemberPresence
- `clubType`: ClubType?
- `guid`: WOWGUID?
- `bnetAccountId`: number?
- `memberNote`: string?
- `officerNote`: string?
- `classID`: number?
- `race`: number?
- `level`: number?
- `zone`: string?
- `achievementPoints`: number?
- `profession1ID`: number?
- `profession1Rank`: number?
- `profession1Name`: string?
- `profession2ID`: number?
- `profession2Rank`: number?
- `profession2Name`: string?
- `lastOnlineYear`: number?
- `lastOnlineMonth`: number?
- `lastOnlineDay`: number?
- `lastOnlineHour`: number?
- `guildRank`: string?
- `guildRankOrder`: luaIndex?
- `isRemoteChat`: bool?
- `overallDungeonScore`: number?
- `faction`: PvPFaction? [NeverSecret=true]
- `timerunningSeasonID`: number?
- `discordInfo`: DiscordChatInfo?

### ClubMessageIdentifier

Fields:

- `epoch`: BigUInteger -- number of microseconds since the UNIX epoch.
- `position`: BigUInteger -- sort order for messages at the same time

### ClubMessageInfo

Fields:

- `messageId`: ClubMessageIdentifier
- `content`: kstringClubMessage
- `author`: ClubMemberInfo
- `destroyer`: ClubMemberInfo? -- May be nil even if the message has been destroyed
- `destroyed`: bool
- `edited`: bool

### ClubMessageRange

Fields:

- `oldestMessageId`: ClubMessageIdentifier
- `newestMessageId`: ClubMessageIdentifier

### ClubPrivilegeInfo

Fields:

- `canDestroy`: bool
- `canSetAttribute`: bool
- `canSetName`: bool
- `canSetDescription`: bool
- `canSetAvatar`: bool
- `canSetBroadcast`: bool
- `canSetPrivacyLevel`: bool
- `canSetOwnMemberAttribute`: bool
- `canSetOtherMemberAttribute`: bool
- `canSetOwnMemberNote`: bool
- `canSetOtherMemberNote`: bool
- `canSetOwnVoiceState`: bool
- `canSetOwnPresenceLevel`: bool
- `canUseVoice`: bool
- `canVoiceMuteMemberForAll`: bool
- `canGetInvitation`: bool
- `canSendInvitation`: bool
- `canSendGuestInvitation`: bool
- `canRevokeOwnInvitation`: bool
- `canRevokeOtherInvitation`: bool
- `canGetBan`: bool
- `canGetSuggestion`: bool
- `canSuggestMember`: bool
- `canGetTicket`: bool
- `canCreateTicket`: bool
- `canDestroyTicket`: bool
- `canAddBan`: bool
- `canRemoveBan`: bool
- `canCreateStream`: bool
- `canDestroyStream`: bool
- `canSetStreamPosition`: bool
- `canSetStreamAttribute`: bool
- `canSetStreamName`: bool
- `canSetStreamSubject`: bool
- `canSetStreamAccess`: bool
- `canSetStreamVoiceLevel`: bool
- `canCreateMessage`: bool
- `canDestroyOwnMessage`: bool
- `canDestroyOtherMessage`: bool
- `canEditOwnMessage`: bool
- `canPinMessage`: bool
- `kickableRoleIds`: table<number> -- Roles that can be kicked and banned

### ClubRoleInfo

Fields:

- `roleId`: number
- `name`: string
- `required`: bool -- At least one user must be in this role
- `unique`: bool -- At most one user can be in this role

### ClubSelfInvitationInfo

Fields:

- `invitationId`: ClubInvitationId
- `club`: ClubInfo
- `inviter`: ClubMemberInfo
- `leaders`: table<ClubMemberInfo>

### ClubStreamInfo

Fields:

- `streamId`: ClubStreamId
- `name`: string
- `subject`: string
- `leadersAndModeratorsOnly`: bool
- `streamType`: ClubStreamType [NeverSecret=true]
- `creationTime`: BigUInteger

### ClubStreamNotificationSetting

Fields:

- `streamId`: ClubStreamId
- `filter`: ClubStreamNotificationFilter

### ClubTicketInfo

Fields:

- `ticketId`: string
- `allowedRedeemCount`: number
- `currentRedeemCount`: number
- `creationTime`: BigUInteger -- Creation time in microseconds since the UNIX epoch.
- `expirationTime`: BigUInteger -- Expiration time in microseconds since the UNIX epoch.
- `defaultStreamId`: ClubStreamId?
- `creator`: ClubMemberInfo
