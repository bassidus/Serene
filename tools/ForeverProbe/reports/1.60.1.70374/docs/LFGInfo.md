# LFGInfo

Namespace `C_LFGInfo`.

Environment=All, Predicates={}

## Functions

### C_LFGInfo.AreCrossFactionGroupQueuesAllowed

SecretArguments=AllowedWhenUntainted

Arguments:

- `lfgDungeonID`: number

Returns:

- `areCrossFactionGroupQueuesAllowed`: bool

### C_LFGInfo.CanPlayerUseGroupFinder

Returns:

- `canUse`: bool
- `failureReason`: string

### C_LFGInfo.CanPlayerUseLFD

Returns:

- `canUse`: bool
- `failureReason`: string

### C_LFGInfo.CanPlayerUseLFR

Returns:

- `canUse`: bool
- `failureReason`: string

### C_LFGInfo.CanPlayerUsePVP

Returns:

- `canUse`: bool
- `failureReason`: string

### C_LFGInfo.CanPlayerUsePremadeGroup

Returns:

- `canUse`: bool
- `failureReason`: string

### C_LFGInfo.CanPlayerUseScenarioFinder

Returns:

- `canUse`: bool
- `failureReason`: string

### C_LFGInfo.ConfirmLfgExpandSearch

### C_LFGInfo.DoesActivePartyMeetPremadeLaunchCount

SecretArguments=AllowedWhenUntainted

Arguments:

- `lfgDungeonID`: number

Returns:

- `doesActivePartyMeetPremadeLaunchCount`: bool

### C_LFGInfo.DoesCrossFactionQueueRequireFullPremade

SecretArguments=AllowedWhenUntainted

Arguments:

- `lfgDungeonID`: number

Returns:

- `doesCrossFactionQueueRequireFullPremade`: bool

### C_LFGInfo.GetActiveLFGDungeonName

Returns:

- `name`: string

### C_LFGInfo.GetAllEntriesForCategory

SecretArguments=AllowedWhenUntainted

Arguments:

- `category`: luaIndex

Returns:

- `lfgDungeonIDs`: table<number>

### C_LFGInfo.GetDungeonInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `lfgDungeonID`: number

Returns:

- `dungeonInfo`: LFGDungeonInfo

### C_LFGInfo.GetLFDLockStates

Returns:

- `lockInfo`: table<LFGLockInfo>

### C_LFGInfo.GetLevelUpInstances

SecretArguments=AllowedWhenUntainted

Arguments:

- `currPlayerLevel`: number
- `isRaid`: bool

Returns:

- `instances`: table<number>

### C_LFGInfo.GetRoleCheckDifficultyDetails

Returns:

- `maxLevel`: number?
- `isLevelReduced`: bool

### C_LFGInfo.HideNameFromUI

SecretArguments=AllowedWhenUntainted

Arguments:

- `dungeonID`: number

Returns:

- `shouldHide`: bool

### C_LFGInfo.IsGroupFinderEnabled

Returns:

- `enabled`: bool

### C_LFGInfo.IsInLFGFollowerDungeon

Returns:

- `result`: bool

### C_LFGInfo.IsInMatchmadeRaidWithoutRoleRequirements

Returns:

- `result`: bool

### C_LFGInfo.IsLFDEnabled

Returns:

- `enabled`: bool

### C_LFGInfo.IsLFGFollowerDungeon

SecretArguments=AllowedWhenUntainted

Arguments:

- `dungeonID`: number

Returns:

- `result`: bool

### C_LFGInfo.IsLFREnabled

Returns:

- `enabled`: bool

## Events

### ISLAND_COMPLETED

SynchronousEvent=true

Payload:

- `mapID`: number
- `winner`: number

### LFG_BOOT_PROPOSAL_UPDATE

SynchronousEvent=true

### LFG_COMPLETION_REWARD

SynchronousEvent=true

### LFG_COOLDOWNS_UPDATED

SynchronousEvent=true

### LFG_ENABLED_STATE_CHANGED

SynchronousEvent=true

### LFG_INVALID_ERROR_MESSAGE

SynchronousEvent=true

Payload:

- `reason`: number
- `subReason1`: number
- `subReason2`: number

### LFG_LOCK_INFO_RECEIVED

SynchronousEvent=true

### LFG_OFFER_CONTINUE

SynchronousEvent=true

Payload:

- `name`: cstring
- `lfgDungeonsID`: number
- `typeID`: number

### LFG_OPEN_FROM_GOSSIP

SynchronousEvent=true

Payload:

- `dungeonID`: number

### LFG_PROPOSAL_DONE

SynchronousEvent=true

### LFG_PROPOSAL_FAILED

SynchronousEvent=true

### LFG_PROPOSAL_SHOW

SynchronousEvent=true

### LFG_PROPOSAL_SUCCEEDED

SynchronousEvent=true

### LFG_PROPOSAL_UPDATE

SynchronousEvent=true

### LFG_QUEUE_STATUS_UPDATE

SynchronousEvent=true

### LFG_READY_CHECK_DECLINED

SynchronousEvent=true

Payload:

- `name`: cstring

### LFG_READY_CHECK_HIDE

SynchronousEvent=true

### LFG_READY_CHECK_PLAYER_IS_READY

SynchronousEvent=true

Payload:

- `name`: cstring

### LFG_READY_CHECK_SHOW

SynchronousEvent=true

Payload:

- `isRequeue`: bool

### LFG_READY_CHECK_UPDATE

SynchronousEvent=true

### LFG_ROLE_CHECK_DECLINED

SynchronousEvent=true

### LFG_ROLE_CHECK_HIDE

SynchronousEvent=true

### LFG_ROLE_CHECK_ROLE_CHOSEN

SynchronousEvent=true

Payload:

- `name`: cstring
- `isTank`: bool
- `isHealer`: bool
- `isDamage`: bool

### LFG_ROLE_CHECK_SHOW

SynchronousEvent=true

Payload:

- `isRequeue`: bool

### LFG_ROLE_CHECK_UPDATE

SynchronousEvent=true

### LFG_ROLE_UPDATE

SynchronousEvent=true

### LFG_UPDATE

SynchronousEvent=true

### LFG_UPDATE_RANDOM_INFO

SynchronousEvent=true

### SHOW_LFG_EXPAND_SEARCH_PROMPT

SynchronousEvent=true

### UPDATE_LFG_LIST

SynchronousEvent=true

### WARFRONT_COMPLETED

SynchronousEvent=true

Payload:

- `mapID`: number
- `winner`: number

## Tables

### LFGDungeonInfo

Fields:

- `name`: string
- `iconID`: fileID
- `link`: string?

### LFGLockInfo

Fields:

- `lfgID`: number
- `reason`: number
- `hideEntry`: bool
