# Unit values, build 1.60.1.70291

Client 1.60.1 (build 70291, Oct  7 2026), Interface 16001.

**S** secret every time, ok never secret, **S**/ok both seen, err the call failed (missing API or bad arguments). A blank cell was not returned there.

## Unit kinds

| # | Unit | Relation | State | Samples | Mobs seen |
|---|---|---|---|---|---|
| 1 | focus | self | nocombat | 5 |  |
| 2 | nameplate | npc-hostile | combat | 74 | Scarlet Convert, Scarlet Initiate, Meven Korgal, Tirisfal Farmer, Tirisfal Farmhand, Decrepit Darkhound |
| 3 | nameplate | npc-hostile | nocombat | 21 | Scarlet Convert, Scarlet Initiate, Meven Korgal, Tirisfal Farmer, Tirisfal Farmhand, Decrepit Darkhound |
| 4 | nameplate | npc-neutral | combat | 2 | Ragged Scavenger |
| 5 | nameplate | npc-neutral | nocombat | 2 | Mindless Zombie, Ragged Scavenger |
| 6 | pet | npc-friendly | combat | 161 | Yazrot, Pagyal |
| 7 | pet | npc-friendly | nocombat | 180 | Yazrot, Pagyal |
| 8 | player | self | combat | 161 |  |
| 9 | player | self | nocombat | 207 |  |
| 10 | target | npc-friendly | combat | 2 | Captured Leper Gnome |
| 11 | target | npc-friendly | nocombat | 18 | Captured Leper Gnome, Pilot Bellowfiz, Pilot Stonegear, Beldin Steelgrill, Loslor Rudge, Father Gavin, Executor Arren, Harold Raims |
| 12 | target | npc-hostile | combat | 93 | Minor Ice Elemental, Scarlet Convert, Scarlet Initiate, Meven Korgal, Tirisfal Farmer, Tirisfal Farmhand, Decrepit Darkhound |
| 13 | target | npc-hostile | nocombat | 53 | Scarlet Convert, Scarlet Initiate, Meven Korgal, Tirisfal Farmer, Tirisfal Farmhand, Decrepit Darkhound |
| 14 | target | npc-neutral | combat | 21 | Large Crag Boar, Elder Crag Boar, Ragged Scavenger |
| 15 | target | npc-neutral | nocombat | 16 | Large Crag Boar, Elder Crag Boar, Mindless Zombie, Ragged Scavenger |
| 16 | target | pc-friendly | nocombat | 5 |  |
| 17 | target | self | nocombat | 8 |  |
| 18 | targettarget | npc-friendly | combat | 7 | Pagyal |
| 19 | targettarget | npc-friendly | nocombat | 4 | Zureetha Fargaze, Duokna |
| 20 | targettarget | self | combat | 81 |  |
| 21 | targettarget | self | nocombat | 8 |  |

## Secret or not

Columns are the unit kinds above.

| API | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14 | 15 | 16 | 17 | 18 | 19 | 20 | 21 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| `C_NamePlate.GetNamePlateForUnit` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | err | err | err | err |
| `CheckInteractDistance(u, 4)` |  |  |  |  |  | ok | ok | ok | ok |  |  |  |  | ok | ok |  |  |  |  | ok |  |
| `GetRaidTargetIndex` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `GetShapeshiftFormID` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitAffectingCombat` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitCanAssist(player, u)` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitCanAttack(player, u)` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitCastingDuration` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitCastingInfo` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitCastingInfo #1` |  | **S** |  |  |  | ok |  | ok | ok |  |  | **S** |  |  |  |  |  | ok |  | ok |  |
| `UnitCastingInfo #10` |  | ok |  |  |  | ok |  | ok | ok |  |  | ok |  |  |  |  |  | ok |  | ok |  |
| `UnitCastingInfo #11` |  | ok |  |  |  | ok |  | ok | ok |  |  | ok |  |  |  |  |  | ok |  | ok |  |
| `UnitCastingInfo #2` |  | **S** |  |  |  | ok |  | ok | ok |  |  | **S** |  |  |  |  |  | ok |  | ok |  |
| `UnitCastingInfo #3` |  | **S** |  |  |  | ok |  | ok | ok |  |  | **S** |  |  |  |  |  | ok |  | ok |  |
| `UnitCastingInfo #4` |  | **S** |  |  |  | ok |  | ok | ok |  |  | **S** |  |  |  |  |  | ok |  | ok |  |
| `UnitCastingInfo #5` |  | **S** |  |  |  | ok |  | ok | ok |  |  | **S** |  |  |  |  |  | ok |  | ok |  |
| `UnitCastingInfo #6` |  | ok |  |  |  | ok |  | ok | ok |  |  | ok |  |  |  |  |  | ok |  | ok |  |
| `UnitCastingInfo #7` |  | **S** |  |  |  | ok |  | ok | ok |  |  | **S** |  |  |  |  |  | ok |  | ok |  |
| `UnitCastingInfo #8` |  | **S** |  |  |  | ok |  | ok | ok |  |  | **S** |  |  |  |  |  | ok |  | ok |  |
| `UnitCastingInfo #9` |  | **S** |  |  |  | ok |  | ok | ok |  |  | **S** |  |  |  |  |  | ok |  | ok |  |
| `UnitChannelInfo` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitClass #1` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitClass #2` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitClass #3` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitClassification` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitCreatureFamily` | ok | ok | ok |  | ok |  |  | ok | ok | ok | ok | ok | ok |  | ok | ok | ok |  | ok | ok | ok |
| `UnitCreatureFamily #1` |  |  |  | ok | ok | ok | ok |  |  |  |  |  |  | ok | ok |  |  | ok |  |  |  |
| `UnitCreatureFamily #2` |  |  |  | ok | ok | ok | ok |  |  |  |  |  |  | ok | ok |  |  | ok |  |  |  |
| `UnitCreatureType #1` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitCreatureType #2` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitDetailedThreatSituation(player, u)` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitDetailedThreatSituation(player, u) #1` |  | **S** |  | **S** |  |  |  |  |  |  |  | ok |  | ok |  |  |  |  |  |  |  |
| `UnitDetailedThreatSituation(player, u) #2` |  | **S** |  | **S** |  |  |  |  |  |  |  | ok |  | ok |  |  |  |  |  |  |  |
| `UnitDetailedThreatSituation(player, u) #3` |  | **S** |  | **S** |  |  |  |  |  |  |  | ok |  | ok |  |  |  |  |  |  |  |
| `UnitDetailedThreatSituation(player, u) #4` |  | **S** |  | **S** |  |  |  |  |  |  |  | ok |  | ok |  |  |  |  |  |  |  |
| `UnitDetailedThreatSituation(player, u) #5` |  | **S** |  | **S** |  |  |  |  |  |  |  | ok |  | ok |  |  |  |  |  |  |  |
| `UnitEffectiveLevel` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitExists` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitFactionGroup #1` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitFactionGroup #2` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitGUID` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitGetIncomingHeals` | **S** | ok | ok | ok | ok | **S** | **S** | **S** | **S** | **S** | **S** | ok | ok | ok | ok | **S** | **S** | **S** | **S** | **S** | **S** |
| `UnitGetTotalAbsorbs` | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** |
| `UnitHealth` | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** |
| `UnitHealthMax` | ok | **S** | **S** | **S** | **S** | ok | ok | ok | ok | **S** | **S** | **S** | **S** | **S** | **S** | **S** | ok | ok | **S** | ok | ok |
| `UnitHealthPercent` | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** |
| `UnitInRange #1` | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** |
| `UnitInRange #2` | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** |
| `UnitIsDeadOrGhost` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitIsEnemy(player, u)` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitIsFriend(player, u)` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitIsPVP` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitIsPlayer` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitIsTapDenied` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitIsUnit(u, player)` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitIsUnit(u, target)` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitLevel` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitName #1` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitName #2` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitPower` | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** |
| `UnitPower(player, Combo)` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitPower(u, Mana)` | **S** | **S**/ok | **S**/ok | ok | ok | **S** | **S** | **S** | **S**/ok | ok | **S**/ok | **S**/ok | **S**/ok | ok | ok | **S**/ok | **S**/ok | **S** | ok | **S** | **S**/ok |
| `UnitPowerMax` | ok | **S** | **S** | **S** | **S** | ok | ok | ok | ok | **S** | **S** | **S** | **S** | **S** | **S** | **S** | ok | ok | **S** | ok | ok |
| `UnitPowerMax(u, Mana)` | ok | **S**/ok | **S**/ok | ok | ok | ok | ok | ok | ok | ok | **S**/ok | **S**/ok | **S**/ok | ok | ok | **S**/ok | ok | ok | ok | ok | ok |
| `UnitPowerPercent(u, Mana)` | **S** | **S**/ok | **S**/ok | ok | ok | **S** | **S** | **S** | **S**/ok | ok | **S**/ok | **S**/ok | **S**/ok | ok | ok | **S**/ok | **S**/ok | **S** | ok | **S** | **S**/ok |
| `UnitPowerType #1` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitPowerType #2` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitPowerType #3` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitPowerType #4` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitPowerType #5` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitRace` |  | ok | ok | ok | ok | ok | ok |  |  | ok | ok | ok | ok | ok | ok |  |  | ok | ok |  |  |
| `UnitRace #1` | ok |  |  |  |  |  |  | ok | ok |  |  |  |  |  |  | ok | ok |  |  | ok | ok |
| `UnitRace #2` | ok |  |  |  |  |  |  | ok | ok |  |  |  |  |  |  | ok | ok |  |  | ok | ok |
| `UnitRace #3` | ok |  |  |  |  |  |  | ok | ok |  |  |  |  |  |  | ok | ok |  |  | ok | ok |
| `UnitReaction(u, player)` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitSex` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitThreatSituation(player, u)` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `aura HARMFUL` | ok | err | ok | err | ok | err | ok | err | ok | err | ok | err | ok | err | ok | ok | ok | err | ok | err | ok |
| `aura HARMFUL.applications` |  |  |  |  |  |  |  |  | ok |  |  |  |  |  |  |  |  |  |  |  |  |
| `aura HARMFUL.auraInstanceID` |  |  |  |  |  |  |  |  | ok |  |  |  |  |  |  |  |  |  |  |  |  |
| `aura HARMFUL.dispelName` |  |  |  |  |  |  |  |  | ok |  |  |  |  |  |  |  |  |  |  |  |  |
| `aura HARMFUL.duration` |  |  |  |  |  |  |  |  | ok |  |  |  |  |  |  |  |  |  |  |  |  |
| `aura HARMFUL.expirationTime` |  |  |  |  |  |  |  |  | ok |  |  |  |  |  |  |  |  |  |  |  |  |
| `aura HARMFUL.icon` |  |  |  |  |  |  |  |  | ok |  |  |  |  |  |  |  |  |  |  |  |  |
| `aura HARMFUL.isFromPlayerOrPlayerPet` |  |  |  |  |  |  |  |  | ok |  |  |  |  |  |  |  |  |  |  |  |  |
| `aura HARMFUL.isStealable` |  |  |  |  |  |  |  |  | ok |  |  |  |  |  |  |  |  |  |  |  |  |
| `aura HARMFUL.name` |  |  |  |  |  |  |  |  | ok |  |  |  |  |  |  |  |  |  |  |  |  |
| `aura HARMFUL.sourceUnit` |  |  |  |  |  |  |  |  | ok |  |  |  |  |  |  |  |  |  |  |  |  |
| `aura HARMFUL.spellId` |  |  |  |  |  |  |  |  | ok |  |  |  |  |  |  |  |  |  |  |  |  |
| `aura HELPFUL` | ok | err | ok | err | ok | err | ok | err | ok | err | ok | err | ok | err | ok | ok | ok | err | ok | err | ok |
| `aura HELPFUL.applications` | ok |  | ok |  |  |  | ok |  | ok |  | ok |  | ok |  |  | ok | ok |  |  |  | ok |
| `aura HELPFUL.auraInstanceID` | ok |  | ok |  |  |  | ok |  | ok |  | ok |  | ok |  |  | ok | ok |  |  |  | ok |
| `aura HELPFUL.dispelName` | ok |  | ok |  |  |  | ok |  | ok |  | ok |  | ok |  |  | ok | ok |  |  |  | ok |
| `aura HELPFUL.duration` | ok |  | ok |  |  |  | ok |  | ok |  | ok |  | ok |  |  | ok | ok |  |  |  | ok |
| `aura HELPFUL.expirationTime` | ok |  | ok |  |  |  | ok |  | ok |  | ok |  | ok |  |  | ok | ok |  |  |  | ok |
| `aura HELPFUL.icon` | ok |  | ok |  |  |  | ok |  | ok |  | ok |  | ok |  |  | ok | ok |  |  |  | ok |
| `aura HELPFUL.isFromPlayerOrPlayerPet` | ok |  | ok |  |  |  | ok |  | ok |  | ok |  | ok |  |  | ok | ok |  |  |  | ok |
| `aura HELPFUL.isStealable` | ok |  | ok |  |  |  | ok |  | ok |  | ok |  | ok |  |  | ok | ok |  |  |  | ok |
| `aura HELPFUL.name` | ok |  | ok |  |  |  | ok |  | ok |  | ok |  | ok |  |  | ok | ok |  |  |  | ok |
| `aura HELPFUL.sourceUnit` | ok |  | ok |  |  |  | ok |  | ok |  | ok |  | ok |  |  | ok | ok |  |  |  | ok |
| `aura HELPFUL.spellId` | ok |  | ok |  |  |  | ok |  | ok |  | ok |  | ok |  |  | ok | ok |  |  |  | ok |

## Last clean values

What each call returned last time it was not secret, per unit kind.

### 1. focus | self | nocombat

- `C_NamePlate.GetNamePlateForUnit`: nil
- `GetRaidTargetIndex`: nil
- `GetShapeshiftFormID`: nil
- `UnitAffectingCombat`: boolean:false
- `UnitCanAssist(player, u)`: boolean:true
- `UnitCanAttack(player, u)`: boolean:false
- `UnitCastingDuration`: nil
- `UnitCastingInfo`: nil
- `UnitChannelInfo`: nil
- `UnitClass #1`: string:Warlock
- `UnitClass #2`: string:WARLOCK
- `UnitClass #3`: number:9
- `UnitClassification`: string:normal
- `UnitCreatureFamily`: nil
- `UnitCreatureType #1`: string:Humanoid
- `UnitCreatureType #2`: number:7
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitEffectiveLevel`: number:6
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: string:Horde
- `UnitFactionGroup #2`: string:Horde
- `UnitGUID`: string:Player-4620-014D513D
- `UnitHealthMax`: number:168
- `UnitIsDeadOrGhost`: boolean:false
- `UnitIsEnemy(player, u)`: boolean:false
- `UnitIsFriend(player, u)`: boolean:true
- `UnitIsPVP`: boolean:false
- `UnitIsPlayer`: boolean:true
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:true
- `UnitIsUnit(u, target)`: boolean:true
- `UnitLevel`: number:6
- `UnitName #1`: string:Forever
- `UnitName #2`: string:Ghoulhunter
- `UnitPower(player, Combo)`: number:0
- `UnitPowerMax`: number:235
- `UnitPowerMax(u, Mana)`: number:235
- `UnitPowerType #1`: number:0
- `UnitPowerType #2`: string:MANA
- `UnitPowerType #3`: nil
- `UnitPowerType #4`: nil
- `UnitPowerType #5`: nil
- `UnitRace #1`: string:Undead
- `UnitRace #2`: string:Scourge
- `UnitRace #3`: number:5
- `UnitReaction(u, player)`: number:5
- `UnitSex`: number:2
- `UnitThreatSituation(player, u)`: nil
- `aura HARMFUL`: nil
- `aura HELPFUL`: nil
- `aura HELPFUL.applications`: number:0
- `aura HELPFUL.auraInstanceID`: number:15
- `aura HELPFUL.dispelName`: nil
- `aura HELPFUL.duration`: number:0
- `aura HELPFUL.expirationTime`: number:0
- `aura HELPFUL.icon`: number:136124
- `aura HELPFUL.isFromPlayerOrPlayerPet`: boolean:true
- `aura HELPFUL.isStealable`: boolean:false
- `aura HELPFUL.name`: string:Blood Pact
- `aura HELPFUL.sourceUnit`: string:pet
- `aura HELPFUL.spellId`: number:6307

### 2. nameplate | npc-hostile | combat

- `C_NamePlate.GetNamePlateForUnit`: table
- `GetRaidTargetIndex`: nil
- `GetShapeshiftFormID`: nil
- `UnitAffectingCombat`: boolean:true
- `UnitCanAssist(player, u)`: boolean:false
- `UnitCanAttack(player, u)`: boolean:true
- `UnitCastingDuration`: nil
- `UnitCastingInfo`: nil
- `UnitCastingInfo #10`: string:CastBar-8813ED88DC62F3EF
- `UnitCastingInfo #11`: number:0
- `UnitCastingInfo #6`: boolean:false
- `UnitChannelInfo`: nil
- `UnitClass #1`: string:Decrepit Darkhound
- `UnitClass #2`: string:WARRIOR
- `UnitClass #3`: number:1
- `UnitClassification`: string:normal
- `UnitCreatureFamily`: nil
- `UnitCreatureType #1`: string:Demon
- `UnitCreatureType #2`: number:3
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitEffectiveLevel`: number:5
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: nil
- `UnitFactionGroup #2`: nil
- `UnitGUID`: string:Creature-0-6782-0-56535-
- `UnitGetIncomingHeals`: nil
- `UnitIsDeadOrGhost`: boolean:false
- `UnitIsEnemy(player, u)`: boolean:true
- `UnitIsFriend(player, u)`: boolean:false
- `UnitIsPVP`: boolean:false
- `UnitIsPlayer`: boolean:false
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:false
- `UnitIsUnit(u, target)`: boolean:true
- `UnitLevel`: number:5
- `UnitName #1`: string:Decrepit Darkhound
- `UnitName #2`: nil
- `UnitPower(player, Combo)`: number:0
- `UnitPower(u, Mana)`: number:0
- `UnitPowerMax(u, Mana)`: number:0
- `UnitPowerPercent(u, Mana)`: number:0
- `UnitPowerType #1`: number:1
- `UnitPowerType #2`: string:RAGE
- `UnitPowerType #3`: nil
- `UnitPowerType #4`: nil
- `UnitPowerType #5`: nil
- `UnitRace`: nil
- `UnitReaction(u, player)`: number:2
- `UnitSex`: number:1
- `UnitThreatSituation(player, u)`: number:3
- `aura HARMFUL`: error: GetAuraDataByIndex(): Auras cannot be accessed when secret while tainted by 'ForeverProbe'
Lua Taint: ForeverProbe
- `aura HELPFUL`: error: GetAuraDataByIndex(): Auras cannot be accessed when secret while tainted by 'ForeverProbe'
Lua Taint: ForeverProbe

### 3. nameplate | npc-hostile | nocombat

- `C_NamePlate.GetNamePlateForUnit`: table
- `GetRaidTargetIndex`: nil
- `GetShapeshiftFormID`: nil
- `UnitAffectingCombat`: boolean:false
- `UnitCanAssist(player, u)`: boolean:false
- `UnitCanAttack(player, u)`: boolean:true
- `UnitCastingDuration`: nil
- `UnitCastingInfo`: nil
- `UnitChannelInfo`: nil
- `UnitClass #1`: string:Decrepit Darkhound
- `UnitClass #2`: string:WARRIOR
- `UnitClass #3`: number:1
- `UnitClassification`: string:normal
- `UnitCreatureFamily`: nil
- `UnitCreatureType #1`: string:Demon
- `UnitCreatureType #2`: number:3
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitEffectiveLevel`: number:5
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: nil
- `UnitFactionGroup #2`: nil
- `UnitGUID`: string:Creature-0-6782-0-56535-
- `UnitGetIncomingHeals`: nil
- `UnitIsDeadOrGhost`: boolean:false
- `UnitIsEnemy(player, u)`: boolean:true
- `UnitIsFriend(player, u)`: boolean:false
- `UnitIsPVP`: boolean:false
- `UnitIsPlayer`: boolean:false
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:false
- `UnitIsUnit(u, target)`: boolean:true
- `UnitLevel`: number:5
- `UnitName #1`: string:Decrepit Darkhound
- `UnitName #2`: nil
- `UnitPower(player, Combo)`: number:0
- `UnitPower(u, Mana)`: number:0
- `UnitPowerMax(u, Mana)`: number:0
- `UnitPowerPercent(u, Mana)`: number:0
- `UnitPowerType #1`: number:1
- `UnitPowerType #2`: string:RAGE
- `UnitPowerType #3`: nil
- `UnitPowerType #4`: nil
- `UnitPowerType #5`: nil
- `UnitRace`: nil
- `UnitReaction(u, player)`: number:2
- `UnitSex`: number:1
- `UnitThreatSituation(player, u)`: nil
- `aura HARMFUL`: nil
- `aura HELPFUL`: nil
- `aura HELPFUL.applications`: number:0
- `aura HELPFUL.auraInstanceID`: number:1
- `aura HELPFUL.dispelName`: string:Magic
- `aura HELPFUL.duration`: number:1800
- `aura HELPFUL.expirationTime`: number:59747.26
- `aura HELPFUL.icon`: number:135843
- `aura HELPFUL.isFromPlayerOrPlayerPet`: boolean:false
- `aura HELPFUL.isStealable`: boolean:false
- `aura HELPFUL.name`: string:Frost Armor
- `aura HELPFUL.sourceUnit`: string:nameplate2
- `aura HELPFUL.spellId`: number:12544

### 4. nameplate | npc-neutral | combat

- `C_NamePlate.GetNamePlateForUnit`: table
- `GetRaidTargetIndex`: nil
- `GetShapeshiftFormID`: nil
- `UnitAffectingCombat`: boolean:true
- `UnitCanAssist(player, u)`: boolean:false
- `UnitCanAttack(player, u)`: boolean:true
- `UnitCastingDuration`: nil
- `UnitCastingInfo`: nil
- `UnitChannelInfo`: nil
- `UnitClass #1`: string:Ragged Scavenger
- `UnitClass #2`: string:WARRIOR
- `UnitClass #3`: number:1
- `UnitClassification`: string:normal
- `UnitCreatureFamily #1`: string:Wolf
- `UnitCreatureFamily #2`: number:1
- `UnitCreatureType #1`: string:Beast
- `UnitCreatureType #2`: number:1
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitEffectiveLevel`: number:2
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: nil
- `UnitFactionGroup #2`: nil
- `UnitGUID`: string:Creature-0-6782-0-56535-
- `UnitGetIncomingHeals`: nil
- `UnitIsDeadOrGhost`: boolean:false
- `UnitIsEnemy(player, u)`: boolean:false
- `UnitIsFriend(player, u)`: boolean:false
- `UnitIsPVP`: boolean:false
- `UnitIsPlayer`: boolean:false
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:false
- `UnitIsUnit(u, target)`: boolean:true
- `UnitLevel`: number:2
- `UnitName #1`: string:Ragged Scavenger
- `UnitName #2`: nil
- `UnitPower(player, Combo)`: number:0
- `UnitPower(u, Mana)`: number:0
- `UnitPowerMax(u, Mana)`: number:0
- `UnitPowerPercent(u, Mana)`: number:0
- `UnitPowerType #1`: number:1
- `UnitPowerType #2`: string:RAGE
- `UnitPowerType #3`: nil
- `UnitPowerType #4`: nil
- `UnitPowerType #5`: nil
- `UnitRace`: nil
- `UnitReaction(u, player)`: number:4
- `UnitSex`: number:1
- `UnitThreatSituation(player, u)`: number:3
- `aura HARMFUL`: error: GetAuraDataByIndex(): Auras cannot be accessed when secret while tainted by 'ForeverProbe'
Lua Taint: ForeverProbe
- `aura HELPFUL`: error: GetAuraDataByIndex(): Auras cannot be accessed when secret while tainted by 'ForeverProbe'
Lua Taint: ForeverProbe

### 5. nameplate | npc-neutral | nocombat

- `C_NamePlate.GetNamePlateForUnit`: table
- `GetRaidTargetIndex`: nil
- `GetShapeshiftFormID`: nil
- `UnitAffectingCombat`: boolean:false
- `UnitCanAssist(player, u)`: boolean:false
- `UnitCanAttack(player, u)`: boolean:true
- `UnitCastingDuration`: nil
- `UnitCastingInfo`: nil
- `UnitChannelInfo`: nil
- `UnitClass #1`: string:Ragged Scavenger
- `UnitClass #2`: string:WARRIOR
- `UnitClass #3`: number:1
- `UnitClassification`: string:normal
- `UnitCreatureFamily`: nil
- `UnitCreatureFamily #1`: string:Wolf
- `UnitCreatureFamily #2`: number:1
- `UnitCreatureType #1`: string:Beast
- `UnitCreatureType #2`: number:1
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitEffectiveLevel`: number:2
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: nil
- `UnitFactionGroup #2`: nil
- `UnitGUID`: string:Creature-0-6782-0-56535-
- `UnitGetIncomingHeals`: nil
- `UnitIsDeadOrGhost`: boolean:false
- `UnitIsEnemy(player, u)`: boolean:false
- `UnitIsFriend(player, u)`: boolean:false
- `UnitIsPVP`: boolean:false
- `UnitIsPlayer`: boolean:false
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:false
- `UnitIsUnit(u, target)`: boolean:true
- `UnitLevel`: number:2
- `UnitName #1`: string:Ragged Scavenger
- `UnitName #2`: nil
- `UnitPower(player, Combo)`: number:0
- `UnitPower(u, Mana)`: number:0
- `UnitPowerMax(u, Mana)`: number:0
- `UnitPowerPercent(u, Mana)`: number:0
- `UnitPowerType #1`: number:1
- `UnitPowerType #2`: string:RAGE
- `UnitPowerType #3`: nil
- `UnitPowerType #4`: nil
- `UnitPowerType #5`: nil
- `UnitRace`: nil
- `UnitReaction(u, player)`: number:4
- `UnitSex`: number:1
- `UnitThreatSituation(player, u)`: nil
- `aura HARMFUL`: nil
- `aura HELPFUL`: nil

### 6. pet | npc-friendly | combat

- `C_NamePlate.GetNamePlateForUnit`: nil
- `CheckInteractDistance(u, 4)`: boolean:false
- `GetRaidTargetIndex`: nil
- `GetShapeshiftFormID`: nil
- `UnitAffectingCombat`: boolean:true
- `UnitCanAssist(player, u)`: boolean:true
- `UnitCanAttack(player, u)`: boolean:false
- `UnitCastingDuration`: userdata
- `UnitCastingInfo`: nil
- `UnitCastingInfo #1`: string:Firebolt
- `UnitCastingInfo #10`: string:CastBar-D04E1E5D80E1D898
- `UnitCastingInfo #11`: number:0
- `UnitCastingInfo #2`: string:Firebolt
- `UnitCastingInfo #3`: number:135809
- `UnitCastingInfo #4`: number:61753898
- `UnitCastingInfo #5`: number:61755898
- `UnitCastingInfo #6`: boolean:false
- `UnitCastingInfo #7`: string:Cast-3-6782-0-56535-3110
- `UnitCastingInfo #8`: boolean:false
- `UnitCastingInfo #9`: number:3110
- `UnitChannelInfo`: nil
- `UnitClass #1`: string:Pagyal
- `UnitClass #2`: string:MAGE
- `UnitClass #3`: number:8
- `UnitClassification`: string:normal
- `UnitCreatureFamily #1`: string:Imp
- `UnitCreatureFamily #2`: number:23
- `UnitCreatureType #1`: string:Demon
- `UnitCreatureType #2`: number:3
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitEffectiveLevel`: number:6
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: string:Horde
- `UnitFactionGroup #2`: string:Horde
- `UnitGUID`: string:Pet-0-4615-0-68650-416-0
- `UnitHealthMax`: number:253
- `UnitIsDeadOrGhost`: boolean:false
- `UnitIsEnemy(player, u)`: boolean:false
- `UnitIsFriend(player, u)`: boolean:true
- `UnitIsPVP`: boolean:false
- `UnitIsPlayer`: boolean:false
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:false
- `UnitIsUnit(u, target)`: boolean:false
- `UnitLevel`: number:6
- `UnitName #1`: string:Pagyal
- `UnitName #2`: nil
- `UnitPower(player, Combo)`: number:0
- `UnitPowerMax`: number:85
- `UnitPowerMax(u, Mana)`: number:85
- `UnitPowerType #1`: number:0
- `UnitPowerType #2`: string:MANA
- `UnitPowerType #3`: nil
- `UnitPowerType #4`: nil
- `UnitPowerType #5`: nil
- `UnitRace`: nil
- `UnitReaction(u, player)`: number:5
- `UnitSex`: number:2
- `UnitThreatSituation(player, u)`: nil
- `aura HARMFUL`: error: GetAuraDataByIndex(): Auras cannot be accessed when secret while tainted by 'ForeverProbe'
Lua Taint: ForeverProbe
- `aura HELPFUL`: error: GetAuraDataByIndex(): Auras cannot be accessed when secret while tainted by 'ForeverProbe'
Lua Taint: ForeverProbe

### 7. pet | npc-friendly | nocombat

- `C_NamePlate.GetNamePlateForUnit`: nil
- `CheckInteractDistance(u, 4)`: boolean:true
- `GetRaidTargetIndex`: nil
- `GetShapeshiftFormID`: nil
- `UnitAffectingCombat`: boolean:false
- `UnitCanAssist(player, u)`: boolean:true
- `UnitCanAttack(player, u)`: boolean:false
- `UnitCastingDuration`: nil
- `UnitCastingInfo`: nil
- `UnitChannelInfo`: nil
- `UnitClass #1`: string:Pagyal
- `UnitClass #2`: string:MAGE
- `UnitClass #3`: number:8
- `UnitClassification`: string:normal
- `UnitCreatureFamily #1`: string:Imp
- `UnitCreatureFamily #2`: number:23
- `UnitCreatureType #1`: string:Demon
- `UnitCreatureType #2`: number:3
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitEffectiveLevel`: number:6
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: string:Horde
- `UnitFactionGroup #2`: string:Horde
- `UnitGUID`: string:Pet-0-4615-0-68650-416-0
- `UnitHealthMax`: number:253
- `UnitIsDeadOrGhost`: boolean:false
- `UnitIsEnemy(player, u)`: boolean:false
- `UnitIsFriend(player, u)`: boolean:true
- `UnitIsPVP`: boolean:false
- `UnitIsPlayer`: boolean:false
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:false
- `UnitIsUnit(u, target)`: boolean:false
- `UnitLevel`: number:6
- `UnitName #1`: string:Pagyal
- `UnitName #2`: nil
- `UnitPower(player, Combo)`: number:0
- `UnitPowerMax`: number:85
- `UnitPowerMax(u, Mana)`: number:85
- `UnitPowerType #1`: number:0
- `UnitPowerType #2`: string:MANA
- `UnitPowerType #3`: nil
- `UnitPowerType #4`: nil
- `UnitPowerType #5`: nil
- `UnitRace`: nil
- `UnitReaction(u, player)`: number:5
- `UnitSex`: number:2
- `UnitThreatSituation(player, u)`: nil
- `aura HARMFUL`: nil
- `aura HELPFUL`: nil
- `aura HELPFUL.applications`: number:0
- `aura HELPFUL.auraInstanceID`: number:13
- `aura HELPFUL.dispelName`: nil
- `aura HELPFUL.duration`: number:0
- `aura HELPFUL.expirationTime`: number:0
- `aura HELPFUL.icon`: number:136124
- `aura HELPFUL.isFromPlayerOrPlayerPet`: boolean:true
- `aura HELPFUL.isStealable`: boolean:false
- `aura HELPFUL.name`: string:Blood Pact
- `aura HELPFUL.sourceUnit`: string:pet
- `aura HELPFUL.spellId`: number:6307

### 8. player | self | combat

- `C_NamePlate.GetNamePlateForUnit`: nil
- `CheckInteractDistance(u, 4)`: boolean:false
- `GetRaidTargetIndex`: nil
- `GetShapeshiftFormID`: nil
- `UnitAffectingCombat`: boolean:true
- `UnitCanAssist(player, u)`: boolean:true
- `UnitCanAttack(player, u)`: boolean:false
- `UnitCastingDuration`: nil
- `UnitCastingInfo`: nil
- `UnitCastingInfo #1`: string:Corruption
- `UnitCastingInfo #10`: string:CastBar-ADE2A0DBFA6C6A2B
- `UnitCastingInfo #11`: number:0
- `UnitCastingInfo #2`: string:Corruption
- `UnitCastingInfo #3`: number:136118
- `UnitCastingInfo #4`: number:61741269
- `UnitCastingInfo #5`: number:61743269
- `UnitCastingInfo #6`: boolean:false
- `UnitCastingInfo #7`: string:Cast-3-6782-0-56535-172-
- `UnitCastingInfo #8`: boolean:false
- `UnitCastingInfo #9`: number:172
- `UnitChannelInfo`: nil
- `UnitClass #1`: string:Warlock
- `UnitClass #2`: string:WARLOCK
- `UnitClass #3`: number:9
- `UnitClassification`: string:normal
- `UnitCreatureFamily`: nil
- `UnitCreatureType #1`: string:Humanoid
- `UnitCreatureType #2`: number:7
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitEffectiveLevel`: number:6
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: string:Horde
- `UnitFactionGroup #2`: string:Horde
- `UnitGUID`: string:Player-4620-014D513D
- `UnitHealthMax`: number:168
- `UnitIsDeadOrGhost`: boolean:false
- `UnitIsEnemy(player, u)`: boolean:false
- `UnitIsFriend(player, u)`: boolean:true
- `UnitIsPVP`: boolean:false
- `UnitIsPlayer`: boolean:true
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:true
- `UnitIsUnit(u, target)`: boolean:false
- `UnitLevel`: number:6
- `UnitName #1`: string:Forever
- `UnitName #2`: string:Ghoulhunter
- `UnitPower(player, Combo)`: number:0
- `UnitPowerMax`: number:235
- `UnitPowerMax(u, Mana)`: number:235
- `UnitPowerType #1`: number:0
- `UnitPowerType #2`: string:MANA
- `UnitPowerType #3`: nil
- `UnitPowerType #4`: nil
- `UnitPowerType #5`: nil
- `UnitRace #1`: string:Undead
- `UnitRace #2`: string:Scourge
- `UnitRace #3`: number:5
- `UnitReaction(u, player)`: number:5
- `UnitSex`: number:2
- `UnitThreatSituation(player, u)`: nil
- `aura HARMFUL`: error: GetAuraDataByIndex(): Auras cannot be accessed when secret while tainted by 'ForeverProbe'
Lua Taint: ForeverProbe
- `aura HELPFUL`: error: GetAuraDataByIndex(): Auras cannot be accessed when secret while tainted by 'ForeverProbe'
Lua Taint: ForeverProbe

### 9. player | self | nocombat

- `C_NamePlate.GetNamePlateForUnit`: nil
- `CheckInteractDistance(u, 4)`: boolean:true
- `GetRaidTargetIndex`: nil
- `GetShapeshiftFormID`: nil
- `UnitAffectingCombat`: boolean:false
- `UnitCanAssist(player, u)`: boolean:true
- `UnitCanAttack(player, u)`: boolean:false
- `UnitCastingDuration`: nil
- `UnitCastingInfo`: nil
- `UnitCastingInfo #1`: string:Opening - No Text
- `UnitCastingInfo #10`: string:CastBar-1A31EEFBAC998193
- `UnitCastingInfo #11`: number:0
- `UnitCastingInfo #2`: string:
- `UnitCastingInfo #3`: number:136243
- `UnitCastingInfo #4`: number:61755358
- `UnitCastingInfo #5`: number:61760358
- `UnitCastingInfo #6`: boolean:false
- `UnitCastingInfo #7`: string:Cast-3-6782-0-56535-2281
- `UnitCastingInfo #8`: boolean:false
- `UnitCastingInfo #9`: number:22810
- `UnitChannelInfo`: nil
- `UnitClass #1`: string:Warlock
- `UnitClass #2`: string:WARLOCK
- `UnitClass #3`: number:9
- `UnitClassification`: string:normal
- `UnitCreatureFamily`: nil
- `UnitCreatureType #1`: string:Humanoid
- `UnitCreatureType #2`: number:7
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitEffectiveLevel`: number:6
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: string:Horde
- `UnitFactionGroup #2`: string:Horde
- `UnitGUID`: string:Player-4620-014D513D
- `UnitHealthMax`: number:168
- `UnitIsDeadOrGhost`: boolean:false
- `UnitIsEnemy(player, u)`: boolean:false
- `UnitIsFriend(player, u)`: boolean:true
- `UnitIsPVP`: boolean:false
- `UnitIsPlayer`: boolean:true
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:true
- `UnitIsUnit(u, target)`: boolean:false
- `UnitLevel`: number:6
- `UnitName #1`: string:Forever
- `UnitName #2`: string:Ghoulhunter
- `UnitPower(player, Combo)`: number:0
- `UnitPowerMax`: number:235
- `UnitPowerMax(u, Mana)`: number:235
- `UnitPowerType #1`: number:0
- `UnitPowerType #2`: string:MANA
- `UnitPowerType #3`: nil
- `UnitPowerType #4`: nil
- `UnitPowerType #5`: nil
- `UnitRace #1`: string:Undead
- `UnitRace #2`: string:Scourge
- `UnitRace #3`: number:5
- `UnitReaction(u, player)`: number:5
- `UnitSex`: number:2
- `UnitThreatSituation(player, u)`: nil
- `aura HARMFUL`: nil
- `aura HARMFUL.applications`: number:0
- `aura HARMFUL.auraInstanceID`: number:21
- `aura HARMFUL.dispelName`: string:Magic
- `aura HARMFUL.duration`: number:5
- `aura HARMFUL.expirationTime`: number:58251.011
- `aura HARMFUL.icon`: number:135843
- `aura HARMFUL.isFromPlayerOrPlayerPet`: boolean:false
- `aura HARMFUL.isStealable`: boolean:false
- `aura HARMFUL.name`: string:Chilled
- `aura HARMFUL.sourceUnit`: nil
- `aura HARMFUL.spellId`: number:6136
- `aura HELPFUL`: nil
- `aura HELPFUL.applications`: number:0
- `aura HELPFUL.auraInstanceID`: number:15
- `aura HELPFUL.dispelName`: nil
- `aura HELPFUL.duration`: number:0
- `aura HELPFUL.expirationTime`: number:0
- `aura HELPFUL.icon`: number:136124
- `aura HELPFUL.isFromPlayerOrPlayerPet`: boolean:true
- `aura HELPFUL.isStealable`: boolean:false
- `aura HELPFUL.name`: string:Blood Pact
- `aura HELPFUL.sourceUnit`: string:pet
- `aura HELPFUL.spellId`: number:6307

### 10. target | npc-friendly | combat

- `C_NamePlate.GetNamePlateForUnit`: nil
- `GetRaidTargetIndex`: nil
- `GetShapeshiftFormID`: nil
- `UnitAffectingCombat`: boolean:false
- `UnitCanAssist(player, u)`: boolean:false
- `UnitCanAttack(player, u)`: boolean:false
- `UnitCastingDuration`: nil
- `UnitCastingInfo`: nil
- `UnitChannelInfo`: nil
- `UnitClass #1`: string:Captured Leper Gnome
- `UnitClass #2`: string:WARRIOR
- `UnitClass #3`: number:1
- `UnitClassification`: string:normal
- `UnitCreatureFamily`: nil
- `UnitCreatureType #1`: string:Humanoid
- `UnitCreatureType #2`: number:7
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitEffectiveLevel`: number:8
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: nil
- `UnitFactionGroup #2`: nil
- `UnitGUID`: string:Creature-0-4621-0-48016-
- `UnitIsDeadOrGhost`: boolean:false
- `UnitIsEnemy(player, u)`: boolean:false
- `UnitIsFriend(player, u)`: boolean:true
- `UnitIsPVP`: boolean:false
- `UnitIsPlayer`: boolean:false
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:false
- `UnitIsUnit(u, target)`: boolean:true
- `UnitLevel`: number:8
- `UnitName #1`: string:Captured Leper Gnome
- `UnitName #2`: nil
- `UnitPower(player, Combo)`: number:0
- `UnitPower(u, Mana)`: number:0
- `UnitPowerMax(u, Mana)`: number:0
- `UnitPowerPercent(u, Mana)`: number:0
- `UnitPowerType #1`: number:1
- `UnitPowerType #2`: string:RAGE
- `UnitPowerType #3`: nil
- `UnitPowerType #4`: nil
- `UnitPowerType #5`: nil
- `UnitRace`: nil
- `UnitReaction(u, player)`: number:5
- `UnitSex`: number:2
- `UnitThreatSituation(player, u)`: nil
- `aura HARMFUL`: error: GetAuraDataByIndex(): Auras cannot be accessed when secret while tainted by 'ForeverProbe'
Lua Taint: ForeverProbe
- `aura HELPFUL`: error: GetAuraDataByIndex(): Auras cannot be accessed when secret while tainted by 'ForeverProbe'
Lua Taint: ForeverProbe

### 11. target | npc-friendly | nocombat

- `C_NamePlate.GetNamePlateForUnit`: nil
- `GetRaidTargetIndex`: nil
- `GetShapeshiftFormID`: nil
- `UnitAffectingCombat`: boolean:false
- `UnitCanAssist(player, u)`: boolean:true
- `UnitCanAttack(player, u)`: boolean:false
- `UnitCastingDuration`: nil
- `UnitCastingInfo`: nil
- `UnitChannelInfo`: nil
- `UnitClass #1`: string:Junior Apothecary Hollan
- `UnitClass #2`: string:WARRIOR
- `UnitClass #3`: number:1
- `UnitClassification`: string:normal
- `UnitCreatureFamily`: nil
- `UnitCreatureType #1`: string:Humanoid
- `UnitCreatureType #2`: number:7
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitEffectiveLevel`: number:20
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: string:Horde
- `UnitFactionGroup #2`: string:Horde
- `UnitGUID`: string:Creature-0-6782-0-56535-
- `UnitIsDeadOrGhost`: boolean:false
- `UnitIsEnemy(player, u)`: boolean:false
- `UnitIsFriend(player, u)`: boolean:true
- `UnitIsPVP`: boolean:true
- `UnitIsPlayer`: boolean:false
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:false
- `UnitIsUnit(u, target)`: boolean:true
- `UnitLevel`: number:20
- `UnitName #1`: string:Junior Apothecary Hollan
- `UnitName #2`: nil
- `UnitPower(player, Combo)`: number:0
- `UnitPower(u, Mana)`: number:0
- `UnitPowerMax(u, Mana)`: number:0
- `UnitPowerPercent(u, Mana)`: number:0
- `UnitPowerType #1`: number:1
- `UnitPowerType #2`: string:RAGE
- `UnitPowerType #3`: nil
- `UnitPowerType #4`: nil
- `UnitPowerType #5`: nil
- `UnitRace`: nil
- `UnitReaction(u, player)`: number:5
- `UnitSex`: number:2
- `UnitThreatSituation(player, u)`: nil
- `aura HARMFUL`: nil
- `aura HELPFUL`: nil
- `aura HELPFUL.applications`: number:0
- `aura HELPFUL.auraInstanceID`: number:1
- `aura HELPFUL.dispelName`: string:Magic
- `aura HELPFUL.duration`: number:3600
- `aura HELPFUL.expirationTime`: number:64607.846
- `aura HELPFUL.icon`: number:135906
- `aura HELPFUL.isFromPlayerOrPlayerPet`: boolean:true
- `aura HELPFUL.isStealable`: boolean:false
- `aura HELPFUL.name`: string:Blessing of Might
- `aura HELPFUL.sourceUnit`: nil
- `aura HELPFUL.spellId`: number:19740

### 12. target | npc-hostile | combat

- `C_NamePlate.GetNamePlateForUnit`: table
- `GetRaidTargetIndex`: nil
- `GetShapeshiftFormID`: nil
- `UnitAffectingCombat`: boolean:true
- `UnitCanAssist(player, u)`: boolean:false
- `UnitCanAttack(player, u)`: boolean:true
- `UnitCastingDuration`: nil
- `UnitCastingInfo`: nil
- `UnitCastingInfo #10`: string:CastBar-A0B3AAA36905874E
- `UnitCastingInfo #11`: number:0
- `UnitCastingInfo #6`: boolean:false
- `UnitChannelInfo`: nil
- `UnitClass #1`: string:Decrepit Darkhound
- `UnitClass #2`: string:WARRIOR
- `UnitClass #3`: number:1
- `UnitClassification`: string:normal
- `UnitCreatureFamily`: nil
- `UnitCreatureType #1`: string:Demon
- `UnitCreatureType #2`: number:3
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitDetailedThreatSituation(player, u) #1`: boolean:true
- `UnitDetailedThreatSituation(player, u) #2`: number:3
- `UnitDetailedThreatSituation(player, u) #3`: number:100
- `UnitDetailedThreatSituation(player, u) #4`: number:0
- `UnitDetailedThreatSituation(player, u) #5`: number:49
- `UnitEffectiveLevel`: number:5
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: nil
- `UnitFactionGroup #2`: nil
- `UnitGUID`: string:Creature-0-6782-0-56535-
- `UnitGetIncomingHeals`: nil
- `UnitIsDeadOrGhost`: boolean:false
- `UnitIsEnemy(player, u)`: boolean:true
- `UnitIsFriend(player, u)`: boolean:false
- `UnitIsPVP`: boolean:false
- `UnitIsPlayer`: boolean:false
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:false
- `UnitIsUnit(u, target)`: boolean:true
- `UnitLevel`: number:5
- `UnitName #1`: string:Decrepit Darkhound
- `UnitName #2`: nil
- `UnitPower(player, Combo)`: number:0
- `UnitPower(u, Mana)`: number:0
- `UnitPowerMax(u, Mana)`: number:0
- `UnitPowerPercent(u, Mana)`: number:0
- `UnitPowerType #1`: number:1
- `UnitPowerType #2`: string:RAGE
- `UnitPowerType #3`: nil
- `UnitPowerType #4`: nil
- `UnitPowerType #5`: nil
- `UnitRace`: nil
- `UnitReaction(u, player)`: number:2
- `UnitSex`: number:1
- `UnitThreatSituation(player, u)`: number:3
- `aura HARMFUL`: error: GetAuraDataByIndex(): Auras cannot be accessed when secret while tainted by 'ForeverProbe'
Lua Taint: ForeverProbe
- `aura HELPFUL`: error: GetAuraDataByIndex(): Auras cannot be accessed when secret while tainted by 'ForeverProbe'
Lua Taint: ForeverProbe

### 13. target | npc-hostile | nocombat

- `C_NamePlate.GetNamePlateForUnit`: nil
- `GetRaidTargetIndex`: nil
- `GetShapeshiftFormID`: nil
- `UnitAffectingCombat`: boolean:false
- `UnitCanAssist(player, u)`: boolean:false
- `UnitCanAttack(player, u)`: boolean:true
- `UnitCastingDuration`: nil
- `UnitCastingInfo`: nil
- `UnitChannelInfo`: nil
- `UnitClass #1`: string:Decrepit Darkhound
- `UnitClass #2`: string:WARRIOR
- `UnitClass #3`: number:1
- `UnitClassification`: string:normal
- `UnitCreatureFamily`: nil
- `UnitCreatureType #1`: string:Demon
- `UnitCreatureType #2`: number:3
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitEffectiveLevel`: number:5
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: nil
- `UnitFactionGroup #2`: nil
- `UnitGUID`: string:Creature-0-6782-0-56535-
- `UnitGetIncomingHeals`: nil
- `UnitIsDeadOrGhost`: boolean:true
- `UnitIsEnemy(player, u)`: boolean:true
- `UnitIsFriend(player, u)`: boolean:false
- `UnitIsPVP`: boolean:false
- `UnitIsPlayer`: boolean:false
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:false
- `UnitIsUnit(u, target)`: boolean:true
- `UnitLevel`: number:5
- `UnitName #1`: string:Decrepit Darkhound
- `UnitName #2`: nil
- `UnitPower(player, Combo)`: number:0
- `UnitPower(u, Mana)`: number:0
- `UnitPowerMax(u, Mana)`: number:0
- `UnitPowerPercent(u, Mana)`: number:0
- `UnitPowerType #1`: number:1
- `UnitPowerType #2`: string:RAGE
- `UnitPowerType #3`: nil
- `UnitPowerType #4`: nil
- `UnitPowerType #5`: nil
- `UnitRace`: nil
- `UnitReaction(u, player)`: number:2
- `UnitSex`: number:1
- `UnitThreatSituation(player, u)`: nil
- `aura HARMFUL`: nil
- `aura HELPFUL`: nil
- `aura HELPFUL.applications`: number:0
- `aura HELPFUL.auraInstanceID`: number:1
- `aura HELPFUL.dispelName`: string:Magic
- `aura HELPFUL.duration`: number:1800
- `aura HELPFUL.expirationTime`: number:59747.26
- `aura HELPFUL.icon`: number:135843
- `aura HELPFUL.isFromPlayerOrPlayerPet`: boolean:false
- `aura HELPFUL.isStealable`: boolean:false
- `aura HELPFUL.name`: string:Frost Armor
- `aura HELPFUL.sourceUnit`: string:nameplate2
- `aura HELPFUL.spellId`: number:12544

### 14. target | npc-neutral | combat

- `C_NamePlate.GetNamePlateForUnit`: table
- `CheckInteractDistance(u, 4)`: boolean:true
- `GetRaidTargetIndex`: nil
- `GetShapeshiftFormID`: nil
- `UnitAffectingCombat`: boolean:true
- `UnitCanAssist(player, u)`: boolean:false
- `UnitCanAttack(player, u)`: boolean:true
- `UnitCastingDuration`: nil
- `UnitCastingInfo`: nil
- `UnitChannelInfo`: nil
- `UnitClass #1`: string:Ragged Scavenger
- `UnitClass #2`: string:WARRIOR
- `UnitClass #3`: number:1
- `UnitClassification`: string:normal
- `UnitCreatureFamily #1`: string:Wolf
- `UnitCreatureFamily #2`: number:1
- `UnitCreatureType #1`: string:Beast
- `UnitCreatureType #2`: number:1
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitDetailedThreatSituation(player, u) #1`: boolean:true
- `UnitDetailedThreatSituation(player, u) #2`: number:3
- `UnitDetailedThreatSituation(player, u) #3`: number:100
- `UnitDetailedThreatSituation(player, u) #4`: number:255
- `UnitDetailedThreatSituation(player, u) #5`: number:11
- `UnitEffectiveLevel`: number:2
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: nil
- `UnitFactionGroup #2`: nil
- `UnitGUID`: string:Creature-0-6782-0-56535-
- `UnitGetIncomingHeals`: nil
- `UnitIsDeadOrGhost`: boolean:false
- `UnitIsEnemy(player, u)`: boolean:false
- `UnitIsFriend(player, u)`: boolean:false
- `UnitIsPVP`: boolean:false
- `UnitIsPlayer`: boolean:false
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:false
- `UnitIsUnit(u, target)`: boolean:true
- `UnitLevel`: number:2
- `UnitName #1`: string:Ragged Scavenger
- `UnitName #2`: nil
- `UnitPower(player, Combo)`: number:0
- `UnitPower(u, Mana)`: number:0
- `UnitPowerMax(u, Mana)`: number:0
- `UnitPowerPercent(u, Mana)`: number:0
- `UnitPowerType #1`: number:1
- `UnitPowerType #2`: string:RAGE
- `UnitPowerType #3`: nil
- `UnitPowerType #4`: nil
- `UnitPowerType #5`: nil
- `UnitRace`: nil
- `UnitReaction(u, player)`: number:4
- `UnitSex`: number:1
- `UnitThreatSituation(player, u)`: number:3
- `aura HARMFUL`: error: GetAuraDataByIndex(): Auras cannot be accessed when secret while tainted by 'ForeverProbe'
Lua Taint: ForeverProbe
- `aura HELPFUL`: error: GetAuraDataByIndex(): Auras cannot be accessed when secret while tainted by 'ForeverProbe'
Lua Taint: ForeverProbe

### 15. target | npc-neutral | nocombat

- `C_NamePlate.GetNamePlateForUnit`: nil
- `CheckInteractDistance(u, 4)`: boolean:true
- `GetRaidTargetIndex`: nil
- `GetShapeshiftFormID`: nil
- `UnitAffectingCombat`: boolean:false
- `UnitCanAssist(player, u)`: boolean:false
- `UnitCanAttack(player, u)`: boolean:true
- `UnitCastingDuration`: nil
- `UnitCastingInfo`: nil
- `UnitChannelInfo`: nil
- `UnitClass #1`: string:Ragged Scavenger
- `UnitClass #2`: string:WARRIOR
- `UnitClass #3`: number:1
- `UnitClassification`: string:normal
- `UnitCreatureFamily`: nil
- `UnitCreatureFamily #1`: string:Wolf
- `UnitCreatureFamily #2`: number:1
- `UnitCreatureType #1`: string:Beast
- `UnitCreatureType #2`: number:1
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitEffectiveLevel`: number:2
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: nil
- `UnitFactionGroup #2`: nil
- `UnitGUID`: string:Creature-0-6782-0-56535-
- `UnitGetIncomingHeals`: nil
- `UnitIsDeadOrGhost`: boolean:true
- `UnitIsEnemy(player, u)`: boolean:false
- `UnitIsFriend(player, u)`: boolean:false
- `UnitIsPVP`: boolean:false
- `UnitIsPlayer`: boolean:false
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:false
- `UnitIsUnit(u, target)`: boolean:true
- `UnitLevel`: number:2
- `UnitName #1`: string:Ragged Scavenger
- `UnitName #2`: nil
- `UnitPower(player, Combo)`: number:0
- `UnitPower(u, Mana)`: number:0
- `UnitPowerMax(u, Mana)`: number:0
- `UnitPowerPercent(u, Mana)`: number:0
- `UnitPowerType #1`: number:1
- `UnitPowerType #2`: string:RAGE
- `UnitPowerType #3`: nil
- `UnitPowerType #4`: nil
- `UnitPowerType #5`: nil
- `UnitRace`: nil
- `UnitReaction(u, player)`: number:4
- `UnitSex`: number:1
- `UnitThreatSituation(player, u)`: nil
- `aura HARMFUL`: nil
- `aura HELPFUL`: nil

### 16. target | pc-friendly | nocombat

- `C_NamePlate.GetNamePlateForUnit`: nil
- `GetRaidTargetIndex`: nil
- `GetShapeshiftFormID`: number:17
- `UnitAffectingCombat`: boolean:false
- `UnitCanAssist(player, u)`: boolean:true
- `UnitCanAttack(player, u)`: boolean:false
- `UnitCastingDuration`: nil
- `UnitCastingInfo`: nil
- `UnitChannelInfo`: nil
- `UnitClass #1`: string:Shaman
- `UnitClass #2`: string:SHAMAN
- `UnitClass #3`: number:7
- `UnitClassification`: string:normal
- `UnitCreatureFamily`: nil
- `UnitCreatureType #1`: string:Humanoid
- `UnitCreatureType #2`: number:7
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitEffectiveLevel`: number:6
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: string:Horde
- `UnitFactionGroup #2`: string:Horde
- `UnitGUID`: string:Player-4620-01673EDA
- `UnitIsDeadOrGhost`: boolean:false
- `UnitIsEnemy(player, u)`: boolean:false
- `UnitIsFriend(player, u)`: boolean:true
- `UnitIsPVP`: boolean:false
- `UnitIsPlayer`: boolean:true
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:false
- `UnitIsUnit(u, target)`: boolean:true
- `UnitLevel`: number:6
- `UnitName #1`: string:Bebo
- `UnitName #2`: string:Evasan
- `UnitPower(player, Combo)`: number:0
- `UnitPowerType #1`: number:0
- `UnitPowerType #2`: string:MANA
- `UnitPowerType #3`: nil
- `UnitPowerType #4`: nil
- `UnitPowerType #5`: nil
- `UnitRace #1`: string:Orc
- `UnitRace #2`: string:Orc
- `UnitRace #3`: number:2
- `UnitReaction(u, player)`: number:5
- `UnitSex`: number:2
- `UnitThreatSituation(player, u)`: nil
- `aura HARMFUL`: nil
- `aura HELPFUL`: nil
- `aura HELPFUL.applications`: number:0
- `aura HELPFUL.auraInstanceID`: number:7
- `aura HELPFUL.dispelName`: string:Magic
- `aura HELPFUL.duration`: number:3600
- `aura HELPFUL.expirationTime`: number:52471.337
- `aura HELPFUL.icon`: number:135987
- `aura HELPFUL.isFromPlayerOrPlayerPet`: boolean:true
- `aura HELPFUL.isStealable`: boolean:false
- `aura HELPFUL.name`: string:Power Word: Fortitude
- `aura HELPFUL.sourceUnit`: nil
- `aura HELPFUL.spellId`: number:1243

### 17. target | self | nocombat

- `C_NamePlate.GetNamePlateForUnit`: nil
- `GetRaidTargetIndex`: nil
- `GetShapeshiftFormID`: nil
- `UnitAffectingCombat`: boolean:false
- `UnitCanAssist(player, u)`: boolean:true
- `UnitCanAttack(player, u)`: boolean:false
- `UnitCastingDuration`: nil
- `UnitCastingInfo`: nil
- `UnitChannelInfo`: nil
- `UnitClass #1`: string:Warlock
- `UnitClass #2`: string:WARLOCK
- `UnitClass #3`: number:9
- `UnitClassification`: string:normal
- `UnitCreatureFamily`: nil
- `UnitCreatureType #1`: string:Humanoid
- `UnitCreatureType #2`: number:7
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitEffectiveLevel`: number:6
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: string:Horde
- `UnitFactionGroup #2`: string:Horde
- `UnitGUID`: string:Player-4620-014D513D
- `UnitHealthMax`: number:168
- `UnitIsDeadOrGhost`: boolean:false
- `UnitIsEnemy(player, u)`: boolean:false
- `UnitIsFriend(player, u)`: boolean:true
- `UnitIsPVP`: boolean:false
- `UnitIsPlayer`: boolean:true
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:true
- `UnitIsUnit(u, target)`: boolean:true
- `UnitLevel`: number:6
- `UnitName #1`: string:Forever
- `UnitName #2`: string:Ghoulhunter
- `UnitPower(player, Combo)`: number:0
- `UnitPowerMax`: number:235
- `UnitPowerMax(u, Mana)`: number:235
- `UnitPowerType #1`: number:0
- `UnitPowerType #2`: string:MANA
- `UnitPowerType #3`: nil
- `UnitPowerType #4`: nil
- `UnitPowerType #5`: nil
- `UnitRace #1`: string:Undead
- `UnitRace #2`: string:Scourge
- `UnitRace #3`: number:5
- `UnitReaction(u, player)`: number:5
- `UnitSex`: number:2
- `UnitThreatSituation(player, u)`: nil
- `aura HARMFUL`: nil
- `aura HELPFUL`: nil
- `aura HELPFUL.applications`: number:0
- `aura HELPFUL.auraInstanceID`: number:15
- `aura HELPFUL.dispelName`: nil
- `aura HELPFUL.duration`: number:0
- `aura HELPFUL.expirationTime`: number:0
- `aura HELPFUL.icon`: number:136124
- `aura HELPFUL.isFromPlayerOrPlayerPet`: boolean:true
- `aura HELPFUL.isStealable`: boolean:false
- `aura HELPFUL.name`: string:Blood Pact
- `aura HELPFUL.sourceUnit`: string:pet
- `aura HELPFUL.spellId`: number:6307

### 18. targettarget | npc-friendly | combat

- `C_NamePlate.GetNamePlateForUnit`: error: Interface/AddOns/ForeverProbe/ForeverProbe.lua:171: bad argument #1 to 'GetNamePlateForUnit' (Target-of-target unit tokens are not allowed for this call. - Usage: local nameplate = C_NamePlate.GetNamePlateForUnit(unitToken [, includeForbidden]))
- `GetRaidTargetIndex`: nil
- `GetShapeshiftFormID`: nil
- `UnitAffectingCombat`: boolean:true
- `UnitCanAssist(player, u)`: boolean:true
- `UnitCanAttack(player, u)`: boolean:false
- `UnitCastingDuration`: userdata
- `UnitCastingInfo`: nil
- `UnitCastingInfo #1`: string:Firebolt
- `UnitCastingInfo #10`: string:CastBar-E4B2F7BF6C674E7D
- `UnitCastingInfo #11`: number:0
- `UnitCastingInfo #2`: string:Firebolt
- `UnitCastingInfo #3`: number:135809
- `UnitCastingInfo #4`: number:61569118
- `UnitCastingInfo #5`: number:61571118
- `UnitCastingInfo #6`: boolean:false
- `UnitCastingInfo #7`: string:Cast-3-6782-0-56535-3110
- `UnitCastingInfo #8`: boolean:false
- `UnitCastingInfo #9`: number:3110
- `UnitChannelInfo`: nil
- `UnitClass #1`: string:Pagyal
- `UnitClass #2`: string:MAGE
- `UnitClass #3`: number:8
- `UnitClassification`: string:normal
- `UnitCreatureFamily #1`: string:Imp
- `UnitCreatureFamily #2`: number:23
- `UnitCreatureType #1`: string:Demon
- `UnitCreatureType #2`: number:3
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitEffectiveLevel`: number:6
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: string:Horde
- `UnitFactionGroup #2`: string:Horde
- `UnitGUID`: string:Pet-0-4615-0-68650-416-0
- `UnitHealthMax`: number:253
- `UnitIsDeadOrGhost`: boolean:false
- `UnitIsEnemy(player, u)`: boolean:false
- `UnitIsFriend(player, u)`: boolean:true
- `UnitIsPVP`: boolean:false
- `UnitIsPlayer`: boolean:false
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:false
- `UnitIsUnit(u, target)`: boolean:false
- `UnitLevel`: number:6
- `UnitName #1`: string:Pagyal
- `UnitName #2`: nil
- `UnitPower(player, Combo)`: number:0
- `UnitPowerMax`: number:85
- `UnitPowerMax(u, Mana)`: number:85
- `UnitPowerType #1`: number:0
- `UnitPowerType #2`: string:MANA
- `UnitPowerType #3`: nil
- `UnitPowerType #4`: nil
- `UnitPowerType #5`: nil
- `UnitRace`: nil
- `UnitReaction(u, player)`: number:5
- `UnitSex`: number:2
- `UnitThreatSituation(player, u)`: nil
- `aura HARMFUL`: error: GetAuraDataByIndex(): Auras cannot be accessed when secret while tainted by 'ForeverProbe'
Lua Taint: ForeverProbe
- `aura HELPFUL`: error: GetAuraDataByIndex(): Auras cannot be accessed when secret while tainted by 'ForeverProbe'
Lua Taint: ForeverProbe

### 19. targettarget | npc-friendly | nocombat

- `C_NamePlate.GetNamePlateForUnit`: error: Interface/AddOns/ForeverProbe/ForeverProbe.lua:171: bad argument #1 to 'GetNamePlateForUnit' (Target-of-target unit tokens are not allowed for this call. - Usage: local nameplate = C_NamePlate.GetNamePlateForUnit(unitToken [, includeForbidden]))
- `GetRaidTargetIndex`: nil
- `GetShapeshiftFormID`: number:17
- `UnitAffectingCombat`: boolean:false
- `UnitCanAssist(player, u)`: boolean:false
- `UnitCanAttack(player, u)`: boolean:false
- `UnitCastingDuration`: nil
- `UnitCastingInfo`: nil
- `UnitChannelInfo`: nil
- `UnitClass #1`: string:Duokna
- `UnitClass #2`: string:WARRIOR
- `UnitClass #3`: number:1
- `UnitClassification`: string:normal
- `UnitCreatureFamily`: nil
- `UnitCreatureType #1`: string:Humanoid
- `UnitCreatureType #2`: number:7
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitEffectiveLevel`: number:10
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: string:Horde
- `UnitFactionGroup #2`: string:Horde
- `UnitGUID`: string:Creature-0-4621-1-53156-
- `UnitIsDeadOrGhost`: boolean:false
- `UnitIsEnemy(player, u)`: boolean:false
- `UnitIsFriend(player, u)`: boolean:true
- `UnitIsPVP`: boolean:false
- `UnitIsPlayer`: boolean:false
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:false
- `UnitIsUnit(u, target)`: boolean:false
- `UnitLevel`: number:10
- `UnitName #1`: string:Duokna
- `UnitName #2`: nil
- `UnitPower(player, Combo)`: number:0
- `UnitPower(u, Mana)`: number:0
- `UnitPowerMax(u, Mana)`: number:0
- `UnitPowerPercent(u, Mana)`: number:0
- `UnitPowerType #1`: number:1
- `UnitPowerType #2`: string:RAGE
- `UnitPowerType #3`: nil
- `UnitPowerType #4`: nil
- `UnitPowerType #5`: nil
- `UnitRace`: nil
- `UnitReaction(u, player)`: number:5
- `UnitSex`: number:3
- `UnitThreatSituation(player, u)`: nil
- `aura HARMFUL`: nil
- `aura HELPFUL`: nil

### 20. targettarget | self | combat

- `C_NamePlate.GetNamePlateForUnit`: error: Interface/AddOns/ForeverProbe/ForeverProbe.lua:171: bad argument #1 to 'GetNamePlateForUnit' (Target-of-target unit tokens are not allowed for this call. - Usage: local nameplate = C_NamePlate.GetNamePlateForUnit(unitToken [, includeForbidden]))
- `CheckInteractDistance(u, 4)`: boolean:false
- `GetRaidTargetIndex`: nil
- `GetShapeshiftFormID`: nil
- `UnitAffectingCombat`: boolean:true
- `UnitCanAssist(player, u)`: boolean:true
- `UnitCanAttack(player, u)`: boolean:false
- `UnitCastingDuration`: nil
- `UnitCastingInfo`: nil
- `UnitCastingInfo #1`: string:Shadow Bolt
- `UnitCastingInfo #10`: string:CastBar-910A45A23318044F
- `UnitCastingInfo #11`: number:0
- `UnitCastingInfo #2`: string:Shadow Bolt
- `UnitCastingInfo #3`: number:136197
- `UnitCastingInfo #4`: number:61510920
- `UnitCastingInfo #5`: number:61512620
- `UnitCastingInfo #6`: boolean:false
- `UnitCastingInfo #7`: string:Cast-3-6782-0-56535-686-
- `UnitCastingInfo #8`: boolean:false
- `UnitCastingInfo #9`: number:686
- `UnitChannelInfo`: nil
- `UnitClass #1`: string:Warlock
- `UnitClass #2`: string:WARLOCK
- `UnitClass #3`: number:9
- `UnitClassification`: string:normal
- `UnitCreatureFamily`: nil
- `UnitCreatureType #1`: string:Humanoid
- `UnitCreatureType #2`: number:7
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitEffectiveLevel`: number:6
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: string:Horde
- `UnitFactionGroup #2`: string:Horde
- `UnitGUID`: string:Player-4620-014D513D
- `UnitHealthMax`: number:168
- `UnitIsDeadOrGhost`: boolean:false
- `UnitIsEnemy(player, u)`: boolean:false
- `UnitIsFriend(player, u)`: boolean:true
- `UnitIsPVP`: boolean:false
- `UnitIsPlayer`: boolean:true
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:true
- `UnitIsUnit(u, target)`: boolean:false
- `UnitLevel`: number:6
- `UnitName #1`: string:Forever
- `UnitName #2`: string:Ghoulhunter
- `UnitPower(player, Combo)`: number:0
- `UnitPowerMax`: number:235
- `UnitPowerMax(u, Mana)`: number:235
- `UnitPowerType #1`: number:0
- `UnitPowerType #2`: string:MANA
- `UnitPowerType #3`: nil
- `UnitPowerType #4`: nil
- `UnitPowerType #5`: nil
- `UnitRace #1`: string:Undead
- `UnitRace #2`: string:Scourge
- `UnitRace #3`: number:5
- `UnitReaction(u, player)`: number:5
- `UnitSex`: number:2
- `UnitThreatSituation(player, u)`: nil
- `aura HARMFUL`: error: GetAuraDataByIndex(): Auras cannot be accessed when secret while tainted by 'ForeverProbe'
Lua Taint: ForeverProbe
- `aura HELPFUL`: error: GetAuraDataByIndex(): Auras cannot be accessed when secret while tainted by 'ForeverProbe'
Lua Taint: ForeverProbe

### 21. targettarget | self | nocombat

- `C_NamePlate.GetNamePlateForUnit`: error: Interface/AddOns/ForeverProbe/ForeverProbe.lua:171: bad argument #1 to 'GetNamePlateForUnit' (Target-of-target unit tokens are not allowed for this call. - Usage: local nameplate = C_NamePlate.GetNamePlateForUnit(unitToken [, includeForbidden]))
- `GetRaidTargetIndex`: nil
- `GetShapeshiftFormID`: nil
- `UnitAffectingCombat`: boolean:false
- `UnitCanAssist(player, u)`: boolean:true
- `UnitCanAttack(player, u)`: boolean:false
- `UnitCastingDuration`: nil
- `UnitCastingInfo`: nil
- `UnitChannelInfo`: nil
- `UnitClass #1`: string:Warlock
- `UnitClass #2`: string:WARLOCK
- `UnitClass #3`: number:9
- `UnitClassification`: string:normal
- `UnitCreatureFamily`: nil
- `UnitCreatureType #1`: string:Humanoid
- `UnitCreatureType #2`: number:7
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitEffectiveLevel`: number:6
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: string:Horde
- `UnitFactionGroup #2`: string:Horde
- `UnitGUID`: string:Player-4620-014D513D
- `UnitHealthMax`: number:168
- `UnitIsDeadOrGhost`: boolean:false
- `UnitIsEnemy(player, u)`: boolean:false
- `UnitIsFriend(player, u)`: boolean:true
- `UnitIsPVP`: boolean:false
- `UnitIsPlayer`: boolean:true
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:true
- `UnitIsUnit(u, target)`: boolean:true
- `UnitLevel`: number:6
- `UnitName #1`: string:Forever
- `UnitName #2`: string:Ghoulhunter
- `UnitPower(player, Combo)`: number:0
- `UnitPowerMax`: number:235
- `UnitPowerMax(u, Mana)`: number:235
- `UnitPowerType #1`: number:0
- `UnitPowerType #2`: string:MANA
- `UnitPowerType #3`: nil
- `UnitPowerType #4`: nil
- `UnitPowerType #5`: nil
- `UnitRace #1`: string:Undead
- `UnitRace #2`: string:Scourge
- `UnitRace #3`: number:5
- `UnitReaction(u, player)`: number:5
- `UnitSex`: number:2
- `UnitThreatSituation(player, u)`: nil
- `aura HARMFUL`: nil
- `aura HELPFUL`: nil
- `aura HELPFUL.applications`: number:0
- `aura HELPFUL.auraInstanceID`: number:15
- `aura HELPFUL.dispelName`: nil
- `aura HELPFUL.duration`: number:0
- `aura HELPFUL.expirationTime`: number:0
- `aura HELPFUL.icon`: number:136124
- `aura HELPFUL.isFromPlayerOrPlayerPet`: boolean:true
- `aura HELPFUL.isStealable`: boolean:false
- `aura HELPFUL.name`: string:Blood Pact
- `aura HELPFUL.sourceUnit`: string:pet
- `aura HELPFUL.spellId`: number:6307
