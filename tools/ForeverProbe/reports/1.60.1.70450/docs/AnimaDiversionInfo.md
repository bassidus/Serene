# AnimaDiversionInfo

Namespace `C_AnimaDiversion`.

Environment=All, Predicates={}

## Functions

### C_AnimaDiversion.CloseUI

### C_AnimaDiversion.GetAnimaDiversionNodes

MayReturnNothing=true

Returns:

- `animaNodes`: table<AnimaDiversionNodeInfo>

### C_AnimaDiversion.GetOriginPosition

Returns:

- `normalizedPosition`: vector2 (Vector2DMixin)?

### C_AnimaDiversion.GetReinforceProgress

Returns:

- `progress`: number

### C_AnimaDiversion.GetTextureKit

Returns:

- `textureKit`: textureKit

### C_AnimaDiversion.OpenAnimaDiversionUI

### C_AnimaDiversion.SelectAnimaNode

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `talentID`: number
- `temporary`: bool

## Events

### ANIMA_DIVERSION_CLOSE

SynchronousEvent=true

### ANIMA_DIVERSION_OPEN

SynchronousEvent=true

Payload:

- `info`: AnimaDiversionFrameInfo

### ANIMA_DIVERSION_TALENT_UPDATED

SynchronousEvent=true

## Tables

### AnimaDiversionNodeState

MaxValue=4, MinValue=0, NumValues=5

Fields:

- `Unavailable`: AnimaDiversionNodeState [= 0]
- `Available`: AnimaDiversionNodeState [= 1]
- `SelectedTemporary`: AnimaDiversionNodeState [= 2]
- `SelectedPermanent`: AnimaDiversionNodeState [= 3]
- `Cooldown`: AnimaDiversionNodeState [= 4]

### AnimaDiversionCostInfo

Fields:

- `currencyID`: number
- `quantity`: number

### AnimaDiversionFrameInfo

Fields:

- `textureKit`: textureKit
- `title`: string
- `mapID`: number

### AnimaDiversionNodeInfo

Fields:

- `talentID`: number
- `name`: string
- `description`: string
- `costs`: table<AnimaDiversionCostInfo>
- `currencyID`: number
- `icon`: number
- `normalizedPosition`: vector2 (Vector2DMixin)
- `state`: AnimaDiversionNodeState
