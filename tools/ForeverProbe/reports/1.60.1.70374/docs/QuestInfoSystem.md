# QuestInfoSystem

Namespace `C_QuestInfoSystem`.

Environment=All, Predicates={}

## Functions

### C_QuestInfoSystem.GetQuestClassification

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number?
- `questInfoID`: number?

Returns:

- `classification`: QuestClassification

### C_QuestInfoSystem.GetQuestHasShortExpirationWarning

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number?

Returns:

- `hasShortExpirationWarning`: bool

### C_QuestInfoSystem.GetQuestLogRewardFavor

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number?
- `clampFavorToCycleCap`: bool?

Returns:

- `amount`: number

### C_QuestInfoSystem.GetQuestRewardCurrencies

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number?

Returns:

- `questRewardCurrencyInfo`: table<QuestRewardCurrencyInfo>

### C_QuestInfoSystem.GetQuestRewardSpellInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number?
- `spellID`: number

Returns:

- `info`: QuestRewardSpellInfo?

### C_QuestInfoSystem.GetQuestRewardSpells

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number?

Returns:

- `spellIDs`: table<number>

### C_QuestInfoSystem.GetQuestShouldToastCompletion

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number?

Returns:

- `shouldToast`: bool

### C_QuestInfoSystem.HasQuestRewardCurrencies

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number?

Returns:

- `hasQuestRewardCurrencies`: bool

### C_QuestInfoSystem.HasQuestRewardSpells

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number?

Returns:

- `hasRewardSpells`: bool
