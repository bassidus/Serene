#!/usr/bin/env bash
# Draws the options window's own textures into Serene/Media with ImageMagick:
#   Corner.tga      the top-left quarter of a rounded 1px line (radius 8 units,
#                   4 px per unit), white; flipped by texcoords for the others
#   CornerFill.tga  the quarter disc that line closes, white, for the fills
#   Glow.tga        a soft white radial falloff in alpha, the window's glow
#   Knob.tga        the sliders' knob: a gold bead in a dark ring, in color
# and the pet happiness icons (from SVG, with rsvg-convert) and the pet frame
# masks into SereneUnitFrames/Media.
# Everything is drawn at 4x and scaled down, which anti-aliases the curves.
#   tools/textures/make.sh
set -euo pipefail

root="$(cd "$(dirname "$0")/../.." && pwd)"
out="$root/Serene/Media"

# 32 px textures drawn at 128: the curve's center is the bottom-right corner.
# The line runs from radius 7 to 8 units (112 to 128 px at 4x).
magick \( -size 128x128 xc:none -fill white -draw "circle 128,128 128,0" \) \
    \( -size 128x128 xc:none -fill white -draw "circle 128,128 128,16" \) \
    -compose DstOut -composite -resize 32x32 \
    -define tga:compression=none -type TrueColorAlpha "$out/Corner.tga"

magick -size 128x128 xc:none -fill white -draw "circle 128,128 128,0" -resize 32x32 \
    -define tga:compression=none -type TrueColorAlpha "$out/CornerFill.tga"

# Alpha falls from 1 in the middle to 0 at the edge of the inscribed circle.
magick -size 256x256 radial-gradient:white-black -sigmoidal-contrast 3,40% \
    \( -size 256x256 xc:white \) +swap -alpha off -compose CopyOpacity -composite \
    -define tga:compression=none -type TrueColorAlpha "$out/Glow.tga"

# Gold like the checkboxes' check, lit from above.
magick -size 128x128 xc:none -fill '#1a0d05' -draw "circle 64,64 64,2" \
    \( -size 128x128 gradient:'#ffe68a-#9c5e0c' \
       \( -size 128x128 xc:black -fill white -draw "circle 64,64 64,14" \) \
       -alpha off -compose CopyOpacity -composite \) -compose Over -composite \
    -fill 'rgba(255,255,255,0.35)' -draw "ellipse 64,42 28,14 0,360" -resize 32x32 \
    -define tga:compression=none -type TrueColorAlpha "$out/Knob.tga"

echo "Wrote Serene/Media/Corner.tga, CornerFill.tga, Glow.tga and Knob.tga"

# The pet happiness icons, one folder per style in tools/textures/happiness,
# drawn from SVG at 256 for the gradients and scaled to 64 px. The greens
# have the pet health bar's colors, sampled in game.
svgs="$root/tools/textures/happiness"
media="$root/SereneUnitFrames/Media"
png="$(mktemp --suffix=.png)"
trap 'rm -f "$png"' EXIT
for svg in "$svgs"/*/*.svg; do
    style="$(basename "$(dirname "$svg")")"
    mkdir -p "$media/Happiness/$style"
    rsvg-convert -w 256 -h 256 "$svg" -o "$png"
    magick "$png" -resize 64x64 -define tga:compression=none -type TrueColorAlpha \
        "$media/Happiness/$style/$(basename "$svg" .svg).tga"
done

echo "Wrote SereneUnitFrames/Media/Happiness/*/Happy.tga, Content.tga and Unhappy.tga"

# The pet frame's one tall health bar, 68x16.5 units at 256x64 drawn at
# 1024x256: the inside of the art's health and power slots together, with
# their corners rounded by a unit.
magick -size 1024x256 xc:black -fill white -draw "roundrectangle 0,0 1023,255 15,15" \
    -resize 256x64 -background white -alpha shape \
    -define tga:compression=none -type TrueColorAlpha "$media/PetBarMask.tga"

# The pet frame art's line between the health and power slots, with the
# slots' rims and rounded corners on either side of it and its joint in the
# frame's right edge, cut out over the art's 120x49 units at 2 px each.
magick -size 240x98 xc:white -fill black -draw "rectangle 90,53 235,62" \
    -background white -alpha shape \
    -define tga:compression=none -type TrueColorAlpha "$media/PetArtMask.tga"

echo "Wrote SereneUnitFrames/Media/PetBarMask.tga and PetArtMask.tga"
