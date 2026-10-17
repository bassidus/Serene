# CommentatorFrame

Namespace `C_Commentator`.

Environment=All, Predicates={}

## Functions

### C_Commentator.AddPlayerOverrideName

SecretArguments=AllowedWhenUntainted

Arguments:

- `playerName`: string
- `overrideName`: string

### C_Commentator.AddTrackedDefensiveAuras

RequiresActiveCommentator=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `spellIDs`: table<number>

### C_Commentator.AddTrackedOffensiveAuras

RequiresActiveCommentator=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `spellIDs`: table<number>

### C_Commentator.AreTeamsSwapped

Returns:

- `teamsAreSwapped`: bool

### C_Commentator.AssignPlayerToTeam

SecretArguments=AllowedWhenUntainted

Arguments:

- `playerName`: string
- `teamName`: string

### C_Commentator.AssignPlayersToTeam

SecretArguments=AllowedWhenUntainted

Arguments:

- `playerName`: table<string>
- `teamName`: string

### C_Commentator.AssignPlayersToTeamInCurrentInstance

SecretArguments=AllowedWhenUntainted

Arguments:

- `teamIndex`: luaIndex
- `teamName`: string

### C_Commentator.CanUseCommentatorCheats

Returns:

- `canUseCommentatorCheats`: bool

### C_Commentator.ClearCameraTarget

RequiresActiveCommentator=true

### C_Commentator.ClearFollowTarget

RequiresActiveCommentator=true

### C_Commentator.ClearLookAtTarget

RequiresActiveCommentator=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `lookAtIndex`: luaIndex?

### C_Commentator.EnterInstance

RequiresCommentator=true

### C_Commentator.ExitInstance

RequiresCommentator=true

### C_Commentator.FindSpectatedUnit

MayReturnNothing=true, RequiresActiveCommentator=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `unitToken`: UnitToken

Returns:

- `playerIndex`: luaIndex
- `teamIndex`: luaIndex
- `isPet`: bool

### C_Commentator.FindTeamNameInCurrentInstance

SecretArguments=AllowedWhenUntainted

Arguments:

- `teamIndex`: luaIndex

Returns:

- `teamName`: string?

### C_Commentator.FindTeamNameInDirectory

SecretArguments=AllowedWhenUntainted

Arguments:

- `playerNames`: table<string>

Returns:

- `teamName`: string?

### C_Commentator.FlushCommentatorHistory

### C_Commentator.FollowPlayer

RequiresActiveCommentator=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `factionIndex`: luaIndex
- `playerIndex`: luaIndex
- `forceInstantTransition`: bool?

### C_Commentator.FollowUnit

RequiresActiveCommentator=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `token`: string

### C_Commentator.ForceFollowTransition

RequiresActiveCommentator=true

### C_Commentator.GetAdditionalCameraWeight

RequiresActiveCommentator=true

Returns:

- `teamIndex`: luaIndex
- `playerIndex`: luaIndex

### C_Commentator.GetAdditionalCameraWeightByToken

MayReturnNothing=true, RequiresActiveCommentator=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `unitToken`: UnitToken

Returns:

- `weight`: number

### C_Commentator.GetAllPlayerOverrideNames

RequiresActiveCommentator=true

Returns:

- `nameEntries`: table<NameOverrideEntry>

### C_Commentator.GetCamera

MayReturnNothing=true, RequiresActiveCommentator=true

Returns:

- `xPos`: number
- `yPos`: number
- `zPos`: number
- `yaw`: number
- `pitch`: number
- `roll`: number
- `fov`: number

### C_Commentator.GetCameraCollision

Returns:

- `isColliding`: bool

### C_Commentator.GetCameraPosition

MayReturnNothing=true, RequiresActiveCommentator=true

Returns:

- `xPos`: number
- `yPos`: number
- `zPos`: number

### C_Commentator.GetCombatEventInfo

RequiresActiveCommentator=true

### C_Commentator.GetCommentatorHistory

Returns:

- `history`: CommentatorHistory

### C_Commentator.GetCommentatorMatchDataState

RequiresActiveCommentator=true

Returns:

- `state`: CommentatorMatchDataState

### C_Commentator.GetCurrentMapID

RequiresCommentator=true

Returns:

- `mapID`: number?

### C_Commentator.GetDampeningPercent

Returns:

- `percentage`: number

### C_Commentator.GetDistanceBeforeForcedHorizontalConvergence

Returns:

- `distance`: number

### C_Commentator.GetDurationToForceHorizontalConvergence

Returns:

- `ms`: number

### C_Commentator.GetExcludeDistance

Returns:

- `excludeDistance`: number

### C_Commentator.GetHardlockWeight

Returns:

- `weight`: number

### C_Commentator.GetHorizontalAngleThresholdToSmooth

Returns:

- `angle`: number

### C_Commentator.GetIndirectSpellID

RequiresActiveCommentator=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `trackedSpellID`: number

Returns:

- `indirectSpellID`: number

### C_Commentator.GetInstanceInfo

MayReturnNothing=true, RequiresCommentator=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `mapIndex`: luaIndex
- `instanceIndex`: luaIndex

Returns:

- `mapID`: number
- `mapName`: string?
- `status`: number
- `instanceIDLow`: number
- `instanceIDHigh`: number

### C_Commentator.GetLookAtLerpAmount

Returns:

- `amount`: number

### C_Commentator.GetMapInfo

MayReturnNothing=true, RequiresCommentator=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `mapIndex`: luaIndex

Returns:

- `teamSize`: number
- `minLevel`: number
- `maxLevel`: number
- `numInstances`: number

### C_Commentator.GetMatchDuration

Returns:

- `seconds`: time_t

### C_Commentator.GetMaxNumPlayersPerTeam

Returns:

- `maxNumPlayersPerTeam`: number

### C_Commentator.GetMaxNumTeams

Returns:

- `maxNumTeams`: number

### C_Commentator.GetMode

Returns:

- `commentatorMode`: number

### C_Commentator.GetMsToHoldForHorizontalMovement

Returns:

- `ms`: number

### C_Commentator.GetMsToHoldForVerticalMovement

Returns:

- `ms`: number

### C_Commentator.GetMsToSmoothHorizontalChange

Returns:

- `ms`: number

### C_Commentator.GetMsToSmoothVerticalChange

Returns:

- `ms`: number

### C_Commentator.GetNumMaps

Returns:

- `numMaps`: number

### C_Commentator.GetNumPlayers

MayReturnNothing=true, RequiresActiveCommentator=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `factionIndex`: luaIndex

Returns:

- `numPlayers`: number

### C_Commentator.GetOrCreateSeries

SecretArguments=AllowedWhenUntainted

Arguments:

- `teamName1`: string
- `teamName2`: string

Returns:

- `data`: CommentatorSeries

### C_Commentator.GetPlayerAuraInfo

MayReturnNothing=true, RequiresActiveCommentator=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `teamIndex`: luaIndex
- `playerIndex`: luaIndex
- `spellID`: number

Returns:

- `startTime`: number
- `duration`: number
- `enable`: bool

### C_Commentator.GetPlayerAuraInfoByUnit

MayReturnNothing=true, RequiresActiveCommentator=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `token`: UnitToken
- `spellID`: number

Returns:

- `startTime`: number
- `duration`: number
- `enable`: bool

### C_Commentator.GetPlayerCooldownInfo

MayReturnNothing=true, RequiresActiveCommentator=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `teamIndex`: luaIndex
- `playerIndex`: luaIndex
- `spellID`: number

Returns:

- `startTime`: number
- `duration`: number
- `enable`: bool

### C_Commentator.GetPlayerCooldownInfoByUnit

MayReturnNothing=true, RequiresActiveCommentator=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `unitToken`: UnitToken
- `spellID`: number

Returns:

- `startTime`: number
- `duration`: number
- `enable`: bool

### C_Commentator.GetPlayerCrowdControlInfo

MayReturnNothing=true, RequiresActiveCommentator=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `teamIndex`: luaIndex
- `playerIndex`: luaIndex

Returns:

- `spellID`: number
- `expiration`: number
- `duration`: number

### C_Commentator.GetPlayerCrowdControlInfoByUnit

MayReturnNothing=true, RequiresActiveCommentator=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `token`: UnitToken

Returns:

- `spellID`: number
- `expiration`: number
- `duration`: number

### C_Commentator.GetPlayerData

RequiresActiveCommentator=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `teamIndex`: luaIndex
- `playerIndex`: luaIndex

Returns:

- `info`: CommentatorPlayerData?

### C_Commentator.GetPlayerFlagInfo

RequiresActiveCommentator=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `teamIndex`: luaIndex
- `playerIndex`: luaIndex

Returns:

- `hasFlag`: bool

### C_Commentator.GetPlayerFlagInfoByUnit

RequiresActiveCommentator=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `unitToken`: UnitToken

Returns:

- `hasFlag`: bool

### C_Commentator.GetPlayerItemCooldownInfo

MayReturnNothing=true, RequiresActiveCommentator=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `teamIndex`: luaIndex
- `playerIndex`: luaIndex
- `itemID`: number

Returns:

- `startTime`: number
- `duration`: number
- `enable`: bool

### C_Commentator.GetPlayerItemCooldownInfoByUnit

MayReturnNothing=true, RequiresActiveCommentator=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `unitToken`: UnitToken
- `itemID`: number

Returns:

- `startTime`: number
- `duration`: number
- `enable`: bool

### C_Commentator.GetPlayerOverrideName

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `originalName`: string

Returns:

- `overrideName`: string

### C_Commentator.GetPlayerSpellCharges

MayReturnNothing=true, RequiresActiveCommentator=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `teamIndex`: luaIndex
- `playerIndex`: luaIndex
- `spellID`: number

Returns:

- `charges`: number
- `maxCharges`: number
- `startTime`: number
- `duration`: number

### C_Commentator.GetPlayerSpellChargesByUnit

MayReturnNothing=true, RequiresActiveCommentator=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `unitToken`: UnitToken
- `spellID`: number

Returns:

- `charges`: number
- `maxCharges`: number
- `startTime`: number
- `duration`: number

### C_Commentator.GetPositionLerpAmount

Returns:

- `amount`: number

### C_Commentator.GetSmoothFollowTransitioning

RequiresActiveCommentator=true

Returns:

- `enabled`: bool

### C_Commentator.GetSoftlockWeight

Returns:

- `weight`: number

### C_Commentator.GetSpeedFactor

Returns:

- `factor`: number

### C_Commentator.GetStartLocation

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `mapID`: number

Returns:

- `pos`: vector3 (Vector3DMixin)

### C_Commentator.GetTeamColor

SecretArguments=AllowedWhenUntainted

Arguments:

- `teamIndex`: luaIndex

Returns:

- `color`: colorRGB (ColorMixin)

### C_Commentator.GetTeamColorByUnit

SecretArguments=AllowedWhenUntainted

Arguments:

- `unitToken`: UnitToken

Returns:

- `color`: colorRGB (ColorMixin)

### C_Commentator.GetTimeLeftInMatch

Returns:

- `timeLeft`: number?

### C_Commentator.GetTrackedSpellID

RequiresActiveCommentator=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `indirectSpellID`: number

Returns:

- `trackedSpellID`: number

### C_Commentator.GetTrackedSpells

RequiresActiveCommentator=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `teamIndex`: luaIndex
- `playerIndex`: luaIndex
- `category`: TrackedSpellCategory

Returns:

- `spells`: table<number>?
- `result`: TrackedSpellsResult

### C_Commentator.GetTrackedSpellsByUnit

RequiresActiveCommentator=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `unitToken`: UnitToken
- `category`: TrackedSpellCategory

Returns:

- `spells`: table<number>?
- `result`: TrackedSpellsResult

### C_Commentator.GetUnitData

RequiresActiveCommentator=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `unitToken`: UnitToken

Returns:

- `data`: CommentatorUnitData

### C_Commentator.GetWargameInfo

MayReturnNothing=true, RequiresCommentator=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `listID`: number

Returns:

- `name`: string
- `minPlayers`: number
- `maxPlayers`: number
- `isArena`: bool

### C_Commentator.HasTrackedAuras

RequiresActiveCommentator=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `token`: UnitToken

Returns:

- `hasOffensiveAura`: bool
- `hasDefensiveAura`: bool

### C_Commentator.IsSmartCameraLocked

Returns:

- `isSmartCameraLocked`: bool

### C_Commentator.IsSpectating

Returns:

- `isSpectating`: bool

### C_Commentator.IsTrackedDefensiveAura

RequiresActiveCommentator=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `spellID`: number

Returns:

- `isDefensiveTrigger`: bool

### C_Commentator.IsTrackedOffensiveAura

RequiresActiveCommentator=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `spellID`: number

Returns:

- `isOffensiveTrigger`: bool

### C_Commentator.IsTrackedSpell

RequiresActiveCommentator=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `teamIndex`: luaIndex
- `playerIndex`: luaIndex
- `spellID`: number
- `category`: TrackedSpellCategory

Returns:

- `isTracked`: bool

### C_Commentator.IsTrackedSpellByUnit

RequiresActiveCommentator=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `unitToken`: UnitToken
- `spellID`: number
- `category`: TrackedSpellCategory

Returns:

- `isTracked`: bool

### C_Commentator.IsUsingSmartCamera

Returns:

- `isUsingSmartCamera`: bool

### C_Commentator.LookAtPlayer

RequiresActiveCommentator=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `factionIndex`: luaIndex
- `playerIndex`: luaIndex
- `lookAtIndex`: luaIndex?

### C_Commentator.RemoveAllOverrideNames

### C_Commentator.RemovePlayerOverrideName

SecretArguments=AllowedWhenUntainted

Arguments:

- `originalPlayerName`: string

### C_Commentator.RequestPlayerCooldownInfo

RequiresActiveCommentator=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `teamIndex`: luaIndex
- `playerIndex`: luaIndex

### C_Commentator.ResetFoVTarget

### C_Commentator.ResetSeriesScores

SecretArguments=AllowedWhenUntainted

Arguments:

- `teamName1`: string
- `teamName2`: string

### C_Commentator.ResetSettings

### C_Commentator.ResetTrackedAuras

RequiresActiveCommentator=true

### C_Commentator.SendAddonMessage -- Works the same as C_ChatInfo.SendAddonMessage but accepts secrets and is only allowed when outgoing addon comms are allowed (i.e. on tournament realms)

SecretArguments=AllowedWhenUntainted

Arguments:

- `prefix`: cstring
- `message`: cstring
- `chatType`: cstring? -- ChatType, defaults to SLASH_CMD_PARTY.
- `target`: cstring? -- Only applies for targeted channels

Returns:

- `result`: SendAddonMessageResult

### C_Commentator.SendAddonMessageLogged -- Works the same as C_ChatInfo.SendAddonMessageLogged but accepts secrets and is only allowed when outgoing addon comms are allowed (i.e. on tournament realms)

SecretArguments=AllowedWhenUntainted

Arguments:

- `prefix`: cstring
- `message`: cstring
- `chatType`: cstring? -- ChatType, defaults to SLASH_CMD_PARTY.
- `target`: cstring? -- Only applies for targeted channels

Returns:

- `result`: SendAddonMessageResult?

### C_Commentator.SetAdditionalCameraWeight

RequiresActiveCommentator=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `teamIndex`: luaIndex
- `playerIndex`: luaIndex
- `weight`: number

### C_Commentator.SetAdditionalCameraWeightByToken

RequiresActiveCommentator=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `unitToken`: UnitToken
- `weight`: number

### C_Commentator.SetBlocklistedAuras

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellIDs`: table<number>

### C_Commentator.SetBlocklistedCooldowns

SecretArguments=AllowedWhenUntainted

Arguments:

- `specID`: number
- `spellIDs`: table<number>

### C_Commentator.SetBlocklistedItemCooldowns

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemIDs`: table<number>

### C_Commentator.SetCamera

RequiresActiveCommentator=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `xPos`: number
- `yPos`: number
- `zPos`: number
- `yaw`: number
- `pitch`: number
- `roll`: number
- `fov`: number

### C_Commentator.SetCameraCollision

RequiresActiveCommentator=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `collide`: bool

### C_Commentator.SetCameraPosition

RequiresActiveCommentator=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `xPos`: number
- `yPos`: number
- `zPos`: number
- `snapToLocation`: bool

### C_Commentator.SetCheatsEnabled

SecretArguments=AllowedWhenUntainted

Arguments:

- `enableCheats`: bool

### C_Commentator.SetCommentatorHistory

SecretArguments=AllowedWhenUntainted

Arguments:

- `history`: CommentatorHistory

### C_Commentator.SetDistanceBeforeForcedHorizontalConvergence

SecretArguments=AllowedWhenUntainted

Arguments:

- `distance`: number

### C_Commentator.SetDurationToForceHorizontalConvergence

SecretArguments=AllowedWhenUntainted

Arguments:

- `ms`: number

### C_Commentator.SetExcludeDistance

SecretArguments=AllowedWhenUntainted

Arguments:

- `excludeDistance`: number

### C_Commentator.SetFollowCameraSpeeds

RequiresActiveCommentator=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `elasticSpeed`: number
- `minSpeed`: number

### C_Commentator.SetHardlockWeight

SecretArguments=AllowedWhenUntainted

Arguments:

- `weight`: number

### C_Commentator.SetHorizontalAngleThresholdToSmooth

SecretArguments=AllowedWhenUntainted

Arguments:

- `angle`: number

### C_Commentator.SetLookAtLerpAmount

SecretArguments=AllowedWhenUntainted

Arguments:

- `amount`: number

### C_Commentator.SetMapAndInstanceIndex

RequiresCommentator=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `mapIndex`: luaIndex
- `instanceIndex`: luaIndex

### C_Commentator.SetMouseDisabled

SecretArguments=AllowedWhenUntainted

Arguments:

- `disabled`: bool

### C_Commentator.SetMoveSpeed

SecretArguments=AllowedWhenUntainted

Arguments:

- `newSpeed`: number

### C_Commentator.SetMsToHoldForHorizontalMovement

SecretArguments=AllowedWhenUntainted

Arguments:

- `ms`: number

### C_Commentator.SetMsToHoldForVerticalMovement

SecretArguments=AllowedWhenUntainted

Arguments:

- `ms`: number

### C_Commentator.SetMsToSmoothHorizontalChange

SecretArguments=AllowedWhenUntainted

Arguments:

- `ms`: number

### C_Commentator.SetMsToSmoothVerticalChange

SecretArguments=AllowedWhenUntainted

Arguments:

- `ms`: number

### C_Commentator.SetPositionLerpAmount

SecretArguments=AllowedWhenUntainted

Arguments:

- `amount`: number

### C_Commentator.SetRequestedDebuffCooldowns

SecretArguments=AllowedWhenUntainted

Arguments:

- `specID`: number
- `spellIDs`: table<number>

### C_Commentator.SetRequestedDefensiveCooldowns

SecretArguments=AllowedWhenUntainted

Arguments:

- `specID`: number
- `spellIDs`: table<number>

### C_Commentator.SetRequestedItemCooldowns

SecretArguments=AllowedWhenUntainted

Arguments:

- `itemIDs`: table<number>

### C_Commentator.SetRequestedOffensiveCooldowns

SecretArguments=AllowedWhenUntainted

Arguments:

- `specID`: number
- `spellIDs`: table<number>

### C_Commentator.SetSeriesScore

SecretArguments=AllowedWhenUntainted

Arguments:

- `teamName1`: string
- `teamName2`: string
- `scoringTeamName`: string
- `score`: number

### C_Commentator.SetSeriesScores

SecretArguments=AllowedWhenUntainted

Arguments:

- `teamName1`: string
- `teamName2`: string
- `score1`: number
- `score2`: number

### C_Commentator.SetSmartCameraLocked

SecretArguments=AllowedWhenUntainted

Arguments:

- `locked`: bool

### C_Commentator.SetSmoothFollowTransitioning

RequiresActiveCommentator=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `enabled`: bool

### C_Commentator.SetSoftlockWeight

SecretArguments=AllowedWhenUntainted

Arguments:

- `weight`: number

### C_Commentator.SetSpeedFactor

SecretArguments=AllowedWhenUntainted

Arguments:

- `factor`: number

### C_Commentator.SetTargetHeightOffset

RequiresActiveCommentator=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `offset`: number

### C_Commentator.SetUseSmartCamera

SecretArguments=AllowedWhenUntainted

Arguments:

- `useSmartCamera`: bool

### C_Commentator.SnapCameraLookAtPoint

RequiresActiveCommentator=true

### C_Commentator.SpellUsesItemCharges

SecretArguments=AllowedWhenUntainted

Arguments:

- `spellID`: number

Returns:

- `spellUsesItemCharges`: bool

### C_Commentator.StartWargame

RequiresCommentator=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `listID`: number
- `teamSize`: number
- `tournamentRules`: bool
- `teamOneCaptain`: string
- `teamTwoCaptain`: string

### C_Commentator.SwapTeamSides

### C_Commentator.ToggleCheats

### C_Commentator.UpdateMapInfo

RequiresCommentator=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `targetPlayer`: string?

### C_Commentator.UpdatePlayerInfo

RequiresCommentator=true

### C_Commentator.ZoomIn

### C_Commentator.ZoomIn_Position

SecretArguments=AllowedWhenUntainted

Arguments:

- `zoomAmount`: number?

### C_Commentator.ZoomOut

### C_Commentator.ZoomOut_Position

SecretArguments=AllowedWhenUntainted

Arguments:

- `zoomAmount`: number?

## Events

### COMMENTATOR_COMBAT_EVENT

SynchronousEvent=true

### COMMENTATOR_ENTER_WORLD

SynchronousEvent=true

### COMMENTATOR_HISTORY_FLUSHED

SynchronousEvent=true

### COMMENTATOR_IMMEDIATE_FOV_UPDATE

SynchronousEvent=true

Payload:

- `fov`: number

### COMMENTATOR_MAP_UPDATE

SynchronousEvent=true

### COMMENTATOR_PLAYER_NAME_OVERRIDE_UPDATE

SynchronousEvent=true

Payload:

- `nameToOverride`: cstring
- `overrideName`: cstring?

### COMMENTATOR_PLAYER_UPDATE

SynchronousEvent=true, UniqueEvent=true

### COMMENTATOR_RESET_SETTINGS

SynchronousEvent=true

### COMMENTATOR_TEAM_NAME_UPDATE

SynchronousEvent=true

Payload:

- `teamName`: string

### COMMENTATOR_TEAMS_SWAPPED

SynchronousEvent=true

Payload:

- `swapped`: bool

## Tables

### TrackedSpellsResult

MaxValue=3, MinValue=0, NumValues=4

Fields:

- `Success`: TrackedSpellsResult [= 0]
- `PlayerNotFound`: TrackedSpellsResult [= 1]
- `NoCooldownInfo`: TrackedSpellsResult [= 2]
- `MismatchedCooldownInfo`: TrackedSpellsResult [= 3]

### CommentatorHistory

Fields:

- `series`: table<CommentatorSeries>
- `teamDirectory`: table<CommentatorTeamDirectoryEntry>
- `overrideNameDirectory`: table<CommentatorOverrideNameEntry>

### CommentatorMatchDataState

Fields:

- `receivedPlayerInfo`: bool
- `setInstancePlayers`: bool
- `requestedCooldownInfo`: bool
- `requestedPlayerCooldowns`: table<TeamPlayerRequestedCooldownInfo>

### CommentatorOverrideNameEntry

Fields:

- `originalName`: string
- `newName`: string

### CommentatorPlayerData

Fields:

- `unitToken`: string
- `name`: string
- `faction`: number
- `specialization`: number
- `damageDone`: number
- `damageTaken`: number
- `healingDone`: number
- `healingTaken`: number
- `kills`: number
- `deaths`: number
- `soloShuffleRoundWins`: number
- `soloShuffleRoundLosses`: number

### CommentatorSeries

Fields:

- `teams`: table<CommentatorSeriesTeam>

### CommentatorSeriesTeam

Fields:

- `name`: string
- `score`: number

### CommentatorTeamDirectoryEntry

Fields:

- `playerName`: string
- `teamName`: string

### CommentatorTrackedItemCooldown

Fields:

- `spellID`: number
- `category`: TrackedSpellCategory

### CommentatorUnitData

Fields:

- `healthMax`: number
- `health`: number
- `absorbTotal`: number
- `isDeadOrGhost`: bool
- `isFeignDeath`: bool
- `powerTypeToken`: string
- `power`: number
- `powerMax`: number

### NameOverrideEntry

Fields:

- `originalName`: string
- `overrideName`: string

### TeamPlayerRequestedCooldownInfo

Fields:

- `teamIndex`: number
- `playerIndex`: number
- `cooldownsRequested`: number
