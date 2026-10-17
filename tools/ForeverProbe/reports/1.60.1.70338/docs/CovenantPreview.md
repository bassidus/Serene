# CovenantPreview

Namespace `C_CovenantPreview`.

Environment=All, Predicates={}

## Functions

### C_CovenantPreview.CloseFromUI

### C_CovenantPreview.GetCovenantInfoForPlayerChoiceResponseID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `playerChoiceResponseID`: number

Returns:

- `previewInfo`: CovenantPreviewInfo

## Events

### COVENANT_PREVIEW_CLOSE

SynchronousEvent=true

### COVENANT_PREVIEW_OPEN

SynchronousEvent=true

Payload:

- `previewInfo`: CovenantPreviewInfo

## Tables

### CovenantAbilityInfo

Fields:

- `spellID`: number
- `type`: CovenantAbilityType

### CovenantFeatureInfo

Fields:

- `name`: cstring
- `description`: cstring
- `texture`: number

### CovenantPreviewInfo

Fields:

- `textureKit`: textureKit
- `transmogSetID`: number
- `mountID`: number
- `covenantName`: string
- `covenantZone`: string
- `description`: string
- `covenantCrest`: textureAtlas
- `covenantAbilities`: table<CovenantAbilityInfo>
- `fromPlayerChoice`: bool
- `covenantSoulbinds`: table<CovenantSoulbindInfo>
- `featureInfo`: CovenantFeatureInfo

### CovenantSoulbindInfo

Fields:

- `spellID`: number
- `uiTextureKit`: textureKit
- `name`: cstring
- `description`: cstring
- `sortOrder`: number
