# WowEntitlementInfo

Namespace `C_WowEntitlementInfo`.

Environment=All, Predicates={}

## Events

### ENTITLEMENT_DELIVERED

SynchronousEvent=true

Payload:

- `entitlementType`: WoWEntitlementType
- `textureID`: number
- `name`: string
- `payloadID`: number?
- `showFancyToast`: bool

### RAF_ENTITLEMENT_DELIVERED

SynchronousEvent=true

Payload:

- `entitlementType`: WoWEntitlementType
- `textureID`: number
- `name`: string
- `payloadID`: number?
- `showFancyToast`: bool
- `rafVersion`: RecruitAFriendRewardsVersion

## Tables

### WoWEntitlementType

MaxValue=9, MinValue=0, NumValues=10

Fields:

- `Item`: WoWEntitlementType [= 0]
- `Mount`: WoWEntitlementType [= 1]
- `Battlepet`: WoWEntitlementType [= 2]
- `Toy`: WoWEntitlementType [= 3]
- `Appearance`: WoWEntitlementType [= 4]
- `AppearanceSet`: WoWEntitlementType [= 5]
- `GameTime`: WoWEntitlementType [= 6]
- `Title`: WoWEntitlementType [= 7]
- `Illusion`: WoWEntitlementType [= 8]
- `Invalid`: WoWEntitlementType [= 9]
