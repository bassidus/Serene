# ModelInfo

Namespace `C_ModelInfo`.

Environment=All, Predicates={}

## Functions

### C_ModelInfo.AddActiveModelScene -- This function does nothing in public clients

SecretArguments=AllowedWhenUntainted

Arguments:

- `modelSceneFrame`: ModelSceneFrame
- `modelSceneID`: number

### C_ModelInfo.AddActiveModelSceneActor -- This function does nothing in public clients

SecretArguments=AllowedWhenUntainted

Arguments:

- `modelSceneFrameActor`: ModelSceneFrameActor
- `modelSceneActorID`: number

### C_ModelInfo.ClearActiveModelScene -- This function does nothing in public clients

SecretArguments=AllowedWhenUntainted

Arguments:

- `modelSceneFrame`: ModelSceneFrame

### C_ModelInfo.ClearActiveModelSceneActor -- This function does nothing in public clients

SecretArguments=AllowedWhenUntainted

Arguments:

- `modelSceneFrameActor`: ModelSceneFrameActor

### C_ModelInfo.GetModelSceneActorDisplayInfoByID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `modelActorDisplayID`: number

Returns:

- `actorDisplayInfo`: UIModelSceneActorDisplayInfo

### C_ModelInfo.GetModelSceneActorInfoByID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `modelActorID`: number

Returns:

- `actorInfo`: UIModelSceneActorInfo

### C_ModelInfo.GetModelSceneCameraInfoByID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `modelSceneCameraID`: number

Returns:

- `modelSceneCameraInfo`: UIModelSceneCameraInfo

### C_ModelInfo.GetModelSceneInfoByID

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `modelSceneID`: number

Returns:

- `modelSceneType`: ModelSceneType
- `modelCameraIDs`: table<number>
- `modelActorsIDs`: table<number>
- `flags`: number

## Events

### UI_MODEL_SCENE_INFO_UPDATED

UniqueEvent=true

## Tables

### UIModelSceneActorDisplayInfo

Fields:

- `animation`: number
- `animationVariation`: number
- `animSpeed`: number
- `animationKitID`: number?
- `spellVisualKitID`: number?
- `alpha`: number
- `scale`: number

### UIModelSceneActorInfo

Fields:

- `modelActorID`: number
- `scriptTag`: cstring
- `position`: vector3 (Vector3DMixin)
- `yaw`: number
- `pitch`: number
- `roll`: number
- `normalizeScaleAggressiveness`: number?
- `useCenterForOriginX`: bool
- `useCenterForOriginY`: bool
- `useCenterForOriginZ`: bool
- `modelActorDisplayID`: number?

### UIModelSceneCameraInfo

Fields:

- `modelSceneCameraID`: number
- `scriptTag`: cstring
- `cameraType`: cstring
- `target`: vector3 (Vector3DMixin)
- `yaw`: number
- `pitch`: number
- `roll`: number
- `zoomDistance`: number
- `minZoomDistance`: number
- `maxZoomDistance`: number
- `zoomedTargetOffset`: vector3 (Vector3DMixin)
- `zoomedYawOffset`: number
- `zoomedPitchOffset`: number
- `zoomedRollOffset`: number
- `flags`: ModelSceneSetting
