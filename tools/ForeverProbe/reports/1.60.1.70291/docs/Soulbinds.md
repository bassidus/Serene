# Soulbinds

Namespace `C_Soulbinds`.

Environment=All, Predicates={}

## Functions

### C_Soulbinds.ActivateSoulbind

SecretArguments=AllowedWhenUntainted

Arguments:

- `soulbindID`: number

### C_Soulbinds.CanActivateSoulbind

SecretArguments=AllowedWhenUntainted

Arguments:

- `soulbindID`: number

Returns:

- `result`: bool
- `errorDescription`: cstring?

### C_Soulbinds.CanModifySoulbind

Returns:

- `result`: bool

### C_Soulbinds.CanResetConduitsInSoulbind

SecretArguments=AllowedWhenUntainted

Arguments:

- `soulbindID`: number

Returns:

- `result`: bool
- `errorDescription`: cstring?

### C_Soulbinds.CanSwitchActiveSoulbindTreeBranch

Returns:

- `result`: bool

### C_Soulbinds.CloseUI

### C_Soulbinds.CommitPendingConduitsInSoulbind

SecretArguments=AllowedWhenUntainted

Arguments:

- `soulbindID`: number

### C_Soulbinds.FindNodeIDActuallyInstalled

SecretArguments=AllowedWhenUntainted

Arguments:

- `soulbindID`: number
- `conduitID`: number

Returns:

- `nodeID`: number

### C_Soulbinds.FindNodeIDAppearingInstalled

SecretArguments=AllowedWhenUntainted

Arguments:

- `soulbindID`: number
- `conduitID`: number

Returns:

- `nodeID`: number

### C_Soulbinds.FindNodeIDPendingInstall

SecretArguments=AllowedWhenUntainted

Arguments:

- `soulbindID`: number
- `conduitID`: number

Returns:

- `nodeID`: number

### C_Soulbinds.FindNodeIDPendingUninstall

SecretArguments=AllowedWhenUntainted

Arguments:

- `soulbindID`: number
- `conduitID`: number

Returns:

- `nodeID`: number

### C_Soulbinds.GetActiveSoulbindID

Returns:

- `soulbindID`: number

### C_Soulbinds.GetConduitCollection

SecretArguments=AllowedWhenUntainted

Arguments:

- `conduitType`: SoulbindConduitType

Returns:

- `collectionData`: table<ConduitCollectionData>

### C_Soulbinds.GetConduitCollectionCount

Returns:

- `count`: number

### C_Soulbinds.GetConduitCollectionData

SecretArguments=AllowedWhenUntainted

Arguments:

- `conduitID`: number

Returns:

- `collectionData`: ConduitCollectionData?

### C_Soulbinds.GetConduitCollectionDataAtCursor

Returns:

- `collectionData`: ConduitCollectionData?

### C_Soulbinds.GetConduitCollectionDataByVirtualID

SecretArguments=AllowedWhenUntainted

Arguments:

- `virtualID`: number

Returns:

- `collectionData`: ConduitCollectionData?

### C_Soulbinds.GetConduitDisplayed

SecretArguments=AllowedWhenUntainted

Arguments:

- `nodeID`: number

Returns:

- `conduitID`: number

### C_Soulbinds.GetConduitHyperlink

SecretArguments=AllowedWhenUntainted

Arguments:

- `conduitID`: number
- `rank`: number

Returns:

- `link`: cstring

### C_Soulbinds.GetConduitIDPendingInstall

SecretArguments=AllowedWhenUntainted

Arguments:

- `nodeID`: number

Returns:

- `conduitID`: number

### C_Soulbinds.GetConduitQuality

SecretArguments=AllowedWhenUntainted

Arguments:

- `conduitID`: number
- `rank`: number

Returns:

- `quality`: number

### C_Soulbinds.GetConduitRank

SecretArguments=AllowedWhenUntainted

Arguments:

- `conduitID`: number

Returns:

- `conduitRank`: number

### C_Soulbinds.GetConduitSpellID

SecretArguments=AllowedWhenUntainted

Arguments:

- `conduitID`: number
- `conduitRank`: number

Returns:

- `spellID`: number

### C_Soulbinds.GetInstalledConduitID

SecretArguments=AllowedWhenUntainted

Arguments:

- `nodeID`: number

Returns:

- `conduitID`: number

### C_Soulbinds.GetNode

SecretArguments=AllowedWhenUntainted

Arguments:

- `nodeID`: number

Returns:

- `node`: SoulbindNode

### C_Soulbinds.GetSoulbindData

SecretArguments=AllowedWhenUntainted

Arguments:

- `soulbindID`: number

Returns:

- `data`: SoulbindData

### C_Soulbinds.GetSpecsAssignedToSoulbind

SecretArguments=AllowedWhenUntainted

Arguments:

- `soulbindID`: number

Returns:

- `specIDs`: table<number>

### C_Soulbinds.GetTree

SecretArguments=AllowedWhenUntainted

Arguments:

- `treeID`: number

Returns:

- `tree`: SoulbindTree

### C_Soulbinds.HasAnyInstalledConduitInSoulbind

SecretArguments=AllowedWhenUntainted

Arguments:

- `soulbindID`: number

Returns:

- `result`: bool

### C_Soulbinds.HasAnyPendingConduits

Returns:

- `result`: bool

### C_Soulbinds.HasPendingConduitsInSoulbind

SecretArguments=AllowedWhenUntainted

Arguments:

- `soulbindID`: number

Returns:

- `result`: bool

### C_Soulbinds.IsConduitInstalled

SecretArguments=AllowedWhenUntainted

Arguments:

- `nodeID`: number

Returns:

- `result`: bool

### C_Soulbinds.IsConduitInstalledInSoulbind

SecretArguments=AllowedWhenUntainted

Arguments:

- `soulbindID`: number
- `conduitID`: number

Returns:

- `result`: bool

### C_Soulbinds.IsItemConduitByItemInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemInfo`: ItemInfo

Returns:

- `result`: bool

### C_Soulbinds.IsNodePendingModify

SecretArguments=AllowedWhenUntainted

Arguments:

- `nodeID`: number

Returns:

- `result`: bool

### C_Soulbinds.IsUnselectedConduitPendingInSoulbind

SecretArguments=AllowedWhenUntainted

Arguments:

- `soulbindID`: number

Returns:

- `result`: bool

### C_Soulbinds.ModifyNode

SecretArguments=AllowedWhenUntainted

Arguments:

- `nodeID`: number
- `conduitID`: number
- `type`: SoulbindConduitTransactionType

### C_Soulbinds.SelectNode

SecretArguments=AllowedWhenUntainted

Arguments:

- `nodeID`: number

### C_Soulbinds.UnmodifyNode

SecretArguments=AllowedWhenUntainted

Arguments:

- `nodeID`: number

## Events

### SOULBIND_ACTIVATED

SynchronousEvent=true

Payload:

- `soulbindID`: number

### SOULBIND_CONDUIT_COLLECTION_CLEARED

SynchronousEvent=true

### SOULBIND_CONDUIT_COLLECTION_REMOVED

SynchronousEvent=true

Payload:

- `conduitID`: number

### SOULBIND_CONDUIT_COLLECTION_UPDATED

SynchronousEvent=true

Payload:

- `collectionData`: ConduitCollectionData

### SOULBIND_CONDUIT_INSTALLED

SynchronousEvent=true

Payload:

- `nodeID`: number
- `data`: SoulbindConduitData

### SOULBIND_CONDUIT_UNINSTALLED

SynchronousEvent=true

Payload:

- `nodeID`: number
- `data`: SoulbindConduitData

### SOULBIND_FORGE_INTERACTION_ENDED

SynchronousEvent=true

### SOULBIND_FORGE_INTERACTION_STARTED

SynchronousEvent=true

### SOULBIND_NODE_LEARNED

SynchronousEvent=true

Payload:

- `nodeID`: number

### SOULBIND_NODE_UNLEARNED

SynchronousEvent=true

Payload:

- `nodeID`: number

### SOULBIND_NODE_UPDATED

SynchronousEvent=true

Payload:

- `nodeID`: number

### SOULBIND_PATH_CHANGED

SynchronousEvent=true

### SOULBIND_PENDING_CONDUIT_CHANGED

SynchronousEvent=true

Payload:

- `nodeID`: number
- `conduitID`: number

## Tables

### ConduitCollectionData

Fields:

- `conduitID`: number
- `conduitRank`: number
- `conduitItemLevel`: number
- `conduitType`: SoulbindConduitType
- `conduitSpecSetID`: number
- `conduitSpecIDs`: table<number>
- `conduitSpecName`: cstring?
- `covenantID`: number?
- `conduitItemID`: number

### SoulbindConduitData

Fields:

- `conduitID`: number
- `conduitRank`: number

### SoulbindData

Fields:

- `ID`: number
- `covenantID`: number
- `name`: cstring
- `description`: cstring
- `textureKit`: textureKit
- `unlocked`: bool
- `cvarIndex`: luaIndex
- `tree`: SoulbindTree
- `modelSceneData`: SoulbindModelSceneData
- `activationSoundKitID`: number
- `playerConditionReason`: cstring?

### SoulbindModelSceneData

Fields:

- `creatureDisplayInfoID`: number
- `modelSceneActorID`: number

### SoulbindNode

Fields:

- `ID`: number
- `row`: number
- `column`: number
- `icon`: fileID
- `spellID`: number
- `playerConditionReason`: cstring?
- `conduitID`: number
- `conduitRank`: number
- `state`: SoulbindNodeState
- `conduitType`: SoulbindConduitType?
- `parentNodeIDs`: table<number>
- `failureRenownRequirement`: number?
- `socketEnhanced`: bool?

### SoulbindTree

Fields:

- `editable`: bool
- `nodes`: table<SoulbindNode>
