# SimpleCheckboxAPI

Environment=All, Predicates={}

## Functions

### GetChecked

Returns:

- `checked`: bool

### GetCheckedTexture

Returns:

- `texture`: SimpleTexture

### GetDisabledCheckedTexture

Returns:

- `texture`: SimpleTexture

### SetChecked

SecretArguments=AllowedWhenUntainted

Arguments:

- `checked`: bool [default=false]

### SetCheckedTexture

CheckAllowChangeParent=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `asset`: TextureAsset

### SetDisabledCheckedTexture

CheckAllowChangeParent=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `asset`: TextureAsset
