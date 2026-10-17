# EndOfMatchUI

Namespace `C_EndOfMatchUI`.

Environment=All, Predicates={}

## Functions

### C_EndOfMatchUI.GetEndOfMatchDetails

Returns:

- `matchDetails`: MatchDetails?

## Events

### SHOW_END_OF_MATCH_UI

SynchronousEvent=true

## Tables

### EndOfMatchType

MaxValue=1, MinValue=0, NumValues=2

Fields:

- `None`: EndOfMatchType [= 0]
- `Plunderstorm`: EndOfMatchType [= 1]

### MatchDetailType

MaxValue=2, MinValue=0, NumValues=3

Fields:

- `Placement`: MatchDetailType [= 0]
- `Kills`: MatchDetailType [= 1]
- `PlunderAcquired`: MatchDetailType [= 2]

### MatchDetail

Fields:

- `type`: MatchDetailType
- `value`: number

### MatchDetails

Fields:

- `matchType`: EndOfMatchType
- `matchEnded`: bool
- `detailsList`: table<MatchDetail>
