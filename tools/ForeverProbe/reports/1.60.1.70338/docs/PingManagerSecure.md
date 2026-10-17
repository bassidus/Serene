# PingManagerSecure

Namespace `C_PingSecure`.

Environment=SecureOnly, Predicates={}

## Functions

### C_PingSecure.ClearHitTestPingInfo

HasRestrictions=true

### C_PingSecure.CreateFrame

HasRestrictions=true

### C_PingSecure.DisplayError

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `error`: cstring

### C_PingSecure.GetTargetPingReceiver

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `mousePosX`: number
- `mousePosY`: number

Returns:

- `frame`: ScriptRegion

### C_PingSecure.SendHitTestPing

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `type`: PingSubjectType?

Returns:

- `result`: SendPingResult

### C_PingSecure.SendPlayerItemPing

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `itemID`: number

Returns:

- `result`: SendPingResult

### C_PingSecure.SendPlayerSpellCategoryPing

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `spellCategoryID`: number

Returns:

- `result`: SendPingResult

### C_PingSecure.SendPlayerSpellPing

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `spellID`: number

Returns:

- `result`: SendPingResult

### C_PingSecure.SendUnitPing

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `target`: WOWGUID
- `type`: PingSubjectType?
- `isPlayerResource`: bool? -- Player unit frame contextual pings have the optional ability to call out the player's health and in some cases mana. This field does nothing for non player pings.

Returns:

- `result`: SendPingResult

### C_PingSecure.SetHitTestPingTarget

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `mousePosX`: number
- `mousePosY`: number
- `forcePointPing`: bool?

Returns:

- `state`: PingSetTargetState

### C_PingSecure.SetHitTestTargetAndSendPing

HasRestrictions=true

Returns:

- `result`: SendPingResult

### C_PingSecure.SetPendingPingOffScreenCallback

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `cb`: PendingPingOffScreenCallback

### C_PingSecure.SetPingCooldownStartedCallback

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `cb`: PingCooldownStartedCallback

### C_PingSecure.SetPingPinFrameAddedCallback

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `cb`: PingPinFrameAddedCallback

### C_PingSecure.SetPingPinFrameRemovedCallback

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `cb`: PingPinFrameRemovedCallback

### C_PingSecure.SetPingPinFrameScreenClampStateUpdatedCallback

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `cb`: PingPinFrameScreenClampStateUpdatedCallback

### C_PingSecure.SetPingRadialWheelCreatedCallback

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `cb`: PingRadialWheelCreatedCallback

### C_PingSecure.SetSendMacroPingCallback

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `cb`: SendMacroPingCallback

### C_PingSecure.SetTogglePingListenerCallback

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `cb`: TogglePingListenerCallback

## Events

### UNIT_PING_PIN_ADDED

HasRestrictions=true, SynchronousEvent=true

Payload:

- `guid`: WOWGUID
- `uiTextureKit`: textureKit

### UNIT_PING_PIN_REMOVED

HasRestrictions=true, SynchronousEvent=true

Payload:

- `guid`: WOWGUID

## Tables

### PingActionCooldownUIInfo

Fields:

- `durationMs`: number [default=0]
- `remainingMs`: number [default=0]

### PingActionUIInfo

Fields:

- `spellID`: number [default=0]
- `itemID`: number [default=0]
- `textureFileDataID`: number [default=0]
- `cooldownInfo`: PingActionCooldownUIInfo?
- `spellCategoryID`: number [default=0]

### SendPingResult

Fields:

- `type`: PingSubjectType?
- `result`: PingResult

### PendingPingOffScreenCallback

### PingCooldownStartedCallback

### PingPinFrameAddedCallback

### PingPinFrameRemovedCallback

### PingPinFrameScreenClampStateUpdatedCallback

### PingRadialWheelCreatedCallback

### SendMacroPingCallback

### TogglePingListenerCallback
