# XMLUtil

Namespace `C_XMLUtil`.

Environment=All, Predicates={}

## Functions

### C_XMLUtil.GetTemplateInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: cstring

Returns:

- `info`: XMLTemplateInfo

### C_XMLUtil.GetTemplates

Returns:

- `templates`: table<XMLTemplateListInfo>

## Tables

### XMLTemplateInfo

Fields:

- `type`: cstring
- `width`: number
- `height`: number
- `keyValues`: table<XMLTemplateKeyValue>
- `inherits`: cstring?
- `sourceLocation`: string

### XMLTemplateKeyValue

Fields:

- `key`: cstring
- `keyType`: cstring
- `type`: cstring
- `value`: cstring

### XMLTemplateListInfo

Fields:

- `name`: cstring
- `type`: cstring
