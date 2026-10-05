# Serene

Lightweight QoL addon for World of Warcraft Forever. Each feature is small and can be toggled on its own.

### Features
- **Fast auto loot**: Loots quicker than Blizzard's Auto Loot. Hold Shift to loot by hand.
- **Skip bind-on-pickup warnings**: Automatically confirms the "will bind to you" question.
- **Type DELETE for you**: Automatically types DELETE into the "delete this good item?" popup.
- **Repair at vendors**: Automatically repairs at vendors.
- **Sell gray items at vendors**: Automatically sells gray items at vendors.
- **Train All button**: Learns everything you can train at a trainer.
- **Accept / turn in quests automatically**: Hold Shift to handle a quest yourself.
- **Hide tutorial pop-ups**: Hides tutorial pop-ups.
- **Skip cinematics without asking**: Escape, Space or Enter skips a movie right away, without confirmation.
- **Farther camera zoom**: Lets the camera zoom out further.
- **Hide error messages / speech**: Hides the "Not enough rage" / "Out of range" warnings.
- **FPS & latency**: A small on-screen readout you can drag anywhere.

### Social
All off by default.
- **Accept group invites from friends**: group invites from friends are accepted automatically while you are not in a group.
- **Block group invites**, **duels** and **shared quests** from strangers: declines them from anyone who is not a friend, and the chat says who was declined.
- **Count your guild as friends**: friends are your friends list and Battle.net friends. With this on, your guild counts too, for all the settings above and for whisper invites.
- **Invite players who whisper a keyword**: whispering `inv` / `invite` gets an invite. If you can't invite, the player gets a whisper back saying why.
- **Thank players who buff you**: when a player outside your group buffs you (Fortitude, Mark of the Wild, Arcane Intellect, Blessings...), you say thanks with an `/emote` after a short pause, at most once a minute. Pick a message or let it vary. Buffs received in combat can't be seen by addons on this client and are not thanked.

### Action bars
- **Color buttons out of range**: Icons are grayed out and turn the chosen color while the target is out of range.
- **Shorten keybind text** (CTRL-2 → C2, Mouse Button 4 → M4), **Show macro names**, plus font, size, outline, color and position (a popup with a dot to drag) for both the keybind and the macro name.

### Unit frames
- **Class-colored health bars**: Class colors on Blizzard's unit frames.
- **Dark frames**: dark frame art.
- Portrait (portrait, class icon, or hidden together with the frame), hide name, name color (class or any color), hide the colored bar behind the target's name.
- Level color (gold by default) and hide level; while the portrait is hidden, the level moves before the name ("14 Hogger").
- Health/mana text as value, percent or both.
- Font, size and outline for the names, the level and the health/mana text.
- Hide the resting glow and Zzz animation on the player frame.

### Tooltip
- Position (follows the cursor, with offsets), font, size and outline.
- Hide the border and set background opacity.
- Hide the beta "Press F6 to submit an issue" line.
- Hide the "<Right click for Frame Settings>" line on unit frame tooltips.
- Keep the unit tooltip while hovering a unit frame's health or mana bar.
- Content: class, level and faction colors, player titles, guild rank, the unit's target, health bar, item level of items and players, spell/item IDs.

### Nameplates
Flat enemy nameplates: threat / class / reaction colors, level, health percent, target highlight, cast bar, debuffs (everyone's, or only yours) and quest mob markers with progress and an optional bar color. You can set font, size, outline, width and height.

### Performance
A page listing every loaded addon's CPU and memory use (sortable), plus average framerate and latency over the last 5 minutes (loading screens are left out).

## Usage
`/serene` Opens or closes the options window.
The minimap icon opens the options when you left-click it and reloads the UI when you right-click it.