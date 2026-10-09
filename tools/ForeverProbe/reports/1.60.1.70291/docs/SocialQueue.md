# SocialQueue

Namespace `C_SocialQueue`.

Environment=All, Predicates={}

## Functions

### C_SocialQueue.GetAllGroups

SecretArguments=AllowedWhenUntainted

Arguments:

- `allowNonJoinable`: bool [default=false]
- `allowNonQueuedGroups`: bool [default=false]

Returns:

- `groupGUIDs`: table<WOWGUID>

### C_SocialQueue.GetConfig

MayReturnNothing=true

Returns:

- `config`: SocialQueueConfig

### C_SocialQueue.GetGroupForPlayer

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `playerGUID`: WOWGUID

Returns:

- `groupGUID`: WOWGUID
- `isSoloQueueParty`: bool

### C_SocialQueue.GetGroupInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `groupGUID`: WOWGUID

Returns:

- `canJoin`: bool
- `numQueues`: number
- `needTank`: bool
- `needHealer`: bool
- `needDamage`: bool
- `isSoloQueueParty`: bool
- `questSessionActive`: bool
- `leaderGUID`: WOWGUID

### C_SocialQueue.GetGroupMembers

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `groupGUID`: WOWGUID

Returns:

- `groupMembers`: table<SocialQueuePlayerInfo>

### C_SocialQueue.GetGroupQueues

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `groupGUID`: WOWGUID

Returns:

- `queues`: table<SocialQueueGroupQueueInfo>

### C_SocialQueue.RequestToJoin

SecretArguments=AllowedWhenUntainted

Arguments:

- `groupGUID`: WOWGUID
- `applyAsTank`: bool [default=false]
- `applyAsHealer`: bool [default=false]
- `applyAsDamage`: bool [default=false]

Returns:

- `requestSuccessful`: bool

### C_SocialQueue.SignalToastDisplayed

SecretArguments=AllowedWhenUntainted

Arguments:

- `groupGUID`: WOWGUID
- `priority`: number

## Events

### SOCIAL_QUEUE_CONFIG_UPDATED

SynchronousEvent=true

### SOCIAL_QUEUE_UPDATE

SynchronousEvent=true

Payload:

- `groupGUID`: WOWGUID
- `numAddedItems`: number?

## Tables

### SocialQueueConfig

Fields:

- `TOASTS_DISABLED`: bool
- `TOAST_DURATION`: number
- `DELAY_DURATION`: number
- `QUEUE_MULTIPLIER`: number
- `PLAYER_MULTIPLIER`: number
- `PLAYER_FRIEND_VALUE`: number
- `PLAYER_GUILD_VALUE`: number
- `THROTTLE_INITIAL_THRESHOLD`: number
- `THROTTLE_DECAY_TIME`: number
- `THROTTLE_PRIORITY_SPIKE`: number
- `THROTTLE_MIN_THRESHOLD`: number
- `THROTTLE_PVP_PRIORITY_NORMAL`: number
- `THROTTLE_PVP_PRIORITY_LOW`: number
- `THROTTLE_PVP_HONOR_THRESHOLD`: number
- `THROTTLE_LFGLIST_PRIORITY_DEFAULT`: number
- `THROTTLE_LFGLIST_PRIORITY_ABOVE`: number
- `THROTTLE_LFGLIST_PRIORITY_BELOW`: number
- `THROTTLE_LFGLIST_ILVL_SCALING_ABOVE`: number
- `THROTTLE_LFGLIST_ILVL_SCALING_BELOW`: number
- `THROTTLE_RF_PRIORITY_ABOVE`: number
- `THROTTLE_RF_ILVL_SCALING_ABOVE`: number
- `THROTTLE_DF_MAX_ITEM_LEVEL`: number
- `THROTTLE_DF_BEST_PRIORITY`: number

### SocialQueueGroupInfo

Fields:

- `canJoin`: bool
- `numQueues`: number
- `needTank`: bool
- `needHealer`: bool
- `needDamage`: bool
- `isSoloQueueParty`: bool
- `questSessionActive`: bool
- `leaderGUID`: WOWGUID

### SocialQueueGroupQueueInfo

Fields:

- `clientID`: number
- `eligible`: bool
- `needTank`: bool
- `needHealer`: bool
- `needDamage`: bool
- `isAutoAccept`: bool
- `queueData`: QueueSpecificInfo

### SocialQueuePlayerInfo

Fields:

- `guid`: WOWGUID
- `clubId`: ClubId?
