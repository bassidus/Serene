#!/usr/bin/env bash
# Prepares a CurseForge release: sets ## Version in Serene.toc, turns the
# commits since the last v* tag into a CHANGELOG.md section (replacing
# "Unreleased"), and zips the tracked files, without .git* and tools/, into
# dist/Serene-<version>.zip with a Serene/ folder at the top.
# Commit, tag v<version> and push afterwards.
set -euo pipefail

version=${1:?usage: tools/release.sh <version>}
cd "$(dirname "$0")/.."

if git rev-parse -q --verify "refs/tags/v$version" >/dev/null; then
    echo "tag v$version already exists" >&2
    exit 1
fi

last=$(git describe --tags --abbrev=0 --match 'v*' 2>/dev/null || true)
entries=$(git log --no-merges --format='- %s' "${last:+$last..}HEAD")

sed -i "s/^## Version: .*/## Version: $version/" Serene.toc

# New section under the title; any old Unreleased section is dropped.
awk -v head="## $version ($(date +%F))" -v entries="$entries" '
    !done && /^## / { print head "\n\n" entries "\n"; done = 1 }
    /^## Unreleased/ { skip = 1; next }
    skip && /^## / { skip = 0 }
    !skip { print }
    END { if (!done) print "\n" head "\n\n" entries }
' CHANGELOG.md > CHANGELOG.md.tmp && mv CHANGELOG.md.tmp CHANGELOG.md

stage=$(mktemp -d)
trap 'rm -rf "$stage"' EXIT
mkdir "$stage/Serene"
git ls-files -z | grep -zv -e '^\.git' -e '^tools/' | xargs -0 cp --parents -t "$stage/Serene"
mkdir -p dist
rm -f "dist/Serene-$version.zip"
(cd "$stage" && zip -qr - Serene) > "dist/Serene-$version.zip"
echo "dist/Serene-$version.zip"
