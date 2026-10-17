# SkillInfo

Namespace `C_SkillInfo`.

Environment=All, Predicates={}

## Functions

### C_SkillInfo.AbandonSkill

SecretArguments=AllowedWhenUntainted

Arguments:

- `skillLineID`: number

### C_SkillInfo.CollapseSkillHeader

SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex

### C_SkillInfo.ExpandSkillHeader

SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex

### C_SkillInfo.GetNumSkillLines

Returns:

- `numSkillLines`: number

### C_SkillInfo.GetSelectedSkill

Returns:

- `index`: luaIndex

### C_SkillInfo.GetSkillLineInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex

Returns:

- `skillLineAttributes`: SkillLineAttributes?

### C_SkillInfo.GetSkillLineInfoByID

SecretArguments=AllowedWhenUntainted

Arguments:

- `ID`: number

Returns:

- `skillLineAttributes`: SkillLineAttributes?

### C_SkillInfo.SetSelectedSkill

SecretArguments=AllowedWhenUntainted

Arguments:

- `index`: luaIndex

## Events

### SKILL_LINES_CHANGED

SynchronousEvent=true

## Tables

### SkillLineAttributes

Fields:

- `skillID`: number
- `name`: cstring
- `isHeader`: bool
- `isCollapsed`: bool
- `rank`: number
- `tempPoints`: number
- `modifier`: number
- `maxRank`: number
- `isAbandonable`: bool
- `stepCost`: number
- `rankCost`: number
- `minLevel`: number
- `costType`: number
- `parentSkillLineID`: number
- `skillLineCategoryID`: number
- `description`: cstring
