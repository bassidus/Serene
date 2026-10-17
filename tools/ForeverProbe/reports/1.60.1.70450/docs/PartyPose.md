# PartyPose

Namespace `C_PartyPose`.

Environment=All, Predicates={}

## Functions

### C_PartyPose.ExtraAction

SecretArguments=AllowedWhenUntainted

Arguments:

- `partyPoseID`: number

### C_PartyPose.GetPartyPoseInfoByID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `mapID`: number

Returns:

- `info`: PartyPoseInfo

### C_PartyPose.GetPartyPoseInfoByMapID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `mapID`: number

Returns:

- `info`: PartyPoseInfo

### C_PartyPose.HasExtraAction

SecretArguments=AllowedWhenUntainted

Arguments:

- `partyPoseID`: number

Returns:

- `hasExtraAction`: bool

## Events

### SHOW_PARTY_POSE_UI

SynchronousEvent=true

Payload:

- `mapID`: number
- `won`: bool

## Tables

### PartyPoseInfo

Fields:

- `partyPoseID`: number
- `mapID`: number
- `widgetSetID`: number?
- `victoryModelSceneID`: number
- `defeatModelSceneID`: number
- `victorySoundKitID`: number
- `defeatSoundKitID`: number
- `uiTextureKit`: textureKit?
- `titleText`: string?
- `extraButtonText`: string?
- `flags`: PartyPoseFlags
