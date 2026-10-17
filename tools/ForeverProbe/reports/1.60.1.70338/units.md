# Unit values, build 1.60.1.70338

Client 1.60.1 (build 70338, Oct  9 2026), Interface 16001.

**S** secret every time, ok never secret, **S**/ok both seen, err the call failed (missing API or bad arguments). A blank cell was not returned there.

## Unit kinds

| # | Unit | Relation | State | Samples | Mobs seen |
|---|---|---|---|---|---|
| 1 | focus | self | nocombat | 1 |  |
| 2 | nameplate | npc-hostile | combat | 619 | Mottled Worg, Ravenclaw Slave, Young Black Bear, Snow Leopard, Minor Ice Elemental, Avala, Prideclaw, Al'Aketh Stormcaller |
| 3 | nameplate | npc-hostile | nocombat | 195 | Mottled Worg, Ravenclaw Slave, Young Black Bear, Minor Ice Elemental, Avala, Prideclaw, Al'Aketh Stormcaller, Living Lightning |
| 4 | nameplate | npc-neutral | combat | 49 | Elder Crag Boar, Skyhopper, Windsong Crawler, Flutterfly |
| 5 | nameplate | npc-neutral | nocombat | 37 | Crag Boar, Windsong Crawler, Galestrider, Skyhopper, Flutterfly, Wind Sprite |
| 6 | party | pc-friendly | combat | 19 |  |
| 7 | party | pc-friendly | nocombat | 32 |  |
| 8 | pet | npc-friendly | combat | 797 | Yazrot, Windsong Crawler, Vuldren Alpha, Pettsson |
| 9 | pet | npc-friendly | nocombat | 1019 | Yazrot, Windsong Crawler, Ornery Galestrider, Vuldren Alpha, Fox, Pettsson |
| 10 | player | self | combat | 1036 |  |
| 11 | player | self | nocombat | 1312 |  |
| 12 | target | npc-friendly | combat | 2 | Aamelia Windfield, Quel'ana Quickgale |
| 13 | target | npc-friendly | nocombat | 143 | Rane Yorick, Deathstalker Erland, Karos Razok, Dalar Dawnweaver, Shadow Priest Allister, Deathguard Podrig, Apothecary Renferrel, High Executor Hadrec |
| 14 | target | npc-hostile | combat | 653 | Mottled Worg, Ravenclaw Slave, Young Black Bear, Snow Leopard, Minor Ice Elemental, Avala, Prideclaw, Al'Aketh Stormcaller |
| 15 | target | npc-hostile | nocombat | 461 | Mottled Worg, Ravenclaw Slave, Young Black Bear, Snow Leopard, Minor Ice Elemental, Avala, Prideclaw, Al'Aketh Stormcaller |
| 16 | target | npc-neutral | combat | 51 | Elder Crag Boar, Skyhopper, Windsong Crawler, Flutterfly |
| 17 | target | npc-neutral | nocombat | 52 | Crag Boar, Windsong Crawler, Galestrider, Skyhopper, Flutterfly, Wind Sprite |
| 18 | target | pc-friendly | nocombat | 15 |  |
| 19 | target | self | nocombat | 1 |  |
| 20 | targettarget | npc-friendly | combat | 214 | Yazrot, Pettsson |
| 21 | targettarget | npc-friendly | nocombat | 2 | Deathstalker Erland, Razzle Sprysprocket |
| 22 | targettarget | npc-hostile | combat | 11 | Shadowgale Shriekling, Al'Aketh Stormchaser |
| 23 | targettarget | npc-hostile | nocombat | 9 | Mottled Worg, Ferocious Grizzled Bear, Shriekling Fledgling, Al'Aketh Assassin, Shadowgale Shriekling, Al'Aketh Footsoldier |
| 24 | targettarget | pc-friendly | nocombat | 1 |  |
| 25 | targettarget | self | combat | 412 |  |
| 26 | targettarget | self | nocombat | 3 |  |

## Secret or not

Columns are the unit kinds above.

| API | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14 | 15 | 16 | 17 | 18 | 19 | 20 | 21 | 22 | 23 | 24 | 25 | 26 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| `C_NamePlate.GetNamePlateForUnit` | ok | ok | ok | ok | ok | err | err | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | err | err | err | err | err | err | err |
| `GetRaidTargetIndex` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `GetShapeshiftFormID` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitAffectingCombat` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitCanAssist(player, u)` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitCanAttack(player, u)` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitCastingDuration` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitCastingInfo` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitCastingInfo #1` |  | **S** | **S** |  |  |  | **S** | ok |  | ok | ok |  |  | **S** | **S** |  |  | **S** |  | ok |  | **S** |  |  | ok |  |
| `UnitCastingInfo #10` |  | ok | ok |  |  |  | ok | ok |  | ok | ok |  |  | ok | ok |  |  | ok |  | ok |  | ok |  |  | ok |  |
| `UnitCastingInfo #11` |  | ok | ok |  |  |  | ok | ok |  | ok | ok |  |  | ok | ok |  |  | ok |  | ok |  | ok |  |  | ok |  |
| `UnitCastingInfo #2` |  | **S** | **S** |  |  |  | **S** | ok |  | ok | ok |  |  | **S** | **S** |  |  | **S** |  | ok |  | **S** |  |  | ok |  |
| `UnitCastingInfo #3` |  | **S** | **S** |  |  |  | **S** | ok |  | ok | ok |  |  | **S** | **S** |  |  | **S** |  | ok |  | **S** |  |  | ok |  |
| `UnitCastingInfo #4` |  | **S** | **S** |  |  |  | **S** | ok |  | ok | ok |  |  | **S** | **S** |  |  | **S** |  | ok |  | **S** |  |  | ok |  |
| `UnitCastingInfo #5` |  | **S** | **S** |  |  |  | **S** | ok |  | ok | ok |  |  | **S** | **S** |  |  | **S** |  | ok |  | **S** |  |  | ok |  |
| `UnitCastingInfo #6` |  | ok | ok |  |  |  | ok | ok |  | ok | ok |  |  | ok | ok |  |  | ok |  | ok |  | ok |  |  | ok |  |
| `UnitCastingInfo #7` |  | **S** | **S** |  |  |  | **S** | ok |  | ok | ok |  |  | **S** | **S** |  |  | **S** |  | ok |  | **S** |  |  | ok |  |
| `UnitCastingInfo #8` |  | **S** | **S** |  |  |  | **S** | ok |  | ok | ok |  |  | **S** | **S** |  |  | **S** |  | ok |  | **S** |  |  | ok |  |
| `UnitCastingInfo #9` |  | **S** | **S** |  |  |  | **S** | ok |  | ok | ok |  |  | **S** | **S** |  |  | **S** |  | ok |  | **S** |  |  | ok |  |
| `UnitChannelInfo` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitChannelInfo #1` |  |  |  |  |  |  |  |  |  | ok |  |  |  |  |  |  |  |  |  |  |  |  |  |  | ok |  |
| `UnitChannelInfo #10` |  |  |  |  |  |  |  |  |  | ok |  |  |  |  |  |  |  |  |  |  |  |  |  |  | ok |  |
| `UnitChannelInfo #11` |  |  |  |  |  |  |  |  |  | ok |  |  |  |  |  |  |  |  |  |  |  |  |  |  | ok |  |
| `UnitChannelInfo #2` |  |  |  |  |  |  |  |  |  | ok |  |  |  |  |  |  |  |  |  |  |  |  |  |  | ok |  |
| `UnitChannelInfo #3` |  |  |  |  |  |  |  |  |  | ok |  |  |  |  |  |  |  |  |  |  |  |  |  |  | ok |  |
| `UnitChannelInfo #4` |  |  |  |  |  |  |  |  |  | ok |  |  |  |  |  |  |  |  |  |  |  |  |  |  | ok |  |
| `UnitChannelInfo #5` |  |  |  |  |  |  |  |  |  | ok |  |  |  |  |  |  |  |  |  |  |  |  |  |  | ok |  |
| `UnitChannelInfo #6` |  |  |  |  |  |  |  |  |  | ok |  |  |  |  |  |  |  |  |  |  |  |  |  |  | ok |  |
| `UnitChannelInfo #7` |  |  |  |  |  |  |  |  |  | ok |  |  |  |  |  |  |  |  |  |  |  |  |  |  | ok |  |
| `UnitChannelInfo #8` |  |  |  |  |  |  |  |  |  | ok |  |  |  |  |  |  |  |  |  |  |  |  |  |  | ok |  |
| `UnitChannelInfo #9` |  |  |  |  |  |  |  |  |  | ok |  |  |  |  |  |  |  |  |  |  |  |  |  |  | ok |  |
| `UnitClass #1` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitClass #2` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitClass #3` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitClassification` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitCreatureFamily` | ok | ok | ok | ok | ok | ok | ok |  |  | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |  | ok | ok | ok | ok | ok | ok |
| `UnitCreatureFamily #1` |  | ok | ok | ok | ok |  |  | ok | ok |  |  |  | ok | ok | ok | ok | ok |  |  | ok |  | ok | ok |  |  |  |
| `UnitCreatureFamily #2` |  | ok | ok | ok | ok |  |  | ok | ok |  |  |  | ok | ok | ok | ok | ok |  |  | ok |  | ok | ok |  |  |  |
| `UnitCreatureType #1` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitCreatureType #2` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitDetailedThreatSituation(player, u)` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitDetailedThreatSituation(player, u) #1` |  | **S** |  | **S** | **S** |  |  |  |  |  |  |  |  | ok |  | ok | ok |  |  |  |  | **S** |  |  |  |  |
| `UnitDetailedThreatSituation(player, u) #2` |  | **S** |  | **S** | **S** |  |  |  |  |  |  |  |  | ok |  | ok | ok |  |  |  |  | **S** |  |  |  |  |
| `UnitDetailedThreatSituation(player, u) #3` |  | **S** |  | **S** | **S** |  |  |  |  |  |  |  |  | ok |  | ok | ok |  |  |  |  | **S** |  |  |  |  |
| `UnitDetailedThreatSituation(player, u) #4` |  | **S** |  | **S** | **S** |  |  |  |  |  |  |  |  | ok |  | ok | ok |  |  |  |  | **S** |  |  |  |  |
| `UnitDetailedThreatSituation(player, u) #5` |  | **S** |  | **S** | **S** |  |  |  |  |  |  |  |  | ok |  | ok | ok |  |  |  |  | **S** |  |  |  |  |
| `UnitEffectiveLevel` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitExists` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitFactionGroup #1` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitFactionGroup #2` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitGUID` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitGetIncomingHeals` | **S** | ok | ok | ok | ok | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S**/ok | ok | ok | ok | ok | **S** | **S** | **S** | **S** | ok | ok | **S** | **S** | **S** |
| `UnitGetTotalAbsorbs` | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** |
| `UnitHealth` | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** |
| `UnitHealthMax` | ok | **S** | **S** | **S** | **S** | **S** | **S** | ok | ok | ok | ok | **S** | **S**/ok | **S** | **S** | **S** | **S** | **S** | ok | ok | **S** | **S** | **S** | **S** | ok | ok |
| `UnitHealthPercent` | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** |
| `UnitInRange #1` | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** |
| `UnitInRange #2` | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** |
| `UnitIsDeadOrGhost` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitIsEnemy(player, u)` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitIsFriend(player, u)` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitIsPVP` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitIsPlayer` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitIsTapDenied` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitIsUnit(u, player)` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitIsUnit(u, target)` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitLevel` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitName #1` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitName #2` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitPower` | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** | **S** |
| `UnitPower(player, Combo)` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitPower(u, Mana)` | **S** | **S**/ok | **S**/ok | **S**/ok | **S**/ok | **S** | **S** | **S**/ok | **S**/ok | **S** | **S** | **S** | **S**/ok | **S**/ok | **S**/ok | **S**/ok | **S**/ok | **S**/ok | **S** | **S**/ok | ok | **S**/ok | **S**/ok | **S** | **S** | **S** |
| `UnitPowerMax` | ok | **S** | **S** | **S** | **S** | **S** | **S** | ok | ok | ok | ok | **S** | **S**/ok | **S** | **S** | **S** | **S** | **S** | ok | ok | **S** | **S** | **S** | **S** | ok | ok |
| `UnitPowerMax(u, Mana)` | ok | **S**/ok | **S**/ok | **S**/ok | **S**/ok | **S** | **S** | ok | ok | ok | ok | **S** | **S**/ok | **S**/ok | **S**/ok | **S**/ok | **S**/ok | **S**/ok | ok | ok | ok | **S**/ok | **S**/ok | **S** | ok | ok |
| `UnitPowerPercent(u, Mana)` | **S** | **S**/ok | **S**/ok | **S**/ok | **S**/ok | **S** | **S** | **S**/ok | **S**/ok | **S** | **S** | **S** | **S**/ok | **S**/ok | **S**/ok | **S**/ok | **S**/ok | **S**/ok | **S** | **S**/ok | ok | **S**/ok | **S**/ok | **S** | **S** | **S** |
| `UnitPowerType #1` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitPowerType #2` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitPowerType #3` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitPowerType #4` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitPowerType #5` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitRace` |  | ok | ok | ok | ok |  |  | ok | ok |  |  | ok | ok | ok | ok | ok | ok |  |  | ok | ok | ok | ok |  |  |  |
| `UnitRace #1` | ok |  |  |  |  | ok | ok |  |  | ok | ok |  |  |  |  |  |  | ok | ok |  |  |  |  | ok | ok | ok |
| `UnitRace #2` | ok |  |  |  |  | ok | ok |  |  | ok | ok |  |  |  |  |  |  | ok | ok |  |  |  |  | ok | ok | ok |
| `UnitRace #3` | ok |  |  |  |  | ok | ok |  |  | ok | ok |  |  |  |  |  |  | ok | ok |  |  |  |  | ok | ok | ok |
| `UnitReaction(u, player)` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitSex` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok |
| `UnitThreatSituation(player, u)` | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | ok | **S**/ok | ok | ok | ok | ok |
| `aura HARMFUL` | ok | err | ok | err | ok | err | ok | err | ok | err | ok | err | ok | err | ok | err | ok | ok | ok | err | ok | err | ok |  | err | ok |
| `aura HARMFUL.applications` |  |  | ok |  |  |  |  |  | ok |  | ok |  | ok |  | ok |  |  | ok |  |  |  |  | ok | ok |  |  |
| `aura HARMFUL.auraInstanceID` |  |  | ok |  |  |  |  |  | ok |  | ok |  | ok |  | ok |  |  | ok |  |  |  |  | ok | ok |  |  |
| `aura HARMFUL.dispelName` |  |  | ok |  |  |  |  |  | ok |  | ok |  | ok |  | ok |  |  | ok |  |  |  |  | ok | ok |  |  |
| `aura HARMFUL.duration` |  |  | ok |  |  |  |  |  | ok |  | ok |  | ok |  | ok |  |  | ok |  |  |  |  | ok | ok |  |  |
| `aura HARMFUL.expirationTime` |  |  | ok |  |  |  |  |  | ok |  | ok |  | ok |  | ok |  |  | ok |  |  |  |  | ok | ok |  |  |
| `aura HARMFUL.icon` |  |  | ok |  |  |  |  |  | ok |  | ok |  | ok |  | ok |  |  | ok |  |  |  |  | ok | ok |  |  |
| `aura HARMFUL.isFromPlayerOrPlayerPet` |  |  | ok |  |  |  |  |  | ok |  | ok |  | ok |  | ok |  |  | ok |  |  |  |  | ok | ok |  |  |
| `aura HARMFUL.isStealable` |  |  | ok |  |  |  |  |  | ok |  | ok |  | ok |  | ok |  |  | ok |  |  |  |  | ok | ok |  |  |
| `aura HARMFUL.name` |  |  | ok |  |  |  |  |  | ok |  | ok |  | ok |  | ok |  |  | ok |  |  |  |  | ok | ok |  |  |
| `aura HARMFUL.sourceUnit` |  |  | ok |  |  |  |  |  | ok |  | ok |  | ok |  | ok |  |  | ok |  |  |  |  | ok | ok |  |  |
| `aura HARMFUL.spellId` |  |  | ok |  |  |  |  |  | ok |  | ok |  | ok |  | ok |  |  | ok |  |  |  |  | ok | ok |  |  |
| `aura HELPFUL` |  | err | ok | err | ok | err |  | err | ok | err | ok | err | ok | err | ok | err | ok |  |  | err | ok | err | ok |  | err |  |
| `aura HELPFUL.applications` | ok |  | ok |  |  |  | ok |  | ok |  | ok |  | ok |  | ok |  |  | ok | ok |  |  |  | ok | ok |  | ok |
| `aura HELPFUL.auraInstanceID` | ok |  | ok |  |  |  | ok |  | ok |  | ok |  | ok |  | ok |  |  | ok | ok |  |  |  | ok | ok |  | ok |
| `aura HELPFUL.dispelName` | ok |  | ok |  |  |  | ok |  | ok |  | ok |  | ok |  | ok |  |  | ok | ok |  |  |  | ok | ok |  | ok |
| `aura HELPFUL.duration` | ok |  | ok |  |  |  | ok |  | ok |  | ok |  | ok |  | ok |  |  | ok | ok |  |  |  | ok | ok |  | ok |
| `aura HELPFUL.expirationTime` | ok |  | ok |  |  |  | ok |  | ok |  | ok |  | ok |  | ok |  |  | ok | ok |  |  |  | ok | ok |  | ok |
| `aura HELPFUL.icon` | ok |  | ok |  |  |  | ok |  | ok |  | ok |  | ok |  | ok |  |  | ok | ok |  |  |  | ok | ok |  | ok |
| `aura HELPFUL.isFromPlayerOrPlayerPet` | ok |  | ok |  |  |  | ok |  | ok |  | ok |  | ok |  | ok |  |  | ok | ok |  |  |  | ok | ok |  | ok |
| `aura HELPFUL.isStealable` | ok |  | ok |  |  |  | ok |  | ok |  | ok |  | ok |  | ok |  |  | ok | ok |  |  |  | ok | ok |  | ok |
| `aura HELPFUL.name` | ok |  | ok |  |  |  | ok |  | ok |  | ok |  | ok |  | ok |  |  | ok | ok |  |  |  | ok | ok |  | ok |
| `aura HELPFUL.sourceUnit` | ok |  | ok |  |  |  | ok |  | ok |  | ok |  | ok |  | ok |  |  | ok | ok |  |  |  | ok | ok |  | ok |
| `aura HELPFUL.spellId` | ok |  | ok |  |  |  | ok |  | ok |  | ok |  | ok |  | ok |  |  | ok | ok |  |  |  | ok | ok |  | ok |

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
- `UnitClass #1`: string:Hunter
- `UnitClass #2`: string:HUNTER
- `UnitClass #3`: number:3
- `UnitClassification`: string:normal
- `UnitCreatureFamily`: nil
- `UnitCreatureType #1`: string:Humanoid
- `UnitCreatureType #2`: number:7
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitEffectiveLevel`: number:10
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: string:Alliance
- `UnitFactionGroup #2`: string:Alliance
- `UnitGUID`: string:Player-4620-017360F4
- `UnitHealthMax`: number:269
- `UnitIsDeadOrGhost`: boolean:false
- `UnitIsEnemy(player, u)`: boolean:false
- `UnitIsFriend(player, u)`: boolean:true
- `UnitIsPVP`: boolean:false
- `UnitIsPlayer`: boolean:true
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:true
- `UnitIsUnit(u, target)`: boolean:true
- `UnitLevel`: number:10
- `UnitName #1`: string:Cycladion
- `UnitName #2`: string:Highgale
- `UnitPower(player, Combo)`: number:0
- `UnitPowerMax`: number:316
- `UnitPowerMax(u, Mana)`: number:316
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
- `aura HELPFUL.auraInstanceID`: number:315
- `aura HELPFUL.dispelName`: nil
- `aura HELPFUL.duration`: number:0
- `aura HELPFUL.expirationTime`: number:0
- `aura HELPFUL.icon`: number:132159
- `aura HELPFUL.isFromPlayerOrPlayerPet`: boolean:true
- `aura HELPFUL.isStealable`: boolean:false
- `aura HELPFUL.name`: string:Aspect of the Monkey
- `aura HELPFUL.sourceUnit`: string:player
- `aura HELPFUL.spellId`: number:13163

### 2. nameplate | npc-hostile | combat

- `C_NamePlate.GetNamePlateForUnit`: table
- `GetRaidTargetIndex`: nil
- `GetShapeshiftFormID`: nil
- `UnitAffectingCombat`: boolean:true
- `UnitCanAssist(player, u)`: boolean:false
- `UnitCanAttack(player, u)`: boolean:true
- `UnitCastingDuration`: nil
- `UnitCastingInfo`: nil
- `UnitCastingInfo #10`: string:CastBar-E1632DDE295E9FAB
- `UnitCastingInfo #11`: number:0
- `UnitCastingInfo #6`: boolean:false
- `UnitChannelInfo`: nil
- `UnitClass #1`: string:Al'Aketh Footsoldier
- `UnitClass #2`: string:ROGUE
- `UnitClass #3`: number:4
- `UnitClassification`: string:normal
- `UnitCreatureFamily`: nil
- `UnitCreatureFamily #1`: string:Bird of Prey
- `UnitCreatureFamily #2`: number:26
- `UnitCreatureType #1`: string:Humanoid
- `UnitCreatureType #2`: number:7
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitEffectiveLevel`: number:11
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: nil
- `UnitFactionGroup #2`: nil
- `UnitGUID`: string:Creature-0-6782-2991-247
- `UnitGetIncomingHeals`: nil
- `UnitIsDeadOrGhost`: boolean:false
- `UnitIsEnemy(player, u)`: boolean:false
- `UnitIsFriend(player, u)`: boolean:false
- `UnitIsPVP`: boolean:false
- `UnitIsPlayer`: boolean:false
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:false
- `UnitIsUnit(u, target)`: boolean:true
- `UnitLevel`: number:11
- `UnitName #1`: string:Al'Aketh Footsoldier
- `UnitName #2`: nil
- `UnitPower(player, Combo)`: number:0
- `UnitPower(u, Mana)`: number:0
- `UnitPowerMax(u, Mana)`: number:0
- `UnitPowerPercent(u, Mana)`: number:0
- `UnitPowerType #1`: number:3
- `UnitPowerType #2`: string:ENERGY
- `UnitPowerType #3`: nil
- `UnitPowerType #4`: nil
- `UnitPowerType #5`: nil
- `UnitRace`: nil
- `UnitReaction(u, player)`: number:2
- `UnitSex`: number:2
- `UnitThreatSituation(player, u)`: number:0
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
- `UnitCastingInfo #10`: string:CastBar-E48918E2478DE89B
- `UnitCastingInfo #11`: number:0
- `UnitCastingInfo #6`: boolean:false
- `UnitChannelInfo`: nil
- `UnitClass #1`: string:Al'Aketh Footsoldier
- `UnitClass #2`: string:ROGUE
- `UnitClass #3`: number:4
- `UnitClassification`: string:normal
- `UnitCreatureFamily`: nil
- `UnitCreatureFamily #1`: string:Bird of Prey
- `UnitCreatureFamily #2`: number:26
- `UnitCreatureType #1`: string:Humanoid
- `UnitCreatureType #2`: number:7
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitEffectiveLevel`: number:11
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: nil
- `UnitFactionGroup #2`: nil
- `UnitGUID`: string:Creature-0-6782-2991-247
- `UnitGetIncomingHeals`: nil
- `UnitIsDeadOrGhost`: boolean:false
- `UnitIsEnemy(player, u)`: boolean:false
- `UnitIsFriend(player, u)`: boolean:false
- `UnitIsPVP`: boolean:false
- `UnitIsPlayer`: boolean:false
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:false
- `UnitIsUnit(u, target)`: boolean:true
- `UnitLevel`: number:11
- `UnitName #1`: string:Al'Aketh Footsoldier
- `UnitName #2`: nil
- `UnitPower(player, Combo)`: number:0
- `UnitPower(u, Mana)`: number:0
- `UnitPowerMax(u, Mana)`: number:0
- `UnitPowerPercent(u, Mana)`: number:0
- `UnitPowerType #1`: number:3
- `UnitPowerType #2`: string:ENERGY
- `UnitPowerType #3`: nil
- `UnitPowerType #4`: nil
- `UnitPowerType #5`: nil
- `UnitRace`: nil
- `UnitReaction(u, player)`: number:2
- `UnitSex`: number:2
- `UnitThreatSituation(player, u)`: nil
- `aura HARMFUL`: nil
- `aura HARMFUL.applications`: number:0
- `aura HARMFUL.auraInstanceID`: number:1
- `aura HARMFUL.dispelName`: nil
- `aura HARMFUL.duration`: number:8
- `aura HARMFUL.expirationTime`: number:18100.554
- `aura HARMFUL.icon`: number:136231
- `aura HARMFUL.isFromPlayerOrPlayerPet`: boolean:false
- `aura HARMFUL.isStealable`: boolean:false
- `aura HARMFUL.name`: string:Lacerate
- `aura HARMFUL.sourceUnit`: string:nameplate2
- `aura HARMFUL.spellId`: number:5422
- `aura HELPFUL`: nil
- `aura HELPFUL.applications`: number:0
- `aura HELPFUL.auraInstanceID`: number:1
- `aura HELPFUL.dispelName`: nil
- `aura HELPFUL.duration`: number:0
- `aura HELPFUL.expirationTime`: number:0
- `aura HELPFUL.icon`: number:4630415
- `aura HELPFUL.isFromPlayerOrPlayerPet`: boolean:false
- `aura HELPFUL.isStealable`: boolean:false
- `aura HELPFUL.name`: string:Newborn Shriekling
- `aura HELPFUL.sourceUnit`: string:nameplate1
- `aura HELPFUL.spellId`: number:1259630

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
- `UnitClass #1`: string:Windsong Crawler
- `UnitClass #2`: string:WARRIOR
- `UnitClass #3`: number:1
- `UnitClassification`: string:normal
- `UnitCreatureFamily`: nil
- `UnitCreatureFamily #1`: string:Crab
- `UnitCreatureFamily #2`: number:8
- `UnitCreatureType #1`: string:Beast
- `UnitCreatureType #2`: number:1
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitEffectiveLevel`: number:8
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: nil
- `UnitFactionGroup #2`: nil
- `UnitGUID`: string:Creature-0-6782-2991-247
- `UnitGetIncomingHeals`: nil
- `UnitIsDeadOrGhost`: boolean:false
- `UnitIsEnemy(player, u)`: boolean:false
- `UnitIsFriend(player, u)`: boolean:false
- `UnitIsPVP`: boolean:false
- `UnitIsPlayer`: boolean:false
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:false
- `UnitIsUnit(u, target)`: boolean:true
- `UnitLevel`: number:8
- `UnitName #1`: string:Windsong Crawler
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
- `UnitThreatSituation(player, u)`: number:0
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
- `UnitClass #1`: string:Galestrider
- `UnitClass #2`: string:WARRIOR
- `UnitClass #3`: number:1
- `UnitClassification`: string:normal
- `UnitCreatureFamily`: nil
- `UnitCreatureFamily #1`: string:Tallstrider
- `UnitCreatureFamily #2`: number:12
- `UnitCreatureType #1`: string:Beast
- `UnitCreatureType #2`: number:1
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitEffectiveLevel`: number:6
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: nil
- `UnitFactionGroup #2`: nil
- `UnitGUID`: string:Creature-0-6782-2991-247
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
- `UnitName #1`: string:Galestrider
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

### 6. party | pc-friendly | combat

- `C_NamePlate.GetNamePlateForUnit`: error: Interface/AddOns/ForeverProbe/ForeverProbe.lua:171: bad argument #1 to 'GetNamePlateForUnit' (Raid<n>/Party<n> unit tokens are not allowed for this call. - Usage: local nameplate = C_NamePlate.GetNamePlateForUnit(unitToken [, includeForbidden]))
- `GetRaidTargetIndex`: nil
- `GetShapeshiftFormID`: nil
- `UnitAffectingCombat`: boolean:false
- `UnitCanAssist(player, u)`: boolean:true
- `UnitCanAttack(player, u)`: boolean:false
- `UnitCastingDuration`: nil
- `UnitCastingInfo`: nil
- `UnitChannelInfo`: nil
- `UnitClass #1`: string:Druid
- `UnitClass #2`: string:DRUID
- `UnitClass #3`: number:11
- `UnitClassification`: string:normal
- `UnitCreatureFamily`: nil
- `UnitCreatureType #1`: string:Humanoid
- `UnitCreatureType #2`: number:7
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitEffectiveLevel`: number:9
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: string:Alliance
- `UnitFactionGroup #2`: string:Alliance
- `UnitGUID`: string:Player-4618-017AA148
- `UnitIsDeadOrGhost`: boolean:false
- `UnitIsEnemy(player, u)`: boolean:false
- `UnitIsFriend(player, u)`: boolean:true
- `UnitIsPVP`: boolean:false
- `UnitIsPlayer`: boolean:true
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:false
- `UnitIsUnit(u, target)`: boolean:false
- `UnitLevel`: number:9
- `UnitName #1`: string:Rødhåret
- `UnitName #2`: string:Kattedame
- `UnitPower(player, Combo)`: number:0
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
- `aura HARMFUL`: error: GetAuraDataByIndex(): Auras cannot be accessed when secret while tainted by 'ForeverProbe'
Lua Taint: ForeverProbe
- `aura HELPFUL`: error: GetAuraDataByIndex(): Auras cannot be accessed when secret while tainted by 'ForeverProbe'
Lua Taint: ForeverProbe

### 7. party | pc-friendly | nocombat

- `C_NamePlate.GetNamePlateForUnit`: error: Interface/AddOns/ForeverProbe/ForeverProbe.lua:171: bad argument #1 to 'GetNamePlateForUnit' (Raid<n>/Party<n> unit tokens are not allowed for this call. - Usage: local nameplate = C_NamePlate.GetNamePlateForUnit(unitToken [, includeForbidden]))
- `GetRaidTargetIndex`: nil
- `GetShapeshiftFormID`: nil
- `UnitAffectingCombat`: boolean:false
- `UnitCanAssist(player, u)`: boolean:true
- `UnitCanAttack(player, u)`: boolean:false
- `UnitCastingDuration`: nil
- `UnitCastingInfo`: nil
- `UnitCastingInfo #10`: string:CastBar-58DDC50D3C7EF0E7
- `UnitCastingInfo #11`: number:0
- `UnitCastingInfo #6`: boolean:false
- `UnitChannelInfo`: nil
- `UnitClass #1`: string:Druid
- `UnitClass #2`: string:DRUID
- `UnitClass #3`: number:11
- `UnitClassification`: string:normal
- `UnitCreatureFamily`: nil
- `UnitCreatureType #1`: string:Humanoid
- `UnitCreatureType #2`: number:7
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitEffectiveLevel`: number:9
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: string:Alliance
- `UnitFactionGroup #2`: string:Alliance
- `UnitGUID`: string:Player-4618-017AA148
- `UnitIsDeadOrGhost`: boolean:false
- `UnitIsEnemy(player, u)`: boolean:false
- `UnitIsFriend(player, u)`: boolean:true
- `UnitIsPVP`: boolean:false
- `UnitIsPlayer`: boolean:true
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:false
- `UnitIsUnit(u, target)`: boolean:false
- `UnitLevel`: number:9
- `UnitName #1`: string:Rødhåret
- `UnitName #2`: string:Kattedame
- `UnitPower(player, Combo)`: number:0
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
- `aura HELPFUL.applications`: number:0
- `aura HELPFUL.auraInstanceID`: number:7
- `aura HELPFUL.dispelName`: string:Magic
- `aura HELPFUL.duration`: number:3600
- `aura HELPFUL.expirationTime`: number:14292.209
- `aura HELPFUL.icon`: number:136078
- `aura HELPFUL.isFromPlayerOrPlayerPet`: boolean:true
- `aura HELPFUL.isStealable`: boolean:false
- `aura HELPFUL.name`: string:Mark of the Wild
- `aura HELPFUL.sourceUnit`: string:party1
- `aura HELPFUL.spellId`: number:1126

### 8. pet | npc-friendly | combat

- `C_NamePlate.GetNamePlateForUnit`: nil
- `GetRaidTargetIndex`: nil
- `GetShapeshiftFormID`: nil
- `UnitAffectingCombat`: boolean:true
- `UnitCanAssist(player, u)`: boolean:true
- `UnitCanAttack(player, u)`: boolean:false
- `UnitCastingDuration`: nil
- `UnitCastingInfo`: nil
- `UnitCastingInfo #1`: string:Firebolt
- `UnitCastingInfo #10`: string:CastBar-6A938A58C36C107F
- `UnitCastingInfo #11`: number:0
- `UnitCastingInfo #2`: string:Firebolt
- `UnitCastingInfo #3`: number:135809
- `UnitCastingInfo #4`: number:28226561
- `UnitCastingInfo #5`: number:28228561
- `UnitCastingInfo #6`: boolean:false
- `UnitCastingInfo #7`: string:Cast-3-4615-0-860-3110-0
- `UnitCastingInfo #8`: boolean:false
- `UnitCastingInfo #9`: number:3110
- `UnitChannelInfo`: nil
- `UnitClass #1`: string:Pettsson
- `UnitClass #2`: string:WARRIOR
- `UnitClass #3`: number:1
- `UnitClassification`: string:normal
- `UnitCreatureFamily #1`: string:Fox
- `UnitCreatureFamily #2`: number:319
- `UnitCreatureType #1`: string:Beast
- `UnitCreatureType #2`: number:1
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitEffectiveLevel`: number:12
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: string:Alliance
- `UnitFactionGroup #2`: string:Alliance
- `UnitGUID`: string:Pet-0-6782-2991-247822-1
- `UnitHealthMax`: number:368
- `UnitIsDeadOrGhost`: boolean:false
- `UnitIsEnemy(player, u)`: boolean:false
- `UnitIsFriend(player, u)`: boolean:true
- `UnitIsPVP`: boolean:false
- `UnitIsPlayer`: boolean:false
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:false
- `UnitIsUnit(u, target)`: boolean:false
- `UnitLevel`: number:12
- `UnitName #1`: string:Pettsson
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
- `aura HARMFUL`: error: GetAuraDataByIndex(): Auras cannot be accessed when secret while tainted by 'ForeverProbe'
Lua Taint: ForeverProbe
- `aura HELPFUL`: error: GetAuraDataByIndex(): Auras cannot be accessed when secret while tainted by 'ForeverProbe'
Lua Taint: ForeverProbe

### 9. pet | npc-friendly | nocombat

- `C_NamePlate.GetNamePlateForUnit`: nil
- `GetRaidTargetIndex`: nil
- `GetShapeshiftFormID`: nil
- `UnitAffectingCombat`: boolean:false
- `UnitCanAssist(player, u)`: boolean:true
- `UnitCanAttack(player, u)`: boolean:false
- `UnitCastingDuration`: nil
- `UnitCastingInfo`: nil
- `UnitChannelInfo`: nil
- `UnitClass #1`: string:Pettsson
- `UnitClass #2`: string:WARRIOR
- `UnitClass #3`: number:1
- `UnitClassification`: string:normal
- `UnitCreatureFamily #1`: string:Fox
- `UnitCreatureFamily #2`: number:319
- `UnitCreatureType #1`: string:Beast
- `UnitCreatureType #2`: number:1
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitEffectiveLevel`: number:12
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: string:Alliance
- `UnitFactionGroup #2`: string:Alliance
- `UnitGUID`: string:Pet-0-6782-2991-247822-1
- `UnitHealthMax`: number:371
- `UnitIsDeadOrGhost`: boolean:false
- `UnitIsEnemy(player, u)`: boolean:false
- `UnitIsFriend(player, u)`: boolean:true
- `UnitIsPVP`: boolean:false
- `UnitIsPlayer`: boolean:false
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:false
- `UnitIsUnit(u, target)`: boolean:false
- `UnitLevel`: number:12
- `UnitName #1`: string:Pettsson
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
- `aura HARMFUL`: nil
- `aura HARMFUL.applications`: number:0
- `aura HARMFUL.auraInstanceID`: number:83
- `aura HARMFUL.dispelName`: nil
- `aura HARMFUL.duration`: number:8
- `aura HARMFUL.expirationTime`: number:18803.413
- `aura HARMFUL.icon`: number:136231
- `aura HARMFUL.isFromPlayerOrPlayerPet`: boolean:false
- `aura HARMFUL.isStealable`: boolean:false
- `aura HARMFUL.name`: string:Lacerate
- `aura HARMFUL.sourceUnit`: nil
- `aura HARMFUL.spellId`: number:5422
- `aura HELPFUL`: nil
- `aura HELPFUL.applications`: number:0
- `aura HELPFUL.auraInstanceID`: number:29
- `aura HELPFUL.dispelName`: nil
- `aura HELPFUL.duration`: number:20
- `aura HELPFUL.expirationTime`: number:9598.781
- `aura HELPFUL.icon`: number:132165
- `aura HELPFUL.isFromPlayerOrPlayerPet`: boolean:true
- `aura HELPFUL.isStealable`: boolean:false
- `aura HELPFUL.name`: string:Feed Pet Effect
- `aura HELPFUL.sourceUnit`: string:player
- `aura HELPFUL.spellId`: number:1539

### 10. player | self | combat

- `C_NamePlate.GetNamePlateForUnit`: nil
- `GetRaidTargetIndex`: nil
- `GetShapeshiftFormID`: nil
- `UnitAffectingCombat`: boolean:true
- `UnitCanAssist(player, u)`: boolean:true
- `UnitCanAttack(player, u)`: boolean:false
- `UnitCastingDuration`: nil
- `UnitCastingInfo`: nil
- `UnitCastingInfo #1`: string:Skinning
- `UnitCastingInfo #10`: string:CastBar-30CB475CA33102F6
- `UnitCastingInfo #11`: number:0
- `UnitCastingInfo #2`: string:Skinning
- `UnitCastingInfo #3`: number:134366
- `UnitCastingInfo #4`: number:11897882
- `UnitCastingInfo #5`: number:11900382
- `UnitCastingInfo #6`: boolean:false
- `UnitCastingInfo #7`: string:Cast-3-6782-2991-247822-
- `UnitCastingInfo #8`: boolean:false
- `UnitCastingInfo #9`: number:8617
- `UnitChannelInfo`: nil
- `UnitChannelInfo #1`: string:Tame Beast
- `UnitChannelInfo #10`: number:0
- `UnitChannelInfo #11`: string:CastBar-E8D1D7A87B5A71BE
- `UnitChannelInfo #2`: string:Channeling
- `UnitChannelInfo #3`: number:132164
- `UnitChannelInfo #4`: number:8823799
- `UnitChannelInfo #5`: number:8843799
- `UnitChannelInfo #6`: boolean:false
- `UnitChannelInfo #7`: boolean:true
- `UnitChannelInfo #8`: number:1515
- `UnitChannelInfo #9`: boolean:false
- `UnitClass #1`: string:Hunter
- `UnitClass #2`: string:HUNTER
- `UnitClass #3`: number:3
- `UnitClassification`: string:normal
- `UnitCreatureFamily`: nil
- `UnitCreatureType #1`: string:Humanoid
- `UnitCreatureType #2`: number:7
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitEffectiveLevel`: number:12
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: string:Alliance
- `UnitFactionGroup #2`: string:Alliance
- `UnitGUID`: string:Player-4620-017360F4
- `UnitHealthMax`: number:273
- `UnitIsDeadOrGhost`: boolean:false
- `UnitIsEnemy(player, u)`: boolean:false
- `UnitIsFriend(player, u)`: boolean:true
- `UnitIsPVP`: boolean:false
- `UnitIsPlayer`: boolean:true
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:true
- `UnitIsUnit(u, target)`: boolean:false
- `UnitLevel`: number:12
- `UnitName #1`: string:Cycladion
- `UnitName #2`: string:Highgale
- `UnitPower(player, Combo)`: number:0
- `UnitPowerMax`: number:375
- `UnitPowerMax(u, Mana)`: number:375
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
- `aura HARMFUL`: error: GetAuraDataByIndex(): Auras cannot be accessed when secret while tainted by 'ForeverProbe'
Lua Taint: ForeverProbe
- `aura HELPFUL`: error: GetAuraDataByIndex(): Auras cannot be accessed when secret while tainted by 'ForeverProbe'
Lua Taint: ForeverProbe

### 11. player | self | nocombat

- `C_NamePlate.GetNamePlateForUnit`: nil
- `GetRaidTargetIndex`: nil
- `GetShapeshiftFormID`: nil
- `UnitAffectingCombat`: boolean:false
- `UnitCanAssist(player, u)`: boolean:true
- `UnitCanAttack(player, u)`: boolean:false
- `UnitCastingDuration`: nil
- `UnitCastingInfo`: nil
- `UnitCastingInfo #1`: string:Apply Poultice
- `UnitCastingInfo #10`: string:CastBar-471FF257486CD0B9
- `UnitCastingInfo #11`: number:0
- `UnitCastingInfo #2`: string:Apply Poultice
- `UnitCastingInfo #3`: number:135928
- `UnitCastingInfo #4`: number:19687427
- `UnitCastingInfo #5`: number:19689902
- `UnitCastingInfo #6`: boolean:false
- `UnitCastingInfo #7`: string:Cast-3-6782-2991-247822-
- `UnitCastingInfo #8`: boolean:false
- `UnitCastingInfo #9`: number:1276047
- `UnitChannelInfo`: nil
- `UnitClass #1`: string:Hunter
- `UnitClass #2`: string:HUNTER
- `UnitClass #3`: number:3
- `UnitClassification`: string:normal
- `UnitCreatureFamily`: nil
- `UnitCreatureType #1`: string:Humanoid
- `UnitCreatureType #2`: number:7
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitEffectiveLevel`: number:13
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: string:Alliance
- `UnitFactionGroup #2`: string:Alliance
- `UnitGUID`: string:Player-4620-017360F4
- `UnitHealthMax`: number:290
- `UnitIsDeadOrGhost`: boolean:false
- `UnitIsEnemy(player, u)`: boolean:false
- `UnitIsFriend(player, u)`: boolean:true
- `UnitIsPVP`: boolean:false
- `UnitIsPlayer`: boolean:true
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:true
- `UnitIsUnit(u, target)`: boolean:false
- `UnitLevel`: number:13
- `UnitName #1`: string:Cycladion
- `UnitName #2`: string:Highgale
- `UnitPower(player, Combo)`: number:0
- `UnitPowerMax`: number:391
- `UnitPowerMax(u, Mana)`: number:391
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
- `aura HARMFUL.applications`: number:0
- `aura HARMFUL.auraInstanceID`: number:335
- `aura HARMFUL.dispelName`: string:Magic
- `aura HARMFUL.duration`: number:12
- `aura HARMFUL.expirationTime`: number:8675.132
- `aura HARMFUL.icon`: number:132156
- `aura HARMFUL.isFromPlayerOrPlayerPet`: boolean:false
- `aura HARMFUL.isStealable`: boolean:false
- `aura HARMFUL.name`: string:Dust Cloud
- `aura HARMFUL.sourceUnit`: nil
- `aura HARMFUL.spellId`: number:7272
- `aura HELPFUL`: nil
- `aura HELPFUL.applications`: number:0
- `aura HELPFUL.auraInstanceID`: number:349
- `aura HELPFUL.dispelName`: nil
- `aura HELPFUL.duration`: number:0
- `aura HELPFUL.expirationTime`: number:0
- `aura HELPFUL.icon`: number:136076
- `aura HELPFUL.isFromPlayerOrPlayerPet`: boolean:true
- `aura HELPFUL.isStealable`: boolean:false
- `aura HELPFUL.name`: string:Aspect of the Hawk
- `aura HELPFUL.sourceUnit`: string:player
- `aura HELPFUL.spellId`: number:13165

### 12. target | npc-friendly | combat

- `C_NamePlate.GetNamePlateForUnit`: nil
- `GetRaidTargetIndex`: nil
- `GetShapeshiftFormID`: nil
- `UnitAffectingCombat`: boolean:false
- `UnitCanAssist(player, u)`: boolean:true
- `UnitCanAttack(player, u)`: boolean:false
- `UnitCastingDuration`: nil
- `UnitCastingInfo`: nil
- `UnitChannelInfo`: nil
- `UnitClass #1`: string:Quel'ana Quickgale
- `UnitClass #2`: string:PALADIN
- `UnitClass #3`: number:2
- `UnitClassification`: string:normal
- `UnitCreatureFamily`: nil
- `UnitCreatureType #1`: string:Humanoid
- `UnitCreatureType #2`: number:7
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitEffectiveLevel`: number:10
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: nil
- `UnitFactionGroup #2`: nil
- `UnitGUID`: string:Creature-0-4615-2991-165
- `UnitIsDeadOrGhost`: boolean:false
- `UnitIsEnemy(player, u)`: boolean:false
- `UnitIsFriend(player, u)`: boolean:true
- `UnitIsPVP`: boolean:true
- `UnitIsPlayer`: boolean:false
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:false
- `UnitIsUnit(u, target)`: boolean:true
- `UnitLevel`: number:10
- `UnitName #1`: string:Quel'ana Quickgale
- `UnitName #2`: nil
- `UnitPower(player, Combo)`: number:0
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

### 13. target | npc-friendly | nocombat

- `C_NamePlate.GetNamePlateForUnit`: nil
- `GetRaidTargetIndex`: nil
- `GetShapeshiftFormID`: nil
- `UnitAffectingCombat`: boolean:false
- `UnitCanAssist(player, u)`: boolean:true
- `UnitCanAttack(player, u)`: boolean:false
- `UnitCastingDuration`: nil
- `UnitCastingInfo`: nil
- `UnitChannelInfo`: nil
- `UnitClass #1`: string:Quel'dora Quickgale
- `UnitClass #2`: string:PALADIN
- `UnitClass #3`: number:2
- `UnitClassification`: string:normal
- `UnitCreatureFamily`: nil
- `UnitCreatureFamily #1`: string:Fox
- `UnitCreatureFamily #2`: number:319
- `UnitCreatureType #1`: string:Humanoid
- `UnitCreatureType #2`: number:7
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitEffectiveLevel`: number:10
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: nil
- `UnitFactionGroup #2`: nil
- `UnitGUID`: string:Creature-0-6782-2991-247
- `UnitIsDeadOrGhost`: boolean:false
- `UnitIsEnemy(player, u)`: boolean:false
- `UnitIsFriend(player, u)`: boolean:true
- `UnitIsPVP`: boolean:true
- `UnitIsPlayer`: boolean:false
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:false
- `UnitIsUnit(u, target)`: boolean:true
- `UnitLevel`: number:10
- `UnitName #1`: string:Quel'dora Quickgale
- `UnitName #2`: nil
- `UnitPower(player, Combo)`: number:0
- `UnitPowerType #1`: number:0
- `UnitPowerType #2`: string:MANA
- `UnitPowerType #3`: nil
- `UnitPowerType #4`: nil
- `UnitPowerType #5`: nil
- `UnitRace`: nil
- `UnitReaction(u, player)`: number:5
- `UnitSex`: number:3
- `UnitThreatSituation(player, u)`: nil
- `aura HARMFUL`: nil
- `aura HARMFUL.applications`: number:0
- `aura HARMFUL.auraInstanceID`: number:5
- `aura HARMFUL.dispelName`: nil
- `aura HARMFUL.duration`: number:900
- `aura HARMFUL.expirationTime`: number:9550.615
- `aura HARMFUL.icon`: number:132164
- `aura HARMFUL.isFromPlayerOrPlayerPet`: boolean:true
- `aura HARMFUL.isStealable`: boolean:false
- `aura HARMFUL.name`: string:Tame Vuldren
- `aura HARMFUL.sourceUnit`: string:player
- `aura HARMFUL.spellId`: number:1271102
- `aura HELPFUL`: nil
- `aura HELPFUL.applications`: number:0
- `aura HELPFUL.auraInstanceID`: number:29
- `aura HELPFUL.dispelName`: nil
- `aura HELPFUL.duration`: number:20
- `aura HELPFUL.expirationTime`: number:9598.781
- `aura HELPFUL.icon`: number:132165
- `aura HELPFUL.isFromPlayerOrPlayerPet`: boolean:true
- `aura HELPFUL.isStealable`: boolean:false
- `aura HELPFUL.name`: string:Feed Pet Effect
- `aura HELPFUL.sourceUnit`: string:player
- `aura HELPFUL.spellId`: number:1539

### 14. target | npc-hostile | combat

- `C_NamePlate.GetNamePlateForUnit`: table
- `GetRaidTargetIndex`: nil
- `GetShapeshiftFormID`: nil
- `UnitAffectingCombat`: boolean:true
- `UnitCanAssist(player, u)`: boolean:false
- `UnitCanAttack(player, u)`: boolean:true
- `UnitCastingDuration`: nil
- `UnitCastingInfo`: nil
- `UnitCastingInfo #10`: string:CastBar-B72E38A993237B0E
- `UnitCastingInfo #11`: number:0
- `UnitCastingInfo #6`: boolean:false
- `UnitChannelInfo`: nil
- `UnitClass #1`: string:Al'Aketh Footsoldier
- `UnitClass #2`: string:ROGUE
- `UnitClass #3`: number:4
- `UnitClassification`: string:normal
- `UnitCreatureFamily`: nil
- `UnitCreatureFamily #1`: string:Bird of Prey
- `UnitCreatureFamily #2`: number:26
- `UnitCreatureType #1`: string:Humanoid
- `UnitCreatureType #2`: number:7
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitDetailedThreatSituation(player, u) #1`: boolean:false
- `UnitDetailedThreatSituation(player, u) #2`: number:0
- `UnitDetailedThreatSituation(player, u) #3`: number:23.846155166626
- `UnitDetailedThreatSituation(player, u) #4`: number:31
- `UnitDetailedThreatSituation(player, u) #5`: number:36
- `UnitEffectiveLevel`: number:11
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: nil
- `UnitFactionGroup #2`: nil
- `UnitGUID`: string:Creature-0-6782-2991-247
- `UnitGetIncomingHeals`: nil
- `UnitIsDeadOrGhost`: boolean:false
- `UnitIsEnemy(player, u)`: boolean:false
- `UnitIsFriend(player, u)`: boolean:false
- `UnitIsPVP`: boolean:false
- `UnitIsPlayer`: boolean:false
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:false
- `UnitIsUnit(u, target)`: boolean:true
- `UnitLevel`: number:11
- `UnitName #1`: string:Al'Aketh Footsoldier
- `UnitName #2`: nil
- `UnitPower(player, Combo)`: number:0
- `UnitPower(u, Mana)`: number:0
- `UnitPowerMax(u, Mana)`: number:0
- `UnitPowerPercent(u, Mana)`: number:0
- `UnitPowerType #1`: number:3
- `UnitPowerType #2`: string:ENERGY
- `UnitPowerType #3`: nil
- `UnitPowerType #4`: nil
- `UnitPowerType #5`: nil
- `UnitRace`: nil
- `UnitReaction(u, player)`: number:2
- `UnitSex`: number:2
- `UnitThreatSituation(player, u)`: number:0
- `aura HARMFUL`: error: GetAuraDataByIndex(): Auras cannot be accessed when secret while tainted by 'ForeverProbe'
Lua Taint: ForeverProbe
- `aura HELPFUL`: error: GetAuraDataByIndex(): Auras cannot be accessed when secret while tainted by 'ForeverProbe'
Lua Taint: ForeverProbe

### 15. target | npc-hostile | nocombat

- `C_NamePlate.GetNamePlateForUnit`: nil
- `GetRaidTargetIndex`: nil
- `GetShapeshiftFormID`: nil
- `UnitAffectingCombat`: boolean:false
- `UnitCanAssist(player, u)`: boolean:false
- `UnitCanAttack(player, u)`: boolean:true
- `UnitCastingDuration`: nil
- `UnitCastingInfo`: nil
- `UnitCastingInfo #10`: string:CastBar-7177197EEACE6DFF
- `UnitCastingInfo #11`: number:0
- `UnitCastingInfo #6`: boolean:false
- `UnitChannelInfo`: nil
- `UnitClass #1`: string:Al'Aketh Footsoldier
- `UnitClass #2`: string:ROGUE
- `UnitClass #3`: number:4
- `UnitClassification`: string:normal
- `UnitCreatureFamily`: nil
- `UnitCreatureFamily #1`: string:Bird of Prey
- `UnitCreatureFamily #2`: number:26
- `UnitCreatureType #1`: string:Humanoid
- `UnitCreatureType #2`: number:7
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitEffectiveLevel`: number:11
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: nil
- `UnitFactionGroup #2`: nil
- `UnitGUID`: string:Creature-0-6782-2991-247
- `UnitGetIncomingHeals`: nil
- `UnitIsDeadOrGhost`: boolean:true
- `UnitIsEnemy(player, u)`: boolean:false
- `UnitIsFriend(player, u)`: boolean:false
- `UnitIsPVP`: boolean:false
- `UnitIsPlayer`: boolean:false
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:false
- `UnitIsUnit(u, target)`: boolean:true
- `UnitLevel`: number:11
- `UnitName #1`: string:Al'Aketh Footsoldier
- `UnitName #2`: nil
- `UnitPower(player, Combo)`: number:0
- `UnitPower(u, Mana)`: number:0
- `UnitPowerMax(u, Mana)`: number:0
- `UnitPowerPercent(u, Mana)`: number:0
- `UnitPowerType #1`: number:3
- `UnitPowerType #2`: string:ENERGY
- `UnitPowerType #3`: nil
- `UnitPowerType #4`: nil
- `UnitPowerType #5`: nil
- `UnitRace`: nil
- `UnitReaction(u, player)`: number:2
- `UnitSex`: number:2
- `UnitThreatSituation(player, u)`: nil
- `aura HARMFUL`: nil
- `aura HARMFUL.applications`: number:0
- `aura HARMFUL.auraInstanceID`: number:1
- `aura HARMFUL.dispelName`: nil
- `aura HARMFUL.duration`: number:8
- `aura HARMFUL.expirationTime`: number:18100.554
- `aura HARMFUL.icon`: number:136231
- `aura HARMFUL.isFromPlayerOrPlayerPet`: boolean:false
- `aura HARMFUL.isStealable`: boolean:false
- `aura HARMFUL.name`: string:Lacerate
- `aura HARMFUL.sourceUnit`: string:nameplate2
- `aura HARMFUL.spellId`: number:5422
- `aura HELPFUL`: nil
- `aura HELPFUL.applications`: number:0
- `aura HELPFUL.auraInstanceID`: number:3
- `aura HELPFUL.dispelName`: nil
- `aura HELPFUL.duration`: number:0
- `aura HELPFUL.expirationTime`: number:0
- `aura HELPFUL.icon`: number:132320
- `aura HELPFUL.isFromPlayerOrPlayerPet`: boolean:false
- `aura HELPFUL.isStealable`: boolean:false
- `aura HELPFUL.name`: string:Sneak
- `aura HELPFUL.sourceUnit`: string:target
- `aura HELPFUL.spellId`: number:22766

### 16. target | npc-neutral | combat

- `C_NamePlate.GetNamePlateForUnit`: table
- `GetRaidTargetIndex`: nil
- `GetShapeshiftFormID`: nil
- `UnitAffectingCombat`: boolean:true
- `UnitCanAssist(player, u)`: boolean:false
- `UnitCanAttack(player, u)`: boolean:true
- `UnitCastingDuration`: nil
- `UnitCastingInfo`: nil
- `UnitChannelInfo`: nil
- `UnitClass #1`: string:Windsong Crawler
- `UnitClass #2`: string:WARRIOR
- `UnitClass #3`: number:1
- `UnitClassification`: string:normal
- `UnitCreatureFamily`: nil
- `UnitCreatureFamily #1`: string:Crab
- `UnitCreatureFamily #2`: number:8
- `UnitCreatureType #1`: string:Beast
- `UnitCreatureType #2`: number:1
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitDetailedThreatSituation(player, u) #1`: boolean:false
- `UnitDetailedThreatSituation(player, u) #2`: number:0
- `UnitDetailedThreatSituation(player, u) #3`: number:68.461540222168
- `UnitDetailedThreatSituation(player, u) #4`: number:89
- `UnitDetailedThreatSituation(player, u) #5`: number:97
- `UnitEffectiveLevel`: number:8
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: nil
- `UnitFactionGroup #2`: nil
- `UnitGUID`: string:Creature-0-6782-2991-247
- `UnitGetIncomingHeals`: nil
- `UnitIsDeadOrGhost`: boolean:false
- `UnitIsEnemy(player, u)`: boolean:false
- `UnitIsFriend(player, u)`: boolean:false
- `UnitIsPVP`: boolean:false
- `UnitIsPlayer`: boolean:false
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:false
- `UnitIsUnit(u, target)`: boolean:true
- `UnitLevel`: number:8
- `UnitName #1`: string:Windsong Crawler
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
- `UnitThreatSituation(player, u)`: number:0
- `aura HARMFUL`: error: GetAuraDataByIndex(): Auras cannot be accessed when secret while tainted by 'ForeverProbe'
Lua Taint: ForeverProbe
- `aura HELPFUL`: error: GetAuraDataByIndex(): Auras cannot be accessed when secret while tainted by 'ForeverProbe'
Lua Taint: ForeverProbe

### 17. target | npc-neutral | nocombat

- `C_NamePlate.GetNamePlateForUnit`: table
- `GetRaidTargetIndex`: nil
- `GetShapeshiftFormID`: nil
- `UnitAffectingCombat`: boolean:false
- `UnitCanAssist(player, u)`: boolean:false
- `UnitCanAttack(player, u)`: boolean:true
- `UnitCastingDuration`: nil
- `UnitCastingInfo`: nil
- `UnitChannelInfo`: nil
- `UnitClass #1`: string:Galestrider
- `UnitClass #2`: string:WARRIOR
- `UnitClass #3`: number:1
- `UnitClassification`: string:normal
- `UnitCreatureFamily`: nil
- `UnitCreatureFamily #1`: string:Tallstrider
- `UnitCreatureFamily #2`: number:12
- `UnitCreatureType #1`: string:Beast
- `UnitCreatureType #2`: number:1
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitDetailedThreatSituation(player, u) #1`: boolean:false
- `UnitDetailedThreatSituation(player, u) #2`: number:0
- `UnitDetailedThreatSituation(player, u) #3`: number:0
- `UnitDetailedThreatSituation(player, u) #4`: number:0
- `UnitDetailedThreatSituation(player, u) #5`: number:0
- `UnitEffectiveLevel`: number:6
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: nil
- `UnitFactionGroup #2`: nil
- `UnitGUID`: string:Creature-0-6782-2991-247
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
- `UnitName #1`: string:Galestrider
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

### 18. target | pc-friendly | nocombat

- `C_NamePlate.GetNamePlateForUnit`: nil
- `GetRaidTargetIndex`: nil
- `GetShapeshiftFormID`: nil
- `UnitAffectingCombat`: boolean:true
- `UnitCanAssist(player, u)`: boolean:true
- `UnitCanAttack(player, u)`: boolean:false
- `UnitCastingDuration`: nil
- `UnitCastingInfo`: nil
- `UnitCastingInfo #10`: string:CastBar-61C322FAB358ED97
- `UnitCastingInfo #11`: number:0
- `UnitCastingInfo #6`: boolean:false
- `UnitChannelInfo`: nil
- `UnitClass #1`: string:Druid
- `UnitClass #2`: string:DRUID
- `UnitClass #3`: number:11
- `UnitClassification`: string:normal
- `UnitCreatureFamily`: nil
- `UnitCreatureType #1`: string:Humanoid
- `UnitCreatureType #2`: number:7
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitEffectiveLevel`: number:11
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: string:Alliance
- `UnitFactionGroup #2`: string:Alliance
- `UnitGUID`: string:Player-4620-01750704
- `UnitIsDeadOrGhost`: boolean:false
- `UnitIsEnemy(player, u)`: boolean:false
- `UnitIsFriend(player, u)`: boolean:true
- `UnitIsPVP`: boolean:false
- `UnitIsPlayer`: boolean:true
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:false
- `UnitIsUnit(u, target)`: boolean:true
- `UnitLevel`: number:11
- `UnitName #1`: string:Dræbergardin
- `UnitName #2`: string:Blæsemedicin
- `UnitPower(player, Combo)`: number:0
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
- `aura HARMFUL.applications`: number:0
- `aura HARMFUL.auraInstanceID`: number:1
- `aura HARMFUL.dispelName`: nil
- `aura HARMFUL.duration`: number:600
- `aura HARMFUL.expirationTime`: number:3533.998
- `aura HARMFUL.icon`: number:136147
- `aura HARMFUL.isFromPlayerOrPlayerPet`: boolean:true
- `aura HARMFUL.isStealable`: boolean:false
- `aura HARMFUL.name`: string:Resurrection Sickness
- `aura HARMFUL.sourceUnit`: string:target
- `aura HARMFUL.spellId`: number:15007
- `aura HELPFUL.applications`: number:0
- `aura HELPFUL.auraInstanceID`: number:17
- `aura HELPFUL.dispelName`: string:Magic
- `aura HELPFUL.duration`: number:600
- `aura HELPFUL.expirationTime`: number:16883.584
- `aura HELPFUL.icon`: number:136104
- `aura HELPFUL.isFromPlayerOrPlayerPet`: boolean:true
- `aura HELPFUL.isStealable`: boolean:false
- `aura HELPFUL.name`: string:Thorns
- `aura HELPFUL.sourceUnit`: string:target
- `aura HELPFUL.spellId`: number:467

### 19. target | self | nocombat

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
- `UnitEffectiveLevel`: number:10
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: string:Alliance
- `UnitFactionGroup #2`: string:Alliance
- `UnitGUID`: string:Player-4620-017360F4
- `UnitHealthMax`: number:269
- `UnitIsDeadOrGhost`: boolean:false
- `UnitIsEnemy(player, u)`: boolean:false
- `UnitIsFriend(player, u)`: boolean:true
- `UnitIsPVP`: boolean:false
- `UnitIsPlayer`: boolean:true
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:true
- `UnitIsUnit(u, target)`: boolean:true
- `UnitLevel`: number:10
- `UnitName #1`: string:Cycladion
- `UnitName #2`: string:Highgale
- `UnitPower(player, Combo)`: number:0
- `UnitPowerMax`: number:316
- `UnitPowerMax(u, Mana)`: number:316
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
- `aura HELPFUL.auraInstanceID`: number:315
- `aura HELPFUL.dispelName`: nil
- `aura HELPFUL.duration`: number:0
- `aura HELPFUL.expirationTime`: number:0
- `aura HELPFUL.icon`: number:132159
- `aura HELPFUL.isFromPlayerOrPlayerPet`: boolean:true
- `aura HELPFUL.isStealable`: boolean:false
- `aura HELPFUL.name`: string:Aspect of the Monkey
- `aura HELPFUL.sourceUnit`: string:player
- `aura HELPFUL.spellId`: number:13163

### 20. targettarget | npc-friendly | combat

- `C_NamePlate.GetNamePlateForUnit`: error: Interface/AddOns/ForeverProbe/ForeverProbe.lua:171: bad argument #1 to 'GetNamePlateForUnit' (Target-of-target unit tokens are not allowed for this call. - Usage: local nameplate = C_NamePlate.GetNamePlateForUnit(unitToken [, includeForbidden]))
- `GetRaidTargetIndex`: nil
- `GetShapeshiftFormID`: nil
- `UnitAffectingCombat`: boolean:true
- `UnitCanAssist(player, u)`: boolean:true
- `UnitCanAttack(player, u)`: boolean:false
- `UnitCastingDuration`: nil
- `UnitCastingInfo`: nil
- `UnitCastingInfo #1`: string:Firebolt
- `UnitCastingInfo #10`: string:CastBar-B319762AA7A3B33
- `UnitCastingInfo #11`: number:0
- `UnitCastingInfo #2`: string:Firebolt
- `UnitCastingInfo #3`: number:135809
- `UnitCastingInfo #4`: number:28124348
- `UnitCastingInfo #5`: number:28126348
- `UnitCastingInfo #6`: boolean:false
- `UnitCastingInfo #7`: string:Cast-3-4615-0-860-3110-0
- `UnitCastingInfo #8`: boolean:false
- `UnitCastingInfo #9`: number:3110
- `UnitChannelInfo`: nil
- `UnitClass #1`: string:Pettsson
- `UnitClass #2`: string:WARRIOR
- `UnitClass #3`: number:1
- `UnitClassification`: string:normal
- `UnitCreatureFamily #1`: string:Fox
- `UnitCreatureFamily #2`: number:319
- `UnitCreatureType #1`: string:Beast
- `UnitCreatureType #2`: number:1
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitEffectiveLevel`: number:12
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: string:Alliance
- `UnitFactionGroup #2`: string:Alliance
- `UnitGUID`: string:Pet-0-6782-2991-247822-1
- `UnitHealthMax`: number:368
- `UnitIsDeadOrGhost`: boolean:false
- `UnitIsEnemy(player, u)`: boolean:false
- `UnitIsFriend(player, u)`: boolean:true
- `UnitIsPVP`: boolean:false
- `UnitIsPlayer`: boolean:false
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:false
- `UnitIsUnit(u, target)`: boolean:false
- `UnitLevel`: number:12
- `UnitName #1`: string:Pettsson
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
- `aura HARMFUL`: error: GetAuraDataByIndex(): Auras cannot be accessed when secret while tainted by 'ForeverProbe'
Lua Taint: ForeverProbe
- `aura HELPFUL`: error: GetAuraDataByIndex(): Auras cannot be accessed when secret while tainted by 'ForeverProbe'
Lua Taint: ForeverProbe

### 21. targettarget | npc-friendly | nocombat

- `C_NamePlate.GetNamePlateForUnit`: error: Interface/AddOns/ForeverProbe/ForeverProbe.lua:171: bad argument #1 to 'GetNamePlateForUnit' (Target-of-target unit tokens are not allowed for this call. - Usage: local nameplate = C_NamePlate.GetNamePlateForUnit(unitToken [, includeForbidden]))
- `GetRaidTargetIndex`: nil
- `GetShapeshiftFormID`: nil
- `UnitAffectingCombat`: boolean:false
- `UnitCanAssist(player, u)`: boolean:true
- `UnitCanAttack(player, u)`: boolean:false
- `UnitCastingDuration`: nil
- `UnitCastingInfo`: nil
- `UnitChannelInfo`: nil
- `UnitClass #1`: string:Razzle Sprysprocket
- `UnitClass #2`: string:WARRIOR
- `UnitClass #3`: number:1
- `UnitClassification`: string:normal
- `UnitCreatureFamily`: nil
- `UnitCreatureType #1`: string:Humanoid
- `UnitCreatureType #2`: number:7
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitEffectiveLevel`: number:20
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: string:Alliance
- `UnitFactionGroup #2`: string:Alliance
- `UnitGUID`: string:Creature-0-4615-0-860-12
- `UnitIsDeadOrGhost`: boolean:false
- `UnitIsEnemy(player, u)`: boolean:false
- `UnitIsFriend(player, u)`: boolean:true
- `UnitIsPVP`: boolean:true
- `UnitIsPlayer`: boolean:false
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:false
- `UnitIsUnit(u, target)`: boolean:false
- `UnitLevel`: number:20
- `UnitName #1`: string:Razzle Sprysprocket
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

### 22. targettarget | npc-hostile | combat

- `C_NamePlate.GetNamePlateForUnit`: error: Interface/AddOns/ForeverProbe/ForeverProbe.lua:171: bad argument #1 to 'GetNamePlateForUnit' (Target-of-target unit tokens are not allowed for this call. - Usage: local nameplate = C_NamePlate.GetNamePlateForUnit(unitToken [, includeForbidden]))
- `GetRaidTargetIndex`: nil
- `GetShapeshiftFormID`: nil
- `UnitAffectingCombat`: boolean:false
- `UnitCanAssist(player, u)`: boolean:false
- `UnitCanAttack(player, u)`: boolean:true
- `UnitCastingDuration`: nil
- `UnitCastingInfo`: nil
- `UnitCastingInfo #10`: string:CastBar-BC4EC684B3EC3CD4
- `UnitCastingInfo #11`: number:0
- `UnitCastingInfo #6`: boolean:false
- `UnitChannelInfo`: nil
- `UnitClass #1`: string:Shadowgale Shriekling
- `UnitClass #2`: string:WARRIOR
- `UnitClass #3`: number:1
- `UnitClassification`: string:normal
- `UnitCreatureFamily`: nil
- `UnitCreatureFamily #1`: string:Bird of Prey
- `UnitCreatureFamily #2`: number:26
- `UnitCreatureType #1`: string:Beast
- `UnitCreatureType #2`: number:1
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitEffectiveLevel`: number:10
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: nil
- `UnitFactionGroup #2`: nil
- `UnitGUID`: string:Creature-0-6782-2991-247
- `UnitGetIncomingHeals`: nil
- `UnitIsDeadOrGhost`: boolean:true
- `UnitIsEnemy(player, u)`: boolean:false
- `UnitIsFriend(player, u)`: boolean:false
- `UnitIsPVP`: boolean:false
- `UnitIsPlayer`: boolean:false
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:false
- `UnitIsUnit(u, target)`: boolean:false
- `UnitLevel`: number:10
- `UnitName #1`: string:Shadowgale Shriekling
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
- `aura HARMFUL`: error: GetAuraDataByIndex(): Auras cannot be accessed when secret while tainted by 'ForeverProbe'
Lua Taint: ForeverProbe
- `aura HELPFUL`: error: GetAuraDataByIndex(): Auras cannot be accessed when secret while tainted by 'ForeverProbe'
Lua Taint: ForeverProbe

### 23. targettarget | npc-hostile | nocombat

- `C_NamePlate.GetNamePlateForUnit`: error: Interface/AddOns/ForeverProbe/ForeverProbe.lua:171: bad argument #1 to 'GetNamePlateForUnit' (Target-of-target unit tokens are not allowed for this call. - Usage: local nameplate = C_NamePlate.GetNamePlateForUnit(unitToken [, includeForbidden]))
- `GetRaidTargetIndex`: nil
- `GetShapeshiftFormID`: nil
- `UnitAffectingCombat`: boolean:true
- `UnitCanAssist(player, u)`: boolean:false
- `UnitCanAttack(player, u)`: boolean:true
- `UnitCastingDuration`: nil
- `UnitCastingInfo`: nil
- `UnitChannelInfo`: nil
- `UnitClass #1`: string:Shadowgale Shriekling
- `UnitClass #2`: string:WARRIOR
- `UnitClass #3`: number:1
- `UnitClassification`: string:normal
- `UnitCreatureFamily`: nil
- `UnitCreatureFamily #1`: string:Bird of Prey
- `UnitCreatureFamily #2`: number:26
- `UnitCreatureType #1`: string:Beast
- `UnitCreatureType #2`: number:1
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitEffectiveLevel`: number:10
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: nil
- `UnitFactionGroup #2`: nil
- `UnitGUID`: string:Creature-0-6782-2991-247
- `UnitGetIncomingHeals`: nil
- `UnitIsDeadOrGhost`: boolean:false
- `UnitIsEnemy(player, u)`: boolean:false
- `UnitIsFriend(player, u)`: boolean:false
- `UnitIsPVP`: boolean:false
- `UnitIsPlayer`: boolean:false
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:false
- `UnitIsUnit(u, target)`: boolean:false
- `UnitLevel`: number:10
- `UnitName #1`: string:Shadowgale Shriekling
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
- `aura HARMFUL.applications`: number:0
- `aura HARMFUL.auraInstanceID`: number:1
- `aura HARMFUL.dispelName`: string:Magic
- `aura HARMFUL.duration`: number:9
- `aura HARMFUL.expirationTime`: number:16298.356
- `aura HARMFUL.icon`: number:136096
- `aura HARMFUL.isFromPlayerOrPlayerPet`: boolean:true
- `aura HARMFUL.isStealable`: boolean:false
- `aura HARMFUL.name`: string:Moonfire
- `aura HARMFUL.sourceUnit`: string:target
- `aura HARMFUL.spellId`: number:8921
- `aura HELPFUL`: nil
- `aura HELPFUL.applications`: number:0
- `aura HELPFUL.auraInstanceID`: number:1
- `aura HELPFUL.dispelName`: nil
- `aura HELPFUL.duration`: number:0
- `aura HELPFUL.expirationTime`: number:0
- `aura HELPFUL.icon`: number:4630415
- `aura HELPFUL.isFromPlayerOrPlayerPet`: boolean:false
- `aura HELPFUL.isStealable`: boolean:false
- `aura HELPFUL.name`: string:Newborn Shriekling
- `aura HELPFUL.sourceUnit`: string:nameplate1
- `aura HELPFUL.spellId`: number:1259630

### 24. targettarget | pc-friendly | nocombat

- `C_NamePlate.GetNamePlateForUnit`: error: Interface/AddOns/ForeverProbe/ForeverProbe.lua:171: bad argument #1 to 'GetNamePlateForUnit' (Target-of-target unit tokens are not allowed for this call. - Usage: local nameplate = C_NamePlate.GetNamePlateForUnit(unitToken [, includeForbidden]))
- `GetRaidTargetIndex`: nil
- `GetShapeshiftFormID`: nil
- `UnitAffectingCombat`: boolean:true
- `UnitCanAssist(player, u)`: boolean:true
- `UnitCanAttack(player, u)`: boolean:false
- `UnitCastingDuration`: nil
- `UnitCastingInfo`: nil
- `UnitChannelInfo`: nil
- `UnitClass #1`: string:Priest
- `UnitClass #2`: string:PRIEST
- `UnitClass #3`: number:5
- `UnitClassification`: string:normal
- `UnitCreatureFamily`: nil
- `UnitCreatureType #1`: string:Humanoid
- `UnitCreatureType #2`: number:7
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitEffectiveLevel`: number:10
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: string:Alliance
- `UnitFactionGroup #2`: string:Alliance
- `UnitGUID`: string:Player-4620-01586361
- `UnitIsDeadOrGhost`: boolean:false
- `UnitIsEnemy(player, u)`: boolean:false
- `UnitIsFriend(player, u)`: boolean:true
- `UnitIsPVP`: boolean:false
- `UnitIsPlayer`: boolean:true
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:false
- `UnitIsUnit(u, target)`: boolean:false
- `UnitLevel`: number:10
- `UnitName #1`: string:Bowlingkugle
- `UnitName #2`: string:Hoved
- `UnitPower(player, Combo)`: number:0
- `UnitPowerType #1`: number:0
- `UnitPowerType #2`: string:MANA
- `UnitPowerType #3`: nil
- `UnitPowerType #4`: nil
- `UnitPowerType #5`: nil
- `UnitRace #1`: string:Gnome
- `UnitRace #2`: string:Gnome
- `UnitRace #3`: number:7
- `UnitReaction(u, player)`: number:5
- `UnitSex`: number:2
- `UnitThreatSituation(player, u)`: nil
- `aura HARMFUL.applications`: number:0
- `aura HARMFUL.auraInstanceID`: number:19
- `aura HARMFUL.dispelName`: nil
- `aura HARMFUL.duration`: number:15
- `aura HARMFUL.expirationTime`: number:28081.216
- `aura HARMFUL.icon`: number:135871
- `aura HARMFUL.isFromPlayerOrPlayerPet`: boolean:true
- `aura HARMFUL.isStealable`: boolean:false
- `aura HARMFUL.name`: string:Weakened Soul
- `aura HARMFUL.sourceUnit`: string:targettarget
- `aura HARMFUL.spellId`: number:6788
- `aura HELPFUL.applications`: number:0
- `aura HELPFUL.auraInstanceID`: number:1
- `aura HELPFUL.dispelName`: nil
- `aura HELPFUL.duration`: number:0
- `aura HELPFUL.expirationTime`: number:0
- `aura HELPFUL.icon`: number:133939
- `aura HELPFUL.isFromPlayerOrPlayerPet`: boolean:true
- `aura HELPFUL.isStealable`: boolean:false
- `aura HELPFUL.name`: string:Find Herbs
- `aura HELPFUL.sourceUnit`: string:targettarget
- `aura HELPFUL.spellId`: number:2383

### 25. targettarget | self | combat

- `C_NamePlate.GetNamePlateForUnit`: error: Interface/AddOns/ForeverProbe/ForeverProbe.lua:171: bad argument #1 to 'GetNamePlateForUnit' (Target-of-target unit tokens are not allowed for this call. - Usage: local nameplate = C_NamePlate.GetNamePlateForUnit(unitToken [, includeForbidden]))
- `GetRaidTargetIndex`: nil
- `GetShapeshiftFormID`: nil
- `UnitAffectingCombat`: boolean:true
- `UnitCanAssist(player, u)`: boolean:true
- `UnitCanAttack(player, u)`: boolean:false
- `UnitCastingDuration`: nil
- `UnitCastingInfo`: nil
- `UnitCastingInfo #1`: string:Smack Flutterfly
- `UnitCastingInfo #10`: string:CastBar-75DB37D10CFAB778
- `UnitCastingInfo #11`: number:0
- `UnitCastingInfo #2`: string:Smack Flutterfly
- `UnitCastingInfo #3`: number:135860
- `UnitCastingInfo #4`: number:7083042
- `UnitCastingInfo #5`: number:7084329
- `UnitCastingInfo #6`: boolean:false
- `UnitCastingInfo #7`: string:Cast-3-4615-2991-165107-
- `UnitCastingInfo #8`: boolean:true
- `UnitCastingInfo #9`: number:1257010
- `UnitChannelInfo`: nil
- `UnitChannelInfo #1`: string:Tame Beast
- `UnitChannelInfo #10`: number:0
- `UnitChannelInfo #11`: string:CastBar-ACD36963A525117F
- `UnitChannelInfo #2`: string:Channeling
- `UnitChannelInfo #3`: number:132164
- `UnitChannelInfo #4`: number:8823799
- `UnitChannelInfo #5`: number:8843799
- `UnitChannelInfo #6`: boolean:false
- `UnitChannelInfo #7`: boolean:true
- `UnitChannelInfo #8`: number:1515
- `UnitChannelInfo #9`: boolean:false
- `UnitClass #1`: string:Hunter
- `UnitClass #2`: string:HUNTER
- `UnitClass #3`: number:3
- `UnitClassification`: string:normal
- `UnitCreatureFamily`: nil
- `UnitCreatureType #1`: string:Humanoid
- `UnitCreatureType #2`: number:7
- `UnitDetailedThreatSituation(player, u)`: nil
- `UnitEffectiveLevel`: number:12
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: string:Alliance
- `UnitFactionGroup #2`: string:Alliance
- `UnitGUID`: string:Player-4620-017360F4
- `UnitHealthMax`: number:273
- `UnitIsDeadOrGhost`: boolean:false
- `UnitIsEnemy(player, u)`: boolean:false
- `UnitIsFriend(player, u)`: boolean:true
- `UnitIsPVP`: boolean:false
- `UnitIsPlayer`: boolean:true
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:true
- `UnitIsUnit(u, target)`: boolean:false
- `UnitLevel`: number:12
- `UnitName #1`: string:Cycladion
- `UnitName #2`: string:Highgale
- `UnitPower(player, Combo)`: number:0
- `UnitPowerMax`: number:375
- `UnitPowerMax(u, Mana)`: number:375
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
- `aura HARMFUL`: error: GetAuraDataByIndex(): Auras cannot be accessed when secret while tainted by 'ForeverProbe'
Lua Taint: ForeverProbe
- `aura HELPFUL`: error: GetAuraDataByIndex(): Auras cannot be accessed when secret while tainted by 'ForeverProbe'
Lua Taint: ForeverProbe

### 26. targettarget | self | nocombat

- `C_NamePlate.GetNamePlateForUnit`: error: Interface/AddOns/ForeverProbe/ForeverProbe.lua:171: bad argument #1 to 'GetNamePlateForUnit' (Target-of-target unit tokens are not allowed for this call. - Usage: local nameplate = C_NamePlate.GetNamePlateForUnit(unitToken [, includeForbidden]))
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
- `UnitEffectiveLevel`: number:10
- `UnitExists`: boolean:true
- `UnitFactionGroup #1`: string:Alliance
- `UnitFactionGroup #2`: string:Alliance
- `UnitGUID`: string:Player-4620-017360F4
- `UnitHealthMax`: number:269
- `UnitIsDeadOrGhost`: boolean:false
- `UnitIsEnemy(player, u)`: boolean:false
- `UnitIsFriend(player, u)`: boolean:true
- `UnitIsPVP`: boolean:false
- `UnitIsPlayer`: boolean:true
- `UnitIsTapDenied`: boolean:false
- `UnitIsUnit(u, player)`: boolean:true
- `UnitIsUnit(u, target)`: boolean:true
- `UnitLevel`: number:10
- `UnitName #1`: string:Cycladion
- `UnitName #2`: string:Highgale
- `UnitPower(player, Combo)`: number:0
- `UnitPowerMax`: number:316
- `UnitPowerMax(u, Mana)`: number:316
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
- `aura HELPFUL.auraInstanceID`: number:315
- `aura HELPFUL.dispelName`: nil
- `aura HELPFUL.duration`: number:0
- `aura HELPFUL.expirationTime`: number:0
- `aura HELPFUL.icon`: number:132159
- `aura HELPFUL.isFromPlayerOrPlayerPet`: boolean:true
- `aura HELPFUL.isStealable`: boolean:false
- `aura HELPFUL.name`: string:Aspect of the Monkey
- `aura HELPFUL.sourceUnit`: string:player
- `aura HELPFUL.spellId`: number:13163
