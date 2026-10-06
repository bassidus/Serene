# Serene

QoL addon suite for WoW Forever (Interface 16001). Unreleased, one user.

## Layout

- `Serene/` is the core: SavedVariables (`SereneDB`), the feature registry, colors, fonts, the minimap icon and `/serene`. It sets the global `Serene`.
- Every other `Serene*/` folder is its own addon with `## Dependencies: Serene` and `## Group: Serene`. Its `Init.lua` does `setmetatable(ns, { __index = Serene })`. Values shared between addons go on `Serene`, not on the addon's own `ns`.
- The TOC line `## X-Serene-Section: <tab>` is how the options window finds a module, whether it is loaded or not.
- `SereneOptions` is load on demand and holds the options window (`Options.lua`, `OptionsWidgets.lua`).
- The repo lives outside the game. Each `Serene*` folder is symlinked into `/mnt/wd1000/Battle.net/World of Warcraft/_classic_beta_/Interface/AddOns/`. A new module needs a symlink too.

## Adding a setting

`ns.RegisterFeature{ key, label, section, category, type, default, apply, tooltip, ... }`. The full field list is above the function in `Serene/Core.lua`. Also useful: `ns.RegisterFontSettings`, `ns.RegisterPositionSettings`, `ns.SetPageIntro`, `ns.AddShiftSkip`, `ns.OnReset` and `ns.OnResetAll`.

- The options page lists settings in registration order, so TOC file order matters. Some files exist only to register last (`NameplateLook.lua`).
- `beside = true` puts a category, or a setting, to the right of the previous one.
- `type = "custom"` with `build(parent)` puts your own frame in a category.
- `tooltip` shows under the category's "?". Leave it out when the label already says it.
- Writes go through `ns.SetValue`, which applies the setting and refreshes the window.

## The client

Forever runs the retail 12.x API on classic-era content.

- Secret values exist (unit data, auras in combat, some anchors). Read game values through `ns.Clean(v)`, which returns nil for a secret value. Never compare a secret value.
- `ReloadUI()` is blocked for addons. Reloading goes through an `InsecureActionButtonTemplate` button with `macrotext = "/reload"` (the minimap icon and the options window) or by rewriting `/rl` in the chat box.
- There are no specs (`GetSpecialization` is nil), and `BEAR_FORM` is nil (Bear is form 5, Dire Bear is 8).
- The whole game is one realm, so names never need a realm suffix.
- The UI frames are retail ones: `PlayerSpellsFrame` (spellbook and talents), `ProfessionsFrame`, `PartyFrame.MemberFrame1..4` and `.healthbar` / `.manabar` on unit frames. There is no `QuestLogFrame`, because the quest log sits in the world map.
- `RegisterForDrag` does nothing on a window that is already shown. Move & Scale drags via `GLOBAL_MOUSE_DOWN/UP` instead.

When unsure whether something exists, don't guess and don't write a fallback. Add a temporary file that writes what it finds into `SereneDB`, have the user `/reload` twice, and read `WTF/Account/817318#2/SavedVariables/Serene.lua` under the game folder. Remove the file afterwards.

## How the code is written

- One code path per API. No `if X then` around APIs that exist, no `C_Foo and C_Foo.Bar or Bar`, no pcall around events that exist.
- Keep guards only where something real can happen: forbidden frames, secret values, combat lockdown, fonts from LibSharedMedia that fail to load.
- Leave Blizzard's frames alone. Use `hooksecurefunc` and keep state in local tables, not as fields on their frames (taint). Hide Blizzard regions with `SetAlpha(0)` rather than `Hide()` when Blizzard keeps showing them.
- No backward compatibility. When a setting's key or format changes, just change it. No SereneDB migrations.
- Comments say why, not what. Nothing about how other addons do things.

## Workflow

- Commit straight to `main`.
- There are no tests. Check syntax with `luac -p` on the files you change (delete `luac.out` afterwards), then the user tests in game.
- `tools/release.sh <version>` bumps `## Version` in every TOC, writes the CHANGELOG section and zips every `Serene*` folder into `dist/`. It refuses to run if `## Interface` differs between TOCs. `tools/release.sh --check` only checks that Interface and Version match everywhere.
- `tools/mockups/render.sh` renders a nameplate collage into `art/mockup-nameplates.png` with headless Chromium, no game needed. `tools/mockups/nameplates.html` is a hand-built replica: update it when the nameplates' look changes. Mockups are only for what is hard to screenshot in game; the options window gets real screenshots.
- Every release gets a written summary. After `release.sh`, replace the generated commit list under the new version in CHANGELOG.md with a short summary for players: an intro if something affects installing or updating, then `### New`, `### Changed` and `### Fixed` as needed. No internal changes (README, CLAUDE.md, tooling, refactors). Then commit and tag. Don't push unless asked.
