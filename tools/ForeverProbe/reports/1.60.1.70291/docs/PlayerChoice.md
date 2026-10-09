# PlayerChoice

Namespace `C_PlayerChoice`.

Environment=All, Predicates={}

## Functions

### C_PlayerChoice.GetCurrentPlayerChoiceInfo

MayReturnNothing=true

Returns:

- `choiceInfo`: PlayerChoiceInfo

### C_PlayerChoice.GetNumRerolls

Returns:

- `numRerolls`: number

### C_PlayerChoice.GetRemainingTime

Returns:

- `remainingTime`: number?

### C_PlayerChoice.IsWaitingForPlayerChoiceResponse

Returns:

- `isWaitingForResponse`: bool

### C_PlayerChoice.OnUIClosed

### C_PlayerChoice.RequestRerollPlayerChoice

### C_PlayerChoice.SendPlayerChoiceResponse

SecretArguments=AllowedWhenUntainted

Arguments:

- `responseID`: number

## Events

### PLAYER_CHOICE_CLOSE

SynchronousEvent=true

### PLAYER_CHOICE_UPDATE

UniqueEvent=true

## Tables

### PlayerChoiceRarity

MaxValue=3, MinValue=0, NumValues=4

Fields:

- `Common`: PlayerChoiceRarity [= 0]
- `Uncommon`: PlayerChoiceRarity [= 1]
- `Rare`: PlayerChoiceRarity [= 2]
- `Epic`: PlayerChoiceRarity [= 3]

### PlayerChoiceInfo

Fields:

- `objectGUID`: WOWGUID
- `choiceID`: number
- `questionText`: string
- `pendingChoiceText`: string
- `uiTextureKit`: textureKit
- `hideWarboardHeader`: bool
- `keepOpenAfterChoice`: bool
- `requiresSelection`: bool
- `hideAnswerArt`: bool
- `playerChoiceLayout`: PlayerChoiceLayout
- `options`: table<PlayerChoiceOptionInfo>
- `soundKitID`: number?
- `closeUISoundKitID`: number?

### PlayerChoiceOptionButtonInfo

Fields:

- `id`: number
- `text`: string
- `disabled`: bool
- `showCheckmark`: bool
- `hideButtonShowText`: bool
- `selected`: bool
- `confirmation`: string?
- `tooltip`: string?
- `rewardQuestID`: number?
- `soundKitID`: number?
- `listText`: string?

### PlayerChoiceOptionInfo

Fields:

- `id`: number
- `description`: string
- `header`: string
- `choiceArtID`: number
- `desaturatedArt`: bool
- `disabledOption`: bool
- `hasRewards`: bool
- `rewardInfo`: PlayerChoiceOptionRewardInfo
- `uiTextureKit`: textureKit
- `maxStacks`: number
- `buttons`: table<PlayerChoiceOptionButtonInfo>
- `widgetSetID`: number?
- `spellID`: number?
- `rarity`: PlayerChoiceRarity?
- `typeArtID`: number?
- `headerIconAtlasElement`: string?
- `subHeader`: string?
- `consolidateWidgets`: bool

### PlayerChoiceOptionRewardInfo

Fields:

- `currencyRewards`: table<PlayerChoiceRewardCurrencyInfo>
- `itemRewards`: table<PlayerChoiceRewardItemInfo>
- `repRewards`: table<PlayerChoiceRewardReputationInfo>

### PlayerChoiceRewardCurrencyInfo

Fields:

- `currencyId`: number
- `name`: string
- `currencyTexture`: number
- `quantity`: number
- `isCurrencyContainer`: bool

### PlayerChoiceRewardItemInfo

Fields:

- `itemId`: number
- `name`: string
- `quantity`: number

### PlayerChoiceRewardReputationInfo

Fields:

- `factionId`: number
- `quantity`: number
