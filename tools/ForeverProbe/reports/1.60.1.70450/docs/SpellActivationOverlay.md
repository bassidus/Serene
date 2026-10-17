# SpellActivationOverlay

Namespace `C_SpellActivationOverlay`.

Environment=All, Predicates={}

## Functions

### C_SpellActivationOverlay.IsSpellOverlayed

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellID`: number

Returns:

- `isSpellOverlayed`: bool

## Events

### SPELL_ACTIVATION_OVERLAY_GLOW_HIDE

SynchronousEvent=true

Payload:

- `spellID`: number

### SPELL_ACTIVATION_OVERLAY_GLOW_SHOW

SynchronousEvent=true

Payload:

- `spellID`: number

### SPELL_ACTIVATION_OVERLAY_HIDE

SynchronousEvent=true

Payload:

- `spellID`: number?

### SPELL_ACTIVATION_OVERLAY_SHOW

SynchronousEvent=true

Payload:

- `spellID`: number
- `overlayFileDataID`: number
- `locationType`: ScreenLocationType
- `scale`: number
- `r`: number
- `g`: number
- `b`: number
