# Event arguments, build 1.60.1.70338

Client 1.60.1 (build 70338, Oct  9 2026), Interface 16001.

Each line is one argument pattern and how often it came. Unit and power tokens are shown as values, everything else as its type. SECRET marks a secret argument.

## ACTION_RANGE_CHECK_UPDATE

combat, 300 recorded:

- 300x `number, boolean, boolean`

nocombat, 300 recorded:

- 300x `number, boolean, boolean`

## BAG_UPDATE_DELAYED

combat, 300 recorded:

- 300x `(none)`

nocombat, 300 recorded:

- 300x `(none)`

## CHAT_MSG_CHANNEL

combat, 12 recorded:

- 12x `string, string, string, string, string, string, number, number, string, number, number, string, number, boolean, boolean, boolean`

nocombat, 277 recorded:

- 277x `string, string, string, string, string, string, number, number, string, number, number, string, number, boolean, boolean, boolean`

## CHAT_MSG_COMBAT_XP_GAIN

combat, 227 recorded:

- 227x `string, string, string, string, string, string, number, number, string, number, number, nil, number, boolean, boolean, boolean`

nocombat, 54 recorded:

- 54x `string, string, string, string, string, string, number, number, string, number, number, nil, number, boolean, boolean, boolean`

## CHAT_MSG_LOOT

combat, 24 recorded:

- 24x `string, string, string, string, string, string, number, number, string, number, number, string, number, boolean, boolean, boolean`

nocombat, 300 recorded:

- 300x `string, string, string, string, string, string, number, number, string, number, number, string, number, boolean, boolean, boolean`

## CHAT_MSG_MONSTER_SAY

combat, 10 recorded:

- 10x `string, string, string, string, string, string, number, number, string, number, number, nil, number, boolean, boolean, boolean`

nocombat, 43 recorded:

- 43x `string, string, string, string, string, string, number, number, string, number, number, nil, number, boolean, boolean, boolean`

## CHAT_MSG_MONSTER_YELL

nocombat, 5 recorded:

- 5x `string, string, string, string, string, string, number, number, string, number, number, nil, number, boolean, boolean, boolean`

## CHAT_MSG_SAY

nocombat, 6 recorded:

- 6x `string, string, string, string, string, string, number, number, string, number, number, string, number, boolean, boolean, boolean`

## CHAT_MSG_SYSTEM

combat, 6 recorded:

- 6x `string, string, string, string, string, string, number, number, string, number, number, nil, number, boolean, boolean, boolean`

nocombat, 251 recorded:

- 251x `string, string, string, string, string, string, number, number, string, number, number, nil, number, boolean, boolean, boolean`

## CHAT_MSG_WHISPER

nocombat, 2 recorded:

- 2x `string, string, string, string, string, string, number, number, string, number, number, string, number, boolean, boolean, boolean`

## COMBAT_TEXT_UPDATE

combat, 300 recorded:

- 300x `string`

nocombat, 215 recorded:

- 215x `string`

## LOOT_READY

combat, 44 recorded:

- 44x `boolean`

nocombat, 300 recorded:

- 300x `boolean`

## NAME_PLATE_UNIT_ADDED

combat, 243 recorded:

- 243x `nameplateN`

nocombat, 300 recorded:

- 300x `nameplateN`

## NAME_PLATE_UNIT_REMOVED

combat, 300 recorded:

- 300x `nameplateN`

nocombat, 300 recorded:

- 300x `nameplateN`

## PLAYER_REGEN_DISABLED

nocombat, 220 recorded:

- 220x `(none)`

## PLAYER_REGEN_ENABLED

nocombat, 220 recorded:

- 220x `(none)`

## PLAYER_TARGET_CHANGED

combat, 300 recorded:

- 300x `(none)`

nocombat, 300 recorded:

- 300x `(none)`

## QUEST_LOG_UPDATE

combat, 40 recorded:

- 40x `(none)`

nocombat, 300 recorded:

- 300x `(none)`

## QUEST_WATCH_UPDATE

combat, 52 recorded:

- 52x `number`

nocombat, 135 recorded:

- 135x `number`

## RAID_TARGET_UPDATE

nocombat, 12 recorded:

- 12x `(none)`

## SPELL_UPDATE_COOLDOWN

combat, 300 recorded:

- 1x `number, nil, nil, nil, nil`
- 297x `number, nil, number, number, nil`
- 2x `number, nil, number, number, number`

nocombat, 300 recorded:

- 20x `nil, nil, nil, nil, nil`
- 133x `number, nil, nil, nil, nil`
- 135x `number, nil, number, number, nil`
- 12x `number, nil, number, number, number`

## SPELL_UPDATE_USABLE

combat, 300 recorded:

- 300x `(none)`

nocombat, 300 recorded:

- 300x `(none)`

## UI_ERROR_MESSAGE

combat, 142 recorded:

- 142x `number, string`

nocombat, 207 recorded:

- 207x `number, string`

## UNIT_AURA

combat, 300 recorded:

- 132x `nameplateN, table`
- 9x `partyN, table`
- 12x `player, table`
- 32x `softenemy, table`
- 105x `target, table`
- 10x `targettarget, table`

nocombat, 300 recorded:

- 22x `nameplateN, table`
- 128x `partyN, table`
- 6x `pet, table`
- 76x `player, table`
- 3x `softenemy, table`
- 23x `softfriend, table`
- 32x `target, table`
- 10x `targettarget, table`

## UNIT_COMBAT

combat, 300 recorded:

- 2x `nameplateN, MISS, string, number, number`
- 1x `nameplateN, PARRY, string, number, number`
- 109x `nameplateN, WOUND, string, number, number`
- 3x `partyN, DODGE, string, number, number`
- 1x `partyN, HEAL, string, number, number`
- 12x `partyN, WOUND, string, number, number`
- 2x `player, DODGE, string, number, number`
- 1x `player, MISS, string, number, number`
- 27x `player, WOUND, string, number, number`
- 10x `softenemy, WOUND, string, number, number`
- 2x `target, MISS, string, number, number`
- 1x `target, PARRY, string, number, number`
- 99x `target, WOUND, string, number, number`
- 2x `targettarget, DODGE, string, number, number`
- 1x `targettarget, MISS, string, number, number`
- 27x `targettarget, WOUND, string, number, number`

nocombat, 300 recorded:

- 1x `nameplateN, DODGE, string, number, number`
- 1x `nameplateN, MISS, string, number, number`
- 2x `nameplateN, PARRY, string, number, number`
- 63x `nameplateN, WOUND, string, number, number`
- 1x `partyN, DODGE, string, number, number`
- 55x `partyN, HEAL, string, number, number`
- 14x `partyN, MISS, string, number, number`
- 1x `partyN, PARRY, string, number, number`
- 106x `partyN, WOUND, string, number, number`
- 1x `player, WOUND, string, number, number`
- 14x `softfriend, HEAL, string, number, number`
- 3x `softfriend, WOUND, string, number, number`
- 15x `target, HEAL, string, number, number`
- 9x `target, WOUND, string, number, number`
- 1x `targettarget, MISS, string, number, number`
- 1x `targettarget, PARRY, string, number, number`
- 12x `targettarget, WOUND, string, number, number`

## UNIT_DISPLAYPOWER

nocombat, 4 recorded:

- 2x `softfriend`
- 2x `target`

## UNIT_FACTION

combat, 72 recorded:

- 18x `nameplateN`
- 8x `pet`
- 18x `softenemy`
- 16x `target`
- 12x `targettarget`

nocombat, 149 recorded:

- 47x `nameplateN`
- 1x `npc`
- 12x `partyN`
- 4x `pet`
- 44x `player`
- 2x `softenemy`
- 8x `softfriend`
- 26x `target`
- 5x `targettarget`

## UNIT_HEALTH

combat, 300 recorded:

- 108x `nameplateN`
- 20x `partyN`
- 1x `pet`
- 39x `player`
- 2x `softenemy`
- 91x `target`
- 39x `targettarget`

nocombat, 300 recorded:

- 48x `nameplateN`
- 184x `partyN`
- 38x `player`
- 11x `softfriend`
- 14x `target`
- 5x `targettarget`

## UNIT_LEVEL

combat, 5 recorded:

- 1x `partyN`
- 2x `pet`
- 2x `player`

nocombat, 5 recorded:

- 1x `partyN`
- 1x `pet`
- 3x `player`

## UNIT_MAXHEALTH

combat, 14 recorded:

- 2x `partyN`
- 4x `pet`
- 8x `player`

nocombat, 135 recorded:

- 9x `nameplateN`
- 4x `npc`
- 11x `partyN`
- 35x `pet`
- 44x `player`
- 2x `softenemy`
- 7x `softfriend`
- 20x `target`
- 3x `targettarget`

## UNIT_MAXPOWER

combat, 2 recorded:

- 2x `player, MANA`

nocombat, 11 recorded:

- 1x `partyN, MANA`
- 1x `pet, MANA`
- 8x `player, MANA`
- 1x `targettarget, MANA`

## UNIT_NAME_UPDATE

nocombat, 6 recorded:

- 5x `pet`
- 1x `target`

## UNIT_POWER_FREQUENT

combat, 300 recorded:

- 16x `partyN, COMBO_POINTS`
- 21x `partyN, ENERGY`
- 24x `partyN, MANA`
- 35x `partyN, RAGE`
- 109x `player, MANA`
- 95x `targettarget, MANA`

nocombat, 300 recorded:

- 6x `partyN, MANA`
- 210x `player, MANA`
- 4x `softfriend, ENERGY`
- 20x `softfriend, MANA`
- 4x `target, ENERGY`
- 20x `target, MANA`
- 36x `targettarget, MANA`

## UNIT_POWER_UPDATE

combat, 300 recorded:

- 11x `partyN, COMBO_POINTS`
- 20x `partyN, ENERGY`
- 23x `partyN, MANA`
- 32x `partyN, RAGE`
- 70x `pet, MANA`
- 79x `player, MANA`
- 65x `targettarget, MANA`

nocombat, 300 recorded:

- 10x `partyN, COMBO_POINTS`
- 35x `partyN, ENERGY`
- 80x `partyN, MANA`
- 25x `partyN, RAGE`
- 68x `player, MANA`
- 2x `softfriend, ENERGY`
- 19x `softfriend, MANA`
- 9x `softfriend, RAGE`
- 2x `target, COMBO_POINTS`
- 7x `target, ENERGY`
- 19x `target, MANA`
- 9x `target, RAGE`
- 7x `targettarget, MANA`
- 8x `targettarget, RAGE`

## UNIT_SPELLCAST_CHANNEL_START

combat, 2 recorded:

- 1x `player, nil, number, string`
- 1x `targettarget, nil, number, string`

nocombat, 11 recorded:

- 2x `partyN, nil, SECRET, string`
- 5x `player, nil, number, string`
- 2x `softfriend, nil, SECRET, string`
- 2x `target, nil, SECRET, string`

## UNIT_SPELLCAST_CHANNEL_STOP

combat, 8 recorded:

- 4x `player, nil, number, nil, string`
- 4x `targettarget, nil, number, nil, string`

nocombat, 4 recorded:

- 1x `partyN, nil, SECRET, nil, string`
- 1x `player, nil, number, nil, string`
- 1x `softfriend, nil, SECRET, nil, string`
- 1x `target, nil, SECRET, nil, string`

## UNIT_SPELLCAST_INTERRUPTED

combat, 90 recorded:

- 7x `nameplateN, SECRET, SECRET, nil, string`
- 10x `pet, string, number, nil, string`
- 31x `player, string, number, nil, nil`
- 6x `player, string, number, nil, string`
- 6x `softenemy, SECRET, SECRET, nil, string`
- 7x `target, SECRET, SECRET, nil, string`
- 2x `targettarget, SECRET, SECRET, nil, string`
- 17x `targettarget, string, number, nil, nil`
- 4x `targettarget, string, number, nil, string`

nocombat, 15 recorded:

- 1x `pet, string, number, nil, string`
- 9x `player, string, number, nil, nil`
- 3x `player, string, number, nil, string`
- 1x `softfriend, SECRET, SECRET, nil, string`
- 1x `target, SECRET, SECRET, nil, string`

## UNIT_SPELLCAST_START

combat, 300 recorded:

- 17x `nameplateN, SECRET, SECRET, string`
- 3x `partyN, SECRET, SECRET, string`
- 153x `pet, string, number, string`
- 1x `player, nil, number, string`
- 51x `player, string, number, string`
- 9x `softenemy, SECRET, SECRET, string`
- 17x `target, SECRET, SECRET, string`
- 49x `targettarget, string, number, string`

nocombat, 213 recorded:

- 3x `nameplateN, SECRET, SECRET, string`
- 12x `partyN, SECRET, SECRET, string`
- 1x `partyN, nil, SECRET, string`
- 3x `pet, string, number, string`
- 185x `player, string, number, string`
- 4x `softfriend, SECRET, SECRET, string`
- 4x `target, SECRET, SECRET, string`
- 1x `targettarget, SECRET, SECRET, string`

## UNIT_SPELLCAST_STOP

combat, 300 recorded:

- 12x `nameplateN, SECRET, SECRET, string`
- 3x `partyN, SECRET, SECRET, string`
- 155x `pet, string, number, string`
- 62x `player, string, number, string`
- 3x `softenemy, SECRET, SECRET, string`
- 11x `target, SECRET, SECRET, string`
- 54x `targettarget, string, number, string`

nocombat, 199 recorded:

- 2x `nameplateN, SECRET, SECRET, string`
- 12x `partyN, SECRET, SECRET, string`
- 1x `pet, string, number, string`
- 173x `player, string, number, string`
- 4x `softfriend, SECRET, SECRET, string`
- 5x `target, SECRET, SECRET, string`
- 2x `targettarget, SECRET, SECRET, string`

## UNIT_SPELLCAST_SUCCEEDED

combat, 300 recorded:

- 3x `partyN, SECRET, SECRET, string`
- 139x `pet, string, number, string`
- 31x `player, string, number, nil`
- 53x `player, string, number, string`
- 27x `targettarget, string, number, nil`
- 47x `targettarget, string, number, string`

nocombat, 300 recorded:

- 2x `nameplateN, SECRET, SECRET, string`
- 12x `partyN, SECRET, SECRET, string`
- 4x `pet, string, number, nil`
- 175x `player, string, number, nil`
- 99x `player, string, number, string`
- 2x `softfriend, SECRET, SECRET, string`
- 3x `target, SECRET, SECRET, string`
- 2x `targettarget, SECRET, SECRET, string`
- 1x `targettarget, string, number, nil`

## UNIT_TARGET

combat, 300 recorded:

- 84x `nameplateN`
- 14x `partyN`
- 21x `pet`
- 61x `player`
- 25x `softenemy`
- 80x `target`
- 15x `targettarget`

nocombat, 300 recorded:

- 12x `nameplateN`
- 2x `npc`
- 75x `partyN`
- 11x `pet`
- 153x `player`
- 3x `softenemy`
- 17x `softfriend`
- 25x `target`
- 2x `targettarget`

## UNIT_THREAT_LIST_UPDATE

combat, 300 recorded:

- 152x `nameplateN`
- 3x `softenemy`
- 145x `target`

nocombat, 179 recorded:

- 56x `nameplateN`
- 1x `pet`
- 60x `player`
- 19x `softenemy`
- 41x `target`
- 2x `targettarget`

## UNIT_THREAT_SITUATION_UPDATE

combat, 300 recorded:

- 1x `partyN`
- 56x `pet`
- 136x `player`
- 107x `targettarget`

nocombat, 300 recorded:

- 4x `partyN`
- 91x `pet`
- 204x `player`
- 1x `targettarget`

## UPDATE_MOUSEOVER_UNIT

combat, 208 recorded:

- 208x `(none)`

nocombat, 300 recorded:

- 300x `(none)`

## UPDATE_SHAPESHIFT_FORM

nocombat, 2 recorded:

- 2x `(none)`
