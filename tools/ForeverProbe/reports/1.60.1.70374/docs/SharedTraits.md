# SharedTraits

Namespace `C_Traits`.

Environment=All, Predicates={}

## Functions

### C_Traits.CanEditConfig -- Returns whether the player can make changes to the specified talent config.

SecretArguments=AllowedWhenUntainted

Arguments:

- `configID`: number

Returns:

- `canEdit`: bool
- `errorMessage`: cstring -- If canEdit is false, this will be filled out with text explaining why the player can not make changes.

### C_Traits.CanPurchaseRank

SecretArguments=AllowedWhenUntainted

Arguments:

- `configID`: number
- `nodeID`: number
- `nodeEntryID`: number

Returns:

- `canPurchase`: bool

### C_Traits.CanRefundRank

SecretArguments=AllowedWhenUntainted

Arguments:

- `configID`: number
- `nodeID`: number

Returns:

- `canRefund`: bool

### C_Traits.CascadeRepurchaseRanks

SecretArguments=AllowedWhenUntainted

Arguments:

- `configID`: number
- `nodeID`: number
- `entryID`: number?

Returns:

- `success`: bool

### C_Traits.ClearCascadeRepurchaseHistory

SecretArguments=AllowedWhenUntainted

Arguments:

- `configID`: number

### C_Traits.CloseTraitSystemInteraction

### C_Traits.CommitConfig

SecretArguments=AllowedWhenUntainted

Arguments:

- `configID`: number

Returns:

- `success`: bool

### C_Traits.ConfigHasStagedChanges

SecretArguments=AllowedWhenUntainted

Arguments:

- `configID`: number

Returns:

- `hasChanges`: bool

### C_Traits.GenerateImportString

SecretArguments=AllowedWhenUntainted

Arguments:

- `configID`: number

Returns:

- `importString`: string

### C_Traits.GenerateInspectImportString

SecretArguments=AllowedWhenUntainted

Arguments:

- `target`: cstring

Returns:

- `importString`: string

### C_Traits.GetConditionInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `configID`: number
- `condID`: number

Returns:

- `condInfo`: TraitCondInfo

### C_Traits.GetConfigIDBySystemID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `systemID`: number

Returns:

- `configID`: number

### C_Traits.GetConfigIDByTreeID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `treeID`: number

Returns:

- `configID`: number

### C_Traits.GetConfigInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `configID`: number

Returns:

- `configInfo`: TraitConfigInfo

### C_Traits.GetConfigVariationID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `systemID`: number

Returns:

- `variationID`: number

### C_Traits.GetConfigsByType

SecretArguments=AllowedWhenUntainted

Arguments:

- `configType`: TraitConfigType

Returns:

- `configIDs`: table<number>

### C_Traits.GetDefinitionInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `definitionID`: number

Returns:

- `definitionInfo`: TraitDefinitionInfo

### C_Traits.GetEntryInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `configID`: number
- `entryID`: number

Returns:

- `entryInfo`: TraitEntryInfo

### C_Traits.GetGroupCurrencyInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `configID`: number
- `groupIDs`: table<number>

Returns:

- `groupCurrencyInfos`: table<GroupCurrencyInfo>

### C_Traits.GetGroupDisplayInfoByTreeID

SecretArguments=AllowedWhenUntainted

Arguments:

- `treeID`: number

Returns:

- `displayInfos`: table<TraitGroupDisplayInfo>

### C_Traits.GetIncreasedTraitData

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `nodeID`: number
- `entryID`: number

Returns:

- `itemName`: table<IncreasedTraitData>

### C_Traits.GetLoadoutSerializationVersion

Returns:

- `serializationVersion`: number

### C_Traits.GetMaxAvailableTraitCurrency

SecretArguments=AllowedWhenUntainted

Arguments:

- `traitCurrencyID`: number
- `limitBySourcedMax`: bool

Returns:

- `maxAvailable`: number

### C_Traits.GetNodeCost

SecretArguments=AllowedWhenUntainted

Arguments:

- `configID`: number
- `nodeID`: number

Returns:

- `costs`: table<TraitCurrencyCost>

### C_Traits.GetNodeInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `configID`: number
- `nodeID`: number

Returns:

- `nodeInfo`: TraitNodeInfo

### C_Traits.GetStagedChanges -- Returns IDs of Trait Nodes with pending changes, grouped by the type of change; Returns nothing if there are no pending changes

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `configID`: number

Returns:

- `nodeIDsWithPurchases`: table<number>
- `nodeIDsWithRefunds`: table<number>
- `nodeIDsWithSelectionSwaps`: table<number> -- Selection nodes that had a previously committed selected entry, and now have a different selected entry pending

### C_Traits.GetStagedChangesCost

SecretArguments=AllowedWhenUntainted

Arguments:

- `configID`: number

Returns:

- `costs`: table<TraitCurrencyCost>

### C_Traits.GetSubTreeInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `configID`: number
- `subTreeID`: number

Returns:

- `subTreeInfo`: TraitSubTreeInfo

### C_Traits.GetSystemIDByTreeID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `treeID`: number

Returns:

- `systemID`: number

### C_Traits.GetTraitCurrencyForAchievement

SecretArguments=AllowedWhenUntainted

Arguments:

- `traitCurrencyID`: number
- `achievementID`: number

Returns:

- `amount`: number

### C_Traits.GetTraitCurrencyInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `traitCurrencyID`: number

Returns:

- `flags`: number
- `type`: number
- `currencyTypesID`: number?
- `icon`: number?

### C_Traits.GetTraitDescription

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `entryID`: number
- `rank`: number

Returns:

- `description`: string

### C_Traits.GetTraitSystemFlags

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `configID`: number

Returns:

- `flags`: number

### C_Traits.GetTraitSystemWidgetSetID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `configID`: number

Returns:

- `uiWidgetSetID`: number

### C_Traits.GetTreeCurrencyInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `configID`: number
- `treeID`: number
- `excludeStagedChanges`: bool

Returns:

- `treeCurrencyInfo`: table<TreeCurrencyInfo>

### C_Traits.GetTreeHash

SecretArguments=AllowedWhenUntainted

Arguments:

- `treeID`: number

Returns:

- `result`: table<number>

### C_Traits.GetTreeInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `configID`: number
- `treeID`: number

Returns:

- `treeInfo`: TraitTreeInfo

### C_Traits.GetTreeNodes -- Returns a list of nodeIDs, sorted ascending, for a given treeID. Contains nodes for all class specializations.

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `treeID`: number

Returns:

- `nodeIDs`: table<number>

### C_Traits.HasValidInspectData

Returns:

- `hasValidInspectData`: bool

### C_Traits.IsReadyForCommit

Returns:

- `isReadyForCommit`: bool

### C_Traits.PurchaseAllRanks

SecretArguments=AllowedWhenUntainted

Arguments:

- `configID`: number
- `nodeID`: number
- `ignoreCost`: bool

Returns:

- `success`: bool

### C_Traits.PurchaseRank

SecretArguments=AllowedWhenUntainted

Arguments:

- `configID`: number
- `nodeID`: number

Returns:

- `success`: bool

### C_Traits.RefundAllRanks

SecretArguments=AllowedWhenUntainted

Arguments:

- `configID`: number
- `nodeID`: number

Returns:

- `success`: bool

### C_Traits.RefundRank

SecretArguments=AllowedWhenUntainted

Arguments:

- `configID`: number
- `nodeID`: number
- `clearEdges`: bool?

Returns:

- `success`: bool

### C_Traits.ResetTree

SecretArguments=AllowedWhenUntainted

Arguments:

- `configID`: number
- `treeID`: number

Returns:

- `success`: bool

### C_Traits.ResetTreeByCurrency

SecretArguments=AllowedWhenUntainted

Arguments:

- `configID`: number
- `treeID`: number
- `traitCurrencyID`: number

Returns:

- `success`: bool

### C_Traits.RollbackConfig

SecretArguments=AllowedWhenUntainted

Arguments:

- `configID`: number

Returns:

- `success`: bool

### C_Traits.SetSelection

SecretArguments=AllowedWhenUntainted

Arguments:

- `configID`: number
- `nodeID`: number
- `nodeEntryID`: number?
- `clearEdges`: bool?

Returns:

- `success`: bool

### C_Traits.StageConfig

SecretArguments=AllowedWhenUntainted

Arguments:

- `configID`: number

Returns:

- `success`: bool

### C_Traits.TalentTestUnlearnSpells

### C_Traits.TryPurchaseAllRanks

SecretArguments=AllowedWhenUntainted

Arguments:

- `configID`: number
- `nodeID`: number

Returns:

- `success`: bool

### C_Traits.TryPurchaseToNode

SecretArguments=AllowedWhenUntainted

Arguments:

- `configID`: number
- `nodeID`: number

Returns:

- `success`: bool

### C_Traits.TryRefundToNode

SecretArguments=AllowedWhenUntainted

Arguments:

- `configID`: number
- `nodeID`: number
- `entryID`: number

Returns:

- `success`: bool

## Events

### CONFIG_COMMIT_FAILED

SynchronousEvent=true

Payload:

- `configID`: number

### TRAIT_COND_INFO_CHANGED

SynchronousEvent=true

Payload:

- `condID`: number

### TRAIT_CONFIG_CREATED

SynchronousEvent=true

Payload:

- `configInfo`: TraitConfigInfo

### TRAIT_CONFIG_DELETED

SynchronousEvent=true

Payload:

- `configID`: number

### TRAIT_CONFIG_LIST_UPDATED

SynchronousEvent=true

### TRAIT_CONFIG_UPDATED

SynchronousEvent=true

Payload:

- `configID`: number

### TRAIT_NODE_CHANGED

SynchronousEvent=true

Payload:

- `nodeID`: number

### TRAIT_NODE_CHANGED_PARTIAL

SynchronousEvent=true

Payload:

- `ID`: number
- `info`: TraitNodeInfoPartial

### TRAIT_NODE_ENTRY_UPDATED

SynchronousEvent=true

Payload:

- `nodeEntryID`: number

### TRAIT_SUB_TREE_CHANGED

SynchronousEvent=true

Payload:

- `subTreeID`: number

### TRAIT_SYSTEM_INTERACTION_STARTED

SynchronousEvent=true

Payload:

- `treeID`: number

### TRAIT_SYSTEM_NPC_CLOSED

SynchronousEvent=true

### TRAIT_TREE_CHANGED

SynchronousEvent=true

Payload:

- `treeID`: number

### TRAIT_TREE_CURRENCY_INFO_UPDATED

SynchronousEvent=true

Payload:

- `treeID`: number

### TRY_PURCHASE_TO_NODE_PARTIAL_SUCCESS

SynchronousEvent=true

Payload:

- `nodeFinishedOn`: number

## Tables

### GroupCurrencyInfo

Fields:

- `traitNodeGroupID`: number
- `currencyInfos`: table<TreeCurrencyInfo>

### IncreasedTraitData

Fields:

- `itemNameIncreasing`: string
- `itemQualityIncreasing`: ItemQuality
- `numPointsIncreased`: number

### TraitCondInfo

Fields:

- `condID`: number
- `ranksGranted`: number?
- `isAlwaysMet`: bool
- `isMet`: bool -- True if the source for the condition has been fulfilled.
- `isGate`: bool
- `isSufficient`: bool -- True if meeting the requirements for the condition means any nodes using this condition are considered fulfilled if the condition is met.
- `type`: number -- The value from the TraitConditionType enum the condition uses.
- `questID`: number?
- `achievementID`: number?
- `specSetID`: number?
- `playerLevel`: number?
- `traitCurrencyID`: number?
- `spentAmountRequired`: number?
- `tooltipFormat`: string?
- `traitCondAccountElementID`: number?

### TraitConfigInfo

Fields:

- `ID`: number
- `type`: TraitConfigType
- `name`: string
- `treeIDs`: table<number>
- `usesSharedActionBars`: bool

### TraitCurrencyCost

Fields:

- `ID`: number
- `amount`: number

### TraitDefinitionInfo

Fields:

- `spellID`: number?
- `overrideName`: string?
- `overrideSubtext`: string?
- `overrideDescription`: string?
- `overrideIcon`: number?
- `overriddenSpellID`: number?
- `subType`: TraitDefinitionSubType?

### TraitEntryInfo

Fields:

- `definitionID`: number? -- Nil on SubTreeSelection Node Entries
- `subTreeID`: number? -- Populated only on SubTreeSelection Node Entries; This is the SubTree that is activated if this Entry is chosen
- `type`: TraitNodeEntryType
- `maxRanks`: number
- `isAvailable`: bool
- `isDisplayError`: bool -- True if this entry fails the TRAIT_CONDITION_TYPE_DISPLAY_ERROR condition check. Used to communicate a problem with the node to the player (e.g. A prerequisite node has not been purchased.) but will not prevent the player from spending points on the node.
- `conditionIDs`: table<number>

### TraitEntryRankInfo

Fields:

- `entryID`: number
- `rank`: number

### TraitGateInfo

Fields:

- `topLeftNodeID`: number
- `conditionID`: number

### TraitGroupDisplayInfo

Fields:

- `groupID`: number
- `treeID`: number
- `skillLineID`: number
- `orderIndex`: number
- `displayName`: cstring
- `icon`: number

### TraitNodeInfo

Fields:

- `ID`: number
- `posX`: number
- `posY`: number
- `flags`: number
- `entryIDs`: table<number>
- `entryIDsWithCommittedRanks`: table<number>
- `canPurchaseRank`: bool
- `canRefundRank`: bool
- `isAvailable`: bool
- `isVisible`: bool
- `isDisplayError`: bool -- True if this node fails the TRAIT_CONDITION_TYPE_DISPLAY_ERROR condition check. Used to communicate a problem with the node to the player (e.g. A prerequisite node has not been purchased.) but will not prevent the player from spending points on the node.
- `ranksPurchased`: number
- `ranksIncreased`: number
- `entryIDToRanksIncreased`: LuaValueVariant -- A map of the entry IDs on this node to the number of ranks increased. This covers all entries on the node, which is important in the case of selection nodes where we have more than one option that could be increased.
- `activeRank`: number
- `currentRank`: number
- `activeEntry`: TraitEntryRankInfo?
- `nextEntry`: TraitEntryRankInfo?
- `maxRanks`: number
- `totalMaxRanks`: number
- `type`: TraitNodeType
- `visibleEdges`: table<TraitOutEdgeInfo>
- `meetsEdgeRequirements`: bool
- `groupIDs`: table<number>
- `conditionIDs`: table<number>
- `isCascadeRepurchasable`: bool
- `cascadeRepurchaseEntryID`: number?
- `subTreeID`: number? -- The SubTree this Node belongs to; Nil if it is not part of a SubTree
- `subTreeActive`: bool? -- True if this node has a SubTreeID, and the SubTree is chosen or staged; May be nil if not part of a SubTree at all

### TraitNodeInfoPartial

Fields:

- `canPurchaseRank`: bool?
- `canRefundRank`: bool?
- `isAvailable`: bool?
- `isVisible`: bool?
- `ranksPurchased`: number?
- `activeRank`: number?
- `currentRank`: number?
- `meetsEdgeRequirements`: bool?
- `isCascadeRepurchasable`: bool?
- `activeEntryID`: number?
- `subTreeActive`: bool?

### TraitOutEdgeInfo

Fields:

- `targetNode`: number
- `type`: number
- `visualStyle`: number
- `isActive`: bool

### TraitSubTreeInfo

Fields:

- `ID`: number
- `name`: string?
- `description`: string?
- `iconElementID`: textureAtlas?
- `traitCurrencyID`: number?
- `isActive`: bool
- `subTreeSelectionNodeIDs`: table<number> -- SubTreeSelectionNodes whose choice entries include this SubTree
- `posX`: number -- Center X node position calculated from the posX values of all of this subTree's nodes
- `posY`: number -- Topmost Y node position taken from the posY values of all of this subTree's nodes

### TraitTreeInfo

Fields:

- `ID`: number
- `gates`: table<TraitGateInfo>
- `hideSingleRankNumbers`: bool
- `cannotRefund`: bool
- `rootNodeID`: number?
- `uiTextureKit`: textureKit
- `titleText`: string?

### TreeCurrencyInfo

Fields:

- `traitCurrencyID`: number
- `quantity`: number
- `maxQuantity`: number?
- `spent`: number
- `spentInTree`: number?
