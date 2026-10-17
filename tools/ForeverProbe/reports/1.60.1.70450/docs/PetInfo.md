# PetInfo

Namespace `C_PetInfo`.

Environment=All, Predicates={}

## Functions

### C_PetInfo.CanPetEatItem

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemID`: number

Returns:

- `canEat`: bool

### C_PetInfo.GetPetFoodTypes

Returns:

- `foodTypes`: table<string>

### C_PetInfo.GetPetHappiness

MayReturnNothing=true

Returns:

- `happiness`: number
- `damagePercentage`: number
- `loyaltyRate`: number

### C_PetInfo.GetPetLoyalty

MayReturnNothing=true

Returns:

- `loyaltyName`: string

### C_PetInfo.GetPetTalentTree

MayReturnNothing=true

Returns:

- `talentTreeName`: stringView

### C_PetInfo.GetPetTamersForMap

SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

Returns:

- `petTamers`: table<PetTamerMapInfo>

### C_PetInfo.GetPetTrainingPoints

Returns:

- `totalPoints`: number
- `usedPoints`: number

### C_PetInfo.GetPetUIModelSceneID

Returns:

- `modelSceneID`: number

### C_PetInfo.GetSpellForPetAction

SecretArguments=AllowedWhenUntainted

Arguments:

- `actionID`: number

Returns:

- `spellID`: number?

### C_PetInfo.IsPetActionPassive

SecretArguments=AllowedWhenUntainted

Arguments:

- `actionID`: number

Returns:

- `isPassive`: bool

### C_PetInfo.PetAbandon

SecretArguments=AllowedWhenUntainted

Arguments:

- `petNumber`: number?

### C_PetInfo.PetAssistMode

### C_PetInfo.PetRename

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: cstring
- `petNumber`: number?
- `declensions`: table<cstring>?

## Events

### PET_ATTACK_START

SynchronousEvent=true

### PET_ATTACK_STOP

SynchronousEvent=true

### PET_BAR_HIDEGRID

SynchronousEvent=true

### PET_BAR_SHOWGRID

SynchronousEvent=true

### PET_BAR_UPDATE_COOLDOWN

SynchronousEvent=true

### PET_DISMISS_START

SynchronousEvent=true

Payload:

- `delay`: number

### PET_FORCE_NAME_DECLENSION

SynchronousEvent=true

Payload:

- `name`: cstring
- `petNumber`: number?
- `declinedName1`: cstring?
- `declinedName2`: cstring?
- `declinedName3`: cstring?
- `declinedName4`: cstring?
- `declinedName5`: cstring?

### PET_UI_CLOSE

SynchronousEvent=true

### RAISED_AS_GHOUL

SynchronousEvent=true

### UPDATE_POSSESS_BAR

SynchronousEvent=true

### UPDATE_VEHICLE_ACTIONBAR

SynchronousEvent=true

## Tables

### PetTamerMapInfo

Fields:

- `areaPoiID`: number
- `position`: vector2 (Vector2DMixin)
- `name`: cstring
- `atlasName`: string?
- `textureIndex`: number?
