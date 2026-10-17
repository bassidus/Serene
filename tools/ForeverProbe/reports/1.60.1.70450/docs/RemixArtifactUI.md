# RemixArtifactUI

Namespace `C_RemixArtifactUI`.

Environment=All, Predicates={}

## Functions

### C_RemixArtifactUI.ClearRemixArtifactItem

### C_RemixArtifactUI.GetAppearanceInfoByID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `artifactAppearanceID`: number

Returns:

- `uiCameraID`: number
- `altHandUICameraID`: number?

### C_RemixArtifactUI.GetArtifactArtInfo

MayReturnNothing=true

Returns:

- `artifactArtInfo`: RemixArtifactArtInfo

### C_RemixArtifactUI.GetArtifactItemInfo

MayReturnNothing=true

Returns:

- `itemID`: number
- `altItemID`: number?
- `artifactAppearanceID`: number
- `appearanceModID`: number
- `itemAppearanceID`: number?
- `altItemAppearanceID`: number?
- `altOnTop`: bool

### C_RemixArtifactUI.GetCurrArtifactItemID

Returns:

- `reqitemID`: number?

### C_RemixArtifactUI.GetCurrItemSpecIndex

Returns:

- `specIndex`: luaIndex?

### C_RemixArtifactUI.GetCurrTraitTreeID

Returns:

- `traitTreeID`: number?

### C_RemixArtifactUI.ItemInSlotIsRemixArtifact

SecretArguments=AllowedWhenUntainted

Arguments:

- `invSlot`: luaIndex

Returns:

- `isRemixArtifact`: bool

## Events

### REMIX_ARTIFACT_ITEM_SPECS_LOADED

SynchronousEvent=true

Payload:

- `success`: bool

### REMIX_ARTIFACT_UPDATE

SynchronousEvent=true

## Tables

### RemixArtifactAppearanceInfo

Fields:

- `uiCameraID`: number
- `altHandUICameraID`: number?

### RemixArtifactArtInfo

Fields:

- `textureKit`: textureKit
- `titleName`: string
- `uiModelSceneID`: number
- `spellVisualKitID`: number

### RemixArtifactInfo

Fields:

- `itemID`: number
- `altItemID`: number?
- `artifactAppearanceID`: number
- `appearanceModID`: number
- `itemAppearanceID`: number?
- `altItemAppearanceID`: number?
- `altOnTop`: bool
