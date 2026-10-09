# EventSchedulerUI

Namespace `C_EventScheduler`.

Environment=All, Predicates={}

## Functions

### C_EventScheduler.CanShowEvents -- Returns true if there are any events eligible to show for the player.

Returns:

- `canShow`: bool

### C_EventScheduler.ClearReminder -- Clears reminder on a scheduled event. Must use endTime to identify which specific instance in the case of repeating ones.

SecretArguments=AllowedWhenUntainted

Arguments:

- `eventKey`: string

### C_EventScheduler.GetActiveContinentName -- Returns the name of the continent with current events

MayReturnNothing=true

Returns:

- `name`: string

### C_EventScheduler.GetEventUiMapID -- Will try to figure out a UiMap for an areaPOI.

SecretArguments=AllowedWhenUntainted

Arguments:

- `areaPoiID`: number

Returns:

- `uiMapID`: number?

### C_EventScheduler.GetEventZoneName -- Will try to figure out a map zone name for an areaPOI

SecretArguments=AllowedWhenUntainted

Arguments:

- `areaPoiID`: number

Returns:

- `name`: string?

### C_EventScheduler.GetOngoingEvents -- Will request data from the server on a throttle

MayReturnNothing=true

Returns:

- `events`: table<OngoingEventInfo>

### C_EventScheduler.GetScheduledEvents -- Will request data from the server on a throttle

MayReturnNothing=true

Returns:

- `events`: table<ScheduledEventInfo>

### C_EventScheduler.HasData -- True if the server sent a list, even if the list had 0 events.

Returns:

- `hasData`: bool

### C_EventScheduler.HasSavedReminders -- Returns whether there are any event reminders saved. Can include reminders that have expired since set and haven't gotten removed yet. Has to be called after cvars are loaded.

Returns:

- `hasSavedReminders`: bool

### C_EventScheduler.RequestEvents -- Requests events from the server, subject to throttle

### C_EventScheduler.SetReminder -- Sets reminder on a scheduled event. Must use endTime to identify which specific instance in the case of repeating ones.

SecretArguments=AllowedWhenUntainted

Arguments:

- `eventKey`: string

## Events

### EVENT_SCHEDULER_UPDATE

SynchronousEvent=true

## Tables

### EventDisplayInfo

Fields:

- `hideTimeLeft`: bool [default=false]
- `hideDescription`: bool [default=false]
- `overrideAtlas`: textureAtlas?
- `overrideTooltipWidgetSetID`: number?

### OngoingEventInfo

Fields:

- `areaPoiID`: number
- `rewardsClaimed`: bool [default=false]
- `displayInfo`: EventDisplayInfo

### ScheduledEventInfo

Fields:

- `eventKey`: string
- `eventID`: number
- `areaPoiID`: number
- `startTime`: time_t
- `endTime`: time_t
- `duration`: time_t
- `hasReminder`: bool [default=false]
- `rewardsClaimed`: bool [default=false]
- `displayInfo`: EventDisplayInfo
