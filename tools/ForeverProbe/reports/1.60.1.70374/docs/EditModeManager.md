# EditModeManager

Namespace `C_EditMode`.

Environment=All, Predicates={}

## Functions

### C_EditMode.ConvertLayoutInfoToString

SecretArguments=AllowedWhenUntainted

Arguments:

- `layoutInfo`: EditModeLayoutInfo

Returns:

- `layoutInfoAsString`: string

### C_EditMode.ConvertStringToLayoutInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `layoutInfoAsString`: string

Returns:

- `layoutInfo`: EditModeLayoutInfo

### C_EditMode.GetAccountSettings

Returns:

- `accountSettings`: table<EditModeSettingInfo>

### C_EditMode.GetEditModeDefaultLayout

Returns:

- `defaultLayout`: number

### C_EditMode.GetLayouts

Returns:

- `layoutInfo`: EditModeLayouts

### C_EditMode.IsValidLayoutName

SecretArguments=AllowedWhenUntainted

Arguments:

- `name`: cstring

Returns:

- `isApproved`: bool

### C_EditMode.OnEditModeExit

### C_EditMode.OnLayoutAdded

SecretArguments=AllowedWhenUntainted

Arguments:

- `addedLayoutIndex`: luaIndex
- `activateNewLayout`: bool
- `isLayoutImported`: bool

### C_EditMode.OnLayoutDeleted

SecretArguments=AllowedWhenUntainted

Arguments:

- `deletedLayoutIndex`: luaIndex

### C_EditMode.SaveLayouts

SecretArguments=AllowedWhenUntainted

Arguments:

- `saveInfo`: EditModeLayouts

### C_EditMode.SetAccountSetting

SecretArguments=AllowedWhenUntainted

Arguments:

- `setting`: EditModeAccountSetting
- `value`: number

### C_EditMode.SetActiveLayout

SecretArguments=AllowedWhenUntainted

Arguments:

- `activeLayout`: luaIndex

## Events

### EDIT_MODE_LAYOUTS_UPDATED

SynchronousEvent=true

Payload:

- `layoutInfo`: EditModeLayouts
- `reconcileLayouts`: bool

## Tables

### EditModeAnchorInfo

Fields:

- `point`: FramePoint
- `relativeTo`: string
- `relativePoint`: FramePoint
- `offsetX`: number
- `offsetY`: number

### EditModeLayoutInfo

Fields:

- `layoutName`: string
- `layoutType`: EditModeLayoutType
- `interfaceStyle`: InputDeviceInterfaceType?
- `systems`: table<EditModeSystemInfo>

### EditModeLayouts

Fields:

- `layouts`: table<EditModeLayoutInfo>
- `activeLayout`: luaIndex

### EditModeSettingInfo

Fields:

- `setting`: number
- `value`: number

### EditModeSystemInfo

Fields:

- `system`: EditModeSystem
- `systemIndex`: luaIndex?
- `anchorInfo`: EditModeAnchorInfo
- `anchorInfo2`: EditModeAnchorInfo?
- `settings`: table<EditModeSettingInfo>
- `isInDefaultPosition`: bool
