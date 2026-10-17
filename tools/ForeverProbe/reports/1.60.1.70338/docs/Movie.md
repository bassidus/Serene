# Movie

Environment=All, Predicates={}

## Functions

### CancelPreloadingMovie

SecretArguments=AllowedWhenUntainted

Arguments:

- `movieId`: number

### GetMovieDownloadProgress

SecretArguments=AllowedWhenUntainted

Arguments:

- `movieId`: number

Returns:

- `inProgress`: bool
- `downloaded`: BigUInteger
- `total`: BigUInteger

### IsMovieLocal

SecretArguments=AllowedWhenUntainted

Arguments:

- `movieId`: number

Returns:

- `isLocal`: bool

### IsMoviePlayable

SecretArguments=AllowedWhenUntainted

Arguments:

- `movieId`: number

Returns:

- `isPlayable`: bool

### IsMovieReadable

SecretArguments=AllowedWhenUntainted

Arguments:

- `movieId`: number

Returns:

- `readable`: bool

### PreloadMovie

SecretArguments=AllowedWhenUntainted

Arguments:

- `movieId`: number
