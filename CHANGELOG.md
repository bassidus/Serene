# Changelog

## 1.8.1 (2026-10-12)

If you changed anything under Action bars, Visibility, check that page after updating: bars set to Always, or never touched, may now be hidden. Restore defaults brings every bar back.

### New
- Action bars: link a bar to another in Visibility. The linked bar uses the other bar's boxes, and the mouse over either shows both.

### Changed
- Action bars: the Always column is gone. Tick both Out of combat and In combat (now the default) to always show a bar, and neither to hide it. Mouse over now only applies in the combat states you ticked.

### Fixed
- Action bars: buttons on a hidden bar no longer show their tooltips.

## 1.8.0 (2026-10-12)

A new module, Serene Other, holds the level-up screenshot, thanks for buffs and the New characters settings. When updating by hand, copy the new SereneOther folder into Interface/AddOns as well. Your settings carry over.

### New
- Other: a new tab for the level-up screenshot, thanks for buffs and the action bars and Edit Mode layout for new characters, moved from General, Social and Action bars.
- Level up: a line in chat once the screenshot is saved.

### Changed
- General: hide error messages / speech is now a single checkbox. The in combat and out of combat choices are gone.
- Thanks for buffs and the level-up screenshot are off by default.
- Action bars: the Visibility group starts closed.

## 1.7.0 (2026-10-11)

### New
- Action bars: choose per bar when it shows: always, out of combat, in combat or on mouseover. Covers action bars 1 to 8, the stance and pet bars, the micro menu, the bags bar, the XP bar and the gryphons or wyverns.
- General: on level up, a screenshot and two lines in chat with how long the last level took and your total time played.

### Changed
- Thanks for buffs: the thanks is now a Blizzard emote aimed at the player who buffed you ("You thank Bob."). It goes out on its own after a short pause, with no key press. Pick the emote (Thank, Bow, Salute, Cheer and more, or Random) in place of the old message list.

### Fixed
- The minimap icon's logo no longer shifts when another addon brings a newer LibDBIcon.

## 1.6.2 (2026-10-11)

### Changed
- Chat: reputation lines are spelled out, like "+ 25 Undercity reputation" instead of "+25 rep Undercity".
- Chat: a space after the green + and red - signs, like "+ 3 Silver" and "+ 200 XP".
- Action bars: shorter text under New characters.

## 1.6.1 (2026-10-11)

### Changed
- The pet frame tooltip and "Show on mouseover" for unit frame numbers only do work while the mouse is on a unit frame.

## 1.6.0 (2026-10-10)

### New
- General: large "+ Combat" and "- Combat" text when a fight starts and ends (off by default).
- General: a warning when any piece of gear is below 30% durability, after a fight and when you log in.
- General: items you already know, like pet grimoires, recipes and mounts, are dimmed at vendors.
- Social: tell your group in chat when you reset instances (off by default).
- Chat: shorter lines for reputation, accepted quests, skill-ups, discovered places, group and raid XP, items you create, spells and recipes you learn, rested state, friends coming online, players joining or leaving your group, and group loot rolls.
- Chat: a quest's XP shows on its "completed" line.
- Chat: whispers read "< Name:" and "> Name:" with orange arrows.

### Changed
- Chat: loot lines put the count first ("+2 [Silverleaf]", "+1 [Earthroot]"), and every + is green and every - red.
- Chat: Battle.net names no longer have brackets.
- Social: "Keyword inv / invite from" now starts on Friends, so friends who whisper "inv" or "invite" get a group invite unless you change it. "Allow duels from" has a tooltip.
- Thanks for buffs: waits 10 seconds for your key press instead of 30.
- The pet frame tooltip, unit frame fonts, the chat input box, Dark mode in bags and nameplate cast bars do less work while you play.

### Fixed
- Nameplates: no Lua error with "Show combo points" turned off.
- Tooltip: the item level shows the first time you hover an item the game hasn't loaded yet.

## 1.5.2 (2026-10-10)

### Changed
- Options: on a small screen the whole window shrinks to fit instead of getting shorter.

### Fixed
- Chat: the bottom line is no longer cut off, so letters like g, p and y show in full.
- Action bars: a little more space above the Edit Mode layout line at the bottom of the page.

## 1.5.1 (2026-10-09)

### New
- Action bars: pick one of your account's Edit Mode layouts for new characters. A character that hasn't chosen a layout yet switches to it at login, and picking one switches the character you're on.

### Changed
- Action bars: "Bars enabled on all characters" is now the New characters group, together with the Edit Mode layout.
- Thanks for buffs: the game no longer lets addons send chat on their own, so the thanks goes out on your next key press. With no key press within 30 seconds it is skipped.

### Fixed
- Nameplates: the target's mana bar shows for casters again after the latest client update.

## 1.5.0 (2026-10-09)

Two new modules, Serene Chat and Serene Dark Mode, and Serene Performance is gone. If you install by hand, delete the SerenePerformance folder and copy in all the new ones. Many settings were merged or renamed, so some may be back at their defaults.

### New
- Chat: a new module. Channel and time formats, gray timestamps, levels after names colored by difficulty, shorter loot, money, XP and say lines, clickable web links, right-click a chat window to copy its text, message spacing, fading old lines, indented wrapped lines and a chat font. The arrow keys step through the lines you sent without holding Alt.
- Dark mode: its own module, turned on with one checkbox at the bottom of the options. It darkens the art of the action bars, bag bar, experience bar, unit frames, minimap, quest tracker and bags, while items, spells and money keep their colors.
- Nameplates: an icon on enemies tagged by someone outside your group.
- Nameplates: neutral quest enemies get their own bar color. Quest enemies are orange-red and yellow by default.
- General: a countdown under the battleground queue popup that turns yellow, then red, with a warning sound near the end.
- Tooltip: AFK and DND after a player's name, a health bar, and alignment and X/Y offsets at the cursor.
- Unit frames: smooth bars, a blue glow in stealth, no damage numbers on portraits, hiding your level, and health and mana numbers that show only on mouseover or are hidden on chosen frames.
- Action bars: hide keybinds, hide macro names and zoomed icons.
- Thanks for buffs: many more messages to pick from.
- Selling gray items tells you what they sold for.

### Changed
- The options window has a new look in Serene's browns with Blizzard's controls. Modules sit at the top of the sidebar, then the pages in alphabetical order. Checkboxes have short tooltips, and Ctrl + scroll resizes the window.
- Social: one Automation group. Choose who you accept group invites from, who gets an invite by whispering "inv" or "invite", and who can duel you: friends, your guild, anyone or no one. Blocking quests shared by strangers is gone.
- Move & Scale: one switch, and positions and sizes are always saved. One Size slider with a list of windows, and a Reset Scale & Positions button.
- Unit frames: one page with fewer settings. Dark frames are now part of Dark mode, and the portrait, name color and level color settings are gone.
- Action bars: keybind and macro text share one font setting and keep their place, and out-of-range buttons are always red.
- Tooltip, Nameplates and Social settings are regrouped and renamed.
- Removed the Performance module. Dedicated profiling addons do this better.

### Fixed
- Bars enabled on all characters now show on a new character's first login.
- The pet frame's tooltip no longer blinks when the mouse crosses its bars.
- The "Current" health and mana format shows only the current value.

## 1.4.0 (2026-10-06)

The FPS & latency display is now part of Serene Performance, and the Serene Stats addon is gone. If you install by hand, delete the SereneStats folder.

### New
- Performance overlay: framerate, latency and total addon CPU and memory, plus the heaviest addons and any you pin, kept on screen while you play. Turn it on under the addon list on the Performance page. It has settings for size, columns, colors and font, and when unlocked you can drag it and its column lines.
- Nameplates: combo points under the health bar of the enemy that holds them.
- Nameplates: the threat colors are settings, grouped by role.
- Action bars: a switch that turns the checked bars 2-8 on for every character. It is off by default, and bars you leave unchecked are up to each character.

### Changed
- The Performance page is grouped like the other pages, under a new Tools heading.
- Tiny CPU shares read "<0.01%" instead of "0.00%".
- The help text in the options window is gold.

### Fixed
- Holding the color picker's wheel no longer applies the setting every frame.

## 1.3.1 (2026-10-05)

### Changed
- A new Serene logo on the minimap icon and in the addon list, and the options window in its colors.

### Fixed
- Short freezes in combat: the unit frames no longer use more and more memory while the target of target is shown.

## 1.3.0 (2026-10-05)

Serene is now split into separate addons: Serene itself, which is required, plus one addon per module. If you install by hand, delete the old Serene folder and copy in all the new ones. Modules can be turned off on the Modules page in the options or in the addon list. A few settings may be back at their defaults.

### New
- Move & scale: drag Blizzard's windows with the mouse, Ctrl + scroll to resize them, middle-click to put them back. A size slider for each window, and an option to remember where you put them.
- Unit frames: class colored health bars, dark frames, class icon portraits, name and level colors, health/mana text format and alignment, fonts, and hiding the resting glow and Zzz.
- Tooltip: a size slider, players' item level, "Rank of Guild", who the unit is targeting, and level, race and class on one line. The "Right click for Frame Settings" line is gone, and the tooltip stays when you hover a unit frame's bars.
- Action bars: macro names with their own font, color and position. Keybind and macro positions are set by dragging a dot.
- Fonts: Blizzard's fonts plus any from LibSharedMedia. The bundled fonts are gone.

### Changed
- Options window: a grouped sidebar, categories that open and close, a "?" with help for each category, Reset page, and it remembers its position and size. It only loads when you open it.
- `/serene reset` resets everything, the options window and minimap icon included.
- Hide error messages: Never, In combat, Out of combat or Always.
- New defaults: FPS & latency is off and locked. Dark frames, hidden resting glow and macro names are on. Your guild counts as friends, and invites from friends and buff thanks are on.

### Fixed
- Bear Form counts as tank for the nameplate threat colors.
- /rl works in whisper windows.
- The "Press F6 to submit an issue" line flashing in tooltips.

## 1.2.0 (2026-10-04)

- Thank you for the buff: thank buffs from other players again
- Bring back Thank you for the buff as an untargeted /emote

## 1.1.0 (2026-10-04)

- Add CHANGELOG and a release script for CurseForge zips
- Nameplates: threat colors solo, with a pet and in a group
- Performance: shorten average tooltip
- Performance: sample right after loading screens, no settle delay
- Performance: show average framerate and latency, drop low/high
- Options: drop tooltips the labels already explain
- README: shorter feature list, Usage at the end
- Nameplates: quest and neutral mobs take threat color once fighting you
- FPS & Latency: always show world latency
- Performance: framerate and latency history, fewer stats
- Range Coloring: always gray out of range icons
- Social: every toggle off by default
- Remove Accept Summons and Accept Resurrections
- Remove Thank you for the buff and Friendly Player Names
- README: fix typos in the intro
- README: drop the Options window section
- Invite on Whisper defaults to "inv or invite"
- README: expand the Social invite, duel and quest blocking line
- Rename Thank for Buffs to "Thank you for the buff"
- README: trim installation, credits and section headings
- Move feature modules into Modules/
- README: expand General feature list, trim Usage
- Drop EllesmereUI nameplate block and other-addon mentions
- README: drop hard line wraps
- Quest progress at the right end of the name row
- Tooltips default to right of cursor, font size 10
- Friendly Player Names on by default
- Move Friendly Player Names to Social, under Thank for Buffs
- Friendly Player Names as its own nameplate setting
- README: mention the friendly nameplates Thank for Buffs turns on
- Thank for Buffs: find casters via friendly name-only plates
- Drop translation of pre-palette color and outline values
- Clean up comments and dead code
- Remove /serene subcommands; /serene only opens the options
- Add README
- Initial commit: Serene QoL addon

