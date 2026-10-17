# AddOns

Namespace `C_AddOns`.

Environment=All, Predicates={}

## Functions

### C_AddOns.DisableAddOn

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: uiAddon
- `character`: cstring [default=0]

### C_AddOns.DisableAllAddOns

SecretArguments=AllowedWhenUntainted

Arguments:

- `character`: cstring?

### C_AddOns.DoesAddOnExist

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: uiAddon

Returns:

- `exists`: bool

### C_AddOns.DoesAddOnHaveLoadError

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: uiAddon

Returns:

- `hadError`: bool

### C_AddOns.EnableAddOn

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: uiAddon
- `character`: cstring [default=0]

### C_AddOns.EnableAllAddOns

SecretArguments=AllowedWhenUntainted

Arguments:

- `character`: cstring?

### C_AddOns.GetAddOnDependencies

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: uiAddon

Returns:

- `deps`: cstring [StrideIndex=1]

### C_AddOns.GetAddOnEnableState

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: uiAddon
- `character`: cstring [default=0]

Returns:

- `state`: AddOnEnableState

### C_AddOns.GetAddOnInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: uiAddon

Returns:

- `name`: cstring
- `title`: cstring
- `notes`: cstring
- `loadable`: bool
- `reason`: cstring
- `security`: cstring

### C_AddOns.GetAddOnInterfaceVersion

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: uiAddon

Returns:

- `interfaceVersion`: number

### C_AddOns.GetAddOnLocalTable -- Returns the addon table (passed as the second argument of ... to files) for any addon that opts in through setting AllowAddOnTableAccess: 1 in the toc file. Insecure code cannot query addon tables from Blizzard addons.

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: uiAddon

Returns:

- `table`: LuaValueVariant

### C_AddOns.GetAddOnMetadata

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: uiAddon
- `variable`: cstring

Returns:

- `value`: cstring

### C_AddOns.GetAddOnName

SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: uiAddon

Returns:

- `name`: cstring

### C_AddOns.GetAddOnNotes

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: uiAddon

Returns:

- `notes`: cstring

### C_AddOns.GetAddOnOptionalDependencies

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: uiAddon

Returns:

- `deps`: cstring [StrideIndex=1]

### C_AddOns.GetAddOnSecurity

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: uiAddon

Returns:

- `security`: AddOnSecurityStatus

### C_AddOns.GetAddOnTitle

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: uiAddon

Returns:

- `title`: cstring

### C_AddOns.GetNumAddOns

Returns:

- `numAddOns`: number

### C_AddOns.GetScriptsDisallowedForBeta

Returns:

- `disallowed`: bool

### C_AddOns.IsAddOnDefaultEnabled

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: uiAddon

Returns:

- `defaultEnabled`: bool

### C_AddOns.IsAddOnLoadOnDemand

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: uiAddon

Returns:

- `loadOnDemand`: bool

### C_AddOns.IsAddOnLoadable

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: uiAddon
- `character`: cstring [default=0]
- `demandLoaded`: bool [default=false]

Returns:

- `loadable`: bool
- `reason`: cstring

### C_AddOns.IsAddOnLoaded

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: uiAddon

Returns:

- `loadedOrLoading`: bool
- `loaded`: bool

### C_AddOns.IsAddonVersionCheckEnabled

Returns:

- `isEnabled`: bool

### C_AddOns.LoadAddOn

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: uiAddon

Returns:

- `loaded`: bool?
- `value`: string?

### C_AddOns.ResetAddOns

### C_AddOns.ResetDisabledAddOns

### C_AddOns.SaveAddOns

### C_AddOns.SetAddonVersionCheck

SecretArguments=AllowedWhenUntainted

Arguments:

- `enabled`: bool

## Events

### ADDON_LOADED

SynchronousEvent=true

Payload:

- `addOnName`: cstring
- `containsBindings`: bool

### ADDONS_UNLOADING

SynchronousEvent=true

Payload:

- `closingClient`: bool

### SAVED_VARIABLES_TOO_LARGE

SynchronousEvent=true

Payload:

- `addOnName`: cstring

## Tables

### AddOnInfo

Fields:

- `name`: cstring
- `title`: cstring
- `notes`: cstring
- `loadable`: bool
- `reason`: cstring
- `security`: cstring

### AddOnLoadableInfo

Fields:

- `loadable`: bool
- `reason`: cstring
