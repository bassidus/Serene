# Event arguments, build 1.60.1.70291

Client 1.60.1 (build 70291, Oct  7 2026), Interface 16001.

Each line is one argument pattern and how often it came. Unit and power tokens are shown as values, everything else as its type. SECRET marks a secret argument.

## ACTION_RANGE_CHECK_UPDATE

combat, 22 recorded:

- 22x `number, boolean, boolean`

nocombat, 300 recorded:

- 300x `number, boolean, boolean`

## BAG_UPDATE_DELAYED

nocombat, 17 recorded:

- 17x `(none)`

## CHAT_MSG_CHANNEL

nocombat, 4 recorded:

- 4x `string, string, string, string, string, string, number, number, string, number, number, string, number, boolean, boolean, boolean`

## CHAT_MSG_COMBAT_XP_GAIN

combat, 6 recorded:

- 6x `string, string, string, string, string, string, number, number, string, number, number, nil, number, boolean, boolean, boolean`

nocombat, 2 recorded:

- 2x `string, string, string, string, string, string, number, number, string, number, number, nil, number, boolean, boolean, boolean`

## CHAT_MSG_LOOT

nocombat, 5 recorded:

- 5x `string, string, string, string, string, string, number, number, string, number, number, string, number, boolean, boolean, boolean`

## CHAT_MSG_MONSTER_SAY

combat, 3 recorded:

- 3x `string, string, string, string, string, string, number, number, string, number, number, nil, number, boolean, boolean, boolean`

nocombat, 1 recorded:

- 1x `string, string, string, string, string, string, number, number, string, number, number, nil, number, boolean, boolean, boolean`

## CHAT_MSG_SYSTEM

combat, 1 recorded:

- 1x `string, string, string, string, string, string, number, number, string, number, number, nil, number, boolean, boolean, boolean`

nocombat, 11 recorded:

- 11x `string, string, string, string, string, string, number, number, string, number, number, nil, number, boolean, boolean, boolean`

## COMBAT_TEXT_UPDATE

combat, 45 recorded:

- 45x `string`

nocombat, 6 recorded:

- 6x `string`

## LOOT_READY

nocombat, 9 recorded:

- 9x `boolean`

## NAME_PLATE_UNIT_ADDED

combat, 15 recorded:

- 15x `nameplateN`

nocombat, 68 recorded:

- 68x `nameplateN`

## NAME_PLATE_UNIT_REMOVED

combat, 20 recorded:

- 20x `nameplateN`

nocombat, 63 recorded:

- 63x `nameplateN`

## PLAYER_REGEN_DISABLED

nocombat, 8 recorded:

- 8x `(none)`

## PLAYER_REGEN_ENABLED

nocombat, 8 recorded:

- 8x `(none)`

## PLAYER_TARGET_CHANGED

combat, 11 recorded:

- 11x `(none)`

nocombat, 34 recorded:

- 34x `(none)`

## QUEST_LOG_UPDATE

nocombat, 45 recorded:

- 45x `(none)`

## QUEST_WATCH_UPDATE

nocombat, 4 recorded:

- 4x `number`

## SPELL_UPDATE_COOLDOWN

combat, 112 recorded:

- 112x `number, nil, number, number, nil`

nocombat, 23 recorded:

- 8x `nil, nil, nil, nil, nil`
- 9x `number, nil, nil, nil, nil`
- 5x `number, nil, number, number, nil`
- 1x `number, nil, number, number, number`

## SPELL_UPDATE_USABLE

combat, 300 recorded:

- 300x `(none)`

nocombat, 300 recorded:

- 300x `(none)`

## UI_ERROR_MESSAGE

combat, 2 recorded:

- 2x `number, string`

nocombat, 3 recorded:

- 3x `number, string`

## UNIT_AURA

combat, 37 recorded:

- 17x `nameplateN, table`
- 2x `pet, table`
- 1x `player, table`
- 16x `target, table`
- 1x `targettarget, table`

nocombat, 10 recorded:

- 1x `nameplateN, table`
- 2x `pet, table`
- 7x `player, table`

## UNIT_COMBAT

combat, 300 recorded:

- 2x `nameplateN, MISS, string, number, number`
- 105x `nameplateN, WOUND, string, number, number`
- 1x `pet, MISS, string, number, number`
- 7x `pet, WOUND, string, number, number`
- 2x `player, DODGE, string, number, number`
- 2x `player, HEAL, string, number, number`
- 38x `player, WOUND, string, number, number`
- 2x `target, MISS, string, number, number`
- 101x `target, WOUND, string, number, number`
- 2x `targettarget, DODGE, string, number, number`
- 1x `targettarget, HEAL, string, number, number`
- 37x `targettarget, WOUND, string, number, number`

nocombat, 1 recorded:

- 1x `player, WOUND, string, number, number`

## UNIT_HEALTH

combat, 300 recorded:

- 88x `nameplateN`
- 5x `pet`
- 64x `player`
- 84x `target`
- 59x `targettarget`

nocombat, 66 recorded:

- 1x `nameplateN`
- 7x `pet`
- 58x `player`

## UNIT_LEVEL

nocombat, 7 recorded:

- 5x `nameplateN`
- 1x `pet`
- 1x `player`

## UNIT_MAXHEALTH

nocombat, 8 recorded:

- 3x `pet`
- 3x `player`
- 1x `softfriend`
- 1x `target`

## UNIT_MAXPOWER

nocombat, 2 recorded:

- 1x `pet, MANA`
- 1x `player, MANA`

## UNIT_NAME_UPDATE

nocombat, 9 recorded:

- 5x `nameplateN`
- 4x `pet`

## UNIT_POWER_FREQUENT

combat, 300 recorded:

- 112x `pet, MANA`
- 101x `player, MANA`
- 87x `targettarget, MANA`

nocombat, 300 recorded:

- 162x `pet, MANA`
- 138x `player, MANA`

## UNIT_POWER_UPDATE

combat, 156 recorded:

- 4x `nameplateN, MANA`
- 80x `pet, MANA`
- 36x `player, MANA`
- 2x `target, MANA`
- 34x `targettarget, MANA`

nocombat, 57 recorded:

- 28x `pet, MANA`
- 29x `player, MANA`

## UNIT_SPELLCAST_INTERRUPTED

combat, 9 recorded:

- 1x `nameplateN, SECRET, SECRET, nil, string`
- 4x `pet, string, number, nil, string`
- 3x `player, string, number, nil, nil`
- 1x `target, SECRET, SECRET, nil, string`

## UNIT_SPELLCAST_START

combat, 87 recorded:

- 3x `nameplateN, SECRET, SECRET, string`
- 44x `pet, string, number, string`
- 20x `player, string, number, string`
- 3x `target, SECRET, SECRET, string`
- 17x `targettarget, string, number, string`

nocombat, 7 recorded:

- 2x `pet, string, number, string`
- 5x `player, string, number, string`

## UNIT_SPELLCAST_STOP

combat, 94 recorded:

- 3x `nameplateN, SECRET, SECRET, string`
- 46x `pet, string, number, string`
- 24x `player, string, number, string`
- 3x `target, SECRET, SECRET, string`
- 18x `targettarget, string, number, string`

nocombat, 1 recorded:

- 1x `player, string, number, string`

## UNIT_SPELLCAST_SUCCEEDED

combat, 86 recorded:

- 2x `nameplateN, SECRET, SECRET, string`
- 42x `pet, string, number, string`
- 23x `player, string, number, string`
- 2x `target, SECRET, SECRET, string`
- 17x `targettarget, string, number, string`

nocombat, 4 recorded:

- 3x `player, string, number, nil`
- 1x `player, string, number, string`

## UNIT_TARGET

combat, 31 recorded:

- 9x `nameplateN`
- 4x `pet`
- 7x `player`
- 10x `target`
- 1x `targettarget`

nocombat, 46 recorded:

- 2x `nameplateN`
- 8x `pet`
- 36x `player`

## UNIT_THREAT_LIST_UPDATE

combat, 138 recorded:

- 69x `nameplateN`
- 69x `target`

nocombat, 12 recorded:

- 4x `nameplateN`
- 7x `player`
- 1x `target`

## UNIT_THREAT_SITUATION_UPDATE

combat, 14 recorded:

- 3x `pet`
- 8x `player`
- 3x `targettarget`

nocombat, 19 recorded:

- 5x `pet`
- 14x `player`

## UPDATE_MOUSEOVER_UNIT

combat, 20 recorded:

- 20x `(none)`

nocombat, 91 recorded:

- 91x `(none)`
