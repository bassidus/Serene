# SocialUI

Namespace `C_SocialUI`.

Environment=All, Predicates={}

## Functions

### C_SocialUI.IsSystemEnabled

Returns:

- `isSocialUISystemEnabled`: bool

## Events

### SOCIAL_UI_SYSTEM_STATUS_UPDATED

SynchronousEvent=true

## Tables

### SocialSystemType

MaxValue=4, MinValue=0, NumValues=5

Fields:

- `Friends`: SocialSystemType [= 0]
- `QuickJoin`: SocialSystemType [= 1]
- `RaidList`: SocialSystemType [= 2]
- `RecruitAFriend`: SocialSystemType [= 3]
- `RecentAllies`: SocialSystemType [= 4]

### SocialUIBlockType

MaxValue=2, MinValue=0, NumValues=3

Fields:

- `None`: SocialUIBlockType [= 0]
- `Ignore`: SocialUIBlockType [= 1]
- `BattleNetInviteBlock`: SocialUIBlockType [= 2]

### SocialUIPresenceType

MaxValue=5, MinValue=0, NumValues=6

Fields:

- `Unknown`: SocialUIPresenceType [= 0]
- `Online`: SocialUIPresenceType [= 1]
- `Offline`: SocialUIPresenceType [= 2]
- `Away`: SocialUIPresenceType [= 3]
- `Busy`: SocialUIPresenceType [= 4]
- `AppearOffline`: SocialUIPresenceType [= 5]
