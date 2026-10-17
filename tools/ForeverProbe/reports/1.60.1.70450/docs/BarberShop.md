# BarberShop

Namespace `C_BarberShop`.

Environment=All, Predicates={}

## Functions

### C_BarberShop.ApplyCustomizationChoices

Returns:

- `success`: bool

### C_BarberShop.Cancel

### C_BarberShop.ClearPreviewChoices

SecretArguments=AllowedWhenUntainted

Arguments:

- `clearSavedChoices`: bool [default=false]

### C_BarberShop.GetAvailableCustomizations

MayReturnNothing=true

Returns:

- `categories`: table<CharCustomizationCategory>

### C_BarberShop.GetCurrentCameraZoom

Returns:

- `zoomLevel`: number

### C_BarberShop.GetCurrentCharacterData

MayReturnNothing=true

Returns:

- `characterData`: PlayerInfoCharacterData

### C_BarberShop.GetCurrentCost

Returns:

- `cost`: number

### C_BarberShop.GetViewingChrModel

Returns:

- `chrModelID`: number?

### C_BarberShop.HasAlteredForm

Returns:

- `hasAlteredForm`: bool

### C_BarberShop.HasAnyChanges

Returns:

- `hasChanges`: bool

### C_BarberShop.HasCustomizationFeature

SecretArguments=AllowedWhenUntainted

Arguments:

- `featureMask`: ChrModelFeatureFlags

Returns:

- `hasCustomizationFeature`: bool

### C_BarberShop.IsViewingAlteredForm

Returns:

- `isViewingAlteredForm`: bool

### C_BarberShop.MarkCustomizationChoiceAsSeen

SecretArguments=AllowedWhenUntainted

Arguments:

- `choiceID`: number

### C_BarberShop.MarkCustomizationOptionAsSeen

SecretArguments=AllowedWhenUntainted

Arguments:

- `optionID`: number

### C_BarberShop.PreviewCustomizationChoice

SecretArguments=AllowedWhenUntainted

Arguments:

- `optionID`: number
- `choiceID`: number

### C_BarberShop.RandomizeCustomizationChoices

### C_BarberShop.ResetCameraRotation

### C_BarberShop.ResetCustomizationChoices

### C_BarberShop.RotateCamera

SecretArguments=AllowedWhenUntainted

Arguments:

- `diffDegrees`: number

### C_BarberShop.SaveSeenChoices

### C_BarberShop.SetCameraDistanceOffset

SecretArguments=AllowedWhenUntainted

Arguments:

- `offset`: number

### C_BarberShop.SetCameraZoomLevel

SecretArguments=AllowedWhenUntainted

Arguments:

- `zoomLevel`: number
- `keepCustomZoom`: bool?

### C_BarberShop.SetCustomizationChoice

SecretArguments=AllowedWhenUntainted

Arguments:

- `optionID`: number
- `choiceID`: number

### C_BarberShop.SetModelDressState

SecretArguments=AllowedWhenUntainted

Arguments:

- `dressedState`: bool

### C_BarberShop.SetSelectedSex

SecretArguments=AllowedWhenUntainted

Arguments:

- `sex`: UnitSex

### C_BarberShop.SetViewingAlteredForm

SecretArguments=AllowedWhenUntainted

Arguments:

- `isViewingAlteredForm`: bool

### C_BarberShop.SetViewingChrModel

SecretArguments=AllowedWhenUntainted

Arguments:

- `chrModelID`: number?
- `spellShapeshiftFormID`: number?

### C_BarberShop.SetViewingShapeshiftForm

SecretArguments=AllowedWhenUntainted

Arguments:

- `shapeshiftFormID`: number?

### C_BarberShop.ZoomCamera

SecretArguments=AllowedWhenUntainted

Arguments:

- `zoomAmount`: number

## Events

### BARBER_SHOP_APPEARANCE_APPLIED

UniqueEvent=true

### BARBER_SHOP_CAMERA_VALUES_UPDATED

SynchronousEvent=true

### BARBER_SHOP_CLOSE

SynchronousEvent=true

### BARBER_SHOP_COST_UPDATE

SynchronousEvent=true

### BARBER_SHOP_FORCE_CUSTOMIZATIONS_UPDATE

SynchronousEvent=true

### BARBER_SHOP_OPEN

SynchronousEvent=true

### BARBER_SHOP_RESULT

SynchronousEvent=true

Payload:

- `success`: bool
