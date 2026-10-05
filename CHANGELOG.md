# Changelog

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

