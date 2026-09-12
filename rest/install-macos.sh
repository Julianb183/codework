#!/bin/sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
mkdir -p "$HOME/bin"
cp "$ROOT/rest.sh" "$HOME/bin/rest"
chmod +x "$HOME/bin/rest"
echo "Installed $HOME/bin/rest"
