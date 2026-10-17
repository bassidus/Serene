# Expansion

Environment=All, Predicates={}

## Functions

### CanUpgradeToCurrentExpansion

Returns:

- `canUpgradeExpansion`: bool

### DoesCurrentLocaleSellExpansionLevels

Returns:

- `regionSellsExpansions`: bool

### GetAccountExpansionLevel

Returns:

- `expansionLevel`: number

### GetClientDisplayExpansionLevel

Returns:

- `expansionLevel`: number

### GetCurrentRegionName

Returns:

- `regionName`: cstring

### GetExpansionDisplayInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `expansionLevel`: number
- `desiredReleaseType`: ReleaseType?

Returns:

- `info`: ExpansionDisplayInfo?

### GetExpansionForLevel

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `playerLevel`: number

Returns:

- `expansionLevel`: number

### GetExpansionLevel

Returns:

- `expansionLevel`: number

### GetExpansionTrialInfo

Returns:

- `isExpansionTrialAccount`: bool
- `expansionTrialRemainingSeconds`: time_t?

### GetMaxLevelForExpansionLevel -- Maps an expansion level to a maximum character level for that expansion.

SecretArguments=AllowedWhenUntainted

Arguments:

- `expansionLevel`: number

Returns:

- `maxLevel`: number

### GetMaxLevelForLatestExpansion

Returns:

- `maxLevel`: number

### GetMaxLevelForPlayerExpansion

Returns:

- `maxLevel`: number

### GetMaximumExpansionLevel

Returns:

- `expansionLevel`: number

### GetMinimumExpansionLevel

Returns:

- `expansionLevel`: number

### GetNumExpansions

Returns:

- `numExpansions`: number

### GetServerExpansionLevel

Returns:

- `serverExpansionLevel`: number

### GetUpgradeExpansionLevel

Returns:

- `upgradeExpansionLevel`: number

### IsDemonHunterAvailable

Returns:

- `available`: bool

### IsExpansionTrial

Returns:

- `isExpansionTrialAccount`: bool

### IsTrialAccount

Returns:

- `isTrialAccount`: bool

### IsVeteranTrialAccount

Returns:

- `isVeteranTrialAccount`: bool

### SendSubscriptionInterstitialResponse

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `response`: SubscriptionInterstitialResponseType

### ShouldShowExpansionUpgradeBanner

Returns:

- `showUpgradeBanner`: bool

## Events

### MAX_EXPANSION_LEVEL_UPDATED

SynchronousEvent=true

### MIN_EXPANSION_LEVEL_UPDATED

SynchronousEvent=true

### SHOW_SUBSCRIPTION_INTERSTITIAL

SynchronousEvent=true

Payload:

- `type`: SubscriptionInterstitialType

## Tables

### SubscriptionInterstitialResponseType

MaxValue=2, MinValue=0, NumValues=3

Fields:

- `Clicked`: SubscriptionInterstitialResponseType [= 0]
- `Closed`: SubscriptionInterstitialResponseType [= 1]
- `WebRedirect`: SubscriptionInterstitialResponseType [= 2]

### SubscriptionInterstitialType

MaxValue=2, MinValue=0, NumValues=3

Fields:

- `Standard`: SubscriptionInterstitialType [= 0]
- `LeftNpeArea`: SubscriptionInterstitialType [= 1]
- `MaxLevel`: SubscriptionInterstitialType [= 2]

### ExpansionDisplayInfo

Fields:

- `logo`: fileID
- `banner`: textureAtlas
- `features`: table<ExpansionDisplayInfoFeature>
- `highResBackgroundID`: fileID
- `lowResBackgroundID`: fileID
- `textureKit`: textureKit
- `glueAmbianceSoundKit`: number?
- `glueMusicSoundKit`: number?
- `glueCreditsSoundKit`: number?

### ExpansionDisplayInfoFeature

Fields:

- `icon`: fileID
- `text`: cstring
