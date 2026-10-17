# SimpleAnimAPI

Environment=All, Predicates={}

## Functions

### GetDuration

Returns:

- `durationSec`: number

### GetElapsed

ChecksForbiddenAspects={1={Argument=self, Aspect=8192}}

Returns:

- `elapsedSec`: number

### GetEndDelay

Returns:

- `delaySec`: number

### GetOrder

Returns:

- `order`: number

### GetProgress

ChecksForbiddenAspects={1={Argument=self, Aspect=8192}}

Returns:

- `progress`: number

### GetRegionParent

Returns:

- `region`: CScriptObject

### GetScript

ChecksForbiddenAspects={1={Argument=self, Aspect=2}}, ConstSecretAccessor=true, RequiresSupportedScript=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `scriptTypeName`: ScriptTypeName
- `bindingType`: ScriptBindingType [default=Extrinsic]

Returns:

- `script`: LuaFunctionReference

### GetSmoothProgress

ChecksForbiddenAspects={1={Argument=self, Aspect=8192}}

Returns:

- `progress`: number

### GetSmoothing

Returns:

- `weights`: SmoothingType

### GetStartDelay

Returns:

- `delaySec`: number

### GetTarget

Returns:

- `target`: CScriptObject

### HasScript

ConstSecretAccessor=true, SecretArguments=AllowedWhenUntainted, SecretReturnsForAspect={1=1}

Arguments:

- `scriptName`: cstring

Returns:

- `hasScript`: bool

### HookScript

ChecksForbiddenAspects={1={Argument=self, Aspect=2}}, RequiresAssignableScript=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `scriptTypeName`: ScriptTypeName
- `script`: LuaFunctionReference
- `bindingType`: ScriptBindingType [default=Extrinsic]

Returns:

- `success`: bool

### IsDelaying

ChecksForbiddenAspects={1={Argument=self, Aspect=8192}}

Returns:

- `isDelaying`: bool

### IsDone

ChecksForbiddenAspects={1={Argument=self, Aspect=8192}}

Returns:

- `isDone`: bool

### IsPaused

ChecksForbiddenAspects={1={Argument=self, Aspect=8192}}

Returns:

- `isPaused`: bool

### IsPlaying

ChecksForbiddenAspects={1={Argument=self, Aspect=8192}}

Returns:

- `isPlaying`: bool

### IsStopped

ChecksForbiddenAspects={1={Argument=self, Aspect=8192}}

Returns:

- `isStopped`: bool

### Pause

### Play

### Restart

### SetChildKey

ChecksForbiddenAspects={1={Argument=self, Aspect=256}}, SecretArguments=AllowedWhenUntainted

Arguments:

- `childKey`: cstring

Returns:

- `success`: bool

### SetDuration

SecretArguments=AllowedWhenUntainted

Arguments:

- `durationSec`: number
- `recomputeGroupDuration`: bool [default=true]

### SetEndDelay

SecretArguments=NotAllowed

Arguments:

- `delaySec`: number
- `recomputeGroupDuration`: bool [default=true]

### SetOrder

SecretArguments=NotAllowed

Arguments:

- `newOrder`: number

### SetParent

CheckAllowChangeParent=true, ChecksForbiddenAspects={1={Argument=parent, Aspect=16384}}, SecretArguments=AllowedWhenUntainted

Arguments:

- `parent`: SimpleAnimGroup
- `order`: number?

### SetPlaying

SecretArguments=NotAllowed

Arguments:

- `play`: bool

### SetScript

ChecksForbiddenAspects={1={Argument=self, Aspect=2}}, RequiresAssignableScript=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `scriptTypeName`: ScriptTypeName
- `script`: LuaFunctionReference?

### SetSmoothProgress

SecretArguments=NotAllowed

Arguments:

- `durationSec`: number

### SetSmoothing

SecretArguments=AllowedWhenUntainted

Arguments:

- `weights`: SmoothingType

### SetStartDelay

SecretArguments=AllowedWhenUntainted

Arguments:

- `delaySec`: number
- `recomputeGroupDuration`: bool [default=true]

### SetTarget

ChecksForbiddenAspects={1={Argument=self, Aspect=256}}, SecretArguments=AllowedWhenUntainted

Arguments:

- `target`: CScriptObject

Returns:

- `success`: bool

### SetTargetKey

ChecksForbiddenAspects={1={Argument=self, Aspect=256}}, SecretArguments=AllowedWhenUntainted

Arguments:

- `key`: cstring

Returns:

- `success`: bool

### SetTargetName

ChecksForbiddenAspects={1={Argument=self, Aspect=256}}, SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: cstring

Returns:

- `success`: bool

### SetTargetParent

ChecksForbiddenAspects={1={Argument=self, Aspect=256}}

Returns:

- `success`: bool

### Stop
