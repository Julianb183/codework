#!/bin/sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
mkdir -p "$HOME/.local/bin"
cp "$ROOT/bin/codework" "$HOME/.local/bin/codework"
chmod +x "$HOME/.local/bin/codework"

for rc in "$HOME/.profile" "$HOME/.bashrc" "$HOME/.zshrc"; do
  touch "$HOME/$rc"
  file="$HOME/$rc"
  if ! grep -Fqx 'export PATH="$HOME/.local/bin:$PATH"' "$file"; then
    printf '\n# codework\nexport PATH="$HOME/.local/bin:$PATH"\n' >> "$file"
  fi
done

echo "Installed $HOME/.local/bin/codework"
echo 'Restart your shell or run: export PATH="$HOME/.local/bin:$PATH"'
