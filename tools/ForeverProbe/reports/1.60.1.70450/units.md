# Unit values, build 1.60.1.70450

Client 1.60.1 (build 70450, Oct 15 2026), Interface 16001.

**S** secret every time, ok never secret, **S**/ok both seen, err the call failed (missing API or bad arguments). A blank cell was not returned there.

## Unit kinds

| # | Unit | Relation | State | Samples | Mobs seen |
|---|---|---|---|---|---|
| 1 | player | self | nocombat | 1 |  |

## Secret or not

Columns are the unit kinds above.

| API | 1 |
|---|---|
| `C_NamePlate.GetNamePlateForUnit` | ok |
| `GetRaidTargetIndex` | ok |
| `GetShapeshiftFormID` | ok |
| `UnitAffectingCombat` | ok |
| `UnitCanAssist(player, u)` | ok |
| `UnitCanAttack(player, u)` | ok |
| `UnitCastingDuration` | ok |
| `UnitCastingInfo` | ok |
| `UnitChannelInfo` | ok |
| `UnitClass #1` | ok |
| `UnitClass #2` | ok |
| `UnitClass #3` | ok |
| `UnitClassification` | ok |
| `UnitCreatureFamily` | ok |
| `UnitCreatureType #1` | ok |
| `UnitCreatureType #2` | ok |
| `UnitDetailedThreatSituation(player, u)` | ok |
| `UnitEffectiveLevel` | ok |
| `UnitExists` | ok |
| `UnitFactionGroup #1` | ok |
| `UnitFactionGroup #2` | ok |
| `UnitGUID` | ok |
| `UnitGetIncomingHeals` | **S** |
| `UnitGetTotalAbsorbs` | **S** |
| `UnitHealth` | **S** |
| `UnitHealthMax` | ok |
| `UnitHealthPercent` | **S** |
| `UnitInRange #1` | **S** |
| `UnitInRange #2` | **S** |
| `UnitIsDeadOrGhost` | ok |
| `UnitIsEnemy(player, u)` | ok |
| `UnitIsFriend(player, u)` | ok |
| `UnitIsPVP` | ok |
| `UnitIsPlayer` | ok |
| `UnitIsTapDenied` | ok |
| `UnitIsUnit(u, player)` | ok |
| `UnitIsUnit(u, target)` | ok |
| `UnitLevel` | ok |
| `UnitName #1` | ok |
| `UnitName #2` | ok |
| `UnitPower` | **S** |
| `UnitPower(player, Combo)` | ok |
| `UnitPower(u, Mana)` | **S** |
| `UnitPowerMax` | ok |
| `UnitPowerMax(u, Mana)` | ok |
| `UnitPowerPercent(u, Mana)` | **S** |
| `UnitPowerType #1` | ok |
| `UnitPowerType #2` | ok |
| `UnitPowerType #3` | ok |
| `UnitPowerType #4` | ok |
| `UnitPowerType #5` | ok |
| `UnitRace #1` | ok |
| `UnitRace #2` | ok |
| `UnitRace #3` | ok |
| `UnitReaction(u, player)` | ok |
| `UnitSex` | ok |
| `UnitThreatSituation(player, u)` | ok |
| `aura HARMFUL` | ok |
| `aura HELPFUL` | ok |

## Last clean values

What each call returned last time it was not secret, per unit kind.

### 1. player | self | nocombat

- `C_NamePlate.GetNamePlateForUnit`: nil
- `GetRaidTargetIndex`: nil
- `GetShapeshiftFormID`: nil
- `UnitAffectingCombat`: boolean:false
- `UnitCanAssist(player, u)`: boolean:true
- `UnitCanAttack(player, u)`: boolean:false
- `UnitCastingDuration`: nil
- `UnitCastingInfo`: nil
- `UnitChannelInfo`: nil
- `UnitClass #1`: string:Mage
- `UnitClass #2`: string:MAGE
- `UnitClass #3`: number:8
- `UnitClassification`: string:normal
- `UnitCreatureFamily`: nil
- `UnitCreatureType #1`: string:Humanoid
- `UnitCreatureType #2`: number:7
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitEffectiveLevel`: number:6
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: string:Alliance
- `UnitFactionGroup #2`: string:Alliance
- `UnitGUID`: string:Player-4620-018941EF
- `UnitHealthMax`: number:117
- `UnitIsDeadOrGhost`: boolean:false
- `UnitIsEnemy(player, u)`: boolean:false
- `UnitIsFriend(player, u)`: boolean:true
- `UnitIsPVP`: boolean:false
- `UnitIsPlayer`: boolean:true
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:true
- `UnitIsUnit(u, target)`: boolean:false
- `UnitLevel`: number:6
- `UnitName #1`: string:Zeya
- `UnitName #2`: string:Winter
- `UnitPower(player, Combo)`: number:0
- `UnitPowerMax`: number:315
- `UnitPowerMax(u, Mana)`: number:315
- `UnitPowerType #1`: number:0
- `UnitPowerType #2`: string:MANA
- `UnitPowerType #3`: nil
- `UnitPowerType #4`: nil
- `UnitPowerType #5`: nil
- `UnitRace #1`: string:High Order Skyborne
- `UnitRace #2`: string:Skyborne
- `UnitRace #3`: number:95
- `UnitReaction(u, player)`: number:5
- `UnitSex`: number:3
- `UnitThreatSituation(player, u)`: nil
- `aura HARMFUL`: nil
- `aura HELPFUL`: nil
