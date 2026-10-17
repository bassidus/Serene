# SimpleMovieAPI

Environment=All, Predicates={}

## Functions

### EnableSubtitles

SecretArguments=AllowedWhenUntainted

Arguments:

- `enable`: bool

### StartMovie

SecretArguments=AllowedWhenUntainted

Arguments:

- `movieID`: number
- `looping`: bool [default=false]

Returns:

- `success`: bool
- `returnCode`: number

### StartMovieByName

SecretArguments=AllowedWhenUntainted

Arguments:

- `movieName`: cstring
- `looping`: bool [default=false]
- `resolution`: number [default=0]

Returns:

- `success`: bool
- `returnCode`: number

### StopMovie
