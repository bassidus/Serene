# AddOnProfiler

Namespace `C_AddOnProfiler`.

Environment=All, Predicates={}

## Functions

### C_AddOnProfiler.AddMeasuredCallEvent -- Adds a measured event to any ongoing measured calls. If no such calls are currently taking place, this function does nothing.

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: stringView -- User-defined string describing the measured event. This should be kept under 48 bytes to avoid memory allocations.

### C_AddOnProfiler.AddPerformanceMessageShown -- Internal API for telemetry.

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `msg`: AddOnPerformanceMessage

### C_AddOnProfiler.CheckForPerformanceMessage -- Optimized check for determining if AddOns are severely impacting UI performance.

MayReturnNothing=true

Returns:

- `msg`: AddOnPerformanceMessage

### C_AddOnProfiler.GetAddOnMetric -- Gets an AddOn profiler value - all times returned are in milliseconds.

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: cstring
- `metric`: AddOnProfilerMetric

Returns:

- `result`: number

### C_AddOnProfiler.GetApplicationMetric -- Overall profiling data for the entire application (not just the UI)

SecretArguments=AllowedWhenUntainted

Arguments:

- `metric`: AddOnProfilerMetric

Returns:

- `result`: number

### C_AddOnProfiler.GetOverallMetric -- Overall profiling data for all addons

SecretArguments=AllowedWhenUntainted

Arguments:

- `metric`: AddOnProfilerMetric

Returns:

- `result`: number

### C_AddOnProfiler.GetTicksPerSecond -- Returns the number of profiling clock ticks that occur within a single real-time second.

Returns:

- `frequency`: BigInteger

### C_AddOnProfiler.GetTopKAddOnsForMetric -- Gets top K AddOns for a given metric.

SecretArguments=AllowedWhenUntainted

Arguments:

- `metric`: AddOnProfilerMetric
- `k`: number

Returns:

- `results`: table<AddOnProfilerResult>

### C_AddOnProfiler.IsEnabled -- AddOn profiler will be enabled for all users, but this will return false if it ever isn't

Returns:

- `enabled`: bool

### C_AddOnProfiler.MeasureCall -- Performs a profiled measurement of a single function call with any supplied arguments.

SecretArguments=AllowedWhenUntainted

Arguments:

- `func`: LuaValueVariant
- `arguments`: LuaValueVariant [NilableContents=true, StrideIndex=1]

Returns:

- `results`: AddOnProfilerCallResults
- `returns`: LuaValueVariant [NilableContents=true, StrideIndex=1]

## Tables

### AddOnPerformanceMessage

Fields:

- `type`: AddOnPerformanceMessageType
- `metric`: AddOnProfilerMetric
- `addOnName`: string?
- `metricValue`: number
- `thresholdValue`: number

### AddOnProfilerCallEvent

Fields:

- `name`: string -- User-defined string describing the measured event.
- `allocatedBytes`: BigUInteger -- Snapshot of the allocated byte count when this event was recorded.
- `deallocatedBytes`: BigUInteger -- Snapshot of the deallocated byte count when this event was recorded.
- `elapsedMilliseconds`: number -- Snapshot of the elapsed milliseconds when this event was recorded.
- `elapsedTicks`: BigInteger -- Snapshot of the elapsed tick count when this event was recorded.

### AddOnProfilerCallResults

Fields:

- `elapsedMilliseconds`: number -- Total number of milliseconds spent executing the function.
- `elapsedTicks`: BigInteger -- Total number of profiling clock ticks spent executing the function.
- `allocatedBytes`: BigUInteger -- Total number of bytes allocated during call execution.
- `deallocatedBytes`: BigUInteger -- Total number of bytes deallocated during call execution.
- `events`: table<AddOnProfilerCallEvent> -- Events recorded by any AddMeasuredCallEvent calls that took place during function execution.

### AddOnProfilerResult

Fields:

- `addOnName`: cstring
- `metricValue`: number
