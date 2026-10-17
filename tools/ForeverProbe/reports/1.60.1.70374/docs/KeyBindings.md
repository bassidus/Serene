# KeyBindings

Namespace `C_KeyBindings`.

Environment=All, Predicates={}

## Functions

### C_KeyBindings.ActivateBindingContext

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `newContext`: BindingContext

### C_KeyBindings.DeactivateBindingContext

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `context`: BindingContext

### C_KeyBindings.GetBindingByKey

SecretArguments=AllowedWhenUntainted

Arguments:

- `action`: cstring
- `context`: BindingContext?

Returns:

- `binding`: cstring

### C_KeyBindings.GetBindingContextForAction

SecretArguments=AllowedWhenUntainted

Arguments:

- `action`: cstring

Returns:

- `context`: BindingContext?

### C_KeyBindings.GetBindingIndex

SecretArguments=AllowedWhenUntainted

Arguments:

- `action`: cstring

Returns:

- `bindingIndex`: luaIndex?

### C_KeyBindings.GetCustomBindingType

SecretArguments=AllowedWhenUntainted

Arguments:

- `bindingIndex`: luaIndex

Returns:

- `customBindingType`: CustomBindingType?

### C_KeyBindings.GetSearchTagsForAction

SecretArguments=AllowedWhenUntainted

Arguments:

- `action`: cstring

Returns:

- `searchTags`: table<string>?

### C_KeyBindings.GetTurnStrafeStyle

Returns:

- `style`: TurnStrafeStyle

### C_KeyBindings.IsBindingContextActive

SecretArguments=AllowedWhenUntainted

Arguments:

- `context`: BindingContext

Returns:

- `isActive`: bool

### C_KeyBindings.SetTurnStrafeStyle -- Can only set to Modern or Legacy.

SecretArguments=AllowedWhenUntainted

Arguments:

- `style`: TurnStrafeStyle

### C_KeyBindings.UpdateTurnStrafeBindingsForCharacter

## Events

### BINDINGS_LOADED

SynchronousEvent=true

### MODIFIER_STATE_CHANGED

SynchronousEvent=true

Payload:

- `key`: cstring
- `down`: number

### NOTIFY_TURN_STRAFE_CHANGE

SynchronousEvent=true

### UPDATE_BINDINGS

SynchronousEvent=true

## Tables

### BindingContext

MaxValue=9, MinValue=0, NumValues=10

Fields:

- `None`: BindingContext [= 0]
- `HousingEditor`: BindingContext [= 1]
- `HousingEditorBasicDecorMode`: BindingContext [= 2]
- `HousingEditorExpertDecorMode`: BindingContext [= 3]
- `HousingEditorCustomizeMode`: BindingContext [= 4]
- `HousingEditorCleanupMode`: BindingContext [= 5]
- `HousingEditorLayoutMode`: BindingContext [= 6]
- `HousingEditorBasicAndExpertDecorMode`: BindingContext [= 7]
- `HousingEditorExteriorCustomizationMode`: BindingContext [= 8]
- `GamepadModeInGameCore`: BindingContext [= 9]

### BindingSet

MaxValue=3, MinValue=0, NumValues=4

Fields:

- `Default`: BindingSet [= 0]
- `Account`: BindingSet [= 1]
- `Character`: BindingSet [= 2]
- `Current`: BindingSet [= 3]

### CustomBindingType

MaxValue=0, MinValue=0, NumValues=1

Fields:

- `VoicePushToTalk`: CustomBindingType [= 0]

### TurnStrafeStyle

MaxValue=2, MinValue=0, NumValues=3

Fields:

- `Modern`: TurnStrafeStyle [= 0]
- `Legacy`: TurnStrafeStyle [= 1]
- `Custom`: TurnStrafeStyle [= 2]

### InputCommandCallback
