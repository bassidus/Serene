# WarCampaign

Namespace `C_CampaignInfo`.

Environment=All, Predicates={}

## Functions

### C_CampaignInfo.GetAvailableCampaigns

Returns:

- `campaignIDs`: table<number>

### C_CampaignInfo.GetCampaignChapterInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `campaignChapterID`: number

Returns:

- `campaignChapterInfo`: CampaignChapterInfo?

### C_CampaignInfo.GetCampaignID

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `campaignID`: number

### C_CampaignInfo.GetCampaignInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `campaignID`: number

Returns:

- `campaignInfo`: CampaignInfo?

### C_CampaignInfo.GetChapterIDs

SecretArguments=AllowedWhenUntainted

Arguments:

- `campaignID`: number

Returns:

- `chapterIDs`: table<number>?

### C_CampaignInfo.GetCurrentChapterID

SecretArguments=AllowedWhenUntainted

Arguments:

- `campaignID`: number

Returns:

- `currentChapterID`: number?

### C_CampaignInfo.GetFailureReason

SecretArguments=AllowedWhenUntainted

Arguments:

- `campaignID`: number

Returns:

- `failureReason`: CampaignFailureReason?

### C_CampaignInfo.GetState

SecretArguments=AllowedWhenUntainted

Arguments:

- `campaignID`: number

Returns:

- `state`: CampaignState

### C_CampaignInfo.IsCampaignQuest

SecretArguments=AllowedWhenUntainted

Arguments:

- `questID`: number

Returns:

- `isCampaignQuest`: bool

### C_CampaignInfo.SortAsNormalQuest

SecretArguments=AllowedWhenUntainted

Arguments:

- `campaignID`: number

Returns:

- `sortAsNormalQuest`: bool

## Tables

### CampaignState

MaxValue=3, MinValue=0, NumValues=4

Fields:

- `Invalid`: CampaignState [= 0]
- `Complete`: CampaignState [= 1]
- `InProgress`: CampaignState [= 2]
- `Stalled`: CampaignState [= 3]

### CampaignChapterInfo

Fields:

- `name`: cstring
- `description`: cstring
- `rewardQuestID`: number

### CampaignFailureReason

Fields:

- `text`: string
- `questID`: number?
- `mapID`: number?

### CampaignInfo

Fields:

- `name`: cstring
- `description`: cstring
- `uiTextureKit`: textureKit
- `isWarCampaign`: bool
- `usesNormalQuestIcons`: bool
- `isContainerCampaign`: bool
- `sortAsNormalQuest`: bool
- `hideFutureChapters`: bool
