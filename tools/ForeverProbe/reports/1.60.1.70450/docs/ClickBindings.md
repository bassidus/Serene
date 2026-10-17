# ClickBindings

Namespace `C_ClickBindings`.

Environment=All, Predicates={}

## Functions

### C_ClickBindings.CanSpellBeClickBound

SecretArguments=AllowedWhenTainted

Arguments:

- `spellID`: SpellIdentifier -- Base spellID for spell, spellID for PetAction

Returns:

- `canBeBound`: bool

### C_ClickBindings.ExecuteBinding

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `targetToken`: cstring
- `button`: cstring
- `modifiers`: number

### C_ClickBindings.GetBindingType

SecretArguments=AllowedWhenUntainted

Arguments:

- `button`: cstring
- `modifiers`: number

Returns:

- `type`: ClickBindingType

### C_ClickBindings.GetEffectiveInteractionButton

SecretArguments=AllowedWhenUntainted

Arguments:

- `button`: cstring
- `modifiers`: number

Returns:

- `effectiveButton`: cstring

### C_ClickBindings.GetProfileInfo

Returns:

- `infoVec`: table<ClickBindingInfo>

### C_ClickBindings.GetTutorialShown

Returns:

- `tutorialShown`: bool

### C_ClickBindings.ResetCurrentProfile

HasRestrictions=true

### C_ClickBindings.SetProfileByInfo

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `infoVec`: table<ClickBindingInfo>

### C_ClickBindings.SetTutorialShown

## Events

### CLICKBINDINGS_SET_HIGHLIGHTS_SHOWN

SynchronousEvent=true

Payload:

- `showHighlights`: bool
