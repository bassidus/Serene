# ClientScene

Namespace `C_ClientScene`.

Environment=All, Predicates={}

## Functions

### C_ClientScene.IsSceneTypeActive

SecretArguments=AllowedWhenUntainted

Arguments:

- `desiredSceneType`: ClientSceneType?

Returns:

- `isPlaying`: bool

## Events

### CLIENT_SCENE_CLOSED

SynchronousEvent=true

### CLIENT_SCENE_OPENED

SynchronousEvent=true

Payload:

- `sceneType`: ClientSceneType

## Tables

### ClientSceneType

MaxValue=1, MinValue=0, NumValues=2

Fields:

- `DefaultSceneType`: ClientSceneType [= 0]
- `MinigameSceneType`: ClientSceneType [= 1]
