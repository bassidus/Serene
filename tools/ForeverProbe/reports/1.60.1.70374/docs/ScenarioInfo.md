# ScenarioInfo

Namespace `C_ScenarioInfo`.

Environment=All, Predicates={}

## Functions

### C_ScenarioInfo.GetCriteriaInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `criteriaIndex`: number

Returns:

- `scenarioCriteriaInfo`: ScenarioCriteriaInfo

### C_ScenarioInfo.GetCriteriaInfoByStep

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `stepID`: number
- `criteriaIndex`: number

Returns:

- `scenarioCriteriaInfo`: ScenarioCriteriaInfo

### C_ScenarioInfo.GetDisplayInfo

MayReturnNothing=true

Returns:

- `info`: ScenarioDisplayInfo

### C_ScenarioInfo.GetJailersTowerTypeString

SecretArguments=AllowedWhenUntainted

Arguments:

- `runType`: JailersTowerType

Returns:

- `typeString`: cstring?

### C_ScenarioInfo.GetScenarioIconInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `uiMapID`: number

Returns:

- `scenarioInfos`: table<ScenarioIconInfo>

### C_ScenarioInfo.GetScenarioInfo

MayReturnNothing=true

Returns:

- `scenarioInfo`: ScenarioInformation

### C_ScenarioInfo.GetScenarioStepInfo

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `scenarioStepID`: number?

Returns:

- `scenarioStepInfo`: ScenarioStepInfo

### C_ScenarioInfo.GetTieredEntranceActiveSpells -- Returns list of active challenge spells if inside a tiered entrance scenario

Returns:

- `spellIDs`: table<number>?

### C_ScenarioInfo.GetUnitCriteriaProgressValues

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted, SecretWhenUnitIdentityRestricted=true

Arguments:

- `unit`: UnitToken

Returns:

- `actualValue`: number
- `percentValue`: number
- `percentValueString`: string

### C_ScenarioInfo.IsTieredEntranceScenario

Returns:

- `isTieredEntrance`: bool

## Events

### JAILERS_TOWER_LEVEL_UPDATE

SynchronousEvent=true

Payload:

- `level`: number
- `type`: JailersTowerType

### SCENARIO_BONUS_OBJECTIVE_COMPLETE

SynchronousEvent=true

Payload:

- `bonusObjectiveID`: number

### SCENARIO_BONUS_VISIBILITY_UPDATE

SynchronousEvent=true

### SCENARIO_COMPLETED

SynchronousEvent=true

Payload:

- `questID`: number?
- `xp`: number?
- `money`: number?

### SCENARIO_CRITERIA_SHOW_STATE_UPDATE

SynchronousEvent=true

Payload:

- `show`: bool

### SCENARIO_CRITERIA_UPDATE

SynchronousEvent=true

Payload:

- `criteriaID`: number

### SCENARIO_POI_UPDATE

SynchronousEvent=true

### SCENARIO_SPELL_UPDATE

SynchronousEvent=true

### SCENARIO_UPDATE

SynchronousEvent=true

Payload:

- `newStep`: bool?

## Tables

### JailersTowerType

MaxValue=14, MinValue=0, NumValues=15

Fields:

- `TwistingCorridors`: JailersTowerType [= 0]
- `SkoldusHalls`: JailersTowerType [= 1]
- `FractureChambers`: JailersTowerType [= 2]
- `Soulforges`: JailersTowerType [= 3]
- `Coldheart`: JailersTowerType [= 4]
- `Mortregar`: JailersTowerType [= 5]
- `UpperReaches`: JailersTowerType [= 6]
- `ArkobanHall`: JailersTowerType [= 7]
- `TormentChamberJaina`: JailersTowerType [= 8]
- `TormentChamberThrall`: JailersTowerType [= 9]
- `TormentChamberAnduin`: JailersTowerType [= 10]
- `AdamantVaults`: JailersTowerType [= 11]
- `ForgottenCatacombs`: JailersTowerType [= 12]
- `Ossuary`: JailersTowerType [= 13]
- `BossRush`: JailersTowerType [= 14]

### ScenarioCriteriaInfo

Fields:

- `description`: string
- `criteriaType`: number [default=0]
- `completed`: bool [default=false]
- `quantity`: number [default=0]
- `totalQuantity`: number [default=0]
- `flags`: number [default=0]
- `assetID`: number [default=0]
- `criteriaID`: number
- `duration`: number [default=0]
- `elapsed`: number [default=0]
- `failed`: bool [default=false]
- `isWeightedProgress`: bool [default=false]
- `isFormatted`: bool [default=false]
- `quantityString`: string

### ScenarioDisplayInfo

Fields:

- `themeColor`: colorRGB (ColorMixin)?
- `startSoundKitID`: number?

### ScenarioIconInfo

Fields:

- `x`: number
- `y`: number
- `atlas`: textureAtlas
- `description`: cstring

### ScenarioInformation

Fields:

- `name`: string
- `currentStage`: number
- `numStages`: number
- `flags`: number
- `isComplete`: bool
- `xp`: number
- `money`: number
- `type`: number
- `area`: string
- `uiTextureKit`: textureKit
- `scenarioID`: number

### ScenarioStepInfo

Fields:

- `title`: string
- `description`: string
- `numCriteria`: number
- `stepFailed`: bool
- `isBonusStep`: bool
- `isForCurrentStepOnly`: bool
- `shouldShowBonusObjective`: bool
- `spells`: table<ScenarioStepSpellInfo>
- `weightedProgress`: number?
- `rewardQuestID`: number
- `widgetSetID`: number?
- `stepID`: number

### ScenarioStepSpellInfo

Fields:

- `spellID`: number
- `name`: string
- `icon`: number
