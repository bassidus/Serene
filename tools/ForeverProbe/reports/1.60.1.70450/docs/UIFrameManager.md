# UIFrameManager

Namespace `C_FrameManager`.

Environment=All, Predicates={}

## Functions

### C_FrameManager.GetFrameVisibilityState

SecretArguments=AllowedWhenUntainted

Arguments:

- `frameType`: UIFrameType

Returns:

- `shouldShow`: bool

## Events

### FRAME_MANAGER_UPDATE_ALL

SynchronousEvent=true

### FRAME_MANAGER_UPDATE_FRAME

SynchronousEvent=true

Payload:

- `type`: UIFrameType
- `show`: bool

## Tables

### UIFrameType

MaxValue=1, MinValue=0, NumValues=2

Fields:

- `JailersTowerBuffs`: UIFrameType [= 0]
- `InterruptTutorial`: UIFrameType [= 1]
