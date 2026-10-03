# Serene

Lightweight quality-of-life addon for World of Warcraft Forever (Interface 16001, the 12.1 engine).
Each feature is small and can be toggled on its own. A feature that is off registers no events,
so it costs nothing.

Most logic is ported from EllesmereUI without
its framework dependencies. Some ideas come from Leatrix Plus, tullaRange, Thanks For The Buff and
Numy's AddonProfiler (see [Credits](#credits)).

## Installation

1. Copy the `Serene` folder into `World of Warcraft/<client>/Interface/AddOns/`.
2. Restart the game, or type `/reload`.
3. Type `/serene`, or click the minimap icon, to open the options.

## Usage

| Command | What it does |
|---|---|
| `/serene` | Opens or closes the options window |
| `/rl` | Reloads the UI (shortcut for `/reload`) |

The minimap icon opens the options when you left-click it and reloads the UI when you right-click it.
Settings are saved account-wide in `SereneDB`. **Reset Defaults** in the options window puts every
option back.

## Features

### General
- **Quick Loot**: loots everything at once. Hold Shift to open the loot window as usual.
- **Skip Loot Warnings**: confirms the "will bind to you" question when you loot or roll on a
  bind-on-pickup item.
- **Auto-Fill Delete**: types DELETE into the "delete this good item?" popup.
- **Auto Repair**: repairs at merchants with your own gold.
- **Auto Sell Junk**: sells gray items at merchants and retries until every gray item is gone.
- **Train All Button**: learns everything you can afford at a trainer in one click.
- **Auto Accept / Turn-In Quests**: hold Shift to handle a quest yourself. Gray and repeatable quests,
  and turn-ins with a choice of reward, are left to you.
- **Hide Tutorials**, **Faster Movie Skip**, **Max Camera Zoom**.
- **Class Colored Healthbars**: class colors on Blizzard's unit frames (player, target, target of
  target, focus, party).
- **Hide Error Messages**: hides the red "Not enough rage" / "Out of range" text, always or only in
  combat. Messages you need to act on (bags full, quest log full, not enough money) still show.

### FPS & Latency
A small on-screen readout you can drag anywhere. Right-click puts it back. Choose framerate and/or
latency, layout, labels, number colors, font, size, outline and background opacity.

### Social
- **Accept Summons** (waits until combat ends) and **Accept Resurrections** (not while the player
  casting it is in combat).
- **Accept invites from friends**. **Block group invites, duels and shared quests** from anyone else.
  Friends are your friends list, Battle.net friends and, if you turn it on, your guild.
- **Invite on Whisper**: whispering `inv` / `invite` gets an invite. If you can't invite, the
  player gets a whisper back saying why.
- **Thank for Buffs**: when a player outside your group buffs you (Fortitude, Mark of the Wild,
  Arcane Intellect, Blessings...), you thank them with an emote (random, or one you pick) after a
  short pause. Each player is thanked at most once every 90 seconds. Buffs received in combat can't be
  seen by addons on this client and are not thanked. Only players with a nameplate (or your target)
  can be recognized, so turn on Friendly Player Names as well.
- **Friendly Player Names** (off by default): other players' names as Blizzard's friendly nameplates
  outside instances: name only, class colored and click-through. It lets Thank for Buffs see who
  buffed you.

### Action Bars
- **Range Coloring**: icons turn the chosen color while the target is out of range, optionally
  grayed out first.
- **Short Keybind Text** (CTRL-2 → C2, Mouse Button 4 → M4), **Hide Macro Text**, plus keybind
  font, size, outline, color and position.

### Tooltip
- Position (follows the cursor, with offsets), font, size and outline.
- Hide the border and set background opacity.
- Hide the beta "Press F6 to submit an issue" line.
- Content: class, level and faction colors, player titles, guild rank, the unit's target, health
  bar, item level, spell/item IDs.

### Nameplates
Flat enemy nameplates: threat / class / reaction colors, level, health percent, target highlight,
cast bar, debuffs (everyone's, or only yours) and quest mob markers with progress and an optional
bar color. You can set font, size, outline, width and height.

### Performance
A page listing every loaded addon's CPU and memory use (sortable), plus latency, framerate and
bandwidth.

## Options window

- **Colors** are picked from a palette, and the **+** swatch opens Blizzard's color picker for any
  other color.
- **Outline** is a set of checkboxes (Outline, Thick, Monochrome, Shadow) that can be combined.
- **Settings that depend on another one** are dimmed until that one is on.
- **Fonts** include Blizzard's own, the bundled fonts in `Media/Fonts` and any font other addons
  register with LibSharedMedia.

## Credits

- EllesmereUI: most of the ported logic
  (nameplates, tooltips, quests, train all, keybind formatting, movie skip).
- Leatrix Plus: ideas for the social filters.
- tullaRange (MIT, Jason Greer): the event-based range coloring approach.
- Thanks For The Buff (Runew0lf): the idea behind Thank for Buffs.
- Numy's AddonProfiler: ideas for the Performance page.
- SharedMedia Additional Fonts: bundled fonts. Each font's license is in `Media/Fonts/Licenses`.
- LibStub, CallbackHandler, LibDataBroker and LibDBIcon for the minimap icon.
