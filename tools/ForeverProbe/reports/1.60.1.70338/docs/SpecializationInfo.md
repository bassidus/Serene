# SpecializationInfo

Namespace `C_SpecializationInfo`.

Environment=All, Predicates={}

## Functions

### C_SpecializationInfo.CanPlayerUsePVPTalentUI

Returns:

- `canUse`: bool
- `failureReason`: string

### C_SpecializationInfo.CanPlayerUseTalentSpecUI

Returns:

- `canUse`: bool
- `failureReason`: string

### C_SpecializationInfo.CanPlayerUseTalentUI

Returns:

- `canUse`: bool
- `failureReason`: string

### C_SpecializationInfo.GetActiveSpecGroup

SecretArguments=AllowedWhenUntainted

Arguments:

- `isInspect`: bool?
- `isPet`: bool?

Returns:

- `groupIndex`: luaIndex

### C_SpecializationInfo.GetAllClassIDs

Returns:

- `allClassIDs`: table<number>

### C_SpecializationInfo.GetAllSelectedPvpTalentIDs

Returns:

- `selectedPvpTalentIDs`: table<number>

### C_SpecializationInfo.GetClassIDFromSpecID

SecretArguments=AllowedWhenUntainted

Arguments:

- `specID`: number

Returns:

- `classID`: number?

### C_SpecializationInfo.GetCombatConfigIDForSpecGroup

SecretArguments=AllowedWhenUntainted

Arguments:

- `groupIndex`: luaIndex

Returns:

- `configID`: number?

### C_SpecializationInfo.GetInspectSelectedPvpTalent

SecretArguments=AllowedWhenUntainted

Arguments:

- `inspectedUnit`: UnitToken
- `talentIndex`: number

Returns:

- `selectedTalentID`: number?

### C_SpecializationInfo.GetInspectSpecialization

SecretArguments=AllowedWhenUntainted, SecretWhenUnitIdentityRestricted=true

Arguments:

- `unit`: UnitToken

Returns:

- `specializationID`: number

### C_SpecializationInfo.GetNumSpecializationsForClassID

SecretArguments=AllowedWhenUntainted

Arguments:

- `classID`: number

Returns:

- `specCount`: number

### C_SpecializationInfo.GetPvpTalentAlertStatus

Returns:

- `hasUnspentSlot`: bool
- `hasNewTalent`: bool

### C_SpecializationInfo.GetPvpTalentInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `talentID`: number

Returns:

- `talentInfo`: PvpTalentInfo?

### C_SpecializationInfo.GetPvpTalentSlotInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `talentIndex`: number

Returns:

- `slotInfo`: PvpTalentSlotInfo?

### C_SpecializationInfo.GetPvpTalentSlotUnlockLevel

SecretArguments=AllowedWhenUntainted

Arguments:

- `talentIndex`: number

Returns:

- `requiredLevel`: number?

### C_SpecializationInfo.GetPvpTalentUnlockLevel

SecretArguments=AllowedWhenUntainted

Arguments:

- `talentID`: number

Returns:

- `requiredLevel`: number?

### C_SpecializationInfo.GetSpecIDs

SecretArguments=AllowedWhenUntainted

Arguments:

- `specSetID`: number

Returns:

- `specIDs`: table<number>

### C_SpecializationInfo.GetSpecialization

SecretArguments=AllowedWhenUntainted

Arguments:

- `isInspect`: bool?
- `isPet`: bool?
- `specGroupIndex`: luaIndex?

Returns:

- `specializationIndex`: luaIndex

### C_SpecializationInfo.GetSpecializationInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `specializationIndex`: luaIndex
- `isInspect`: bool [default=false]
- `isPet`: bool [default=false]
- `inspectTarget`: string?
- `sex`: number?
- `groupIndex`: luaIndex?
- `classID`: number?

Returns:

- `specId`: number [default=0]
- `name`: string?
- `description`: string?
- `icon`: fileID?
- `role`: string?
- `primaryStat`: luaIndex?
- `pointsSpent`: number [default=0]
- `background`: string?
- `previewPointsSpent`: number [default=0]
- `isUnlocked`: bool [default=true]

### C_SpecializationInfo.GetSpecializationMasterySpells

SecretArguments=AllowedWhenUntainted

Arguments:

- `specializationIndex`: luaIndex
- `isInspect`: bool?
- `isPet`: bool?

Returns:

- `spellIDs`: table<number>

### C_SpecializationInfo.GetSpellsDisplay

SecretArguments=AllowedWhenUntainted

Arguments:

- `specializationID`: number

Returns:

- `spellID`: table<number>

### C_SpecializationInfo.GetTalentInfo

SecretArguments=AllowedWhenUntainted

Arguments:

- `query`: TalentInfoQuery

Returns:

- `result`: TalentInfoResult?

### C_SpecializationInfo.HasPlayerEarnedATalentPoint

Returns:

- `hasEarned`: bool

### C_SpecializationInfo.IsInitialized

Returns:

- `isSpecializationDataInitialized`: bool

### C_SpecializationInfo.IsPvpTalentLocked

SecretArguments=AllowedWhenUntainted

Arguments:

- `talentID`: number

Returns:

- `locked`: bool

### C_SpecializationInfo.IsSpecSelectionEnabled

SecretArguments=AllowedWhenUntainted

Arguments:

- `classID`: number

Returns:

- `enabled`: bool

### C_SpecializationInfo.MatchesCurrentSpecSet

SecretArguments=AllowedWhenUntainted

Arguments:

- `specSetID`: number

Returns:

- `matches`: bool

### C_SpecializationInfo.SetActiveSpecGroup

SecretArguments=AllowedWhenUntainted

Arguments:

- `groupIndex`: luaIndex

### C_SpecializationInfo.SetPetSpecialization

SecretArguments=AllowedWhenUntainted

Arguments:

- `specIndex`: luaIndex
- `petNumber`: number?

### C_SpecializationInfo.SetPvpTalentLocked

SecretArguments=AllowedWhenUntainted

Arguments:

- `talentID`: number
- `locked`: bool

### C_SpecializationInfo.SetSpecialization

SecretArguments=AllowedWhenUntainted

Arguments:

- `specIndex`: luaIndex

Returns:

- `success`: bool

## Events

### ACTIVE_TALENT_GROUP_CHANGED

SynchronousEvent=true

Payload:

- `curr`: number
- `prev`: number

### CONFIRM_PET_UNLEARN

SynchronousEvent=true

Payload:

- `cost`: number

### CONFIRM_TALENT_WIPE

SynchronousEvent=true

Payload:

- `cost`: number
- `respecType`: number

### PET_SPECIALIZATION_CHANGED

SynchronousEvent=true

### PLAYER_LEARN_PVP_TALENT_FAILED

SynchronousEvent=true

### PLAYER_LEARN_TALENT_FAILED

SynchronousEvent=true

### PLAYER_PVP_TALENT_UPDATE

SynchronousEvent=true

### PLAYER_TALENT_UPDATE

SynchronousEvent=true

### SPEC_INVOLUNTARILY_CHANGED

SynchronousEvent=true

Payload:

- `isPet`: bool

### TALENTS_INVOLUNTARILY_RESET

SynchronousEvent=true

Payload:

- `isPetTalents`: bool

## Tables

### PvpTalentInfo

Fields:

- `talentID`: number
- `name`: string
- `icon`: number
- `selected`: bool
- `available`: bool
- `spellID`: number
- `unlocked`: bool
- `known`: bool
- `grantedByAura`: bool
- `dependenciesUnmet`: bool
- `dependenciesUnmetReason`: string?

### PvpTalentSlotInfo

Fields:

- `enabled`: bool
- `level`: number
- `selectedTalentID`: number?
- `availableTalentIDs`: table<number>

### SpecializationInfoOutput

Fields:

- `specId`: number [default=0]
- `name`: string?
- `description`: string?
- `icon`: fileID?
- `role`: string?
- `primaryStat`: luaIndex?
- `pointsSpent`: number [default=0]
- `background`: string?
- `previewPointsSpent`: number [default=0]
- `isUnlocked`: bool [default=true]

### SpecializationInfoQuery

Fields:

- `specializationIndex`: luaIndex
- `isInspect`: bool [default=false]
- `isPet`: bool [default=false]
- `inspectTarget`: string?
- `sex`: number?
- `groupIndex`: luaIndex?
- `classID`: number?

### TalentInfoQuery

Fields:

- `groupIndex`: luaIndex?
- `isInspect`: bool [default=false]
- `tier`: luaIndex?
- `column`: luaIndex?
- `target`: UnitToken?
- `specializationIndex`: luaIndex?
- `talentIndex`: luaIndex?
- `isPet`: bool [default=false]

### TalentInfoResult

Fields:

- `talentID`: number [default=0]
- `name`: string
- `icon`: fileID
- `tier`: luaIndex
- `column`: luaIndex
- `selected`: bool [default=false]
- `available`: bool [default=false]
- `spellID`: number [default=0]
- `isPVPTalentUnlocked`: bool [default=false]
- `known`: bool [default=false]
- `grantedByAura`: bool [default=false]
- `rank`: luaIndex
- `maxRank`: luaIndex
- `meetsPrereq`: bool [default=false]
- `previewRank`: luaIndex
- `meetsPreviewPrereq`: bool [default=false]
- `isExceptional`: bool [default=false]
- `hasGoldBorder`: bool [default=false]
