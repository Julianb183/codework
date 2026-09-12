#!/bin/sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
mkdir -p "$HOME/bin"
cp "$ROOT/bin/codework" "$HOME/bin/codework"
chmod +x "$HOME/bin/codework"

for rc in "$HOME/.zprofile" "$HOME/.bash_profile"; do
  touch "$rc"
  if ! grep -Fqx 'export PATH="$HOME/bin:$PATH"' "$rc"; then
    printf '\n# codework\nexport PATH="$HOME/bin:$PATH"\n' >> "$rc"
  fi
done

echo "Installed $HOME/bin/codework"
echo 'Restart your shell or run: export PATH="$HOME/bin:$PATH"'
