#!/usr/bin/env bash
# Renders the mockups (options window and overlay) into art/ with headless
# Chromium, without logging into the game. Needs chromium, ImageMagick (magick)
# and unzip; the overlay uses the system's Nimbus Sans Narrow (gsfonts).
#   tools/mockups/render.sh
set -euo pipefail

here="$(cd "$(dirname "$0")" && pwd)"
root="$(cd "$here/../.." && pwd)"
work="$(mktemp -d)"
trap 'rm -rf "$work"' EXIT

version="$(sed -n 's/^## Version: *//p' "$root/Serene/Serene.toc" | tr -d '\r')"

cp "$here/options.html" "$here/overlay.html" "$here/belleza.woff2" "$work/"
cp "$root/art/logo.png" "$work/"
unzip -p "$root/tools/friz-quadrata-regular.zip" "*.ttf" > "$work/friz.ttf"
# A patch of game world from the old promo screenshot, behind the overlay.
magick "$root/art/serene-curseforge.png" -crop 400x274+1484+406 +repage "$work/scene.png"

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

shoot "file://$work/options.html?state=usage&version=$version"   700 686 "$root/art/mockup-options-usage.png"
shoot "file://$work/options.html?state=overlay&version=$version" 700 686 "$root/art/mockup-options-overlay-settings.png"
shoot "file://$work/overlay.html" 560 320 "$root/art/mockup-overlay.png"
echo "Wrote art/mockup-options-usage.png, art/mockup-options-overlay-settings.png, art/mockup-overlay.png"
