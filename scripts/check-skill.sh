#!/bin/sh
# Confirm the public skill source and that the current skills CLI can install it.
set -eu

root=$(CDPATH= cd -- "$(dirname "$0")/.." && pwd)
skill="$root/skills/gitpin/SKILL.md"
readme="$root/README.md"
command='npx skills add https://github.com/writeitai/gitpin --skill gitpin -a codex -y'

test -f "$skill"
test -f "$readme"
grep -F "$command" "$readme" >/dev/null

awk '
  NR == 1 { if ($0 != "---") { print "SKILL.md must start with frontmatter" > "/dev/stderr"; exit 1 } next }
  $0 == "---" { closed = 1; exit 0 }
  $0 ~ /^name: / { name = substr($0, 7); gsub(/^["'\'']|["'\'']$/, "", name) }
  $0 ~ /^description: / { description = substr($0, 14) }
  END {
    if (!closed) { print "SKILL.md frontmatter must be closed" > "/dev/stderr"; exit 1 }
    if (name != "gitpin") { print "skill name must be gitpin" > "/dev/stderr"; exit 1 }
    if (description == "") { print "skill description is required" > "/dev/stderr"; exit 1 }
  }
' "$skill"

work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT
git -C "$work" init -q
(
  cd "$work"
  npx --yes skills@1.7.4 add "$root" --skill gitpin -a codex -y --copy --json
)
installed=$(find "$work" -type f -path '*/gitpin/SKILL.md' | head -n 1)
test -n "$installed"
grep -F 'name: gitpin' "$installed" >/dev/null
echo "installed $installed"
