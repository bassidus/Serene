# SplashScreen

Namespace `C_SplashScreen`.

Environment=All, Predicates={}

## Functions

### C_SplashScreen.AcknowledgeSplash

### C_SplashScreen.CanViewSplashScreen

Returns:

- `canView`: bool

### C_SplashScreen.RequestLatestSplashScreen

SecretArguments=AllowedWhenUntainted

Arguments:

- `fromGameMenu`: bool

### C_SplashScreen.SendSplashScreenActionLaunchedTelem

HasRestrictions=true

### C_SplashScreen.SendSplashScreenCloseTelem

HasRestrictions=true

## Events

### OPEN_SPLASH_SCREEN

SynchronousEvent=true

Payload:

- `info`: SplashScreenInfo?

## Tables

### SplashScreenInfo

Fields:

- `textureKit`: textureKit
- `minDisplayCharLevel`: number
- `minQuestDisplayLevel`: number
- `soundKitID`: number
- `allianceQuestID`: number?
- `hordeQuestID`: number?
- `header`: string
- `topLeftFeatureTitle`: string
- `topLeftFeatureDesc`: string
- `bottomLeftFeatureTitle`: string
- `bottomLeftFeatureDesc`: string
- `rightFeatureTitle`: string
- `rightFeatureDesc`: string
- `shouldShowQuest`: bool
- `screenType`: SplashScreenType
- `gameMenuRequest`: bool
