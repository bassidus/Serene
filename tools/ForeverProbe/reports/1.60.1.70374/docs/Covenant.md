# Covenant

Namespace `C_Covenants`.

Environment=All, Predicates={}

## Functions

### C_Covenants.GetActiveCovenantID

Returns:

- `covenantID`: number

### C_Covenants.GetCovenantData

SecretArguments=AllowedWhenUntainted

Arguments:

- `covenantID`: number

Returns:

- `data`: CovenantData?

### C_Covenants.GetCovenantIDs

Returns:

- `covenantID`: table<number>

## Events

### COVENANT_CHOSEN

SynchronousEvent=true

Payload:

- `covenantID`: number

## Tables

### CovenantData

Fields:

- `ID`: number
- `textureKit`: textureKit
- `celebrationSoundKit`: number
- `animaChannelSelectSoundKit`: number
- `animaChannelActiveSoundKit`: number
- `animaGemsFullSoundKit`: number
- `animaNewGemSoundKit`: number
- `animaReinforceSelectSoundKit`: number
- `upgradeTabSelectSoundKitID`: number
- `reservoirFullSoundKitID`: number
- `beginResearchSoundKitID`: number
- `renownFanfareSoundKitID`: number
- `factionID`: number
- `name`: cstring
- `soulbindIDs`: table<number>
