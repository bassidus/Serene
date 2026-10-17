# DelvesUI

Namespace `C_DelvesUI`.

Environment=All, Predicates={}

## Functions

### C_DelvesUI.GetActiveDelveTier -- Returns the entrance tier information for the active Delve (via party data). Assumes only Delves use this type for now.

Returns:

- `tierInfo`: TieredEntranceTierInfo

### C_DelvesUI.GetCompanionInfoForActivePlayer

Returns:

- `playerCompanionInfoID`: number

### C_DelvesUI.GetCreatureDisplayInfoForCompanion

SecretArguments=AllowedWhenUntainted

Arguments:

- `companionID`: number?

Returns:

- `creatureDisplayInfoID`: number

### C_DelvesUI.GetCurioLink -- Given the spell ID for an owned curio and its rarity, return a spell link style hyperlink for the curio spell, since they aren't items when learned

SecretArguments=AllowedWhenTainted

Arguments:

- `spellID`: SpellIdentifier
- `rarity`: CurioRarity [NeverSecret=true]

Returns:

- `curioLink`: cstring

### C_DelvesUI.GetCurioNodeForCompanion

SecretArguments=AllowedWhenUntainted

Arguments:

- `curioType`: CurioType
- `companionID`: number?

Returns:

- `nodeID`: number

### C_DelvesUI.GetCurioRarityByTraitCondAccountElementID

SecretArguments=AllowedWhenUntainted

Arguments:

- `traitCondAccountElementID`: number

Returns:

- `rarity`: CurioRarity

### C_DelvesUI.GetCurrentDelvesSeasonNumber

Returns:

- `seasonNumber`: number

### C_DelvesUI.GetDelveEntranceBackgroundWidgetSetID

Returns:

- `backgroundWidgetSetID`: number

### C_DelvesUI.GetDelveEntranceDescriptionString

Returns:

- `description`: string?

### C_DelvesUI.GetDelveEntranceHeaderString

Returns:

- `header`: string?

### C_DelvesUI.GetDelveEntranceMapID

Returns:

- `mapID`: number

### C_DelvesUI.GetDelveEntranceTiers

Returns:

- `levelInfo`: table<TieredEntranceTierInfo>

### C_DelvesUI.GetDelveEntranceTitleString

Returns:

- `title`: cstring?

### C_DelvesUI.GetDelvesAffixSpellsForSeason

Returns:

- `affixSpellIDs`: table<number>

### C_DelvesUI.GetDelvesFactionForSeason

Returns:

- `factionID`: number

### C_DelvesUI.GetDelvesMinRequiredLevel -- Players must be at or above the min level + offset to enter Delves. This function returns that min level.

Returns:

- `minRequiredLevel`: number?

### C_DelvesUI.GetFactionForCompanion

SecretArguments=AllowedWhenUntainted

Arguments:

- `companionID`: number?

Returns:

- `factionID`: number

### C_DelvesUI.GetFlavorNodeForCompanion

SecretArguments=AllowedWhenUntainted

Arguments:

- `companionID`: number?

Returns:

- `nodeID`: number

### C_DelvesUI.GetFlavorNodeNameForCompanion

SecretArguments=AllowedWhenUntainted

Arguments:

- `companionID`: number?

Returns:

- `name`: cstring

### C_DelvesUI.GetLockedTextForCompanion

SecretArguments=AllowedWhenUntainted

Arguments:

- `companionID`: number?

Returns:

- `text`: cstring

### C_DelvesUI.GetModelSceneForCompanion

SecretArguments=AllowedWhenUntainted

Arguments:

- `companionID`: number?

Returns:

- `modelSceneID`: number

### C_DelvesUI.GetPlayerCompanionPDEID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `companionID`: number?

Returns:

- `pdeID`: number

### C_DelvesUI.GetRoleNodeForCompanion

SecretArguments=AllowedWhenUntainted

Arguments:

- `companionID`: number?

Returns:

- `nodeID`: number

### C_DelvesUI.GetRoleSubtreeForCompanion

SecretArguments=AllowedWhenUntainted

Arguments:

- `roleType`: CompanionRoleType
- `companionID`: number?

Returns:

- `subTreeID`: number

### C_DelvesUI.GetTieredEntranceOptionalAffixTraitTreeID

Returns:

- `treeID`: number?

### C_DelvesUI.GetTieredEntrancePDEID

Returns:

- `pdeID`: number

### C_DelvesUI.GetTieredEntranceType

Returns:

- `entranceType`: TieredEntranceType

### C_DelvesUI.GetTraitTreeForCompanion

SecretArguments=AllowedWhenUntainted

Arguments:

- `companionID`: number?

Returns:

- `treeID`: number

### C_DelvesUI.GetUnseenCuriosBySlotType

SecretArguments=AllowedWhenUntainted

Arguments:

- `slotType`: CompanionConfigSlotTypes
- `ownedCurioNodeIDs`: table<number>

Returns:

- `unseenCurioNodeIDs`: table<number>

### C_DelvesUI.GetWorldTierDifficultyForActivePlayer

Returns:

- `difficulty`: WorldTierDifficulty

### C_DelvesUI.HasActiveDelve

Returns:

- `result`: bool

### C_DelvesUI.HasActiveLFGLair

Returns:

- `result`: bool

### C_DelvesUI.HasActiveLair

Returns:

- `result`: bool

### C_DelvesUI.IsDelveEntranceTierEnabled

SecretArguments=AllowedWhenUntainted

Arguments:

- `tier`: number

Returns:

- `isEnabled`: bool
- `failureReason`: string?

### C_DelvesUI.IsEligibleForActiveDelveRewards

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `result`: bool

### C_DelvesUI.IsInLair

Returns:

- `result`: bool

### C_DelvesUI.IsTraitTreeForCompanion

SecretArguments=AllowedWhenUntainted

Arguments:

- `traitTreeID`: number

Returns:

- `isForCompanion`: bool

### C_DelvesUI.RequestPartyEligibilityForDelveTiers -- Queries private party members to see what level they have unlocked for the Delve. Ineligible members are added to the tooltip of dropdown entries.

SecretArguments=AllowedWhenUntainted

Arguments:

- `mapID`: number

### C_DelvesUI.SaveSeenCuriosBySlotType

SecretArguments=AllowedWhenUntainted

Arguments:

- `slotType`: CompanionConfigSlotTypes
- `ownedCurioNodeIDs`: table<number>

### C_DelvesUI.SelectDelveEntranceTier

SecretArguments=AllowedWhenUntainted

Arguments:

- `tier`: number

## Events

### ACTIVE_DELVE_DATA_UPDATE -- Signaled when SpellScript calls change the data for players/parties owning a delve or when the delve is shut down.

SynchronousEvent=true

### DELVE_ASSIST_ACTION -- Signaled when an assist action occurs in a delve.

SynchronousEvent=true

Payload:

- `data`: DelveAssistActionData

### DELVES_ACCOUNT_DATA_ELEMENT_CHANGED -- Signaled when player account data element(s) have changed. This drives curio ranks, and the UI should update when this is sent.

SynchronousEvent=true

### PARTY_ELIGIBILITY_FOR_DELVE_TIERS_CHANGED -- Signaled when responses come in from RequestPartyEligibilityForDelveTiers.

SynchronousEvent=true

Payload:

- `playerName`: string
- `maxEligibleLevel`: number

### SHOW_DELVES_COMPANION_CONFIGURATION_UI -- Signaled when SpellScript indicates that a curio has been learned or upgraded. Will show the companion config UI.

SynchronousEvent=true

### WALK_IN_DATA_UPDATE -- Signaled when the player or a private party member join a new walk-in instance or when the instance is shut down.

SynchronousEvent=true

## Tables

### CompanionRoleType

MaxValue=2, MinValue=0, NumValues=3

Fields:

- `Dps`: CompanionRoleType [= 0]
- `Heal`: CompanionRoleType [= 1]
- `Tank`: CompanionRoleType [= 2]

### CurioType

MaxValue=1, MinValue=0, NumValues=2

Fields:

- `Combat`: CurioType [= 0]
- `Utility`: CurioType [= 1]

### TieredEntranceRewardType

MaxValue=1, MinValue=0, NumValues=2

Fields:

- `Item`: TieredEntranceRewardType [= 0]
- `Currency`: TieredEntranceRewardType [= 1]

### TieredEntranceRewardInfo

Fields:

- `id`: number
- `quantity`: number
- `rewardType`: TieredEntranceRewardType
- `context`: ItemCreationContext

### TieredEntranceTierInfo

Fields:

- `tier`: number
- `suggestedILvl`: number
- `overrideTooltipSpellID`: number
- `unlocked`: bool
- `tierDescription`: string
- `rewards`: table<TieredEntranceRewardInfo>
- `modifierUIWidgetSetID`: number
- `lockedReason`: string?
- `queueAsLFG`: bool
- `difficultyID`: number
