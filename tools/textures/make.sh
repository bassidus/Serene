#!/usr/bin/env bash
# Draws the options window's own textures into Serene/Media with ImageMagick:
#   Corner.tga      the top-left quarter of a rounded 1px line (radius 8 units,
#                   4 px per unit), white; flipped by texcoords for the others
#   CornerFill.tga  the quarter disc that line closes, white, for the fills
#   Glow.tga        a soft white radial falloff in alpha, the window's glow
#   Knob.tga        the sliders' knob: a gold bead in a dark ring, in color
# and the pet happiness faces and the pet frame masks into SereneUnitFrames/Media.
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

# The pet happiness faces, emoji-like: green, orange and red. 64 px drawn at 256.
faces="$root/SereneUnitFrames/Media"
mkdir -p "$faces"
face() {  # face <out> <outline> <light> <dark> <features...>
    local file="$1" ink="$2" light="$3" dark="$4"; shift 4
    magick -size 256x256 xc:none -fill "$ink" -draw "circle 128,128 128,4" \
        \( -size 256x256 radial-gradient:"$light"-"$dark" \
           \( -size 256x256 xc:black -fill white -draw "circle 128,128 128,16" \) \
           -alpha off -compose CopyOpacity -composite \) -compose Over -composite \
        -fill "$ink" -stroke "$ink" -strokewidth 1 "$@" -resize 64x64 \
        -define tga:compression=none -type TrueColorAlpha "$faces/$file"
}
eyes=(-draw "ellipse 90,100 13,21 0,360" -draw "ellipse 166,100 13,21 0,360")
line=(-fill none -strokewidth 15 -draw "stroke-linecap round")
face Happy.tga '#0f3d06' '#9cf06a' '#3fa82a' "${eyes[@]}" "${line[@]}" -draw "path 'M 74,150 Q 128,210 182,150'"
face Content.tga '#5a2600' '#ffc06a' '#ef7a14' "${eyes[@]}" "${line[@]}" -draw "line 86,172 170,172"
face Unhappy.tga '#4a0a00' '#ff7a52' '#cf2614' \
    -draw "ellipse 92,122 12,17 0,360" -draw "ellipse 164,122 12,17 0,360" \
    "${line[@]}" -draw "line 62,74 112,100" -draw "line 194,74 144,100" \
    -draw "path 'M 82,190 Q 128,148 174,190'"

echo "Wrote SereneUnitFrames/Media/Happy.tga, Content.tga and Unhappy.tga"

# The pet frame's one tall health bar, 75x18 units at 256x64 drawn at
# 1024x256: the left edge cut along the outside of the portrait ring (a circle
# of radius 20.5 units centred 15.3 left of the bar and 5 below its top, an
# ellipse here as the pixels aren't square), the right corners cut off at
# 45 degrees like the frame art's, the right edge half a unit in.
magick -size 1024x256 xc:black -fill white \
    -draw "polygon 0,0 1003,0 1017,14 1017,242 1003,256 0,256" \
    -fill black -draw "ellipse -208.9,71.1 279.9,291.6 0,360" \
    -resize 256x64 -background white -alpha shape \
    -define tga:compression=none -type TrueColorAlpha "$faces/PetBarMask.tga"

# The pet frame art's line between the health and power bars and the shadow
# under it at the top of the power bar's place, cut out over the art's
# 120x49 units at 2 px each: from the ring to the right edge, short of the
# soft shadow on its inside. The line reaches into that shadow, so it is
# thinned there to the shadow's own darkness, measured in game.
magick -size 241x98 xc:white -fill black -draw "rectangle 92,49 226,63" \
    -fill gray50 -draw "rectangle 227,52 227,56" -fill gray65 -draw "rectangle 228,52 228,56" \
    -fill gray75 -draw "rectangle 227,57 227,60" -fill gray85 -draw "rectangle 228,57 228,60" \
    -background white -alpha shape \
    -define tga:compression=none -type TrueColorAlpha "$faces/PetArtMask.tga"

echo "Wrote SereneUnitFrames/Media/PetBarMask.tga and PetArtMask.tga"
