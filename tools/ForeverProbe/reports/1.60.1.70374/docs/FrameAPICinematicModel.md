# FrameAPICinematicModel

Environment=All, Predicates={}

## Functions

### EquipItem

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemID`: number

### InitializeCamera

SecretArguments=AllowedWhenUntainted

Arguments:

- `scaleFactor`: number [default=0]

### InitializePanCamera

SecretArguments=AllowedWhenUntainted

Arguments:

- `scaleFactor`: number [default=0]

### RefreshCamera

### SetAnimOffset

SecretArguments=AllowedWhenUntainted

Arguments:

- `offset`: number

### SetCameraPosition

SecretArguments=AllowedWhenUntainted

Arguments:

- `positionX`: number
- `positionY`: number
- `positionZ`: number

### SetCameraTarget

SecretArguments=AllowedWhenUntainted

Arguments:

- `positionX`: number
- `positionY`: number
- `positionZ`: number

### SetCreatureData

SecretArguments=AllowedWhenUntainted

Arguments:

- `creatureID`: number

### SetFacingLeft

SecretArguments=AllowedWhenUntainted

Arguments:

- `isFacingLeft`: bool [default=false]

### SetFadeTimes

SecretArguments=AllowedWhenUntainted

Arguments:

- `fadeInSeconds`: number
- `fadeOutSeconds`: number

### SetHeightFactor

SecretArguments=AllowedWhenUntainted

Arguments:

- `factor`: number

### SetJumpInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `jumpLength`: number
- `jumpHeight`: number

### SetPanDistance

SecretArguments=AllowedWhenUntainted

Arguments:

- `scale`: number

### SetSpellVisualKit

SecretArguments=AllowedWhenUntainted

Arguments:

- `visualKitID`: number

### SetTargetDistance

SecretArguments=AllowedWhenUntainted

Arguments:

- `scale`: number

### StartPan

SecretArguments=AllowedWhenUntainted

Arguments:

- `panType`: luaIndex
- `durationSeconds`: number
- `doFade`: bool [default=false]
- `visKitID`: number [default=0]
- `startPositionScale`: number [default=0]
- `speedMultiplier`: number [default=1]

### StopPan

### UnequipItems
