#!/usr/bin/env bash
# Draws the options window's own textures into Serene/Media with ImageMagick:
#   Corner.tga      the top-left quarter of a rounded 1px line (radius 8 units,
#                   4 px per unit), white; flipped by texcoords for the others
#   CornerFill.tga  the quarter disc that line closes, white, for the fills
#   Glow.tga        a soft white radial falloff in alpha, the window's glow
#   Knob.tga        the sliders' knob: a gold bead in a dark ring, in color
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
