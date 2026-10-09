# Unit values, build 1.60.1.70291

Client 1.60.1 (build 70291, Oct  7 2026), Interface 16001.

**S** secret every time, ok never secret, **S**/ok both seen, err the call failed (missing API or bad arguments). A blank cell was not returned there.

## Unit kinds

| # | Unit | Relation | State | Samples | Mobs seen |
|---|---|---|---|---|---|
| 1 | pet | npc-friendly | combat | 42 | Yazrot, Pagyal |
| 2 | pet | npc-friendly | nocombat | 51 | Yazrot, Pagyal |
| 3 | player | self | combat | 42 |  |
| 4 | player | self | nocombat | 51 |  |
| 5 | target | npc-friendly | combat | 2 | Captured Leper Gnome |
| 6 | target | npc-friendly | nocombat | 6 | Captured Leper Gnome, Pilot Bellowfiz, Pilot Stonegear, Beldin Steelgrill, Loslor Rudge, Father Gavin |
| 7 | target | npc-hostile | combat | 8 | Minor Ice Elemental, Scarlet Convert, Scarlet Initiate |
| 8 | target | npc-hostile | nocombat | 7 | Scarlet Convert, Scarlet Initiate |
| 9 | target | npc-neutral | combat | 19 | Large Crag Boar, Elder Crag Boar |
| 10 | target | npc-neutral | nocombat | 13 | Large Crag Boar, Elder Crag Boar |
| 11 | targettarget | self | combat | 21 |  |

## Secret or not

Columns are the unit kinds above.

| API | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 |
|---|---|---|---|---|---|---|---|---|---|---|---|
| `C_NamePlate.GetNamePlateForUnit` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | err |
| `CheckInteractDistance(u, 4)` | ok | ok | ok | ok |  |  |  |  | ok | ok | ok |
| `GetRaidTargetIndex` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `GetShapeshiftFormID` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitAffectingCombat` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitCanAssist(player, u)` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitCanAttack(player, u)` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitCastingDuration` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitCastingInfo` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitCastingInfo #1` | ok |  | ok |  |  |  | **S** |  |  |  | ok |
| `UnitCastingInfo #10` | ok |  | ok |  |  |  | ok |  |  |  | ok |
| `UnitCastingInfo #11` | ok |  | ok |  |  |  | ok |  |  |  | ok |
| `UnitCastingInfo #2` | ok |  | ok |  |  |  | **S** |  |  |  | ok |
| `UnitCastingInfo #3` | ok |  | ok |  |  |  | **S** |  |  |  | ok |
| `UnitCastingInfo #4` | ok |  | ok |  |  |  | **S** |  |  |  | ok |
| `UnitCastingInfo #5` | ok |  | ok |  |  |  | **S** |  |  |  | ok |
| `UnitCastingInfo #6` | ok |  | ok |  |  |  | ok |  |  |  | ok |
| `UnitCastingInfo #7` | ok |  | ok |  |  |  | **S** |  |  |  | ok |
| `UnitCastingInfo #8` | ok |  | ok |  |  |  | **S** |  |  |  | ok |
| `UnitCastingInfo #9` | ok |  | ok |  |  |  | **S** |  |  |  | ok |
| `UnitChannelInfo` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitClass #1` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitClass #2` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitClass #3` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitClassification` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitCreatureFamily` |  |  | ok | ok | ok | ok | ok | ok |  |  | ok |
| `UnitCreatureFamily #1` | ok | ok |  |  |  |  |  |  | ok | ok |  |
| `UnitCreatureFamily #2` | ok | ok |  |  |  |  |  |  | ok | ok |  |
| `UnitCreatureType #1` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitCreatureType #2` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitDetailedThreatSituation(player, u)` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitDetailedThreatSituation(player, u) #1` |  |  |  |  |  |  | ok |  | ok |  |  |
| `UnitDetailedThreatSituation(player, u) #2` |  |  |  |  |  |  | ok |  | ok |  |  |
| `UnitDetailedThreatSituation(player, u) #3` |  |  |  |  |  |  | ok |  | ok |  |  |
| `UnitDetailedThreatSituation(player, u) #4` |  |  |  |  |  |  | ok |  | ok |  |  |
| `UnitDetailedThreatSituation(player, u) #5` |  |  |  |  |  |  | ok |  | ok |  |  |
| `UnitEffectiveLevel` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitExists` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitFactionGroup #1` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitFactionGroup #2` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitGUID` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitGetIncomingHeals` | **S** | **S** | **S** | **S** | **S** | **S** | ok | ok | ok | ok | **S** |
| `UnitGetTotalAbsorbs` | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** |
| `UnitHealth` | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** |
| `UnitHealthMax` | ok | ok | ok | ok | **S** | **S** | **S** | **S** | **S** | **S** | ok |
| `UnitHealthPercent` | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** |
| `UnitInRange #1` | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** |
| `UnitInRange #2` | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** |
| `UnitIsDeadOrGhost` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitIsEnemy(player, u)` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitIsFriend(player, u)` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitIsPVP` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitIsPlayer` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitIsTapDenied` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitIsUnit(u, player)` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitIsUnit(u, target)` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitLevel` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitName #1` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitName #2` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitPower` | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** |
| `UnitPower(player, Combo)` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitPower(u, Mana)` | **S** | **S** | **S** | **S** | ok | ok | **S**/ok | **S**/ok | ok | ok | **S** |
| `UnitPowerMax` | ok | ok | ok | ok | **S** | **S** | **S** | **S** | **S** | **S** | ok |
| `UnitPowerMax(u, Mana)` | ok | ok | ok | ok | ok | ok | **S**/ok | **S**/ok | ok | ok | ok |
| `UnitPowerPercent(u, Mana)` | **S** | **S** | **S** | **S** | ok | ok | **S**/ok | **S**/ok | ok | ok | **S** |
| `UnitPowerType #1` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitPowerType #2` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitPowerType #3` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitPowerType #4` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitPowerType #5` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitRace` | ok | ok |  |  | ok | ok | ok | ok | ok | ok |  |
| `UnitRace #1` |  |  | ok | ok |  |  |  |  |  |  | ok |
| `UnitRace #2` |  |  | ok | ok |  |  |  |  |  |  | ok |
| `UnitRace #3` |  |  | ok | ok |  |  |  |  |  |  | ok |
| `UnitReaction(u, player)` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitSex` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitThreatSituation(player, u)` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `aura HARMFUL` | err | ok | err | ok | err | ok | err | ok | err | ok | err |
| `aura HARMFUL.applications` |  |  |  | ok |  |  |  |  |  |  |  |
| `aura HARMFUL.auraInstanceID` |  |  |  | ok |  |  |  |  |  |  |  |
| `aura HARMFUL.dispelName` |  |  |  | ok |  |  |  |  |  |  |  |
| `aura HARMFUL.duration` |  |  |  | ok |  |  |  |  |  |  |  |
| `aura HARMFUL.expirationTime` |  |  |  | ok |  |  |  |  |  |  |  |
| `aura HARMFUL.icon` |  |  |  | ok |  |  |  |  |  |  |  |
| `aura HARMFUL.isFromPlayerOrPlayerPet` |  |  |  | ok |  |  |  |  |  |  |  |
| `aura HARMFUL.isStealable` |  |  |  | ok |  |  |  |  |  |  |  |
| `aura HARMFUL.name` |  |  |  | ok |  |  |  |  |  |  |  |
| `aura HARMFUL.sourceUnit` |  |  |  | ok |  |  |  |  |  |  |  |
| `aura HARMFUL.spellId` |  |  |  | ok |  |  |  |  |  |  |  |
| `aura HELPFUL` | err | ok | err | ok | err | ok | err | ok | err | ok | err |
| `aura HELPFUL.applications` |  |  |  | ok |  | ok |  | ok |  |  |  |
| `aura HELPFUL.auraInstanceID` |  |  |  | ok |  | ok |  | ok |  |  |  |
| `aura HELPFUL.dispelName` |  |  |  | ok |  | ok |  | ok |  |  |  |
| `aura HELPFUL.duration` |  |  |  | ok |  | ok |  | ok |  |  |  |
| `aura HELPFUL.expirationTime` |  |  |  | ok |  | ok |  | ok |  |  |  |
| `aura HELPFUL.icon` |  |  |  | ok |  | ok |  | ok |  |  |  |
| `aura HELPFUL.isFromPlayerOrPlayerPet` |  |  |  | ok |  | ok |  | ok |  |  |  |
| `aura HELPFUL.isStealable` |  |  |  | ok |  | ok |  | ok |  |  |  |
| `aura HELPFUL.name` |  |  |  | ok |  | ok |  | ok |  |  |  |
| `aura HELPFUL.sourceUnit` |  |  |  | ok |  | ok |  | ok |  |  |  |
| `aura HELPFUL.spellId` |  |  |  | ok |  | ok |  | ok |  |  |  |

## Last clean values

What each call returned last time it was not secret, per unit kind.

### 1. pet | npc-friendly | combat

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
- `UnitCastingInfo #10`: string:CastBar-150510956988B3AF
- `UnitCastingInfo #11`: number:0
- `UnitCastingInfo #2`: string:Firebolt
- `UnitCastingInfo #3`: number:135809
- `UnitCastingInfo #4`: number:47481297
- `UnitCastingInfo #5`: number:47483297
- `UnitCastingInfo #6`: boolean:false
- `UnitCastingInfo #7`: string:Cast-3-4615-0-56958-3110
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
- `UnitEffectiveLevel`: number:5
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: string:Horde
- `UnitFactionGroup #2`: string:Horde
- `UnitGUID`: string:Pet-0-4615-0-56774-416-0
- `UnitHealthMax`: number:217
- `UnitIsDeadOrGhost`: boolean:false
- `UnitIsEnemy(player, u)`: boolean:false
- `UnitIsFriend(player, u)`: boolean:true
- `UnitIsPVP`: boolean:false
- `UnitIsPlayer`: boolean:false
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:false
- `UnitIsUnit(u, target)`: boolean:false
- `UnitLevel`: number:5
- `UnitName #1`: string:Pagyal
- `UnitName #2`: nil
- `UnitPower(player, Combo)`: number:0
- `UnitPowerMax`: number:76
- `UnitPowerMax(u, Mana)`: number:76
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

### 2. pet | npc-friendly | nocombat

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
- `UnitEffectiveLevel`: number:5
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: string:Horde
- `UnitFactionGroup #2`: string:Horde
- `UnitGUID`: string:Pet-0-4615-0-56774-416-0
- `UnitHealthMax`: number:217
- `UnitIsDeadOrGhost`: boolean:false
- `UnitIsEnemy(player, u)`: boolean:false
- `UnitIsFriend(player, u)`: boolean:true
- `UnitIsPVP`: boolean:false
- `UnitIsPlayer`: boolean:false
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:false
- `UnitIsUnit(u, target)`: boolean:false
- `UnitLevel`: number:5
- `UnitName #1`: string:Pagyal
- `UnitName #2`: nil
- `UnitPower(player, Combo)`: number:0
- `UnitPowerMax`: number:76
- `UnitPowerMax(u, Mana)`: number:76
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

### 3. player | self | combat

- `C_NamePlate.GetNamePlateForUnit`: nil
- `CheckInteractDistance(u, 4)`: boolean:false
- `GetRaidTargetIndex`: nil
- `GetShapeshiftFormID`: nil
- `UnitAffectingCombat`: boolean:true
- `UnitCanAssist(player, u)`: boolean:true
- `UnitCanAttack(player, u)`: boolean:false
- `UnitCastingDuration`: nil
- `UnitCastingInfo`: nil
- `UnitCastingInfo #1`: string:Shadow Bolt
- `UnitCastingInfo #10`: string:CastBar-AAA41B4AA57C293F
- `UnitCastingInfo #11`: number:0
- `UnitCastingInfo #2`: string:Shadow Bolt
- `UnitCastingInfo #3`: number:136197
- `UnitCastingInfo #4`: number:47476361
- `UnitCastingInfo #5`: number:47478061
- `UnitCastingInfo #6`: boolean:false
- `UnitCastingInfo #7`: string:Cast-3-4615-0-56958-686-
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
- `UnitEffectiveLevel`: number:5
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: string:Horde
- `UnitFactionGroup #2`: string:Horde
- `UnitGUID`: string:Player-4620-014D513D
- `UnitHealthMax`: number:123
- `UnitIsDeadOrGhost`: boolean:false
- `UnitIsEnemy(player, u)`: boolean:false
- `UnitIsFriend(player, u)`: boolean:true
- `UnitIsPVP`: boolean:false
- `UnitIsPlayer`: boolean:true
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:true
- `UnitIsUnit(u, target)`: boolean:false
- `UnitLevel`: number:5
- `UnitName #1`: string:Forever
- `UnitName #2`: string:Ghoulhunter
- `UnitPower(player, Combo)`: number:0
- `UnitPowerMax`: number:208
- `UnitPowerMax(u, Mana)`: number:208
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

### 4. player | self | nocombat

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
- `UnitClass #1`: string:Warlock
- `UnitClass #2`: string:WARLOCK
- `UnitClass #3`: number:9
- `UnitClassification`: string:normal
- `UnitCreatureFamily`: nil
- `UnitCreatureType #1`: string:Humanoid
- `UnitCreatureType #2`: number:7
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitEffectiveLevel`: number:5
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: string:Horde
- `UnitFactionGroup #2`: string:Horde
- `UnitGUID`: string:Player-4620-014D513D
- `UnitHealthMax`: number:123
- `UnitIsDeadOrGhost`: boolean:false
- `UnitIsEnemy(player, u)`: boolean:false
- `UnitIsFriend(player, u)`: boolean:true
- `UnitIsPVP`: boolean:false
- `UnitIsPlayer`: boolean:true
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:true
- `UnitIsUnit(u, target)`: boolean:false
- `UnitLevel`: number:5
- `UnitName #1`: string:Forever
- `UnitName #2`: string:Ghoulhunter
- `UnitPower(player, Combo)`: number:0
- `UnitPowerMax`: number:208
- `UnitPowerMax(u, Mana)`: number:208
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
- `aura HARMFUL.auraInstanceID`: number:29
- `aura HARMFUL.dispelName`: nil
- `aura HARMFUL.duration`: number:4
- `aura HARMFUL.expirationTime`: number:47071.76
- `aura HARMFUL.icon`: number:135860
- `aura HARMFUL.isFromPlayerOrPlayerPet`: boolean:false
- `aura HARMFUL.isStealable`: boolean:false
- `aura HARMFUL.name`: string:Dazed
- `aura HARMFUL.sourceUnit`: nil
- `aura HARMFUL.spellId`: number:1604
- `aura HELPFUL`: nil
- `aura HELPFUL.applications`: number:0
- `aura HELPFUL.auraInstanceID`: number:3
- `aura HELPFUL.dispelName`: string:Magic
- `aura HELPFUL.duration`: number:3600.001
- `aura HELPFUL.expirationTime`: number:50938.387
- `aura HELPFUL.icon`: number:135906
- `aura HELPFUL.isFromPlayerOrPlayerPet`: boolean:true
- `aura HELPFUL.isStealable`: boolean:false
- `aura HELPFUL.name`: string:Blessing of Might
- `aura HELPFUL.sourceUnit`: nil
- `aura HELPFUL.spellId`: number:19740

### 5. target | npc-friendly | combat

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

### 6. target | npc-friendly | nocombat

- `C_NamePlate.GetNamePlateForUnit`: nil
- `GetRaidTargetIndex`: nil
- `GetShapeshiftFormID`: nil
- `UnitAffectingCombat`: boolean:false
- `UnitCanAssist(player, u)`: boolean:false
- `UnitCanAttack(player, u)`: boolean:false
- `UnitCastingDuration`: nil
- `UnitCastingInfo`: nil
- `UnitChannelInfo`: nil
- `UnitClass #1`: string:Father Gavin
- `UnitClass #2`: string:WARRIOR
- `UnitClass #3`: number:1
- `UnitClassification`: string:normal
- `UnitCreatureFamily`: nil
- `UnitCreatureType #1`: string:Humanoid
- `UnitCreatureType #2`: number:7
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitEffectiveLevel`: number:15
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
- `UnitLevel`: number:15
- `UnitName #1`: string:Father Gavin
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
- `UnitSex`: number:2
- `UnitThreatSituation(player, u)`: nil
- `aura HARMFUL`: nil
- `aura HELPFUL`: nil
- `aura HELPFUL.applications`: number:0
- `aura HELPFUL.auraInstanceID`: number:1
- `aura HELPFUL.dispelName`: nil
- `aura HELPFUL.duration`: number:0
- `aura HELPFUL.expirationTime`: number:0
- `aura HELPFUL.icon`: number:135996
- `aura HELPFUL.isFromPlayerOrPlayerPet`: boolean:false
- `aura HELPFUL.isStealable`: boolean:false
- `aura HELPFUL.name`: string:Recombobulate
- `aura HELPFUL.sourceUnit`: string:target
- `aura HELPFUL.spellId`: number:7344

### 7. target | npc-hostile | combat

- `C_NamePlate.GetNamePlateForUnit`: table
- `GetRaidTargetIndex`: nil
- `GetShapeshiftFormID`: nil
- `UnitAffectingCombat`: boolean:true
- `UnitCanAssist(player, u)`: boolean:false
- `UnitCanAttack(player, u)`: boolean:true
- `UnitCastingDuration`: userdata
- `UnitCastingInfo`: nil
- `UnitCastingInfo #10`: string:CastBar-FBF5E02D422897AD
- `UnitCastingInfo #11`: number:0
- `UnitCastingInfo #6`: boolean:false
- `UnitChannelInfo`: nil
- `UnitClass #1`: string:Scarlet Initiate
- `UnitClass #2`: string:MAGE
- `UnitClass #3`: number:8
- `UnitClassification`: string:normal
- `UnitCreatureFamily`: nil
- `UnitCreatureType #1`: string:Humanoid
- `UnitCreatureType #2`: number:7
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitDetailedThreatSituation(player, u) #1`: boolean:true
- `UnitDetailedThreatSituation(player, u) #2`: number:3
- `UnitDetailedThreatSituation(player, u) #3`: number:100
- `UnitDetailedThreatSituation(player, u) #4`: number:255
- `UnitDetailedThreatSituation(player, u) #5`: number:55
- `UnitEffectiveLevel`: number:3
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: nil
- `UnitFactionGroup #2`: nil
- `UnitGUID`: string:Creature-0-4615-0-56958-
- `UnitGetIncomingHeals`: nil
- `UnitIsDeadOrGhost`: boolean:false
- `UnitIsEnemy(player, u)`: boolean:true
- `UnitIsFriend(player, u)`: boolean:false
- `UnitIsPVP`: boolean:false
- `UnitIsPlayer`: boolean:false
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:false
- `UnitIsUnit(u, target)`: boolean:true
- `UnitLevel`: number:3
- `UnitName #1`: string:Scarlet Initiate
- `UnitName #2`: nil
- `UnitPower(player, Combo)`: number:0
- `UnitPowerType #1`: number:0
- `UnitPowerType #2`: string:MANA
- `UnitPowerType #3`: nil
- `UnitPowerType #4`: nil
- `UnitPowerType #5`: nil
- `UnitRace`: nil
- `UnitReaction(u, player)`: number:2
- `UnitSex`: number:2
- `UnitThreatSituation(player, u)`: number:3
- `aura HARMFUL`: error: GetAuraDataByIndex(): Auras cannot be accessed when secret while tainted by 'ForeverProbe'
Lua Taint: ForeverProbe
- `aura HELPFUL`: error: GetAuraDataByIndex(): Auras cannot be accessed when secret while tainted by 'ForeverProbe'
Lua Taint: ForeverProbe

### 8. target | npc-hostile | nocombat

- `C_NamePlate.GetNamePlateForUnit`: table
- `GetRaidTargetIndex`: nil
- `GetShapeshiftFormID`: nil
- `UnitAffectingCombat`: boolean:false
- `UnitCanAssist(player, u)`: boolean:false
- `UnitCanAttack(player, u)`: boolean:true
- `UnitCastingDuration`: nil
- `UnitCastingInfo`: nil
- `UnitChannelInfo`: nil
- `UnitClass #1`: string:Scarlet Initiate
- `UnitClass #2`: string:MAGE
- `UnitClass #3`: number:8
- `UnitClassification`: string:normal
- `UnitCreatureFamily`: nil
- `UnitCreatureType #1`: string:Humanoid
- `UnitCreatureType #2`: number:7
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitEffectiveLevel`: number:3
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: nil
- `UnitFactionGroup #2`: nil
- `UnitGUID`: string:Creature-0-4615-0-56958-
- `UnitGetIncomingHeals`: nil
- `UnitIsDeadOrGhost`: boolean:false
- `UnitIsEnemy(player, u)`: boolean:true
- `UnitIsFriend(player, u)`: boolean:false
- `UnitIsPVP`: boolean:false
- `UnitIsPlayer`: boolean:false
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:false
- `UnitIsUnit(u, target)`: boolean:true
- `UnitLevel`: number:3
- `UnitName #1`: string:Scarlet Initiate
- `UnitName #2`: nil
- `UnitPower(player, Combo)`: number:0
- `UnitPowerType #1`: number:0
- `UnitPowerType #2`: string:MANA
- `UnitPowerType #3`: nil
- `UnitPowerType #4`: nil
- `UnitPowerType #5`: nil
- `UnitRace`: nil
- `UnitReaction(u, player)`: number:2
- `UnitSex`: number:2
- `UnitThreatSituation(player, u)`: nil
- `aura HARMFUL`: nil
- `aura HELPFUL`: nil
- `aura HELPFUL.applications`: number:0
- `aura HELPFUL.auraInstanceID`: number:1
- `aura HELPFUL.dispelName`: string:Magic
- `aura HELPFUL.duration`: number:1800
- `aura HELPFUL.expirationTime`: number:49229.09
- `aura HELPFUL.icon`: number:135843
- `aura HELPFUL.isFromPlayerOrPlayerPet`: boolean:false
- `aura HELPFUL.isStealable`: boolean:false
- `aura HELPFUL.name`: string:Frost Armor
- `aura HELPFUL.sourceUnit`: string:nameplate1
- `aura HELPFUL.spellId`: number:12544

### 9. target | npc-neutral | combat

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
- `UnitClass #1`: string:Large Crag Boar
- `UnitClass #2`: string:WARRIOR
- `UnitClass #3`: number:1
- `UnitClassification`: string:normal
- `UnitCreatureFamily #1`: string:Boar
- `UnitCreatureFamily #2`: number:5
- `UnitCreatureType #1`: string:Beast
- `UnitCreatureType #2`: number:1
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitDetailedThreatSituation(player, u) #1`: boolean:true
- `UnitDetailedThreatSituation(player, u) #2`: number:3
- `UnitDetailedThreatSituation(player, u) #3`: number:100
- `UnitDetailedThreatSituation(player, u) #4`: number:255
- `UnitDetailedThreatSituation(player, u) #5`: number:79
- `UnitEffectiveLevel`: number:6
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: nil
- `UnitFactionGroup #2`: nil
- `UnitGUID`: string:Creature-0-4621-0-48016-
- `UnitGetIncomingHeals`: nil
- `UnitIsDeadOrGhost`: boolean:false
- `UnitIsEnemy(player, u)`: boolean:false
- `UnitIsFriend(player, u)`: boolean:false
- `UnitIsPVP`: boolean:false
- `UnitIsPlayer`: boolean:false
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:false
- `UnitIsUnit(u, target)`: boolean:true
- `UnitLevel`: number:6
- `UnitName #1`: string:Large Crag Boar
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

### 10. target | npc-neutral | nocombat

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
- `UnitClass #1`: string:Large Crag Boar
- `UnitClass #2`: string:WARRIOR
- `UnitClass #3`: number:1
- `UnitClassification`: string:normal
- `UnitCreatureFamily #1`: string:Boar
- `UnitCreatureFamily #2`: number:5
- `UnitCreatureType #1`: string:Beast
- `UnitCreatureType #2`: number:1
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitEffectiveLevel`: number:6
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: nil
- `UnitFactionGroup #2`: nil
- `UnitGUID`: string:Creature-0-4621-0-48016-
- `UnitGetIncomingHeals`: nil
- `UnitIsDeadOrGhost`: boolean:true
- `UnitIsEnemy(player, u)`: boolean:false
- `UnitIsFriend(player, u)`: boolean:false
- `UnitIsPVP`: boolean:false
- `UnitIsPlayer`: boolean:false
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:false
- `UnitIsUnit(u, target)`: boolean:true
- `UnitLevel`: number:6
- `UnitName #1`: string:Large Crag Boar
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

### 11. targettarget | self | combat

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
- `UnitCastingInfo #10`: string:CastBar-52B9F86A4A2C3B4F
- `UnitCastingInfo #11`: number:0
- `UnitCastingInfo #2`: string:Shadow Bolt
- `UnitCastingInfo #3`: number:136197
- `UnitCastingInfo #4`: number:47476361
- `UnitCastingInfo #5`: number:47478061
- `UnitCastingInfo #6`: boolean:false
- `UnitCastingInfo #7`: string:Cast-3-4615-0-56958-686-
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
- `UnitEffectiveLevel`: number:5
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: string:Horde
- `UnitFactionGroup #2`: string:Horde
- `UnitGUID`: string:Player-4620-014D513D
- `UnitHealthMax`: number:123
- `UnitIsDeadOrGhost`: boolean:false
- `UnitIsEnemy(player, u)`: boolean:false
- `UnitIsFriend(player, u)`: boolean:true
- `UnitIsPVP`: boolean:false
- `UnitIsPlayer`: boolean:true
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:true
- `UnitIsUnit(u, target)`: boolean:false
- `UnitLevel`: number:5
- `UnitName #1`: string:Forever
- `UnitName #2`: string:Ghoulhunter
- `UnitPower(player, Combo)`: number:0
- `UnitPowerMax`: number:208
- `UnitPowerMax(u, Mana)`: number:208
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
