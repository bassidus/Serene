# Calendar

Namespace `C_Calendar`.

Environment=All, Predicates={}

## Functions

### C_Calendar.AddEvent

HasRestrictions=true

### C_Calendar.AreNamesReady

Returns:

- `ready`: bool

### C_Calendar.CanAddEvent

Returns:

- `canAddEvent`: bool

### C_Calendar.CanSendInvite

Returns:

- `canSendInvite`: bool

### C_Calendar.CloseEvent

### C_Calendar.ContextMenuEventCanComplain

SecretArguments=AllowedWhenUntainted

Arguments:

- `offsetMonths`: number
- `monthDay`: luaIndex
- `eventIndex`: luaIndex

Returns:

- `canComplain`: bool

### C_Calendar.ContextMenuEventCanEdit

SecretArguments=AllowedWhenUntainted

Arguments:

- `offsetMonths`: number
- `monthDay`: luaIndex
- `eventIndex`: luaIndex

Returns:

- `canEdit`: bool

### C_Calendar.ContextMenuEventCanRemove

SecretArguments=AllowedWhenUntainted

Arguments:

- `offsetMonths`: number
- `monthDay`: luaIndex
- `eventIndex`: luaIndex

Returns:

- `canRemove`: bool

### C_Calendar.ContextMenuEventClipboard

Returns:

- `exists`: bool

### C_Calendar.ContextMenuEventCopy

### C_Calendar.ContextMenuEventGetCalendarType

Returns:

- `calendarType`: string?

### C_Calendar.ContextMenuEventPaste

SecretArguments=AllowedWhenUntainted

Arguments:

- `offsetMonths`: number
- `monthDay`: luaIndex

### C_Calendar.ContextMenuEventRemove

### C_Calendar.ContextMenuEventSignUp

### C_Calendar.ContextMenuGetEventIndex

MayReturnNothing=true

Returns:

- `info`: CalendarEventIndexInfo

### C_Calendar.ContextMenuInviteAvailable

### C_Calendar.ContextMenuInviteDecline

### C_Calendar.ContextMenuInviteRemove

### C_Calendar.ContextMenuInviteTentative

### C_Calendar.ContextMenuSelectEvent

SecretArguments=AllowedWhenUntainted

Arguments:

- `offsetMonths`: number
- `monthDay`: luaIndex
- `eventIndex`: luaIndex

### C_Calendar.CreateCommunitySignUpEvent

### C_Calendar.CreateGuildAnnouncementEvent

### C_Calendar.CreateGuildSignUpEvent

### C_Calendar.CreatePlayerEvent

### C_Calendar.EventAvailable

### C_Calendar.EventCanEdit

Returns:

- `canEdit`: bool

### C_Calendar.EventClearAutoApprove

### C_Calendar.EventClearLocked

### C_Calendar.EventClearModerator

SecretArguments=AllowedWhenUntainted

Arguments:

- `inviteIndex`: luaIndex

### C_Calendar.EventDecline

### C_Calendar.EventGetCalendarType

Returns:

- `calendarType`: string?

### C_Calendar.EventGetClubId

Returns:

- `info`: ClubId?

### C_Calendar.EventGetInvite

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted, SecretInChatMessagingLockdown=true

Arguments:

- `eventIndex`: luaIndex

Returns:

- `info`: CalendarEventInviteInfo

### C_Calendar.EventGetInviteResponseTime

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted, SecretInChatMessagingLockdown=true

Arguments:

- `eventIndex`: luaIndex

Returns:

- `time`: CalendarTime

### C_Calendar.EventGetInviteSortCriterion

Returns:

- `criterion`: string
- `reverse`: bool

### C_Calendar.EventGetSelectedInvite

Returns:

- `inviteIndex`: luaIndex?

### C_Calendar.EventGetStatusOptions

SecretArguments=AllowedWhenUntainted

Arguments:

- `eventIndex`: luaIndex

Returns:

- `options`: table<CalendarEventStatusOption>

### C_Calendar.EventGetTextures

SecretArguments=AllowedWhenUntainted

Arguments:

- `eventType`: CalendarEventType

Returns:

- `textures`: table<CalendarEventTextureInfo>

### C_Calendar.EventGetTypes

Returns:

- `types`: table<string>

### C_Calendar.EventGetTypesDisplayOrdered

Returns:

- `infos`: table<CalendarEventTypeDisplayInfo>

### C_Calendar.EventHasPendingInvite

Returns:

- `hasPendingInvite`: bool

### C_Calendar.EventHaveSettingsChanged

Returns:

- `haveSettingsChanged`: bool

### C_Calendar.EventInvite

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: cstring

### C_Calendar.EventRemoveInvite

SecretArguments=AllowedWhenUntainted

Arguments:

- `inviteIndex`: luaIndex

### C_Calendar.EventRemoveInviteByGuid

SecretArguments=AllowedWhenUntainted

Arguments:

- `guid`: WOWGUID

### C_Calendar.EventSelectInvite

SecretArguments=AllowedWhenUntainted

Arguments:

- `inviteIndex`: luaIndex

### C_Calendar.EventSetAutoApprove

### C_Calendar.EventSetClubId

SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId?

### C_Calendar.EventSetDate

SecretArguments=AllowedWhenUntainted

Arguments:

- `month`: luaIndex
- `monthDay`: luaIndex
- `year`: number

### C_Calendar.EventSetDescription

SecretArguments=AllowedWhenUntainted

Arguments:

- `description`: cstring

### C_Calendar.EventSetInviteStatus

SecretArguments=AllowedWhenUntainted

Arguments:

- `eventIndex`: luaIndex
- `status`: CalendarStatus

### C_Calendar.EventSetLocked

### C_Calendar.EventSetModerator

SecretArguments=AllowedWhenUntainted

Arguments:

- `inviteIndex`: luaIndex

### C_Calendar.EventSetTextureID

SecretArguments=AllowedWhenUntainted

Arguments:

- `textureIndex`: luaIndex

### C_Calendar.EventSetTime

SecretArguments=AllowedWhenUntainted

Arguments:

- `hour`: number
- `minute`: number

### C_Calendar.EventSetTitle

SecretArguments=AllowedWhenUntainted

Arguments:

- `title`: cstring

### C_Calendar.EventSetType

SecretArguments=AllowedWhenUntainted

Arguments:

- `typeIndex`: CalendarEventType

### C_Calendar.EventSignUp

### C_Calendar.EventSortInvites

SecretArguments=AllowedWhenUntainted

Arguments:

- `criterion`: cstring
- `reverse`: bool

### C_Calendar.EventTentative

### C_Calendar.GetClubCalendarEvents

SecretArguments=AllowedWhenUntainted, SecretInChatMessagingLockdown=true

Arguments:

- `clubId`: ClubId
- `startTime`: CalendarTime
- `endTime`: CalendarTime

Returns:

- `events`: table<CalendarDayEvent>

### C_Calendar.GetDayEvent

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted, SecretInChatMessagingLockdown=true

Arguments:

- `monthOffset`: number
- `monthDay`: luaIndex
- `index`: luaIndex

Returns:

- `event`: CalendarDayEvent

### C_Calendar.GetDefaultGuildFilter

Returns:

- `info`: CalendarGuildFilterInfo

### C_Calendar.GetEventIndex

MayReturnNothing=true

Returns:

- `info`: CalendarEventIndexInfo

### C_Calendar.GetEventIndexInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `eventID`: CalendarEventID
- `monthOffset`: number?
- `monthDay`: number?

Returns:

- `eventIndexInfo`: CalendarEventIndexInfo?

### C_Calendar.GetEventInfo

MayReturnNothing=true

Returns:

- `info`: CalendarEventInfo

### C_Calendar.GetFirstPendingInvite

SecretArguments=AllowedWhenUntainted

Arguments:

- `offsetMonths`: number
- `monthDay`: luaIndex

Returns:

- `firstPendingInvite`: luaIndex?

### C_Calendar.GetGuildEventInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex

Returns:

- `info`: CalendarGuildEventInfo

### C_Calendar.GetGuildEventSelectionInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex

Returns:

- `info`: CalendarEventIndexInfo

### C_Calendar.GetHolidayInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `monthOffset`: number
- `monthDay`: luaIndex
- `index`: luaIndex

Returns:

- `event`: CalendarHolidayInfo

### C_Calendar.GetMaxCreateDate

Returns:

- `maxCreateDate`: CalendarTime

### C_Calendar.GetMinDate

Returns:

- `minDate`: CalendarTime

### C_Calendar.GetMonthInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `offsetMonths`: number [default=0]

Returns:

- `monthInfo`: CalendarMonthInfo

### C_Calendar.GetNextClubId

Returns:

- `clubId`: ClubId?

### C_Calendar.GetNumDayEvents

SecretArguments=AllowedWhenUntainted

Arguments:

- `offsetMonths`: number
- `monthDay`: luaIndex

Returns:

- `numDayEvents`: number

### C_Calendar.GetNumGuildEvents

Returns:

- `numGuildEvents`: number

### C_Calendar.GetNumInvites

Returns:

- `num`: number

### C_Calendar.GetNumPendingInvites

Returns:

- `num`: number

### C_Calendar.GetRaidInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `offsetMonths`: number
- `monthDay`: luaIndex
- `eventIndex`: luaIndex

Returns:

- `info`: CalendarRaidInfo

### C_Calendar.IsActionPending

Returns:

- `actionPending`: bool

### C_Calendar.IsEventOpen

Returns:

- `isOpen`: bool

### C_Calendar.MassInviteCommunity

SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId
- `minLevel`: number
- `maxLevel`: number
- `maxRankOrder`: luaIndex?

### C_Calendar.MassInviteGuild

SecretArguments=AllowedWhenUntainted

Arguments:

- `minLevel`: number
- `maxLevel`: number
- `maxRankOrder`: luaIndex

### C_Calendar.OpenCalendar

### C_Calendar.OpenEvent

SecretArguments=AllowedWhenUntainted

Arguments:

- `offsetMonths`: number
- `monthDay`: luaIndex
- `index`: luaIndex

Returns:

- `success`: bool

### C_Calendar.RemoveEvent

### C_Calendar.SetAbsMonth

SecretArguments=AllowedWhenUntainted

Arguments:

- `month`: luaIndex
- `year`: number

### C_Calendar.SetMonth

SecretArguments=AllowedWhenUntainted

Arguments:

- `offsetMonths`: number

### C_Calendar.SetNextClubId

SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId?

### C_Calendar.UpdateEvent

HasRestrictions=true

## Events

### CALENDAR_ACTION_PENDING

SynchronousEvent=true

Payload:

- `pending`: bool

### CALENDAR_CLOSE_EVENT

SynchronousEvent=true

### CALENDAR_EVENT_ALARM

SynchronousEvent=true

Payload:

- `title`: cstring
- `hour`: number
- `minute`: number

### CALENDAR_NEW_EVENT

SynchronousEvent=true

Payload:

- `isCopy`: bool

### CALENDAR_OPEN_EVENT

SynchronousEvent=true

Payload:

- `calendarType`: cstring

### CALENDAR_UPDATE_ERROR

SynchronousEvent=true

Payload:

- `errorReason`: cstring

### CALENDAR_UPDATE_ERROR_WITH_COUNT

SynchronousEvent=true

Payload:

- `errorReason`: cstring
- `count`: number

### CALENDAR_UPDATE_ERROR_WITH_PLAYER_NAME

SynchronousEvent=true

Payload:

- `errorReason`: cstring
- `playerName`: cstring

### CALENDAR_UPDATE_EVENT

SynchronousEvent=true

### CALENDAR_UPDATE_EVENT_LIST

SynchronousEvent=true, UniqueEvent=true

### CALENDAR_UPDATE_GUILD_EVENTS

SynchronousEvent=true

### CALENDAR_UPDATE_INVITE_LIST

SynchronousEvent=true

Payload:

- `hasCompleteList`: bool?

### CALENDAR_UPDATE_PENDING_INVITES

SynchronousEvent=true

## Tables

### CalendarDayEvent

Fields:

- `eventID`: CalendarEventID
- `title`: string
- `isCustomTitle`: bool
- `startTime`: CalendarTime
- `endTime`: CalendarTime
- `calendarType`: cstring
- `sequenceType`: cstring
- `eventType`: CalendarEventType
- `iconTexture`: fileID?
- `modStatus`: cstring
- `inviteStatus`: CalendarStatus
- `invitedBy`: string
- `difficulty`: number
- `inviteType`: CalendarInviteType
- `sequenceIndex`: luaIndex
- `numSequenceDays`: number
- `difficultyName`: cstring
- `dontDisplayBanner`: bool
- `dontDisplayEnd`: bool
- `clubID`: ClubId
- `isLocked`: bool

### CalendarEventIndexInfo

Fields:

- `offsetMonths`: number
- `monthDay`: luaIndex
- `eventIndex`: luaIndex

### CalendarEventInfo

Fields:

- `title`: string
- `description`: string
- `creator`: string?
- `eventType`: CalendarEventType
- `repeatOption`: CalendarEventRepeatOptions
- `maxSize`: number
- `textureIndex`: luaIndex?
- `time`: CalendarTime
- `lockoutTime`: CalendarTime
- `isLocked`: bool
- `isAutoApprove`: bool
- `hasPendingInvite`: bool
- `inviteStatus`: CalendarStatus?
- `inviteType`: CalendarInviteType?
- `calendarType`: string
- `communityName`: string?

### CalendarEventInviteInfo

Fields:

- `name`: string?
- `level`: number
- `className`: string?
- `classFilename`: string?
- `inviteStatus`: CalendarStatus?
- `modStatus`: string?
- `inviteIsMine`: bool
- `type`: CalendarInviteType
- `notes`: string
- `classID`: number?
- `guid`: WOWGUID

### CalendarEventStatusOption

Fields:

- `status`: CalendarStatus
- `statusString`: string

### CalendarEventTextureInfo

Fields:

- `title`: string
- `iconTexture`: fileID
- `expansionLevel`: number
- `difficultyId`: number?
- `mapId`: number?
- `isLfr`: bool?

### CalendarEventTypeDisplayInfo

Fields:

- `displayString`: string
- `eventType`: CalendarEventType

### CalendarGuildEventInfo

Fields:

- `eventID`: CalendarEventID
- `year`: number
- `month`: luaIndex
- `monthDay`: luaIndex
- `weekday`: luaIndex
- `hour`: number
- `minute`: number
- `eventType`: CalendarEventType
- `title`: string
- `calendarType`: string
- `texture`: fileID
- `inviteStatus`: CalendarStatus
- `clubID`: ClubId

### CalendarGuildFilterInfo

Fields:

- `minLevel`: number
- `maxLevel`: number
- `rank`: number

### CalendarHolidayInfo

Fields:

- `name`: cstring
- `description`: cstring
- `texture`: fileID
- `startTime`: CalendarTime?
- `endTime`: CalendarTime?

### CalendarMonthInfo

Fields:

- `month`: luaIndex
- `year`: number
- `numDays`: number
- `firstWeekday`: luaIndex

### CalendarRaidInfo

Fields:

- `name`: string
- `calendarType`: string
- `raidID`: number
- `time`: CalendarTime
- `difficulty`: number
- `difficultyName`: string?
