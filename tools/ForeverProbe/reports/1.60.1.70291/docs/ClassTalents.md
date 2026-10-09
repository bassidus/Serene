# ClassTalents

Namespace `C_ClassTalents`.

Environment=All, Predicates={}

## Functions

### C_ClassTalents.CanChangeTalents -- Returns true only if the player has staged changes and can commit their talents in their current state.

Returns:

- `canChange`: bool
- `canAdd`: bool
- `changeError`: string?

### C_ClassTalents.CanCreateNewConfig

Returns:

- `canCreate`: bool

### C_ClassTalents.CanEditTalents -- Returns true if the player could switch talents if they staged a proper loadout.

Returns:

- `canEdit`: bool
- `changeError`: cstring

### C_ClassTalents.CommitConfig

SecretArguments=AllowedWhenUntainted

Arguments:

- `savedConfigID`: number?

Returns:

- `success`: bool

### C_ClassTalents.DeleteConfig

SecretArguments=AllowedWhenUntainted

Arguments:

- `configID`: number

Returns:

- `success`: bool

### C_ClassTalents.GetActiveConfigID

Returns:

- `activeConfigID`: number?

### C_ClassTalents.GetActiveHeroTalentSpec -- Returns the SubTreeID of the player's active Hero Talent Specialization SubTree.

Returns:

- `heroSpecID`: number? -- SubTreeID of the player's active Hero Talent Specialization or nil if no Specialization is active.

### C_ClassTalents.GetConfigIDsBySpecID

SecretArguments=AllowedWhenUntainted

Arguments:

- `specID`: number?

Returns:

- `configIDs`: table<number>

### C_ClassTalents.GetHasStarterBuild

Returns:

- `hasStarterBuild`: bool

### C_ClassTalents.GetHeroTalentSpecsForClassSpec -- Returns the SubTreeIDs of the Hero Talent Specializations available to a Class Specialization and config; Returns nothing if none available

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `configID`: number? -- If not supplied, defaults to the player's active config
- `classSpecID`: number? -- If not supplied, defaults to the player's active spec

Returns:

- `subTreeIDs`: table<number>? -- SubTreeIDs of each Hero Talent Specialization
- `requiredPlayerLevel`: number? -- The player level at which one of the Hero Talent Specializations can be activated

### C_ClassTalents.GetLastSelectedSavedConfigID

SecretArguments=AllowedWhenUntainted

Arguments:

- `specID`: number

Returns:

- `configID`: number?

### C_ClassTalents.GetNextStarterBuildPurchase

Returns:

- `nodeID`: number?
- `entryID`: number?

### C_ClassTalents.GetStarterBuildActive

Returns:

- `isActive`: bool

### C_ClassTalents.GetTraitTreeForSpec

SecretArguments=AllowedWhenUntainted

Arguments:

- `specID`: number

Returns:

- `treeID`: number?

### C_ClassTalents.HasUnspentHeroTalentPoints -- Returns whether the player has any unspent talent points in their active hero talent tree. If hasUnspentPoints is true, numHeroPoints will be greater than zero.

Returns:

- `hasUnspentPoints`: bool
- `numHeroPoints`: number

### C_ClassTalents.HasUnspentTalentPoints -- Returns whether the player has any unspent talent points in their class or spec talent trees. If hasUnspentPoints is true, the number of unspent points for at least one of the trees will be greater than zero. Hero talent points are not included by this function.

Returns:

- `hasUnspentPoints`: bool
- `numClassPoints`: number
- `numSpecPoints`: number

### C_ClassTalents.ImportLoadout

SecretArguments=AllowedWhenUntainted

Arguments:

- `configID`: number
- `entries`: table<ImportLoadoutEntryInfo>
- `name`: string
- `importString`: string?

Returns:

- `success`: bool
- `importError`: cstring

### C_ClassTalents.InitializeViewLoadout

SecretArguments=AllowedWhenUntainted

Arguments:

- `specID`: number
- `level`: number

### C_ClassTalents.IsConfigPopulated -- New configs may or may not be populated and ready to load immediately after creation. Avoid calling for configs intentionally created empty.

SecretArguments=AllowedWhenUntainted

Arguments:

- `configID`: number

Returns:

- `isPopulated`: bool

### C_ClassTalents.LoadConfig

SecretArguments=AllowedWhenUntainted

Arguments:

- `configID`: number
- `autoApply`: bool

Returns:

- `result`: LoadConfigResult
- `changeError`: string?
- `newLearnedNodeIDs`: table<number>

### C_ClassTalents.RenameConfig

SecretArguments=AllowedWhenUntainted

Arguments:

- `configID`: number
- `name`: string

Returns:

- `success`: bool

### C_ClassTalents.RequestNewConfig

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: string

Returns:

- `success`: bool

### C_ClassTalents.SaveConfig

SecretArguments=AllowedWhenUntainted

Arguments:

- `configID`: number

Returns:

- `success`: bool

### C_ClassTalents.SetStarterBuildActive

SecretArguments=AllowedWhenUntainted

Arguments:

- `active`: bool

Returns:

- `result`: LoadConfigResult

### C_ClassTalents.SetUsesSharedActionBars

SecretArguments=AllowedWhenUntainted

Arguments:

- `configID`: number
- `usesShared`: bool

### C_ClassTalents.SwitchToLoadoutByIndex -- Loads loadout for the current specialization by dropdown index. Indices start at 1.

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `loadoutIndex`: number

### C_ClassTalents.SwitchToLoadoutByName -- Loads loadout for the current specialization by name. Loads the first one found in the case of duplicate names.

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `loadoutName`: cstring

### C_ClassTalents.SwitchToSpecializationByIndex -- Activates specialization for the current class by index in the order within the Specializations tab. Indices start at 1.

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `specIndex`: number

### C_ClassTalents.SwitchToSpecializationByName -- Activates specialization for the current class by spec name.

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `specName`: cstring

### C_ClassTalents.UpdateLastSelectedSavedConfigID

SecretArguments=AllowedWhenUntainted

Arguments:

- `specID`: number
- `configID`: number?

### C_ClassTalents.ViewLoadout

SecretArguments=AllowedWhenUntainted

Arguments:

- `entries`: table<ImportLoadoutEntryInfo>
- `importString`: string?

Returns:

- `success`: bool

## Events

### ACTIVE_COMBAT_CONFIG_CHANGED

SynchronousEvent=true

Payload:

- `configID`: number

### CLASS_TALENTS_SWITCH_TO_LOADOUT_BY_INDEX

CallbackEvent=true

Payload:

- `loadoutIndex`: number

### CLASS_TALENTS_SWITCH_TO_LOADOUT_BY_NAME

CallbackEvent=true

Payload:

- `loadoutName`: cstring

### CLASS_TALENTS_SWITCH_TO_SPECIALIZATION_BY_INDEX

CallbackEvent=true

Payload:

- `specIndex`: number

### CLASS_TALENTS_SWITCH_TO_SPECIALIZATION_BY_NAME

CallbackEvent=true

Payload:

- `specName`: cstring

### SELECTED_LOADOUT_CHANGED

SynchronousEvent=true

### SPECIALIZATION_CHANGE_CAST_FAILED

SynchronousEvent=true

### STARTER_BUILD_ACTIVATION_FAILED

SynchronousEvent=true

## Tables

### LoadConfigResult

MaxValue=3, MinValue=0, NumValues=4

Fields:

- `Error`: LoadConfigResult [= 0]
- `NoChangesNecessary`: LoadConfigResult [= 1]
- `LoadInProgress`: LoadConfigResult [= 2]
- `Ready`: LoadConfigResult [= 3]

### ImportLoadoutEntryInfo

Fields:

- `nodeID`: number
- `ranksGranted`: number
- `ranksPurchased`: number
- `selectionEntryID`: number
