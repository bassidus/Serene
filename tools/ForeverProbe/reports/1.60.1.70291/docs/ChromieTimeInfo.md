# ChromieTimeInfo

Namespace `C_ChromieTime`.

Environment=All, Predicates={}

## Functions

### C_ChromieTime.CloseUI

### C_ChromieTime.GetChromieTimeExpansionOption

SecretArguments=AllowedWhenUntainted

Arguments:

- `expansionRecID`: number

Returns:

- `info`: ChromieTimeExpansionInfo?

### C_ChromieTime.GetChromieTimeExpansionOptions

Returns:

- `expansionOptions`: table<ChromieTimeExpansionInfo>

### C_ChromieTime.SelectChromieTimeOption

SecretArguments=AllowedWhenUntainted

Arguments:

- `chromieTimeExpansionInfoId`: number

## Tables

### ChromieTimeExpansionInfo

Fields:

- `id`: number
- `name`: cstring
- `description`: cstring
- `mapAtlas`: textureAtlas
- `previewAtlas`: textureAtlas
- `completed`: bool
- `alreadyOn`: bool
- `recommended`: bool
- `sortPriority`: number
