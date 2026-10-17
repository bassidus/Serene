#!/usr/bin/env bash
# tools/check.sh   Release checks that read the code and change nothing.
#                  FAIL is a problem to fix before a release; WARN and INFO
#                  are for a look. Exits 1 when anything failed.
#
#   toc        every file a TOC lists exists, every .lua is listed
#   versions   ## Interface and ## Version match (release.sh --check)
#   symlinks   every Serene* folder is linked into the game's AddOns
#   syntax     luac5.1 -p on every .lua
#   globals    no global writes but Serene, Serene*DB and SLASH_*; no global
#              read that is neither in the newest probe's api.txt, nor
#              ALL_CAPS, nor in tools/known-globals.txt (a local used above
#              its line reads as a global)
#   members    ns./NP./W. members nothing uses, or only their own file uses
#   leftovers  print(), luac.out, probe files, TODO/FIXME, comment lines
#              over 100 characters
#   pcall      every pcall, each of which should be a known beta workaround
#   saved      stale SereneDB keys (tools/sv-clean.lua)
#   changed    files changed since the last v* tag, for the in-game tests
set -uo pipefail

cd "$(dirname "$0")/.."

ADDONS_DIR="/mnt/wd1000/Battle.net/World of Warcraft/_classic_beta_/Interface/AddOns"
failed=0

section() { printf '\n== %s\n' "$1"; }
fail() { echo "FAIL $*"; failed=1; }
warn() { echo "WARN $*"; }
info() { echo "INFO $*"; }

command -v luac5.1 >/dev/null || { echo "luac5.1 is needed (the client runs Lua 5.1)" >&2; exit 1; }

addons=()
for dir in Serene*/; do addons+=("${dir%/}"); done
# Serene's own files, without the embedded libraries.
mapfile -t ours < <(find Serene* -name '*.lua' -not -path '*/Libs/*' | sort)

section toc
for addon in "${addons[@]}"; do
    toc="$addon/$addon.toc"
    listed=$(grep -v '^\s*#' "$toc" | tr -d '\r' | sed '/^\s*$/d' | tr '\\' '/')
    while read -r file; do
        [[ -f $addon/$file ]] || fail "$toc lists $file, which does not exist"
    done <<< "$listed"
    while read -r file; do
        grep -qxF "$file" <<< "$listed" || fail "$addon/$file is not in $toc"
    done < <(cd "$addon" && find . -name '*.lua' -not -path './Libs/*' | sed 's|^\./||')
done

section versions
tools/release.sh --check || failed=1

section symlinks
for addon in "${addons[@]}"; do
    link="$ADDONS_DIR/$addon"
    if [[ ! -L $link ]]; then
        fail "$addon has no symlink in AddOns"
    elif [[ $(readlink -f "$link") != "$(readlink -f "$addon")" ]]; then
        fail "AddOns/$addon points to $(readlink "$link")"
    fi
done

section syntax
while read -r file; do
    luac5.1 -p "$file" || fail "$file does not parse"
done < <(find Serene* -name '*.lua')

section globals
api=$(ls -d tools/ForeverProbe/reports/*/ | sort -V | tail -1)api.txt
known=$( { sed 's/[. (=].*//' "$api"; grep -v '^#' tools/known-globals.txt; } | sort -u)
reads=""
for file in "${ours[@]}"; do
    listing=$(luac5.1 -p -l "$file")
    while read -r name; do
        [[ $name == Serene || $name == Serene*DB || $name == SLASH_* ]] || fail "$file writes the global $name"
    done < <(grep SETGLOBAL <<< "$listing" | sed 's/.*; //' | sort -u)
    while read -r name; do
        reads+="$name"$'\n'
        [[ $name =~ ^[A-Z0-9_]+$ ]] && continue
        grep -qxF "$name" <<< "$known" || fail "$file reads the global $name: a local used too early, or new (check in game, then add it to tools/known-globals.txt)"
    done < <(grep GETGLOBAL <<< "$listing" | sed 's/.*; //' | sort -u)
done
while read -r name; do
    grep -qxF "$name" <<< "$reads" || warn "tools/known-globals.txt: nothing reads $name any more"
done < <(grep -v '^#' tools/known-globals.txt)
info "api.txt from $api"

section members
code=$(for file in "${ours[@]}"; do sed "s|--.*||; s|^|$file:|" "$file"; done)
while read -r member; do
    name=${member#*.}
    files=$(grep -E "\b(ns|NP|W|Serene)\.$name\b" <<< "$code" | cut -d: -f1 | sort -u)
    uses=$(grep -oE "\b(ns|NP|W|Serene)\.$name\b" <<< "$code" | wc -l)
    if (( uses == 1 )); then
        fail "$member is set in $files and never used"
    elif [[ $(wc -l <<< "$files") == 1 ]]; then
        warn "$member is only used in $files (could be local)"
    fi
done < <(grep -ohE '(function (ns|NP|W)\.[A-Za-z_]+|(ns|NP|W)\.[A-Za-z_]+ *=[^=])' "${ours[@]}" \
         | sed -E 's/function //; s/ *=.*//' | sort -u)

section leftovers
grep -nE '(^|[^.:_[:alnum:]])print\(' "${ours[@]}" | while read -r line; do fail "print: $line"; done
find . -name luac.out -not -path './.git/*' | while read -r f; do fail "$f left by luac"; done
find Serene* -iname '*probe*' | while read -r f; do fail "probe file $f"; done
grep -nE '\b(TODO|FIXME|XXX)\b' "${ours[@]}" | while read -r line; do warn "$line"; done
awk 'length($0) > 100 && $0 ~ /^ *--/ { print FILENAME ":" FNR ": " length($0) " characters" }' "${ours[@]}" \
    | while read -r line; do warn "long comment $line"; done

section pcall
grep -n 'pcall(' "${ours[@]}" | while read -r line; do info "$line"; done

section saved
if ! out=$(lua tools/sv-clean.lua); then
    while read -r line; do warn "$line"; done <<< "$out"
fi

section changed
last=$(git describe --tags --abbrev=0 --match 'v*' 2>/dev/null || true)
info "since ${last:-the first commit}:"
git diff --name-only "${last:+$last}" -- 'Serene*' | sed 's|/.*||' | sort | uniq -c \
    | while read -r n addon; do info "  $addon: $n file(s)"; done
git diff --name-only "${last:+$last}" -- 'Serene*' | sed 's|^|INFO     |'

echo
if (( failed )); then echo "Some checks FAILED."; else echo "No failures."; fi
exit $failed
