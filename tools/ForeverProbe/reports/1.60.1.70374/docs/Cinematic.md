# Cinematic

Environment=All, Predicates={}

## Functions

### CinematicFinished

SecretArguments=AllowedWhenUntainted

Arguments:

- `movieType`: CinematicType
- `userCanceled`: bool [default=false]
- `didError`: bool [default=false]

### CinematicStarted

SecretArguments=AllowedWhenUntainted

Arguments:

- `movieType`: CinematicType
- `movieID`: number
- `canCancel`: bool [default=true]

### GetCurrentCinematicSummary

Returns:

- `summary`: cstring

### InCinematic

Returns:

- `inCinematic`: bool

### MouseOverrideCinematicDisable

SecretArguments=AllowedWhenUntainted

Arguments:

- `doOverride`: bool [default=false]

### OpeningCinematic

### StopCinematic

## Events

### CINEMATIC_START

SynchronousEvent=true

Payload:

- `canBeCancelled`: bool
- `forcedAspectRatio`: CameraModeAspectRatio

### CINEMATIC_STOP

SynchronousEvent=true

### HIDE_SUBTITLE

SynchronousEvent=true

### PLAY_MOVIE

SynchronousEvent=true

Payload:

- `movieID`: number

### SHOW_SUBTITLE

SynchronousEvent=true

Payload:

- `subtitle`: cstring
- `sender`: cstring?

### STOP_MOVIE

SynchronousEvent=true
