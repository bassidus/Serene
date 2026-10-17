# Event arguments, build 1.60.1.70291

Client 1.60.1 (build 70291, Oct  7 2026), Interface 16001.

Each line is one argument pattern and how often it came. Unit and power tokens are shown as values, everything else as its type. SECRET marks a secret argument.

## ACTION_RANGE_CHECK_UPDATE

combat, 161 recorded:

- 161x `number, boolean, boolean`

nocombat, 300 recorded:

- 300x `number, boolean, boolean`

## BAG_UPDATE_DELAYED

combat, 1 recorded:

- 1x `(none)`

nocombat, 107 recorded:

- 107x `(none)`

## CHAT_MSG_CHANNEL

combat, 8 recorded:

- 8x `string, string, string, string, string, string, number, number, string, number, number, string, number, boolean, boolean, boolean`

nocombat, 148 recorded:

- 148x `string, string, string, string, string, string, number, number, string, number, number, string, number, boolean, boolean, boolean`

## CHAT_MSG_COMBAT_XP_GAIN

combat, 33 recorded:

- 33x `string, string, string, string, string, string, number, number, string, number, number, nil, number, boolean, boolean, boolean`

nocombat, 5 recorded:

- 5x `string, string, string, string, string, string, number, number, string, number, number, nil, number, boolean, boolean, boolean`

## CHAT_MSG_LOOT

combat, 2 recorded:

- 2x `string, string, string, string, string, string, number, number, string, number, number, string, number, boolean, boolean, boolean`

nocombat, 61 recorded:

- 61x `string, string, string, string, string, string, number, number, string, number, number, string, number, boolean, boolean, boolean`

## CHAT_MSG_MONSTER_SAY

combat, 12 recorded:

- 12x `string, string, string, string, string, string, number, number, string, number, number, nil, number, boolean, boolean, boolean`

nocombat, 7 recorded:

- 7x `string, string, string, string, string, string, number, number, string, number, number, nil, number, boolean, boolean, boolean`

## CHAT_MSG_SAY

nocombat, 1 recorded:

- 1x `string, string, string, string, string, string, number, number, string, number, number, string, number, boolean, boolean, boolean`

## CHAT_MSG_SYSTEM

combat, 3 recorded:

- 3x `string, string, string, string, string, string, number, number, string, number, number, nil, number, boolean, boolean, boolean`

nocombat, 66 recorded:

- 66x `string, string, string, string, string, string, number, number, string, number, number, nil, number, boolean, boolean, boolean`

## CHAT_MSG_WHISPER

nocombat, 1 recorded:

- 1x `string, string, string, string, string, string, number, number, string, number, number, string, number, boolean, boolean, boolean`

## COMBAT_TEXT_UPDATE

combat, 163 recorded:

- 163x `string`

nocombat, 27 recorded:

- 27x `string`

## LOOT_READY

combat, 6 recorded:

- 6x `boolean`

nocombat, 66 recorded:

- 66x `boolean`

## NAME_PLATE_UNIT_ADDED

combat, 68 recorded:

- 68x `nameplateN`

nocombat, 300 recorded:

- 300x `nameplateN`

## NAME_PLATE_UNIT_REMOVED

combat, 97 recorded:

- 97x `nameplateN`

nocombat, 300 recorded:

- 300x `nameplateN`

## PLAYER_REGEN_DISABLED

nocombat, 31 recorded:

- 31x `(none)`

## PLAYER_REGEN_ENABLED

nocombat, 31 recorded:

- 31x `(none)`

## PLAYER_TARGET_CHANGED

combat, 54 recorded:

- 54x `(none)`

nocombat, 146 recorded:

- 146x `(none)`

## QUEST_LOG_UPDATE

combat, 2 recorded:

- 2x `(none)`

nocombat, 132 recorded:

- 132x `(none)`

## QUEST_WATCH_UPDATE

combat, 1 recorded:

- 1x `number`

nocombat, 24 recorded:

- 24x `number`

## SPELL_UPDATE_COOLDOWN

combat, 300 recorded:

- 300x `number, nil, number, number, nil`

nocombat, 113 recorded:

- 16x `nil, nil, nil, nil, nil`
- 54x `number, nil, nil, nil, nil`
- 1x `number, nil, nil, nil, number`
- 41x `number, nil, number, number, nil`
- 1x `number, nil, number, number, number`

## SPELL_UPDATE_USABLE

combat, 300 recorded:

- 300x `(none)`

nocombat, 300 recorded:

- 300x `(none)`

## UI_ERROR_MESSAGE

combat, 11 recorded:

- 11x `number, string`

nocombat, 16 recorded:

- 16x `number, string`

## UNIT_AURA

combat, 216 recorded:

- 108x `nameplateN, table`
- 4x `pet, table`
- 13x `player, table`
- 79x `target, table`
- 12x `targettarget, table`

nocombat, 44 recorded:

- 19x `nameplateN, table`
- 4x `pet, table`
- 21x `player, table`

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

nocombat, 141 recorded:

- 4x `nameplateN, MISS, string, number, number`
- 2x `nameplateN, PARRY, string, number, number`
- 120x `nameplateN, WOUND, string, number, number`
- 1x `pet, HEAL, string, number, number`
- 1x `player, HEAL, string, number, number`
- 4x `player, WOUND, string, number, number`
- 2x `target, DODGE, string, number, number`
- 2x `target, WOUND, string, number, number`
- 1x `targettarget, DODGE, string, number, number`
- 4x `targettarget, WOUND, string, number, number`

## UNIT_FACTION

combat, 1 recorded:

- 1x `nameplateN`

nocombat, 25 recorded:

- 21x `nameplateN`
- 2x `softenemy`
- 2x `target`

## UNIT_HEALTH

combat, 300 recorded:

- 88x `nameplateN`
- 5x `pet`
- 64x `player`
- 84x `target`
- 59x `targettarget`

nocombat, 291 recorded:

- 129x `nameplateN`
- 19x `pet`
- 133x `player`
- 1x `softenemy`
- 5x `target`
- 4x `targettarget`

## UNIT_LEVEL

nocombat, 9 recorded:

- 5x `nameplateN`
- 2x `pet`
- 2x `player`

## UNIT_MAXHEALTH

nocombat, 25 recorded:

- 11x `pet`
- 11x `player`
- 1x `softfriend`
- 2x `target`

## UNIT_MAXPOWER

nocombat, 4 recorded:

- 2x `pet, MANA`
- 2x `player, MANA`

## UNIT_NAME_UPDATE

nocombat, 11 recorded:

- 5x `nameplateN`
- 6x `pet`

## UNIT_POWER_FREQUENT

combat, 300 recorded:

- 112x `pet, MANA`
- 101x `player, MANA`
- 87x `targettarget, MANA`

nocombat, 300 recorded:

- 162x `pet, MANA`
- 138x `player, MANA`

## UNIT_POWER_UPDATE

combat, 300 recorded:

- 4x `nameplateN, MANA`
- 152x `pet, MANA`
- 79x `player, MANA`
- 2x `target, MANA`
- 63x `targettarget, MANA`

nocombat, 300 recorded:

- 4x `nameplateN, MANA`
- 108x `pet, MANA`
- 185x `player, MANA`
- 3x `target, MANA`

## UNIT_SPELLCAST_INTERRUPTED

combat, 37 recorded:

- 4x `nameplateN, SECRET, SECRET, nil, string`
- 18x `pet, string, number, nil, string`
- 6x `player, string, number, nil, nil`
- 3x `player, string, number, nil, string`
- 2x `target, SECRET, SECRET, nil, string`
- 3x `targettarget, string, number, nil, nil`
- 1x `targettarget, string, number, nil, string`

nocombat, 8 recorded:

- 6x `player, string, number, nil, nil`
- 2x `player, string, number, nil, string`

## UNIT_SPELLCAST_START

combat, 300 recorded:

- 24x `nameplateN, SECRET, SECRET, string`
- 138x `pet, string, number, string`
- 65x `player, string, number, string`
- 13x `target, SECRET, SECRET, string`
- 60x `targettarget, string, number, string`

nocombat, 54 recorded:

- 14x `pet, string, number, string`
- 39x `player, string, number, string`
- 1x `target, SECRET, SECRET, string`

## UNIT_SPELLCAST_STOP

combat, 300 recorded:

- 24x `nameplateN, SECRET, SECRET, string`
- 137x `pet, string, number, string`
- 77x `player, string, number, string`
- 12x `target, SECRET, SECRET, string`
- 50x `targettarget, string, number, string`

nocombat, 20 recorded:

- 1x `nameplateN, SECRET, SECRET, string`
- 18x `player, string, number, string`
- 1x `target, SECRET, SECRET, string`

## UNIT_SPELLCAST_SUCCEEDED

combat, 300 recorded:

- 20x `nameplateN, SECRET, SECRET, string`
- 133x `pet, string, number, string`
- 3x `player, string, number, nil`
- 80x `player, string, number, string`
- 10x `target, SECRET, SECRET, string`
- 1x `targettarget, string, number, nil`
- 53x `targettarget, string, number, string`

nocombat, 29 recorded:

- 1x `nameplateN, SECRET, SECRET, string`
- 1x `pet, string, number, nil`
- 10x `player, string, number, nil`
- 16x `player, string, number, string`
- 1x `target, SECRET, SECRET, string`

## UNIT_TARGET

combat, 248 recorded:

- 74x `nameplateN`
- 42x `pet`
- 46x `player`
- 74x `target`
- 12x `targettarget`

nocombat, 214 recorded:

- 5x `focus`
- 5x `focustarget`
- 7x `nameplateN`
- 23x `pet`
- 150x `player`
- 1x `softenemy`
- 1x `softfriend`
- 14x `target`
- 8x `targettarget`

## UNIT_THREAT_LIST_UPDATE

combat, 300 recorded:

- 152x `nameplateN`
- 148x `target`

nocombat, 34 recorded:

- 8x `nameplateN`
- 21x `player`
- 5x `target`

## UNIT_THREAT_SITUATION_UPDATE

combat, 182 recorded:

- 65x `pet`
- 72x `player`
- 45x `targettarget`

nocombat, 72 recorded:

- 24x `pet`
- 48x `player`

## UPDATE_MOUSEOVER_UNIT

combat, 58 recorded:

- 58x `(none)`

nocombat, 300 recorded:

- 300x `(none)`

## UPDATE_SHAPESHIFT_FORM

nocombat, 2 recorded:

- 2x `(none)`
