# Serene

Lightweight quality-of-life addon for World of Warcraft Forever. Each feature is small and can be toggled on its own. A feature that is off registers no events, so it costs nothing.

## Usage
`/serene` Opens or closes the options window
The minimap icon opens the options when you left-click it and reloads the UI when you right-click it.

### Features
- **Quick Loot**: Automatically loots everything at once. Hold Shift to open the loot window as usual.
- **Skip Loot Warnings**: Automatically confirms the "will bind to you" question when you loot or roll on a bind-on-pickup item.
- **Auto-Fill Delete**: Automatically types DELETE into the "delete this good item?" popup.
- **Auto Repair**: Automatically repairs at merchants with your own gold.
- **Auto Sell Junk**: Automatically sells gray items at merchants and retries until every gray item is gone.
- **Train All Button**: Learns everything you can afford at a trainer in one click.
- **Auto Accept / Turn-In Quests**: Hold Shift to handle a quest yourself. Gray and repeatable quests, and turn-ins with a choice of reward, are left to you.
- **Hide Tutorials**: Hides tutorial pop-ups, the yellow help bubbles and the (i) help buttons on Blizzard's panels, along with their tooltips. Turning it off brings them back.
- **Faster Movie Skip**: Escape, Space or Enter skips a cinematic or movie right away, without the "Are you sure?" question.
- **Max Camera Zoom**: Lets the camera zoom out as far as the client allows (2.6 instead of Blizzard's 1.9). Turning it off sets the distance back to Blizzard's default, but only if Serene changed it.
- **Class Colored Healthbars**: Class colors on Blizzard's unit frames (player, target, target of target, focus, party).
- **Hide Error Messages**: Hides the red "Not enough rage" / "Out of range" text, always or only in combat. Messages you need to act on (bags full, quest log full, not enough money) still show.

### FPS & Latency
A small on-screen readout you can drag anywhere. Right-click puts it back. Choose framerate and/or latency, layout, labels, number colors, font, size, outline and background opacity.

### Social
- **Accept Summons** Waits until combat ends and **Accept Resurrections** (not while the player casting it is in combat).
- **Accept invites from friends**. **Block group invites, duels and shared quests** From anyone else. Friends are your friends list, Battle.net friends and, if you turn it on, your guild.
- **Invite on Whisper**: whispering `inv` / `invite` gets an invite. If you can't invite, the player gets a whisper back saying why.
- **Thank you for the buff**: when a player outside your group buffs you (Fortitude, Mark of the Wild, Arcane Intellect, Blessings...), you thank them with an emote (random, or one you pick) after a short pause. Each player is thanked at most once every 90 seconds. Buffs received in combat can't be seen by addons on this client and are not thanked. Only players with a nameplate (or your target) can be recognized, so turn on Friendly Player Names as well.
- **Friendly Player Names**: Other players' names as Blizzard's friendly nameplates outside instances: name only, class colored and click-through. Required for Thank you for the buff to see who buffed you.

### Action Bars
- **Range Coloring**: Icons turn the chosen color while the target is out of range, optionally grayed out first.
- **Short Keybind Text** (CTRL-2 → C2, Mouse Button 4 → M4), **Hide Macro Text**, plus keybind font, size, outline, color and position.

### Tooltip
- Position (follows the cursor, with offsets), font, size and outline.
- Hide the border and set background opacity.
- Hide the beta "Press F6 to submit an issue" line.
- Content: class, level and faction colors, player titles, guild rank, the unit's target, health bar, item level, spell/item IDs.

### Nameplates
Flat enemy nameplates: threat / class / reaction colors, level, health percent, target highlight, cast bar, debuffs (everyone's, or only yours) and quest mob markers with progress and an optional bar color. You can set font, size, outline, width and height.

### Performance
A page listing every loaded addon's CPU and memory use (sortable), plus latency, framerate and bandwidth.

## Options window

- **Colors** are picked from a palette, and the **+** swatch opens Blizzard's color picker for any other color.
- **Outline** is a set of checkboxes (Outline, Thick, Monochrome, Shadow) that can be combined.
- **Fonts** include Blizzard's own, the bundled fonts in `Media/Fonts` and any font other addons register with LibSharedMedia.
