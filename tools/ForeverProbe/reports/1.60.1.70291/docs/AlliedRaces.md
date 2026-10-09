# AlliedRaces

Namespace `C_AlliedRaces`.

Environment=All, Predicates={}

## Functions

### C_AlliedRaces.GetAllRacialAbilitiesFromID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `raceID`: number

Returns:

- `allDisplayInfo`: table<AlliedRaceRacialAbility>

### C_AlliedRaces.GetRaceInfoByID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `raceID`: number

Returns:

- `info`: AlliedRaceInfo

## Events

### ALLIED_RACE_CLOSE

SynchronousEvent=true

### ALLIED_RACE_OPEN

SynchronousEvent=true

Payload:

- `raceID`: number

## Tables

### AlliedRaceInfo

Fields:

- `raceID`: number
- `maleModelID`: number
- `femaleModelID`: number
- `achievementIds`: table<number>
- `maleName`: cstring
- `femaleName`: cstring
- `description`: cstring
- `raceFileString`: cstring
- `crestAtlas`: textureAtlas
- `modelBackgroundAtlas`: textureAtlas
- `bannerColor`: colorRGB (ColorMixin)

### AlliedRaceRacialAbility

Fields:

- `description`: cstring
- `name`: cstring
- `icon`: fileID
