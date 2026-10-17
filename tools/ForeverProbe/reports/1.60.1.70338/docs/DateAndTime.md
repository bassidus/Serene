# DateAndTime

Namespace `C_DateAndTime`.

Environment=All, Predicates={}

## Functions

### C_DateAndTime.AdjustTimeByDays

SecretArguments=AllowedWhenUntainted

Arguments:

- `date`: CalendarTime
- `days`: number

Returns:

- `newDate`: CalendarTime

### C_DateAndTime.AdjustTimeByMinutes

SecretArguments=AllowedWhenUntainted

Arguments:

- `date`: CalendarTime
- `minutes`: number

Returns:

- `newDate`: CalendarTime

### C_DateAndTime.AdjustTimeByMonths

SecretArguments=AllowedWhenUntainted

Arguments:

- `date`: CalendarTime
- `months`: number

Returns:

- `newDate`: CalendarTime

### C_DateAndTime.CompareCalendarTime

SecretArguments=AllowedWhenUntainted

Arguments:

- `lhsCalendarTime`: CalendarTime
- `rhsCalendarTime`: CalendarTime

Returns:

- `comparison`: number -- -1 if rhsCalendarTime < lhsCalendarTime, 0 if rhsCalendarTime == lhsCalendarTime, 1 if rhsCalendarTime > lhsCalendarTime

### C_DateAndTime.GetCalendarTimeFromEpoch

SecretArguments=AllowedWhenUntainted

Arguments:

- `epoch`: BigUInteger

Returns:

- `date`: CalendarTime

### C_DateAndTime.GetCurrentCalendarTime

Returns:

- `date`: CalendarTime

### C_DateAndTime.GetSecondsUntilDailyReset

Returns:

- `seconds`: time_t

### C_DateAndTime.GetSecondsUntilWeeklyReset

Returns:

- `seconds`: time_t

### C_DateAndTime.GetServerTimeLocal

Returns:

- `serverTimeLocal`: time_t

### C_DateAndTime.GetWeeklyResetStartTime

Returns:

- `seconds`: time_t

### C_DateAndTime.IsDayTime

Returns:

- `isDayTime`: bool

## Events

### DIEL_CYCLE_CHANGED -- Signaled when the game time transitions between day and night.

SynchronousEvent=true

Payload:

- `isDayTime`: bool

## Tables

### TimeEventFlag

MaxValue=4, MinValue=1, NumValues=3

Fields:

- `GlueScreenShortcut`: TimeEventFlag [= 1]
- `WeeklyReset`: TimeEventFlag [= 2]
- `GlobalLaunch`: TimeEventFlag [= 4]
