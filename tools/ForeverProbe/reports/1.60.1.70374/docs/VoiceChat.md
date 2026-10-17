# VoiceChat

Namespace `C_VoiceChat`.

Environment=All, Predicates={}

## Functions

### C_VoiceChat.ActivateChannel

SecretArguments=AllowedWhenUntainted

Arguments:

- `channelID`: VoiceChatID

### C_VoiceChat.ActivateChannelTranscription

SecretArguments=AllowedWhenUntainted

Arguments:

- `channelID`: VoiceChatID

### C_VoiceChat.BeginLocalCapture

SecretArguments=AllowedWhenUntainted

Arguments:

- `listenToLocalUser`: bool

### C_VoiceChat.CanAccessSettings

Returns:

- `canAccess`: bool

### C_VoiceChat.CanPlayerUseVoiceChat

Returns:

- `canUseVoiceChat`: bool

### C_VoiceChat.CreateChannel

SecretArguments=AllowedWhenUntainted

Arguments:

- `channelDisplayName`: cstring

Returns:

- `status`: VoiceChatStatusCode

### C_VoiceChat.DeactivateChannel

SecretArguments=AllowedWhenUntainted

Arguments:

- `channelID`: VoiceChatID

### C_VoiceChat.DeactivateChannelTranscription

SecretArguments=AllowedWhenUntainted

Arguments:

- `channelID`: VoiceChatID

### C_VoiceChat.EndLocalCapture

### C_VoiceChat.GetActiveChannelID

Returns:

- `channelID`: VoiceChatID?

### C_VoiceChat.GetActiveChannelType

Returns:

- `channelType`: ChatChannelType?

### C_VoiceChat.GetActiveVoiceProviderID

Returns:

- `activeVoiceProviderID`: VoiceProviderID

### C_VoiceChat.GetAvailableInputDevices

Returns:

- `inputDevices`: table<VoiceAudioDevice>?

### C_VoiceChat.GetAvailableOutputDevices

Returns:

- `outputDevices`: table<VoiceAudioDevice>?

### C_VoiceChat.GetChannel

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted, SecretInChatMessagingLockdown=true

Arguments:

- `channelID`: VoiceChatID

Returns:

- `channel`: VoiceChatChannel

### C_VoiceChat.GetChannelForChannelType

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted, SecretInChatMessagingLockdown=true

Arguments:

- `channelType`: ChatChannelType

Returns:

- `channel`: VoiceChatChannel

### C_VoiceChat.GetChannelForCommunityStream

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted, SecretInChatMessagingLockdown=true

Arguments:

- `clubId`: ClubId
- `streamId`: ClubStreamId

Returns:

- `channel`: VoiceChatChannel

### C_VoiceChat.GetCommunicationMode

Returns:

- `communicationMode`: CommunicationMode?

### C_VoiceChat.GetCurrentVoiceChatConnectionStatusCode

Returns:

- `statusCode`: VoiceChatStatusCode?

### C_VoiceChat.GetInputVolume

Returns:

- `volume`: number?

### C_VoiceChat.GetJoinClubVoiceChannelError

SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId

Returns:

- `errorReason`: VoiceChannelErrorReason?

### C_VoiceChat.GetLocalPlayerActiveChannelMemberInfo

Returns:

- `memberInfo`: VoiceChatMember?

### C_VoiceChat.GetLocalPlayerMemberID

SecretArguments=AllowedWhenUntainted

Arguments:

- `channelID`: VoiceChatID

Returns:

- `memberID`: VoiceChatID?

### C_VoiceChat.GetMasterVolumeScale

Returns:

- `scale`: number

### C_VoiceChat.GetMemberGUID

SecretArguments=AllowedWhenUntainted, SecretInChatMessagingLockdown=true

Arguments:

- `memberID`: VoiceChatID
- `channelID`: VoiceChatID

Returns:

- `memberGUID`: WOWGUID

### C_VoiceChat.GetMemberID

SecretArguments=AllowedWhenUntainted, SecretInChatMessagingLockdown=true

Arguments:

- `channelID`: VoiceChatID
- `memberGUID`: WOWGUID

Returns:

- `memberID`: VoiceChatID?

### C_VoiceChat.GetMemberInfo

SecretArguments=AllowedWhenUntainted, SecretInChatMessagingLockdown=true

Arguments:

- `memberID`: VoiceChatID
- `channelID`: VoiceChatID

Returns:

- `memberInfo`: VoiceChatMember?

### C_VoiceChat.GetMemberName

SecretArguments=AllowedWhenUntainted, SecretInChatMessagingLockdown=true

Arguments:

- `memberID`: VoiceChatID
- `channelID`: VoiceChatID

Returns:

- `memberName`: string?

### C_VoiceChat.GetMemberVolume

SecretArguments=AllowedWhenUntainted

Arguments:

- `playerLocation`: PlayerLocation (PlayerLocationMixin)

Returns:

- `volume`: number?

### C_VoiceChat.GetOutputVolume

Returns:

- `volume`: number?

### C_VoiceChat.GetPTTButtonPressedState

Returns:

- `isPressed`: bool?

### C_VoiceChat.GetProcesses

MayReturnNothing=true

Returns:

- `processes`: table<VoiceChatProcess>

### C_VoiceChat.GetPushToTalkBinding

Returns:

- `keys`: table<string>?

### C_VoiceChat.GetRemoteTtsVoices

Returns:

- `ttsVoices`: table<VoiceTtsVoiceType>

### C_VoiceChat.GetTtsVoices

Returns:

- `ttsVoices`: table<VoiceTtsVoiceType>

### C_VoiceChat.GetVADSensitivity

Returns:

- `sensitivity`: number?

### C_VoiceChat.IsChannelJoinPending

SecretArguments=AllowedWhenUntainted

Arguments:

- `channelType`: ChatChannelType
- `clubId`: ClubId?
- `streamId`: ClubStreamId?

Returns:

- `isPending`: bool

### C_VoiceChat.IsDeafened

Returns:

- `isDeafened`: bool?

### C_VoiceChat.IsEnabled

Returns:

- `isEnabled`: bool

### C_VoiceChat.IsLoggedIn

Returns:

- `isLoggedIn`: bool

### C_VoiceChat.IsMemberLocalPlayer

SecretArguments=AllowedWhenUntainted

Arguments:

- `memberID`: VoiceChatID
- `channelID`: VoiceChatID

Returns:

- `isLocalPlayer`: bool

### C_VoiceChat.IsMemberMuted

SecretArguments=AllowedWhenUntainted

Arguments:

- `playerLocation`: PlayerLocation (PlayerLocationMixin)

Returns:

- `mutedForMe`: bool?

### C_VoiceChat.IsMemberMutedForAll

SecretArguments=AllowedWhenUntainted, SecretInChatMessagingLockdown=true

Arguments:

- `memberID`: VoiceChatID
- `channelID`: VoiceChatID

Returns:

- `mutedForAll`: bool?

### C_VoiceChat.IsMemberSilenced

SecretArguments=AllowedWhenUntainted, SecretInChatMessagingLockdown=true

Arguments:

- `memberID`: VoiceChatID
- `channelID`: VoiceChatID

Returns:

- `silenced`: bool?

### C_VoiceChat.IsMuted

Returns:

- `isMuted`: bool?

### C_VoiceChat.IsParentalDisabled

Returns:

- `isParentalDisabled`: bool

### C_VoiceChat.IsParentalMuted

Returns:

- `isParentalMuted`: bool

### C_VoiceChat.IsPlayerUsingVoice

SecretArguments=AllowedWhenUntainted

Arguments:

- `playerLocation`: PlayerLocation (PlayerLocationMixin)

Returns:

- `isUsingVoice`: bool

### C_VoiceChat.IsSilenced

Returns:

- `isSilenced`: bool?

### C_VoiceChat.IsSpeakForMeActive

Returns:

- `isActive`: bool

### C_VoiceChat.IsSpeakForMeAllowed

Returns:

- `isAllowed`: bool

### C_VoiceChat.IsTranscribing

Returns:

- `isTranscribing`: bool

### C_VoiceChat.IsTranscriptionAllowed

Returns:

- `isAllowed`: bool

### C_VoiceChat.IsVoiceChatConnected

Returns:

- `connected`: bool

### C_VoiceChat.LeaveChannel

SecretArguments=AllowedWhenUntainted

Arguments:

- `channelID`: VoiceChatID

### C_VoiceChat.Login

SecretArguments=AllowedWhenUntainted

Arguments:

- `channelType`: ChatChannelType?

Returns:

- `status`: VoiceChatStatusCode

### C_VoiceChat.Logout

Returns:

- `status`: VoiceChatStatusCode

### C_VoiceChat.MarkChannelsDiscovered -- Once the UI has enumerated all channels, use this to reset the channel discovery state, it will be updated again if appropriate

### C_VoiceChat.RequestJoinAndActivateCommunityStreamChannel

SecretArguments=AllowedWhenUntainted

Arguments:

- `clubId`: ClubId
- `streamId`: ClubStreamId

### C_VoiceChat.RequestJoinChannelByChannelType

SecretArguments=AllowedWhenUntainted

Arguments:

- `channelType`: ChatChannelType
- `autoActivate`: bool?

### C_VoiceChat.RestoreActiveVoiceProvider -- Changes the active voice provider to the party voice provider, or to the preferred voice provider when the party has none.

Returns:

- `changed`: bool

### C_VoiceChat.SetActiveVoiceProvider -- Changes the active voice provider without changing the preferred voice provider.

SecretArguments=AllowedWhenUntainted

Arguments:

- `voiceProviderID`: VoiceProviderID

Returns:

- `success`: bool

### C_VoiceChat.SetCommunicationMode

SecretArguments=AllowedWhenUntainted

Arguments:

- `communicationMode`: CommunicationMode

### C_VoiceChat.SetDeafened

SecretArguments=AllowedWhenUntainted

Arguments:

- `isDeafened`: bool

### C_VoiceChat.SetInputDevice

SecretArguments=AllowedWhenUntainted

Arguments:

- `deviceID`: string

### C_VoiceChat.SetInputVolume

SecretArguments=AllowedWhenUntainted

Arguments:

- `volume`: number

### C_VoiceChat.SetMasterVolumeScale

SecretArguments=AllowedWhenUntainted

Arguments:

- `scale`: number

### C_VoiceChat.SetMemberMuted

SecretArguments=AllowedWhenUntainted

Arguments:

- `playerLocation`: PlayerLocation (PlayerLocationMixin)
- `muted`: bool

### C_VoiceChat.SetMemberVolume -- Adjusts member volume across all channels

SecretArguments=AllowedWhenUntainted

Arguments:

- `playerLocation`: PlayerLocation (PlayerLocationMixin)
- `volume`: number

### C_VoiceChat.SetMuted

SecretArguments=AllowedWhenUntainted

Arguments:

- `isMuted`: bool

### C_VoiceChat.SetOutputDevice

SecretArguments=AllowedWhenUntainted

Arguments:

- `deviceID`: string

### C_VoiceChat.SetOutputVolume

SecretArguments=AllowedWhenUntainted

Arguments:

- `volume`: number

### C_VoiceChat.SetPortraitTexture

SecretArguments=AllowedWhenUntainted

Arguments:

- `textureObject`: SimpleTexture
- `memberID`: VoiceChatID
- `channelID`: VoiceChatID

### C_VoiceChat.SetPushToTalkBinding

SecretArguments=AllowedWhenUntainted

Arguments:

- `keys`: table<string>

### C_VoiceChat.SetVADSensitivity

SecretArguments=AllowedWhenUntainted

Arguments:

- `sensitivity`: number

### C_VoiceChat.ShouldDiscoverChannels -- Use this while loading to determine if the UI should attempt to rediscover the previously joined/active voice channels

Returns:

- `shouldDiscoverChannels`: bool

### C_VoiceChat.SpeakRemoteTextSample

SecretArguments=AllowedWhenUntainted

Arguments:

- `text`: string

### C_VoiceChat.SpeakText -- SpeakText also supports XML TTS tags on Windows including bookmarks - see SAPI XML TTS Tutorial in Microsoft's online documentation for more information.

SecretArguments=AllowedWhenTainted

Arguments:

- `voiceID`: number [NeverSecret=true]
- `text`: cstring [ConditionalSecret=true]
- `rate`: number [NeverSecret=true]
- `volume`: number [NeverSecret=true]
- `overlap`: bool [default=false, NeverSecret=true]

### C_VoiceChat.StopSpeakingText

### C_VoiceChat.ToggleDeafened

### C_VoiceChat.ToggleMemberMuted

SecretArguments=AllowedWhenUntainted

Arguments:

- `playerLocation`: PlayerLocation (PlayerLocationMixin)

### C_VoiceChat.ToggleMuted

## Events

### VOICE_CHAT_ACTIVE_INPUT_DEVICE_UPDATED

SynchronousEvent=true

### VOICE_CHAT_ACTIVE_OUTPUT_DEVICE_UPDATED

SynchronousEvent=true

### VOICE_CHAT_ACTIVE_VOICE_PROVIDER_CHANGED

SynchronousEvent=true

Payload:

- `voiceProviderID`: VoiceProviderID

### VOICE_CHAT_AUDIO_CAPTURE_ENERGY

SynchronousEvent=true

Payload:

- `isSpeaking`: bool
- `energy`: number

### VOICE_CHAT_AUDIO_CAPTURE_STARTED

SynchronousEvent=true

### VOICE_CHAT_AUDIO_CAPTURE_STOPPED

SynchronousEvent=true

### VOICE_CHAT_CHANNEL_ACTIVATED

SynchronousEvent=true

Payload:

- `channelID`: VoiceChatID

### VOICE_CHAT_CHANNEL_DEACTIVATED

SynchronousEvent=true

Payload:

- `channelID`: VoiceChatID

### VOICE_CHAT_CHANNEL_DISPLAY_NAME_CHANGED

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `channelID`: VoiceChatID
- `channelDisplayName`: cstring

### VOICE_CHAT_CHANNEL_JOINED

SynchronousEvent=true

Payload:

- `status`: VoiceChatStatusCode
- `channelID`: VoiceChatID
- `channelType`: ChatChannelType
- `clubId`: ClubId?
- `streamId`: ClubStreamId?

### VOICE_CHAT_CHANNEL_MEMBER_ACTIVE_STATE_CHANGED

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `memberID`: VoiceChatID
- `channelID`: VoiceChatID
- `isActive`: bool

### VOICE_CHAT_CHANNEL_MEMBER_ADDED

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `memberID`: VoiceChatID
- `channelID`: VoiceChatID

### VOICE_CHAT_CHANNEL_MEMBER_ENERGY_CHANGED

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `memberID`: VoiceChatID
- `channelID`: VoiceChatID
- `speakingEnergy`: number

### VOICE_CHAT_CHANNEL_MEMBER_GUID_UPDATED

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `memberID`: VoiceChatID
- `channelID`: VoiceChatID

### VOICE_CHAT_CHANNEL_MEMBER_MUTE_FOR_ALL_CHANGED

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `memberID`: VoiceChatID
- `channelID`: VoiceChatID
- `isMutedForAll`: bool

### VOICE_CHAT_CHANNEL_MEMBER_MUTE_FOR_ME_CHANGED

SynchronousEvent=true

Payload:

- `memberID`: VoiceChatID
- `channelID`: VoiceChatID
- `isMutedForMe`: bool

### VOICE_CHAT_CHANNEL_MEMBER_REMOVED

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `memberID`: VoiceChatID
- `channelID`: VoiceChatID

### VOICE_CHAT_CHANNEL_MEMBER_SILENCED_CHANGED

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `memberID`: VoiceChatID
- `channelID`: VoiceChatID
- `isSilenced`: bool

### VOICE_CHAT_CHANNEL_MEMBER_SPEAKING_STATE_CHANGED

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `memberID`: VoiceChatID
- `channelID`: VoiceChatID
- `isSpeaking`: bool

### VOICE_CHAT_CHANNEL_MEMBER_STT_MESSAGE

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `memberID`: VoiceChatID
- `channelID`: VoiceChatID
- `message`: string
- `language`: string

### VOICE_CHAT_CHANNEL_MEMBER_VOLUME_CHANGED

SecretInChatMessagingLockdown=true, SynchronousEvent=true

Payload:

- `memberID`: VoiceChatID
- `channelID`: VoiceChatID
- `volume`: number

### VOICE_CHAT_CHANNEL_MUTE_STATE_CHANGED

SynchronousEvent=true

Payload:

- `channelID`: VoiceChatID
- `isMuted`: bool

### VOICE_CHAT_CHANNEL_PTT_CHANGED

SynchronousEvent=true

Payload:

- `channelID`: VoiceChatID
- `pushToTalkSetting`: cstring

### VOICE_CHAT_CHANNEL_REMOVED

SynchronousEvent=true

Payload:

- `channelID`: VoiceChatID

### VOICE_CHAT_CHANNEL_TRANSCRIBING_CHANGED

SynchronousEvent=true

Payload:

- `channelID`: VoiceChatID
- `isTranscribing`: bool

### VOICE_CHAT_CHANNEL_TRANSMIT_CHANGED

SynchronousEvent=true

Payload:

- `channelID`: VoiceChatID
- `isTransmitting`: bool

### VOICE_CHAT_CHANNEL_VOLUME_CHANGED

SynchronousEvent=true

Payload:

- `channelID`: VoiceChatID
- `volume`: number

### VOICE_CHAT_COMMUNICATION_MODE_CHANGED

SynchronousEvent=true

Payload:

- `communicationMode`: CommunicationMode

### VOICE_CHAT_CONNECTION_SUCCESS

SynchronousEvent=true

### VOICE_CHAT_DEAFENED_CHANGED

SynchronousEvent=true

Payload:

- `isDeafened`: bool

### VOICE_CHAT_DISCORD_SETTINGS_UPDATED

SynchronousEvent=true

### VOICE_CHAT_ERROR

SynchronousEvent=true

Payload:

- `platformCode`: number
- `statusCode`: VoiceChatStatusCode

### VOICE_CHAT_INPUT_DEVICES_UPDATED

SynchronousEvent=true

### VOICE_CHAT_LOGIN

SynchronousEvent=true

Payload:

- `status`: VoiceChatStatusCode

### VOICE_CHAT_LOGOUT

SynchronousEvent=true

Payload:

- `status`: VoiceChatStatusCode

### VOICE_CHAT_MUTED_CHANGED

SynchronousEvent=true

Payload:

- `isMuted`: bool

### VOICE_CHAT_OUTPUT_DEVICES_UPDATED

SynchronousEvent=true

### VOICE_CHAT_PENDING_CHANNEL_JOIN_STATE

SynchronousEvent=true

Payload:

- `channelType`: ChatChannelType
- `clubId`: ClubId?
- `streamId`: ClubStreamId?
- `pendingJoin`: bool

### VOICE_CHAT_PTT_BUTTON_PRESSED_STATE_CHANGED

SynchronousEvent=true

Payload:

- `isPressed`: bool

### VOICE_CHAT_SILENCED_CHANGED

SynchronousEvent=true

Payload:

- `isSilenced`: bool

### VOICE_CHAT_SPEAK_FOR_ME_ACTIVE_STATUS_UPDATED

SynchronousEvent=true

### VOICE_CHAT_SPEAK_FOR_ME_FEATURE_STATUS_UPDATED

SynchronousEvent=true

### VOICE_CHAT_TTS_PLAYBACK_BOOKMARK

SynchronousEvent=true

Payload:

- `utteranceID`: number
- `bookmarkName`: cstring [ConditionalSecret=true]

### VOICE_CHAT_TTS_PLAYBACK_FAILED

SynchronousEvent=true

Payload:

- `utteranceID`: number
- `status`: VoiceTtsStatusCode

### VOICE_CHAT_TTS_PLAYBACK_FINISHED

SynchronousEvent=true

Payload:

- `utteranceID`: number

### VOICE_CHAT_TTS_PLAYBACK_STARTED

SynchronousEvent=true

Payload:

- `utteranceID`: number

### VOICE_CHAT_TTS_SPEAK_TEXT_UPDATE

SynchronousEvent=true

Payload:

- `status`: VoiceTtsStatusCode
- `utteranceID`: number

### VOICE_CHAT_TTS_VOICES_UPDATE

SynchronousEvent=true

### VOICE_CHAT_VAD_SETTINGS_UPDATED

SynchronousEvent=true

### VOICE_CHAT_VOICE_PROVIDER_CHANGED

SynchronousEvent=true

Payload:

- `voiceProviderID`: VoiceProviderID

### VOICE_CHAT_VOICE_PROVIDERS_AVAILABLE_CHANGED

SynchronousEvent=true

## Tables

### CommunicationMode

MaxValue=1, MinValue=0, NumValues=2

Fields:

- `PushToTalk`: CommunicationMode [= 0]
- `OpenMic`: CommunicationMode [= 1]

### VoiceChannelErrorReason

MaxValue=1, MinValue=0, NumValues=2

Fields:

- `Unknown`: VoiceChannelErrorReason [= 0]
- `IsBattleNetChannel`: VoiceChannelErrorReason [= 1]

### VoiceChatStatusCode

MaxValue=25, MinValue=0, NumValues=26

Fields:

- `Success`: VoiceChatStatusCode [= 0]
- `OperationPending`: VoiceChatStatusCode [= 1]
- `TooManyRequests`: VoiceChatStatusCode [= 2]
- `LoginProhibited`: VoiceChatStatusCode [= 3]
- `ClientNotInitialized`: VoiceChatStatusCode [= 4]
- `ClientNotLoggedIn`: VoiceChatStatusCode [= 5]
- `ClientAlreadyLoggedIn`: VoiceChatStatusCode [= 6]
- `ChannelNameTooShort`: VoiceChatStatusCode [= 7]
- `ChannelNameTooLong`: VoiceChatStatusCode [= 8]
- `ChannelAlreadyExists`: VoiceChatStatusCode [= 9]
- `AlreadyInChannel`: VoiceChatStatusCode [= 10]
- `TargetNotFound`: VoiceChatStatusCode [= 11]
- `Failure`: VoiceChatStatusCode [= 12]
- `ServiceLost`: VoiceChatStatusCode [= 13]
- `UnableToLaunchProxy`: VoiceChatStatusCode [= 14]
- `ProxyConnectionTimeOut`: VoiceChatStatusCode [= 15]
- `ProxyConnectionUnableToConnect`: VoiceChatStatusCode [= 16]
- `ProxyConnectionUnexpectedDisconnect`: VoiceChatStatusCode [= 17]
- `Disabled`: VoiceChatStatusCode [= 18]
- `UnsupportedChatChannelType`: VoiceChatStatusCode [= 19]
- `InvalidCommunityStream`: VoiceChatStatusCode [= 20]
- `PlayerSilenced`: VoiceChatStatusCode [= 21]
- `PlayerVoiceChatParentalDisabled`: VoiceChatStatusCode [= 22]
- `InvalidInputDevice`: VoiceChatStatusCode [= 23]
- `InvalidOutputDevice`: VoiceChatStatusCode [= 24]
- `PlayerVoiceChatAgeVerificationRestricted`: VoiceChatStatusCode [= 25]

### VoiceProviderID

MaxValue=1, MinValue=0, NumValues=2

Fields:

- `Legacy`: VoiceProviderID [= 0]
- `Discord`: VoiceProviderID [= 1]

### VoiceTtsStatusCode

MaxValue=13, MinValue=0, NumValues=14

Fields:

- `Success`: VoiceTtsStatusCode [= 0]
- `InvalidEngineType`: VoiceTtsStatusCode [= 1]
- `EngineAllocationFailed`: VoiceTtsStatusCode [= 2]
- `NotSupported`: VoiceTtsStatusCode [= 3]
- `MaxCharactersExceeded`: VoiceTtsStatusCode [= 4]
- `UtteranceBelowMinimumDuration`: VoiceTtsStatusCode [= 5]
- `InputTextEnqueued`: VoiceTtsStatusCode [= 6]
- `SdkNotInitialized`: VoiceTtsStatusCode [= 7]
- `DestinationQueueFull`: VoiceTtsStatusCode [= 8]
- `EnqueueNotNecessary`: VoiceTtsStatusCode [= 9]
- `UtteranceNotFound`: VoiceTtsStatusCode [= 10]
- `ManagerNotFound`: VoiceTtsStatusCode [= 11]
- `InvalidArgument`: VoiceTtsStatusCode [= 12]
- `InternalError`: VoiceTtsStatusCode [= 13]

### VoiceAudioDevice

Fields:

- `deviceID`: string
- `displayName`: string
- `isActive`: bool
- `isSystemDefault`: bool
- `isCommsDefault`: bool

### VoiceChatChannel

Fields:

- `name`: string
- `channelID`: VoiceChatID [NeverSecret=true]
- `channelType`: ChatChannelType [NeverSecret=true]
- `clubId`: ClubId [NeverSecret=true]
- `streamId`: ClubStreamId [NeverSecret=true]
- `volume`: number [NeverSecret=true]
- `isActive`: bool [NeverSecret=true]
- `isMuted`: bool [NeverSecret=true]
- `isTransmitting`: bool [NeverSecret=true]
- `isTranscribing`: bool [NeverSecret=true]
- `members`: table<VoiceChatMember>

### VoiceChatMember

Fields:

- `energy`: number
- `memberID`: VoiceChatID
- `isActive`: bool
- `isSpeaking`: bool
- `isMutedForAll`: bool
- `isSilenced`: bool

### VoiceChatProcess

Fields:

- `name`: string
- `channels`: table<VoiceChatChannel>

### VoiceTtsVoiceType

Fields:

- `voiceID`: number
- `name`: string
