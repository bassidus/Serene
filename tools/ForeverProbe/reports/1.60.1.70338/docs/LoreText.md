# LoreText

Namespace `C_LoreText`.

Environment=All, Predicates={}

## Functions

### C_LoreText.RequestLoreTextForCampaignID

SecretArguments=AllowedWhenUntainted

Arguments:

- `campaignID`: number

## Events

### LORE_TEXT_UPDATED_CAMPAIGN

SynchronousEvent=true

Payload:

- `campaignID`: number
- `textEntries`: table<LoreTextEntry>

## Tables

### LoreTextEntry

Fields:

- `text`: string
- `isHeader`: bool
