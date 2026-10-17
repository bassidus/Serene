# QuestOffer

Namespace `C_QuestOffer`.

Environment=All, Predicates={}

## Functions

### C_QuestOffer.GetHideRequiredItems

Returns:

- `hideRequiredItems`: bool

### C_QuestOffer.GetQuestOfferMajorFactionReputationRewards

MayReturnNothing=true

Returns:

- `reputationRewards`: table<QuestRewardReputationInfo>

### C_QuestOffer.GetQuestRequiredCurrencyInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `questRewardIndex`: luaIndex

Returns:

- `questRequiredCurrencyInfo`: QuestRequiredCurrencyInfo?

### C_QuestOffer.GetQuestRewardCurrencyInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `questInfoType`: cstring
- `questRewardIndex`: luaIndex

Returns:

- `questRewardCurrencyInfo`: QuestRewardCurrencyInfo?

## Events

### QUEST_ACCEPT_CONFIRM

SynchronousEvent=true

Payload:

- `name`: cstring
- `questTitle`: cstring
- `questID`: number

### QUEST_FINISHED

SynchronousEvent=true

### QUEST_GREETING

SynchronousEvent=true

### QUEST_ITEM_UPDATE

SynchronousEvent=true

### QUEST_PROGRESS

SynchronousEvent=true

## Tables

### QuestRequiredCurrencyInfo

Fields:

- `texture`: fileID
- `name`: cstring
- `currencyID`: number
- `quality`: number
- `requiredAmount`: number
