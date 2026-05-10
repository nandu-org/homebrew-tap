#!/usr/bin/env bash
# bump.sh — bump Formula/ndf.rb to a new ndf CLI release version.
#
# Usage: ./bump.sh 2.1.2

set -e
VER="${1:-}"
[ -n "$VER" ] || { echo "usage: $0 <version>  (e.g. $0 2.1.2)"; exit 1; }

cd "$(dirname "$0")"
git pull --ff-only

TMP=$(mktemp)
trap "rm -f $TMP" EXIT

curl -fsSL "https://github.com/nandu-org/nandu-dev-framework-cli/releases/download/v${VER}/checksums.txt" > "$TMP"
ARM64=$(awk '/ndf-darwin-arm64$/ {print $1}' "$TMP")
AMD64=$(awk '/ndf-darwin-amd64$/ {print $1}' "$TMP")
LINUX_AMD64=$(awk '/ndf-linux-amd64$/ {print $1}' "$TMP")
[ -n "$ARM64" ] && [ -n "$AMD64" ] && [ -n "$LINUX_AMD64" ] || { echo "missing one or more checksums"; exit 1; }

echo "darwin/arm64: $ARM64"
echo "darwin/amd64: $AMD64"
echo "linux/amd64:  $LINUX_AMD64"

python3 - "$VER" "$ARM64" "$AMD64" "$LINUX_AMD64" <<'PY'
import sys, re
from pathlib import Path
ver, arm64, amd64, linux_amd64 = sys.argv[1:]
f = Path("Formula/ndf.rb")
t = f.read_text()
t = re.sub(r'version "[^"]+"', f'version "{ver}"', t, count=1)
t = re.sub(r'(ndf-darwin-arm64"\n\s*sha256 ")[^"]+(")', rf'\g<1>{arm64}\g<2>', t)
t = re.sub(r'(ndf-darwin-amd64"\n\s*sha256 ")[^"]+(")', rf'\g<1>{amd64}\g<2>', t)
t = re.sub(r'(ndf-linux-amd64"\n\s*sha256 ")[^"]+(")', rf'\g<1>{linux_amd64}\g<2>', t)
f.write_text(t)
print(f"OK: Formula/ndf.rb updated to v{ver}")
PY

git --no-pager diff Formula/ndf.rb
git add Formula/ndf.rb
git commit -m "ndf ${VER}"
git push
