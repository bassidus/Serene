# Tutorial

Namespace `C_Tutorial`.

Environment=All, Predicates={1={FailureMode=ReturnNothing, Name=RequireNPERestricted, Type=Precondition}}

## Functions

### C_Tutorial.AbandonTutorialArea

### C_Tutorial.GetCombatEventInfo

RequireNPERestricted=true

### C_Tutorial.ReturnToTutorialArea

## Events

### LEAVING_TUTORIAL_AREA

SynchronousEvent=true

### NPE_TUTORIAL_UPDATE

SynchronousEvent=true

### TUTORIAL_COMBAT_EVENT

RequireNPERestricted=true, SynchronousEvent=true

### TUTORIAL_HIGHLIGHT_SPELL

SynchronousEvent=true

Payload:

- `spellID`: number
- `tutorialGlobalStringTag`: cstring

### TUTORIAL_TRIGGER

SynchronousEvent=true

Payload:

- `tutorialIndex`: number
- `forceShow`: bool

### TUTORIAL_UNHIGHLIGHT_SPELL

SynchronousEvent=true

## Tables

### FrameTutorialAccount

MaxValue=51, MinValue=1, NumValues=51

Fields:

- `HudRevampBagChanges`: FrameTutorialAccount [= 1]
- `PerksProgramActivitiesIntro`: FrameTutorialAccount [= 2]
- `EditModeManager`: FrameTutorialAccount [= 3]
- `TransmogSetsTab`: FrameTutorialAccount [= 4]
- `MountCollectionDragonriding`: FrameTutorialAccount [= 5]
- `LFGList`: FrameTutorialAccount [= 6]
- `HeirloomJournalLevel`: FrameTutorialAccount [= 7]
- `TimerunnersAdvantage`: FrameTutorialAccount [= 8]
- `AccountWideReputation`: FrameTutorialAccount [= 9]
- `TransferableCurrencies`: FrameTutorialAccount [= 10]
- `BindToAccountUntilEquip`: FrameTutorialAccount [= 11]
- `CompletedQuestsFilter`: FrameTutorialAccount [= 12]
- `CompletedQuestsFilterSeen`: FrameTutorialAccount [= 13]
- `ConcentrationCurrency`: FrameTutorialAccount [= 14]
- `MapLegendOpened`: FrameTutorialAccount [= 15]
- `NpcCraftingOrders`: FrameTutorialAccount [= 16]
- `NpcCraftingOrderCreateButton`: FrameTutorialAccount [= 17]
- `NpcCraftingOrderTabNew`: FrameTutorialAccount [= 18]
- `LocalStoriesFilterSeen`: FrameTutorialAccount [= 19]
- `EventSchedulerTabSeen`: FrameTutorialAccount [= 20]
- `AssistedCombatRotationDragSpell`: FrameTutorialAccount [= 21]
- `AssistedCombatRotationActionButton`: FrameTutorialAccount [= 22]
- `HousingDecorCleanup`: FrameTutorialAccount [= 23]
- `HousingDecorPlace`: FrameTutorialAccount [= 24]
- `HousingDecorClippingGrid`: FrameTutorialAccount [= 25]
- `HousingDecorCustomization`: FrameTutorialAccount [= 26]
- `HousingDecorLayout`: FrameTutorialAccount [= 27]
- `HousingHouseFinderMap`: FrameTutorialAccount [= 28]
- `HousingHouseFinderVisitHouse`: FrameTutorialAccount [= 29]
- `HousingItemAcquisition`: FrameTutorialAccount [= 30]
- `HousingNewPip`: FrameTutorialAccount [= 31]
- `PerksProgramActivitiesOpen`: FrameTutorialAccount [= 32]
- `EnconterJournalTutorialsTabSeen`: FrameTutorialAccount [= 33]
- `HousingMarketTab`: FrameTutorialAccount [= 34]
- `HousingTeleportButton`: FrameTutorialAccount [= 35]
- `RPETalentStarterBuild`: FrameTutorialAccount [= 36]
- `HousingInvalidCollision`: FrameTutorialAccount [= 37]
- `HousingModesUnlocked`: FrameTutorialAccount [= 38]
- `HousingExpertMode`: FrameTutorialAccount [= 39]
- `HousingCleanupMode`: FrameTutorialAccount [= 40]
- `TransmogOutfits`: FrameTutorialAccount [= 41]
- `TransmogSets`: FrameTutorialAccount [= 42]
- `TransmogCustomSets`: FrameTutorialAccount [= 43]
- `TransmogSituations`: FrameTutorialAccount [= 44]
- `TransmogWeaponOptions`: FrameTutorialAccount [= 45]
- `TransmogTrialOfStyle`: FrameTutorialAccount [= 46]
- `TransmogCustomSetsMigration`: FrameTutorialAccount [= 47]
- `HousingEndeavorsTabSeen`: FrameTutorialAccount [= 48]
- `RunesOfPower`: FrameTutorialAccount [= 49]
- `HousingPetBeds`: FrameTutorialAccount [= 50]
- `Reserved1`: FrameTutorialAccount [= 51]
