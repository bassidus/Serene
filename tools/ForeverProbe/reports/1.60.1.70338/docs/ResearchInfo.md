# ResearchInfo

Namespace `C_ResearchInfo`.

Environment=All, Predicates={}

## Functions

### C_ResearchInfo.GetDigSitesForMap

SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

Returns:

- `digSites`: table<DigSiteMapInfo>

## Events

### ARCHAEOLOGY_CLOSED

SynchronousEvent=true

### ARCHAEOLOGY_FIND_COMPLETE

SynchronousEvent=true

Payload:

- `numFindsCompleted`: number
- `totalFinds`: number
- `researchBranchID`: number

### ARCHAEOLOGY_SURVEY_CAST

SynchronousEvent=true

Payload:

- `numFindsCompleted`: number
- `totalFinds`: number
- `researchBranchID`: number
- `successfulFind`: number

### ARCHAEOLOGY_TOGGLE

SynchronousEvent=true

### ARTIFACT_DIGSITE_COMPLETE

SynchronousEvent=true

Payload:

- `researchBranchID`: number

### RESEARCH_ARTIFACT_COMPLETE

SynchronousEvent=true

Payload:

- `name`: cstring

### RESEARCH_ARTIFACT_DIG_SITE_UPDATED

SynchronousEvent=true

### RESEARCH_ARTIFACT_UPDATE

SynchronousEvent=true

## Tables

### DigSiteMapInfo

Fields:

- `researchSiteID`: number
- `position`: vector2 (Vector2DMixin)
- `name`: cstring
- `poiBlobID`: number
- `textureIndex`: number
