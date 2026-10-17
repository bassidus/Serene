# SimpleAnimGroupAPI

Environment=All, Predicates={}

## Functions

### CreateAnimation

ChecksForbiddenAspects={1={Argument=self, Aspect=16384}}, SecretArguments=NotAllowed

Arguments:

- `animationType`: cstring?
- `name`: cstring?
- `templateName`: cstring?

Returns:

- `anim`: SimpleAnim

### Finish

### GetAnimationSpeedMultiplier

Returns:

- `animationSpeedMultiplier`: number

### GetAnimations

Returns:

- `anims`: SimpleAnim [StrideIndex=1]

### GetDuration

Returns:

- `durationSec`: number

### GetElapsed

ChecksForbiddenAspects={1={Argument=self, Aspect=8192}}

Returns:

- `elapsedSec`: number

### GetLoopState

ChecksForbiddenAspects={1={Argument=self, Aspect=8192}}

Returns:

- `loopState`: cstring

### GetLooping

Returns:

- `loopType`: LoopType

### GetProgress

ChecksForbiddenAspects={1={Argument=self, Aspect=8192}}

Returns:

- `progress`: number

### GetScript

ChecksForbiddenAspects={1={Argument=self, Aspect=2}}, ConstSecretAccessor=true, RequiresSupportedScript=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `scriptTypeName`: ScriptTypeName
- `bindingType`: ScriptBindingType [default=Extrinsic]

Returns:

- `script`: LuaFunctionReference

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

### IsDone

ChecksForbiddenAspects={1={Argument=self, Aspect=8192}}

Returns:

- `isDone`: bool

### IsPaused

ChecksForbiddenAspects={1={Argument=self, Aspect=8192}}

Returns:

- `isPaused`: bool

### IsPendingFinish

ChecksForbiddenAspects={1={Argument=self, Aspect=8192}}

Returns:

- `isPendingFinish`: bool

### IsPlaying

ChecksForbiddenAspects={1={Argument=self, Aspect=8192}}

Returns:

- `isPlaying`: bool

### IsReverse

ChecksForbiddenAspects={1={Argument=self, Aspect=8192}}

Returns:

- `isReverse`: bool

### IsSetToFinalAlpha

Returns:

- `isSetToFinalAlpha`: bool

### Pause

### Play

SecretArguments=AllowedWhenUntainted

Arguments:

- `reverse`: bool [default=false]
- `offset`: number [default=0]

### RemoveAnimations

### Restart

SecretArguments=AllowedWhenUntainted

Arguments:

- `reverse`: bool [default=false]
- `offset`: number [default=0]

### SetAnimationSpeedMultiplier

SecretArguments=AllowedWhenUntainted

Arguments:

- `animationSpeedMultiplier`: number

### SetLooping

SecretArguments=NotAllowed

Arguments:

- `loopType`: LoopType

### SetPlaying

SecretArguments=AllowedWhenUntainted

Arguments:

- `play`: bool

### SetScript

ChecksForbiddenAspects={1={Argument=self, Aspect=2}}, RequiresAssignableScript=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `scriptTypeName`: ScriptTypeName
- `script`: LuaFunctionReference?

### SetToFinalAlpha

SecretArguments=AllowedWhenUntainted

Arguments:

- `setToFinalAlpha`: bool

### Stop
