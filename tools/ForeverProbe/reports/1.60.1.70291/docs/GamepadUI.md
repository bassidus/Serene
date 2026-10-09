# GamepadUI

Namespace `C_GamepadUI`.

Environment=All, Predicates={}

## Functions

### C_GamepadUI.GetFirstGamepadActionBarStorageSlotIndexForActiveStance

Returns:

- `activeStanceFirstGamepadStorageSlotIndex`: luaIndex?

### C_GamepadUI.GetFirstGamepadActionStorageSlotIndex

Returns:

- `firstGamepadActionStorageSlotIndex`: luaIndex

### C_GamepadUI.GetFirstGamepadPetActionStorageSlotIndex

Returns:

- `firstGamepadPetActionStorageSlotID`: luaIndex

### C_GamepadUI.IsValidGamepadActionStorageSlotIndex

SecretArguments=AllowedWhenUntainted

Arguments:

- `gamepadActionStorageSlotIndex`: luaIndex

Returns:

- `isValid`: bool

### C_GamepadUI.IsValidGamepadPossessBarStorageSlotIndex

SecretArguments=AllowedWhenUntainted

Arguments:

- `gamepadPossessBarStorageSlotIndex`: luaIndex

Returns:

- `isValid`: bool

## Events

### GAMEPAD_POSSESS_BAR_OVERRIDE_CHANGED

UniqueEvent=true

Payload:

- `oldOverride`: GamepadPossessBarOverride
- `newOverride`: GamepadPossessBarOverride

### GAMEPAD_STANCE_BAR_OVERRIDE_CHANGED

UniqueEvent=true

Payload:

- `oldOverride`: GamepadStanceBarOverride
- `newOverride`: GamepadStanceBarOverride

## Tables

### GamepadPossessBarOverride

MaxValue=12, MinValue=1, NumValues=12

Fields:

- `SpecialPageTopBar`: GamepadPossessBarOverride [= 1]
- `Page1LeftBar`: GamepadPossessBarOverride [= 2]
- `Page1RightBar`: GamepadPossessBarOverride [= 3]
- `Page1BottomBar`: GamepadPossessBarOverride [= 4]
- `Page2TopBar`: GamepadPossessBarOverride [= 5]
- `Page2LeftBar`: GamepadPossessBarOverride [= 6]
- `Page2RightBar`: GamepadPossessBarOverride [= 7]
- `Page2BottomBar`: GamepadPossessBarOverride [= 8]
- `Page3TopBar`: GamepadPossessBarOverride [= 9]
- `Page3LeftBar`: GamepadPossessBarOverride [= 10]
- `Page3RightBar`: GamepadPossessBarOverride [= 11]
- `Page3BottomBar`: GamepadPossessBarOverride [= 12]

### GamepadStanceBarOverride

MaxValue=12, MinValue=1, NumValues=12

Fields:

- `None`: GamepadStanceBarOverride [= 1]
- `Page1LeftBar`: GamepadStanceBarOverride [= 2]
- `Page1RightBar`: GamepadStanceBarOverride [= 3]
- `Page1BottomBar`: GamepadStanceBarOverride [= 4]
- `Page2TopBar`: GamepadStanceBarOverride [= 5]
- `Page2LeftBar`: GamepadStanceBarOverride [= 6]
- `Page2RightBar`: GamepadStanceBarOverride [= 7]
- `Page2BottomBar`: GamepadStanceBarOverride [= 8]
- `Page3TopBar`: GamepadStanceBarOverride [= 9]
- `Page3LeftBar`: GamepadStanceBarOverride [= 10]
- `Page3RightBar`: GamepadStanceBarOverride [= 11]
- `Page3BottomBar`: GamepadStanceBarOverride [= 12]

### GamepadActionBarConstants

Values:

- `NUM_SLOTS_PER_GAMEPAD_ACTION_BAR_GROUP`: number [Value=4]
- `NUM_GROUPS_PER_GAMEPAD_ACTION_BAR`: number [Value=2]
- `NUM_SLOTS_PER_GAMEPAD_ACTION_BAR`: number [Value=8]
- `NUM_PAGEABLE_BARS_IN_GAMEPAD_ACTION_BAR_PAGE_UNIT`: number [Value=4]
- `NUM_PAGEABLE_SLOTS_PER_GAMEPAD_ACTION_BAR_PAGE_UNIT_STANDARD_PAGE`: number [Value=32]
- `NUM_RESERVED_SLOTS_PER_GAMEPAD_ACTION_BAR_PAGE_UNIT`: number [Value=4]
- `NUM_PAGES_PER_GAMEPAD_ACTION_BAR_PAGE_UNIT`: number [Value=4]
- `NUM_STANDARD_PAGES_PER_GAMEPAD_ACTION_BAR_PAGE_UNIT`: number [Value=3]
- `GAMEPAD_ACTION_BAR_PAGE_UNIT_SPECIAL_PAGE_INDEX`: number [Value=4]
- `NUM_PAGEABLE_SLOTS_PER_GAMEPAD_ACTION_BAR_PAGE_UNIT`: number [Value=96]
- `NUM_GAMEPAD_STANCE_ACTION_BARS`: number [Value=5]
