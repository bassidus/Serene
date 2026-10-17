# UserFeedback

Namespace `C_UserFeedback`.

Environment=All, Predicates={}

## Functions

### C_UserFeedback.SubmitBug

SecretArguments=AllowedWhenUntainted

Arguments:

- `bugInfo`: cstring
- `suppressNotification`: bool [default=false]

Returns:

- `success`: bool

### C_UserFeedback.SubmitSuggestion

SecretArguments=AllowedWhenUntainted

Arguments:

- `suggestion`: cstring

Returns:

- `success`: bool
