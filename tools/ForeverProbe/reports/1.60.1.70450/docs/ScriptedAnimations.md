# ScriptedAnimations

Namespace `C_ScriptedAnimations`.

Environment=All, Predicates={}

## Functions

### C_ScriptedAnimations.GetAllScriptedAnimationEffects

Returns:

- `scriptedAnimationEffects`: table<ScriptedAnimationEffect>

## Events

### SCRIPTED_ANIMATIONS_UPDATE

SynchronousEvent=true

## Tables

### ScriptedAnimationBehavior

MaxValue=5, MinValue=0, NumValues=6

Fields:

- `None`: ScriptedAnimationBehavior [= 0]
- `TargetShake`: ScriptedAnimationBehavior [= 1]
- `TargetKnockBack`: ScriptedAnimationBehavior [= 2]
- `SourceRecoil`: ScriptedAnimationBehavior [= 3]
- `SourceCollideWithTarget`: ScriptedAnimationBehavior [= 4]
- `UIParentShake`: ScriptedAnimationBehavior [= 5]

### ScriptedAnimationFlags

MaxValue=1, MinValue=1, NumValues=1

Fields:

- `UseTargetAsSource`: ScriptedAnimationFlags [= 1]

### ScriptedAnimationTrajectory

MaxValue=6, MinValue=0, NumValues=7

Fields:

- `AtSource`: ScriptedAnimationTrajectory [= 0]
- `AtTarget`: ScriptedAnimationTrajectory [= 1]
- `Straight`: ScriptedAnimationTrajectory [= 2]
- `CurveLeft`: ScriptedAnimationTrajectory [= 3]
- `CurveRight`: ScriptedAnimationTrajectory [= 4]
- `CurveRandom`: ScriptedAnimationTrajectory [= 5]
- `HalfwayBetween`: ScriptedAnimationTrajectory [= 6]

### ScriptedAnimationEffect

Fields:

- `id`: number
- `visual`: fileID
- `visualScale`: number
- `duration`: number
- `trajectory`: ScriptedAnimationTrajectory
- `yawRadians`: number
- `pitchRadians`: number
- `rollRadians`: number
- `offsetX`: number
- `offsetY`: number
- `offsetZ`: number
- `animation`: number
- `animationSpeed`: number
- `alpha`: number
- `useTargetAsSource`: bool
- `startBehavior`: ScriptedAnimationBehavior?
- `startSoundKitID`: number?
- `finishEffectID`: number?
- `finishBehavior`: ScriptedAnimationBehavior?
- `finishSoundKitID`: number?
- `startAlphaFade`: number?
- `startAlphaFadeDuration`: number?
- `endAlphaFade`: number?
- `endAlphaFadeDuration`: number?
- `animationStartOffset`: number?
- `loopingSoundKitID`: number?
- `particleOverrideScale`: number?
