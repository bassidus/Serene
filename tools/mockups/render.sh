#!/usr/bin/env bash
# Renders the nameplate mockup into art/ with headless Chromium, without logging
# into the game. Needs chromium, ImageMagick (magick) and unzip.
#   tools/mockups/render.sh
set -euo pipefail

here="$(cd "$(dirname "$0")" && pwd)"
root="$(cd "$here/../.." && pwd)"
work="$(mktemp -d)"
trap 'rm -rf "$work"' EXIT

cp "$here/nameplates.html" "$here/belleza.woff2" "$work/"
cp -r "$here/icons" "$work/"
cp "$root/art/logo.png" "$work/"
unzip -p "$root/tools/friz-quadrata-regular.zip" "*.ttf" > "$work/friz.ttf"
# Two patches without plates in them, behind the nameplates.
magick "$root/art/serene-curseforge.png" -crop 376x150+1075+530 +repage "$work/sceneA.png"
magick "$root/art/serene-curseforge.png" -crop 404x150+1481+530 +repage "$work/sceneB.png"

# Chromium sometimes saves the screenshot before the page has finished
# painting, which leaves a white block; such a shot is retaken.
shoot() {  # url width height out
    local url="$1" w="$2" h="$3" out="$4" white
    for _ in 1 2 3 4 5; do
        chromium --headless=new --disable-gpu --hide-scrollbars --run-all-compositor-stages-before-draw \
            --force-device-scale-factor=2 --default-background-color=00000000 \
            --window-size="$w,$h" --virtual-time-budget=8000 --allow-file-access-from-files \
            --screenshot="$out" "$url" 2>/dev/null
        # Share of pure white pixels; white text alone stays under 1% and the block seen so far covers about 5%.
        white="$(magick "$out" -alpha off -fill black +opaque white -format '%[fx:mean]' info:)"
        if awk -v w="$white" 'BEGIN { exit !(w < 0.02) }'; then return 0; fi
    done
    echo "render.sh: $out still has a white block after 5 tries" >&2
    return 1
}

shoot "file://$work/nameplates.html" 1000 836 "$root/art/mockup-nameplates.png"
echo "Wrote art/mockup-nameplates.png"
