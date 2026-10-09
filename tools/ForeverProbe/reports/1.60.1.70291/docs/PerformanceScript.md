# PerformanceScript

Environment=All, Predicates={}

## Functions

### GetAddOnCPUUsage

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: uiAddon

Returns:

- `result`: number

### GetAddOnMemoryUsage

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: uiAddon

Returns:

- `result`: number

### GetEventCPUUsage

Returns:

- `call_time`: number
- `call_count`: number

### GetFrameCPUUsage

SecretArguments=AllowedWhenUntainted

Arguments:

- `frame`: SimpleFrame
- `includeChildren`: bool [default=false]

Returns:

- `call_time`: number
- `call_count`: number

### GetFunctionCPUUsage

Returns:

- `call_time`: number
- `call_count`: number

### GetScriptCPUUsage

Returns:

- `result`: number

### ResetCPUUsage

### UpdateAddOnCPUUsage

### UpdateAddOnMemoryUsage
