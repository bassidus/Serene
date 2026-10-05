#!/usr/bin/env bash
# tools/release.sh <version>   Prepares a CurseForge release: checks that every
#                              Serene* TOC has the same ## Interface, sets
#                              ## Version in all of them, turns the commits since
#                              the last v* tag into a CHANGELOG.md section
#                              (replacing "Unreleased") and zips every Serene*
#                              folder into dist/Serene-<version>.zip.
#                              Commit, tag v<version> and push afterwards.
# tools/release.sh --check     Only checks that ## Interface and ## Version
#                              match across the TOCs.
set -euo pipefail

cd "$(dirname "$0")/.."

addons=()
for dir in Serene*/; do addons+=("${dir%/}"); done

field() {  # field <addon> <name>: the value of "## <name>:" in the addon's TOC
    sed -n "s/^## $2: *//p" "$1/$1.toc" | tr -d '\r'
}

# check <name> <wanted>: every TOC has "## <name>: <wanted>".
check() {
    local bad=0
    for addon in "${addons[@]}"; do
        if [[ ! -f $addon/$addon.toc ]]; then
            echo "$addon: no $addon.toc" >&2
            bad=1
            continue
        fi
        local value
        value=$(field "$addon" "$1")
        if [[ $value != "$2" ]]; then
            echo "$addon: ## $1: '$value', expected '$2'" >&2
            bad=1
        fi
    done
    return $bad
}

interface=$(field Serene Interface)

if [[ ${1:-} == --check ]]; then
    ok=0
    check Interface "$interface" || ok=1
    check Version "$(field Serene Version)" || ok=1
    [[ $ok == 0 ]] && echo "All ${#addons[@]} TOCs: Interface $interface, Version $(field Serene Version)"
    exit $ok
fi

version=${1:?usage: tools/release.sh <version> | --check}

if git rev-parse -q --verify "refs/tags/v$version" >/dev/null; then
    echo "tag v$version already exists" >&2
    exit 1
fi

check Interface "$interface" || { echo "## Interface differs between the TOCs" >&2; exit 1; }

for addon in "${addons[@]}"; do
    sed -i "s/^## Version: .*/## Version: $version/" "$addon/$addon.toc"
done
check Version "$version" || { echo "## Version could not be set in every TOC" >&2; exit 1; }

last=$(git describe --tags --abbrev=0 --match 'v*' 2>/dev/null || true)
entries=$(git log --no-merges --format='- %s' "${last:+$last..}HEAD")

# New section under the title; any old Unreleased section is dropped.
awk -v head="## $version ($(date +%F))" -v entries="$entries" '
    !done && /^## / { print head "\n\n" entries "\n"; done = 1 }
    /^## Unreleased/ { skip = 1; next }
    skip && /^## / { skip = 0 }
    !skip { print }
    END { if (!done) print "\n" head "\n\n" entries }
' CHANGELOG.md > CHANGELOG.md.tmp && mv CHANGELOG.md.tmp CHANGELOG.md

# Every Serene* folder at the top of the zip, as they go into Interface/AddOns.
stage=$(mktemp -d)
trap 'rm -rf "$stage"' EXIT
git ls-files -z -- "${addons[@]}" | xargs -0 cp --parents -t "$stage"
mkdir -p dist
rm -f "dist/Serene-$version.zip"
(cd "$stage" && zip -qr - "${addons[@]}") > "dist/Serene-$version.zip"
echo "dist/Serene-$version.zip (${#addons[@]} addons, Interface $interface)"
