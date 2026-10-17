# Unit values, build 1.60.1.70374

Client 1.60.1 (build 70374, Oct 12 2026), Interface 16001.

**S** secret every time, ok never secret, **S**/ok both seen, err the call failed (missing API or bad arguments). A blank cell was not returned there.

## Unit kinds

| # | Unit | Relation | State | Samples | Mobs seen |
|---|---|---|---|---|---|
| 1 | pet | npc-friendly | nocombat | 3 | Boar |
| 2 | player | self | nocombat | 3 |  |

## Secret or not

Columns are the unit kinds above.

| API | 1 | 2 |
|---|---|---|
| `C_NamePlate.GetNamePlateForUnit` | ok | ok |
| `GetRaidTargetIndex` | ok | ok |
| `GetShapeshiftFormID` | ok | ok |
| `UnitAffectingCombat` | ok | ok |
| `UnitCanAssist(player, u)` | ok | ok |
| `UnitCanAttack(player, u)` | ok | ok |
| `UnitCastingDuration` | ok | ok |
| `UnitCastingInfo` | ok | ok |
| `UnitChannelInfo` | ok | ok |
| `UnitClass #1` | ok | ok |
| `UnitClass #2` | ok | ok |
| `UnitClass #3` | ok | ok |
| `UnitClassification` | ok | ok |
| `UnitCreatureFamily` |  | ok |
| `UnitCreatureFamily #1` | ok |  |
| `UnitCreatureFamily #2` | ok |  |
| `UnitCreatureType #1` | ok | ok |
| `UnitCreatureType #2` | ok | ok |
| `UnitDetailedThreatSituation(player, u)` | ok | ok |
| `UnitEffectiveLevel` | ok | ok |
| `UnitExists` | ok | ok |
| `UnitFactionGroup #1` | ok | ok |
| `UnitFactionGroup #2` | ok | ok |
| `UnitGUID` | ok | ok |
| `UnitGetIncomingHeals` | **S** | **S** |
| `UnitGetTotalAbsorbs` | **S** | **S** |
| `UnitHealth` | **S** | **S** |
| `UnitHealthMax` | ok | ok |
| `UnitHealthPercent` | **S** | **S** |
| `UnitInRange #1` | **S** | **S** |
| `UnitInRange #2` | **S** | **S** |
| `UnitIsDeadOrGhost` | ok | ok |
| `UnitIsEnemy(player, u)` | ok | ok |
| `UnitIsFriend(player, u)` | ok | ok |
| `UnitIsPVP` | ok | ok |
| `UnitIsPlayer` | ok | ok |
| `UnitIsTapDenied` | ok | ok |
| `UnitIsUnit(u, player)` | ok | ok |
| `UnitIsUnit(u, target)` | ok | ok |
| `UnitLevel` | ok | ok |
| `UnitName #1` | ok | ok |
| `UnitName #2` | ok | ok |
| `UnitPower` | **S** | **S** |
| `UnitPower(player, Combo)` | ok | ok |
| `UnitPower(u, Mana)` | ok | **S** |
| `UnitPowerMax` | ok | ok |
| `UnitPowerMax(u, Mana)` | ok | ok |
| `UnitPowerPercent(u, Mana)` | ok | **S** |
| `UnitPowerType #1` | ok | ok |
| `UnitPowerType #2` | ok | ok |
| `UnitPowerType #3` | ok | ok |
| `UnitPowerType #4` | ok | ok |
| `UnitPowerType #5` | ok | ok |
| `UnitRace` | ok |  |
| `UnitRace #1` |  | ok |
| `UnitRace #2` |  | ok |
| `UnitRace #3` |  | ok |
| `UnitReaction(u, player)` | ok | ok |
| `UnitSex` | ok | ok |
| `UnitThreatSituation(player, u)` | ok | ok |
| `aura HARMFUL` |  | ok |
| `aura HARMFUL.applications` | ok |  |
| `aura HARMFUL.auraInstanceID` | ok |  |
| `aura HARMFUL.dispelName` | ok |  |
| `aura HARMFUL.duration` | ok |  |
| `aura HARMFUL.expirationTime` | ok |  |
| `aura HARMFUL.icon` | ok |  |
| `aura HARMFUL.isFromPlayerOrPlayerPet` | ok |  |
| `aura HARMFUL.isStealable` | ok |  |
| `aura HARMFUL.name` | ok |  |
| `aura HARMFUL.sourceUnit` | ok |  |
| `aura HARMFUL.spellId` | ok |  |
| `aura HELPFUL` | ok |  |
| `aura HELPFUL.applications` |  | ok |
| `aura HELPFUL.auraInstanceID` |  | ok |
| `aura HELPFUL.dispelName` |  | ok |
| `aura HELPFUL.duration` |  | ok |
| `aura HELPFUL.expirationTime` |  | ok |
| `aura HELPFUL.icon` |  | ok |
| `aura HELPFUL.isFromPlayerOrPlayerPet` |  | ok |
| `aura HELPFUL.isStealable` |  | ok |
| `aura HELPFUL.name` |  | ok |
| `aura HELPFUL.sourceUnit` |  | ok |
| `aura HELPFUL.spellId` |  | ok |

## Last clean values

What each call returned last time it was not secret, per unit kind.

### 1. pet | npc-friendly | nocombat

- `C_NamePlate.GetNamePlateForUnit`: nil
- `GetRaidTargetIndex`: nil
- `GetShapeshiftFormID`: nil
- `UnitAffectingCombat`: boolean:false
- `UnitCanAssist(player, u)`: boolean:true
- `UnitCanAttack(player, u)`: boolean:false
- `UnitCastingDuration`: nil
- `UnitCastingInfo`: nil
- `UnitChannelInfo`: nil
- `UnitClass #1`: string:Boar
- `UnitClass #2`: string:WARRIOR
- `UnitClass #3`: number:1
- `UnitClassification`: string:normal
- `UnitCreatureFamily #1`: string:Boar
- `UnitCreatureFamily #2`: number:5
- `UnitCreatureType #1`: string:Beast
- `UnitCreatureType #2`: number:1
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitEffectiveLevel`: number:15
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: string:Alliance
- `UnitFactionGroup #2`: string:Alliance
- `UnitGUID`: string:Pet-0-6782-0-311612-1651
- `UnitHealthMax`: number:529
- `UnitIsDeadOrGhost`: boolean:false
- `UnitIsEnemy(player, u)`: boolean:false
- `UnitIsFriend(player, u)`: boolean:true
- `UnitIsPVP`: boolean:false
- `UnitIsPlayer`: boolean:false
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:false
- `UnitIsUnit(u, target)`: boolean:false
- `UnitLevel`: number:15
- `UnitName #1`: string:Boar
- `UnitName #2`: nil
- `UnitPower(player, Combo)`: number:0
- `UnitPower(u, Mana)`: number:0
- `UnitPowerMax`: number:100
- `UnitPowerMax(u, Mana)`: number:0
- `UnitPowerPercent(u, Mana)`: number:0
- `UnitPowerType #1`: number:2
- `UnitPowerType #2`: string:FOCUS
- `UnitPowerType #3`: nil
- `UnitPowerType #4`: nil
- `UnitPowerType #5`: nil
- `UnitRace`: nil
- `UnitReaction(u, player)`: number:5
- `UnitSex`: number:1
- `UnitThreatSituation(player, u)`: nil
- `aura HARMFUL.applications`: number:0
- `aura HARMFUL.auraInstanceID`: number:5
- `aura HARMFUL.dispelName`: string:Disease
- `aura HARMFUL.duration`: number:1200.001
- `aura HARMFUL.expirationTime`: number:15253.93
- `aura HARMFUL.icon`: number:135914
- `aura HARMFUL.isFromPlayerOrPlayerPet`: boolean:false
- `aura HARMFUL.isStealable`: boolean:false
- `aura HARMFUL.name`: string:Spirit Decay
- `aura HARMFUL.sourceUnit`: nil
- `aura HARMFUL.spellId`: number:8016
- `aura HELPFUL`: nil

### 2. player | self | nocombat

- `C_NamePlate.GetNamePlateForUnit`: nil
- `GetRaidTargetIndex`: nil
- `GetShapeshiftFormID`: nil
- `UnitAffectingCombat`: boolean:false
- `UnitCanAssist(player, u)`: boolean:true
- `UnitCanAttack(player, u)`: boolean:false
- `UnitCastingDuration`: nil
- `UnitCastingInfo`: nil
- `UnitChannelInfo`: nil
- `UnitClass #1`: string:Hunter
- `UnitClass #2`: string:HUNTER
- `UnitClass #3`: number:3
- `UnitClassification`: string:normal
- `UnitCreatureFamily`: nil
- `UnitCreatureType #1`: string:Humanoid
- `UnitCreatureType #2`: number:7
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitEffectiveLevel`: number:15
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: string:Alliance
- `UnitFactionGroup #2`: string:Alliance
- `UnitGUID`: string:Player-4620-017360F4
- `UnitHealthMax`: number:377
- `UnitIsDeadOrGhost`: boolean:false
- `UnitIsEnemy(player, u)`: boolean:false
- `UnitIsFriend(player, u)`: boolean:true
- `UnitIsPVP`: boolean:false
- `UnitIsPlayer`: boolean:true
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:true
- `UnitIsUnit(u, target)`: boolean:false
- `UnitLevel`: number:15
- `UnitName #1`: string:Cycladion
- `UnitName #2`: string:Highgale
- `UnitPower(player, Combo)`: number:0
- `UnitPowerMax`: number:561
- `UnitPowerMax(u, Mana)`: number:561
- `UnitPowerType #1`: number:0
- `UnitPowerType #2`: string:MANA
- `UnitPowerType #3`: nil
- `UnitPowerType #4`: nil
- `UnitPowerType #5`: nil
- `UnitRace #1`: string:High Order Skyborne
- `UnitRace #2`: string:Skyborne
- `UnitRace #3`: number:95
- `UnitReaction(u, player)`: number:5
- `UnitSex`: number:2
- `UnitThreatSituation(player, u)`: nil
- `aura HARMFUL`: nil
- `aura HELPFUL.applications`: number:0
- `aura HELPFUL.auraInstanceID`: number:5
- `aura HELPFUL.dispelName`: string:Magic
- `aura HELPFUL.duration`: number:3600.001
- `aura HELPFUL.expirationTime`: number:16421.904
- `aura HELPFUL.icon`: number:135932
- `aura HELPFUL.isFromPlayerOrPlayerPet`: boolean:true
- `aura HELPFUL.isStealable`: boolean:false
- `aura HELPFUL.name`: string:Arcane Intellect
- `aura HELPFUL.sourceUnit`: nil
- `aura HELPFUL.spellId`: number:1460
