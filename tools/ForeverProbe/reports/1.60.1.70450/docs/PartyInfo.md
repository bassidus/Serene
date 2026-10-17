# PartyInfo

Namespace `C_PartyInfo`.

Environment=All, Predicates={1={FailureMode=ReturnNothing, Name=RequiresValidInviteTarget, Type=Precondition}}

## Functions

### C_PartyInfo.AllowedToDoPartyConversion

SecretArguments=AllowedWhenUntainted

Arguments:

- `toRaid`: bool

Returns:

- `allowed`: bool

### C_PartyInfo.CanFormCrossFactionParties

Returns:

- `canFormCrossFactionParties`: bool

### C_PartyInfo.CanInvite

Returns:

- `allowedToInvite`: bool

### C_PartyInfo.CanStartInstanceAbandonVote -- Returns whether it's possible to start a vote at this time

Returns:

- `canStart`: bool

### C_PartyInfo.ChallengeModeRestrictionsActive

Returns:

- `restrictionsActive`: bool

### C_PartyInfo.ConfirmConvertToRaid -- Immediately convert to raid with no regard for potentially destructive actions.

HasRestrictions=true

### C_PartyInfo.ConfirmInviteTravelPass

SecretArguments=AllowedWhenUntainted

Arguments:

- `targetName`: cstring
- `targetGUID`: WOWGUID

### C_PartyInfo.ConfirmInviteUnit -- Immediately invites the named unit to a party, with no regard for potentially destructive actions.

RequiresValidInviteTarget=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `targetName`: cstring

### C_PartyInfo.ConfirmLeaveParty -- Immediately leave the party with no regard for potentially destructive actions

SecretArguments=AllowedWhenUntainted

Arguments:

- `category`: luaIndex?

### C_PartyInfo.ConfirmReadyCheck

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `isReady`: bool

### C_PartyInfo.ConfirmRequestInviteFromUnit -- Immediately request an invite into the target party, this is the confirmation function to call after RequestInviteFromUnit, or if you would like to skip the confirmation process.

RequiresValidInviteTarget=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `targetName`: cstring
- `tank`: bool?
- `healer`: bool?
- `dps`: bool?

### C_PartyInfo.ConvertToParty

HasRestrictions=true

### C_PartyInfo.ConvertToRaid -- Usually this will convert to raid immediately. In some cases (e.g. PartySync) the user will be prompted to confirm converting to raid, because it's potentially destructive.

HasRestrictions=true

### C_PartyInfo.DelveTeleportOut

### C_PartyInfo.DemoteAssistant

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: cstring
- `exactNameMatch`: bool?

### C_PartyInfo.DoCountdown

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `seconds`: number

Returns:

- `success`: bool

### C_PartyInfo.DoReadyCheck

HasRestrictions=true

### C_PartyInfo.GetActiveCategories

MayReturnNothing=true

Returns:

- `categories`: table<number>

### C_PartyInfo.GetAvailableLootMethods

Returns:

- `methods`: table<LootMethod>

### C_PartyInfo.GetInstanceAbandonShutdownTime -- Returns the total duration of the shutdown time after a vote passes and how much time is left before it ends

Returns:

- `durationSeconds`: number [default=0]
- `timeLeftSeconds`: number [default=0]

### C_PartyInfo.GetInstanceAbandonVoteCooldownTime -- Returns the total duration of the abandon vote cooldown and how much time is left before it ends

MayReturnNothing=true

Returns:

- `durationSeconds`: number [default=0]
- `timeLeftSeconds`: number [default=0]

### C_PartyInfo.GetInstanceAbandonVoteRequirements -- Returns values controlling the vote

Returns:

- `votesRequired`: number [default=0]
- `keystoneOwnerVoteWeight`: number [default=0]

### C_PartyInfo.GetInstanceAbandonVoteResponse -- Returns how the player voted, nil for not yet

Returns:

- `response`: bool?

### C_PartyInfo.GetInstanceAbandonVoteTime -- Returns the total duration of the vote and how much time is left before it ends

Returns:

- `durationSeconds`: number [default=0]
- `timeLeftSeconds`: number [default=0]

### C_PartyInfo.GetInviteConfirmationInvalidQueues

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `inviteGUID`: WOWGUID

Returns:

- `invalidQueues`: table<QueueSpecificInfo>

### C_PartyInfo.GetInviteReferralInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `inviteGUID`: WOWGUID

Returns:

- `outReferredByGuid`: WOWGUID
- `outReferredByName`: cstring
- `outRelationType`: PartyRequestJoinRelation
- `outIsQuickJoin`: bool
- `outClubId`: ClubId

### C_PartyInfo.GetLootMethod

Returns:

- `method`: LootMethod
- `masterLootPartyID`: number?
- `masterLooterRaidID`: number?

### C_PartyInfo.GetLootMethodStyle

Returns:

- `methodStyle`: LootMethodStyles

### C_PartyInfo.GetMinItemLevel

SecretArguments=AllowedWhenUntainted

Arguments:

- `avgItemLevelCategory`: AvgItemLevelCategories -- The active party is always used

Returns:

- `minItemLevel`: number
- `playerNameWithLowestItemLevel`: cstring

### C_PartyInfo.GetMinLevel

SecretArguments=AllowedWhenUntainted

Arguments:

- `category`: luaIndex? -- If not provided, the active party is used

Returns:

- `minLevel`: number

### C_PartyInfo.GetNumInstanceAbandonGroupVoteResponses -- Returns how many players have voted either way

Returns:

- `count`: number

### C_PartyInfo.GetRestrictPings

Returns:

- `restrictTo`: RestrictPingsTo

### C_PartyInfo.InviteUnit -- Attempt to invite the named unit to a party, requires confirmation in some cases (e.g. the party will convert to a raid, or if there is a party sync in progress).

RequiresValidInviteTarget=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `targetName`: cstring

### C_PartyInfo.IsChallengeModeActive

Returns:

- `active`: bool

### C_PartyInfo.IsChallengeModeKeystoneOwner

Returns:

- `isKeystoneOwner`: bool

### C_PartyInfo.IsCrossFactionParty

SecretArguments=AllowedWhenUntainted

Arguments:

- `category`: luaIndex? -- If not provided, the active party is used

Returns:

- `isCrossFactionParty`: bool

### C_PartyInfo.IsDelveComplete

Returns:

- `isDelveComplete`: bool

### C_PartyInfo.IsDelveInProgress

Returns:

- `isDelveComplete`: bool

### C_PartyInfo.IsGUIDInGroup

SecretArguments=AllowedWhenUntainted

Arguments:

- `guid`: WOWGUID
- `category`: luaIndex? -- If not provided, the active party is used

Returns:

- `isInGroup`: bool

### C_PartyInfo.IsLootMethodAvailable

SecretArguments=AllowedWhenUntainted

Arguments:

- `method`: LootMethod

Returns:

- `available`: bool

### C_PartyInfo.IsPartyFull

SecretArguments=AllowedWhenUntainted

Arguments:

- `category`: luaIndex? -- If not provided, the active party is used

Returns:

- `isFull`: bool

### C_PartyInfo.IsPartyInJailersTower

Returns:

- `isPartyInJailersTower`: bool

### C_PartyInfo.IsPartyWalkIn

Returns:

- `isPartyWalkIn`: bool

### C_PartyInfo.LeaveParty -- Usually this will leave the party immediately. In some cases (e.g. PartySync) the user will be prompted to confirm leaving the party, because it's potentially destructive

SecretArguments=AllowedWhenUntainted

Arguments:

- `category`: luaIndex?

### C_PartyInfo.PromoteToAssistant

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: cstring
- `exactNameMatch`: bool?

### C_PartyInfo.PromoteToLeader

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: cstring
- `exactNameMatch`: bool?

### C_PartyInfo.RequestInviteFromUnit -- Attempt to request an invite into the target party, requires confirmation in some cases (e.g. there is a party sync in progress).

RequiresValidInviteTarget=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `targetName`: cstring
- `tank`: bool?
- `healer`: bool?
- `dps`: bool?

### C_PartyInfo.SetEveryoneIsAssistant

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `isAssistant`: bool

Returns:

- `updated`: bool

### C_PartyInfo.SetInstanceAbandonVoteResponse -- Vote on whether to abandon instance, true for yes, false for no

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `response`: bool

### C_PartyInfo.SetLootMethod

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `method`: LootMethod
- `lootMaster`: string?

Returns:

- `success`: bool

### C_PartyInfo.SetRestrictPings

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `restrictTo`: RestrictPingsTo

### C_PartyInfo.StartInstanceAbandonVote -- Start the vote

HasRestrictions=true

### C_PartyInfo.UninviteUnit

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: cstring
- `reason`: cstring?
- `exactNameMatch`: bool?

## Events

### BNET_REQUEST_INVITE_CONFIRMATION

SynchronousEvent=true

Payload:

- `gameAccountID`: number
- `questSessionActive`: bool
- `tank`: bool
- `healer`: bool
- `dps`: bool

### CONVERT_TO_RAID_CONFIRMATION

SynchronousEvent=true

### ENTERED_DIFFERENT_INSTANCE_FROM_PARTY

SynchronousEvent=true

### GROUP_FORMED

SynchronousEvent=true

Payload:

- `category`: number
- `partyGUID`: WOWGUID

### GROUP_INVITE_CONFIRMATION

SynchronousEvent=true

### GROUP_JOINED

SynchronousEvent=true

Payload:

- `category`: number
- `partyGUID`: WOWGUID

### GROUP_LEFT

SynchronousEvent=true

Payload:

- `category`: number
- `partyGUID`: WOWGUID

### GROUP_ROSTER_UPDATE

UniqueEvent=true

### INSTANCE_ABANDON_VOTE_FINISHED

SynchronousEvent=true

Payload:

- `votePassed`: bool

### INSTANCE_ABANDON_VOTE_STARTED

SynchronousEvent=true

### INSTANCE_ABANDON_VOTE_UPDATED

SynchronousEvent=true

### INSTANCE_BOOT_START

SynchronousEvent=true

### INSTANCE_BOOT_STOP

SynchronousEvent=true

### INSTANCE_GROUP_SIZE_CHANGED

SynchronousEvent=true

### INVITE_TO_PARTY_CONFIRMATION

SynchronousEvent=true

Payload:

- `targetName`: cstring
- `willConvertToRaid`: bool
- `questSessionActive`: bool

### INVITE_TRAVEL_PASS_CONFIRMATION

SynchronousEvent=true

Payload:

- `targetName`: cstring
- `targetGUID`: WOWGUID
- `willConvertToRaid`: bool
- `questSessionActive`: bool

### LEAVE_PARTY_CONFIRMATION

SynchronousEvent=true

Payload:

- `reason`: LeavePartyConfirmReason

### PARTY_INVITE_CANCEL

SynchronousEvent=true

### PARTY_INVITE_REQUEST

SynchronousEvent=true

Payload:

- `name`: cstring
- `isTank`: bool
- `isHealer`: bool
- `isDamage`: bool
- `isNativeRealm`: bool
- `allowMultipleRoles`: bool
- `inviterGUID`: WOWGUID
- `questSessionActive`: bool

### PARTY_LEADER_CHANGED

UniqueEvent=true

### PARTY_LFG_RESTRICTED

SynchronousEvent=true

### PARTY_LOOT_METHOD_CHANGED

UniqueEvent=true

### PARTY_MEMBER_DISABLE

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### PARTY_MEMBER_ENABLE

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### PLAYER_DIFFICULTY_CHANGED

SynchronousEvent=true

### PLAYER_ROLES_ASSIGNED

UniqueEvent=true

### RAID_ROSTER_UPDATE

SynchronousEvent=true

### READY_CHECK

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `initiatorName`: cstring
- `readyCheckTimeLeft`: time_t

### READY_CHECK_CONFIRM

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant
- `isReady`: bool

### READY_CHECK_FINISHED

SynchronousEvent=true

Payload:

- `preempted`: bool

### REQUEST_INVITE_CONFIRMATION

SynchronousEvent=true

Payload:

- `targetName`: cstring
- `partyLevelLink`: number
- `questSessionActive`: bool
- `tank`: bool?
- `healer`: bool?
- `dps`: bool?

### VOTE_KICK_REASON_NEEDED

SynchronousEvent=true

Payload:

- `name`: cstring
- `resultGUID`: WOWGUID

## Tables

### LeavePartyConfirmReason

MaxValue=1, MinValue=0, NumValues=2

Fields:

- `QuestSync`: LeavePartyConfirmReason [= 0]
- `RestrictedChallengeMode`: LeavePartyConfirmReason [= 1]
