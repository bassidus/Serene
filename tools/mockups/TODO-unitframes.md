# TODO: unit frame collage

A collage like `art/mockup-nameplates.png` for SereneUnitFrames: class colors, dark frames,
portrait vs class icon. Built from real screenshots, not an HTML replica: the frames are
Blizzard's art and 3D portraits, which would look fake rebuilt.

## Screenshots to take

Same camera and UI scale for all, with the UI scale turned up so the frames are big
(the old one, 399x202, is too small for a collage):

1. Dark frames on, portrait (player + pet, as in `~/Pictures/Screenshots/Screenshot_20261005_195419.png`)
2. Dark frames off
3. Class icon as portrait
4. Optional: a target frame on another player, or party frames

## Class colors

One screenshot is enough for all nine classes: recolor the health bar. The game desaturates
the bar texture and tints it with the class color (`SetStatusBarDesaturated` +
`SetStatusBarColor`), so dividing the screenshot's bar by its class color gives the gray
texture back, and multiplying by another class color gives that class. Text and borders are
left alone by a mask (bar pixels have blue well above red on a warlock bar).

Tried on the old screenshot (warlock, bar at x 149-377, y 51-85) and it looked right:

```python
WARLOCK = np.array([0.53, 0.53, 0.93])
reg = img[y0:y1, x0:x1]                       # RGB 0..1
r, g, b = reg[..., 0], reg[..., 1], reg[..., 2]
m = np.clip(((b - r) / np.maximum(b, 0.01) - 0.2) / 0.15, 0, 1)[..., None]
tex = (reg / WARLOCK).mean(axis=2, keepdims=True)
img[y0:y1, x0:x1] = reg * (1 - m) + np.clip(tex * np.array(color), 0, 1) * m
```

The mask depends on the screenshot's own class; for another class, change the tint and the mask.
`RAID_CLASS_COLORS`: Warrior .78 .61 .43, Paladin .96 .55 .73, Hunter .67 .83 .45,
Rogue 1 .96 .41, Priest 1 1 1, Shaman 0 .44 .87, Mage .25 .78 .92, Druid 1 .49 .04,
Warlock .53 .53 .93.

## Then

- A script under `tools/mockups/` (Python + Pillow/numpy) that does the recoloring, and a page
  in the nameplates collage's style that lays out the screenshots; render it from `render.sh`.
- Keep the source screenshots in the repo (e.g. `tools/mockups/screenshots/`) so it can be redone.
