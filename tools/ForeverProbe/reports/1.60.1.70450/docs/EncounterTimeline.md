# EncounterTimeline

Namespace `C_EncounterTimeline`.

Environment=All, Predicates={1={FailureMode=ReturnNothing, Name=RequiresValidTimelineEvent, Type=Precondition}, 2={Name=SecretWhenEncounterEvent, Type=Secret}}

## Functions

### C_EncounterTimeline.AddEditModeEvents -- Adds a predefined set of events to the timeline for display in Edit Mode.

Returns:

- `loopTimerDuration`: Seconds

### C_EncounterTimeline.AddScriptEvent -- Adds a custom event to the timeline.

SecretArguments=NotAllowed

Arguments:

- `eventInfo`: EncounterTimelineScriptEventRequest

Returns:

- `eventID`: EncounterTimelineEventID

### C_EncounterTimeline.CancelAllScriptEvents -- Cancels all custom timeline events, removing them from the timeline.

### C_EncounterTimeline.CancelEditModeEvents -- Removes all Edit Mode events from the timeline.

### C_EncounterTimeline.CancelScriptEvent -- Cancels a custom timeline event, removing it from the timeline.

RequiresValidTimelineEvent=true, SecretArguments=NotAllowed

Arguments:

- `eventID`: EncounterTimelineEventID

### C_EncounterTimeline.FinishScriptEvent -- Finishes a custom timeline event, removing it from the timeline.

RequiresValidTimelineEvent=true, SecretArguments=NotAllowed

Arguments:

- `eventID`: EncounterTimelineEventID

### C_EncounterTimeline.GetCurrentTime -- Returns the current timestamp used for rendering the timeline display.

Returns:

- `currentTime`: Seconds

### C_EncounterTimeline.GetEventColor -- Returns the current color used to render timeline event.

RequiresValidTimelineEvent=true, SecretArguments=NotAllowed, SecretWhenEncounterEvent=true

Arguments:

- `eventID`: EncounterTimelineEventID
- `overrideTrigger`: EncounterEventColorTrigger?

Returns:

- `color`: colorRGBA (ColorMixin)

### C_EncounterTimeline.GetEventCountBySource -- Returns the number of present events in the timeline by their source type.

SecretArguments=AllowedWhenUntainted

Arguments:

- `source`: EncounterTimelineEventSource

Returns:

- `count`: number

### C_EncounterTimeline.GetEventHighlightTime -- Returns the duration at which timeline events will be highlighted for imminency.

Returns:

- `highlightTime`: Seconds

### C_EncounterTimeline.GetEventInfo -- Returns information about a timeline event. This data is generally expected to be static for the lifetime of an event.

RequiresValidTimelineEvent=true, SecretArguments=NotAllowed, SecretWhenEncounterEvent=true

Arguments:

- `eventID`: EncounterTimelineEventID

Returns:

- `info`: EncounterTimelineEventInfo

### C_EncounterTimeline.GetEventList -- Returns an unsorted list of event IDs present in the timeline.

Returns:

- `events`: table<EncounterTimelineEventID>

### C_EncounterTimeline.GetEventState -- Returns the current state of a timeline event.

RequiresValidTimelineEvent=true, SecretArguments=NotAllowed

Arguments:

- `eventID`: EncounterTimelineEventID

Returns:

- `state`: EncounterTimelineEventState

### C_EncounterTimeline.GetEventTimeElapsed -- Returns the elapsed duration of a timeline event.

RequiresValidTimelineEvent=true, SecretArguments=NotAllowed

Arguments:

- `eventID`: EncounterTimelineEventID

Returns:

- `timeElapsed`: Seconds

### C_EncounterTimeline.GetEventTimeRemaining -- Returns the remaining duration of a timeline event.

RequiresValidTimelineEvent=true, SecretArguments=NotAllowed

Arguments:

- `eventID`: EncounterTimelineEventID

Returns:

- `timeRemaining`: Seconds

### C_EncounterTimeline.GetEventTimer -- Returns a Duration object that tracks the elapsed duration of a timeline event. This object tracks the range [0, duration] of the event and automatically pauses its progression based on event state.

SecretArguments=NotAllowed

Arguments:

- `eventID`: EncounterTimelineEventID

Returns:

- `duration`: LuaDurationObject?

### C_EncounterTimeline.GetEventTrack -- Returns information about the position of an event on the timeline.

RequiresValidTimelineEvent=true, SecretArguments=NotAllowed

Arguments:

- `eventID`: EncounterTimelineEventID

Returns:

- `track`: EncounterTimelineTrack
- `trackSortIndex`: luaIndex?

### C_EncounterTimeline.GetSortedEventList -- Returns a sorted list of event IDs present in the timeline from shortest to longest remaining durations, meeting the requirements of the specified filters.

SecretArguments=NotAllowed

Arguments:

- `maxEventCount`: number? -- Maximum number of sorted events to return.
- `maxEventDuration`: Seconds? -- Maximum duration of sorted events to return.
- `excludeTerminalStates`: bool [default=true] -- If false, include events that are terminal states such as Canceled or Finished.
- `excludeHiddenEvents`: bool [default=true] -- If false, include events that should be hidden by user configuration, such as events on long tracks when the user has opted to not show long countdowns.

Returns:

- `events`: table<EncounterTimelineEventID>

### C_EncounterTimeline.GetTrackInfo -- Returns information for a single timeline track.

SecretArguments=NotAllowed

Arguments:

- `track`: EncounterTimelineTrack

Returns:

- `trackInfo`: EncounterTimelineTrackInfo

### C_EncounterTimeline.GetTrackList -- Returns information about all timeline tracks.

Returns:

- `tracks`: table<EncounterTimelineTrackInfo>

### C_EncounterTimeline.GetTrackMaxEventDuration -- Returns the maximum permitted event duration on a single timeline track.

SecretArguments=NotAllowed

Arguments:

- `track`: EncounterTimelineTrack

Returns:

- `maxEventDuration`: Seconds

### C_EncounterTimeline.GetTrackType -- Returns the type of a single timeline track.

SecretArguments=NotAllowed

Arguments:

- `track`: EncounterTimelineTrack

Returns:

- `trackType`: EncounterTimelineTrackType

### C_EncounterTimeline.GetViewType -- Returns the current view type of the timeline.

Returns:

- `viewType`: EncounterTimelineViewType

### C_EncounterTimeline.HasActiveEvents -- Returns true if the timeline contains any events in the active state.

Returns:

- `hasActiveEvents`: bool

### C_EncounterTimeline.HasAnyEvents -- Returns true if the timeline contains any events in any state.

Returns:

- `hasAnyEvents`: bool

### C_EncounterTimeline.HasPausedEvents -- Returns true if the timeline contains any events in the paused state.

Returns:

- `hasPausedEvents`: bool

### C_EncounterTimeline.HasVisibleEvents -- Returns true if the timeline contains any events that are on visible tracks.

Returns:

- `hasVisibleEvents`: bool

### C_EncounterTimeline.IsEventBlocked -- Returns true if the event is in a 'blocked' state, where the cast for this event may not occur due to encounter conditions not being met.

RequiresValidTimelineEvent=true, SecretArguments=NotAllowed

Arguments:

- `eventID`: EncounterTimelineEventID

Returns:

- `blocked`: bool

### C_EncounterTimeline.IsFeatureAvailable -- Returns true if the encounter timeline feature is available on this client.

Returns:

- `isAvailable`: bool

### C_EncounterTimeline.IsFeatureEnabled -- Returns true if the encounter timeline feature has been enabled by the player. This function will always return false if the feature is not available.

Returns:

- `isAvailableAndEnabled`: bool

### C_EncounterTimeline.PauseScriptEvent -- Pauses a custom timeline event, hiding it from the timeline. A paused event can later be resumed to show it again, or canceled.

RequiresValidTimelineEvent=true, SecretArguments=NotAllowed

Arguments:

- `eventID`: EncounterTimelineEventID

### C_EncounterTimeline.ResumeScriptEvent -- Resumes a custom timeline event, showing it on the timeline again if it is currently paused.

RequiresValidTimelineEvent=true, SecretArguments=NotAllowed

Arguments:

- `eventID`: EncounterTimelineEventID

### C_EncounterTimeline.SetEventIconTextures -- Updates a given vector of texture objects to reference art assets for icons associated with an event.

RequiresValidTimelineEvent=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `eventID`: EncounterTimelineEventID
- `includeIcons`: EncounterEventIconmask -- Mask to apply to candidate icons. Any icon bits not present in this set will not be assigned to textures.
- `textures`: table<SimpleTexture> -- Array of texture objects to update. This will change the assigned atlases and alpha values of the region, applying secret aspects to protect the data.

### C_EncounterTimeline.SetViewType -- Changes the view type for the timeline. This adjusts track layouts to be more appropriate for a specific mode and optimizes event processing.

SecretArguments=NotAllowed

Arguments:

- `viewType`: EncounterTimelineViewType

## Events

### ENCOUNTER_TIMELINE_EVENT_ADDED -- Fired when an event has been added to the timeline.

SecretWhenEncounterEvent=true, SynchronousEvent=true

Payload:

- `eventInfo`: EncounterTimelineEventInfo

### ENCOUNTER_TIMELINE_EVENT_BLOCK_STATE_CHANGED -- Fired when an event has transitioned into or out of a 'blocked' status.

UniqueEvent=true

Payload:

- `eventID`: EncounterTimelineEventID

### ENCOUNTER_TIMELINE_EVENT_COLOR_CHANGED -- Fired when an event has met a condition that should trigger a color change.

UniqueEvent=true

Payload:

- `eventID`: EncounterTimelineEventID

### ENCOUNTER_TIMELINE_EVENT_HIGHLIGHT -- Fired when an event has met a condition that should trigger its highlight glow animation.

UniqueEvent=true

Payload:

- `eventID`: EncounterTimelineEventID

### ENCOUNTER_TIMELINE_EVENT_REMOVED -- Fired when an event has been removed from the timeline. This is guaranteed to fire after an event has transitioned to a 'final' state such as Canceled or Finished, and will be delayed at least one game tick to allow for API queries to still access event data in OnUpdate scripts. This is fired post-removal of the event, and so queries using the supplied event ID will return nil.

UniqueEvent=true

Payload:

- `eventID`: EncounterTimelineEventID

### ENCOUNTER_TIMELINE_EVENT_STATE_CHANGED -- Fired when an event has changed state.

UniqueEvent=true

Payload:

- `eventID`: EncounterTimelineEventID

### ENCOUNTER_TIMELINE_EVENT_TRACK_CHANGED -- Fired when an event has changed track, or has been re-ordered within its existing track.

UniqueEvent=true

Payload:

- `eventID`: EncounterTimelineEventID

### ENCOUNTER_TIMELINE_LAYOUT_UPDATED -- Fired when the layout of tracks on the timeline has been updated. This can include changes to the minimum or maximum durations of tracks.

SynchronousEvent=true

### ENCOUNTER_TIMELINE_STATE_UPDATED -- Signaled when conditions controlling the visibility of the encounter timeline are updated.

UniqueEvent=true

### ENCOUNTER_TIMELINE_VIEW_ACTIVATED -- Fired when a new timeline view is being activated. This is fired after a full layout and timeline data update, allowing the UI to immediately query the API and get usable results.

SynchronousEvent=true

Payload:

- `viewType`: EncounterTimelineViewType

### ENCOUNTER_TIMELINE_VIEW_DEACTIVATED -- Fired when the current timeline view is being deactivated. The UI should clear all stored timeline event data and release all frames back to pools during this event.

SynchronousEvent=true

Payload:

- `viewType`: EncounterTimelineViewType

## Tables

### EncounterTimelineEventFilter

Fields:

- `maxEventCount`: number? -- Maximum number of sorted events to return.
- `maxEventDuration`: Seconds? -- Maximum duration of sorted events to return.
- `excludeTerminalStates`: bool [default=true] -- If false, include events that are terminal states such as Canceled or Finished.
- `excludeHiddenEvents`: bool [default=true] -- If false, include events that should be hidden by user configuration, such as events on long tracks when the user has opted to not show long countdowns.

### EncounterTimelineEventInfo

Fields:

- `id`: EncounterTimelineEventID [NeverSecret=true] -- Instance ID for this event.
- `source`: EncounterTimelineEventSource [NeverSecret=true] -- Source that this event came from.
- `spellName`: string -- Spell name associated with this event. For script events, this may instead be the contents of the 'overrideName' field if it wasn't empty.
- `spellID`: number -- Spell ID associated with this event.
- `iconFileID`: fileID -- Icon file ID associated with this event.
- `duration`: Seconds [NeverSecret=true] -- Base duration of this event at the point that it was queued onto the timeline.
- `maxQueueDuration`: Seconds [NeverSecret=true] -- Hold duration for this event after it reaches the end of the timeline. During this period, the event will sit in the queued track of the timeline until manually finished or this added duration expires.
- `icons`: EncounterEventIconmask -- Bitmask of active icon states for this event.
- `severity`: EncounterEventSeverity -- Severity of this event.
- `isApproximate`: bool -- If true, this event is an approximation and may not occur exactly when the timeline suggests it will.

### EncounterTimelineScriptEventRequest

Fields:

- `spellID`: number
- `iconFileID`: fileID
- `duration`: Seconds
- `maxQueueDuration`: Seconds [default=0]
- `overrideName`: stringView [default=]
- `icons`: EncounterEventIconmask?
- `severity`: EncounterEventSeverity [default=Medium]
- `paused`: bool [default=false]

### EncounterTimelineTrackInfo

Fields:

- `id`: EncounterTimelineTrack
- `type`: EncounterTimelineTrackType
- `minimumDuration`: Seconds? -- The exclusive lower bound of durations for events on this track. If zero, this should be treated as an inclusive lower bound. This bound is ignored by the timeline sequence in circumstances where an adjacent Sorted track would exceed its maximum event count, requiring events be pushed 'to the left' by one track.
- `maximumDuration`: Seconds? -- The inclusive upper bound of durations for events on this track.
- `minimumEventIntroDuration`: Seconds? -- Lower duration bound for events that want to transition onto this track from an Indeterminate position. Events below this duration are artificially kept in the indeterminate track state until they can transition into a later track in the timeline sequence.
- `minimumEventGapDuration`: Seconds? -- Minimum duration gap that must exist between two sequential candidate events for this track. If two event durations have a distance under this figure, the later of the two events will be artifically kept in the indeterminate track state until it can transition into a later track in the timeline sequence.
- `maximumEventCount`: number? -- The maximum number of events permitted within this track. This only applies to Sorted tracks.
- `sortDirection`: EncounterTimelineEventSortDirection? -- Sort ordering for events within this track. This only applies to Sorted tracks.
