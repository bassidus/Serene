# SocialRestrictions

Namespace `C_SocialRestrictions`.

Environment=All, Predicates={}

## Functions

### C_SocialRestrictions.AcknowledgeAgeVerificationRestriction

### C_SocialRestrictions.AcknowledgeRegionalChatDisabled

### C_SocialRestrictions.CanReceiveChat -- Returns true if the player meets all conditions that allow them to receive chat messages.

Returns:

- `canReceiveChat`: bool

### C_SocialRestrictions.CanSendChat -- Returns true if the player meets all conditions that allow them to send chat messages.

Returns:

- `canSendChat`: bool

### C_SocialRestrictions.IsAgeVerificationRestricted -- Returns true if the account is restricted by the Age Verification feature.

Returns:

- `restricted`: bool

### C_SocialRestrictions.IsAgeVerificationRestrictedMinor -- Returns true if the Age Verification restriction is because the account belongs to a minor, as opposed to an adult who has not yet verified their age.

HasRestrictions=true

Returns:

- `isMinor`: bool

### C_SocialRestrictions.IsChatDisabled

Returns:

- `disabled`: bool

### C_SocialRestrictions.IsFriendsDisabled

Returns:

- `disabled`: bool

### C_SocialRestrictions.IsMuted

Returns:

- `isMuted`: bool

### C_SocialRestrictions.IsSilenced

Returns:

- `isSilenced`: bool

### C_SocialRestrictions.IsSquelched

Returns:

- `isSquelched`: bool

### C_SocialRestrictions.SetChatDisabled

SecretArguments=AllowedWhenUntainted

Arguments:

- `disabled`: bool

## Events

### ALERT_AGE_VERIFICATION_RESTRICTED

SynchronousEvent=true

### ALERT_REGIONAL_CHAT_DISABLED

SynchronousEvent=true

### CHAT_DISABLED_CHANGE_FAILED

SynchronousEvent=true

Payload:

- `disabled`: bool

### CHAT_DISABLED_CHANGED

SynchronousEvent=true

Payload:

- `disabled`: bool
