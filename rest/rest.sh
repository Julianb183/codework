#!/usr/bin/env bash
set -euo pipefail

all=0
[[ "${1:-}" == "-a" || "${1:-}" == "--all" ]] && all=1

if [[ "$(uname -s)" == Darwin ]]; then
  if [[ -x "$HOME/bin/rest-screen" ]]; then
    if (( all )); then exec "$HOME/bin/rest-screen" --all; else exec "$HOME/bin/rest-screen"; fi
  fi
  echo 'rest: rest-screen is not installed; sleeping with macOS pmset' >&2
  /usr/bin/pmset sleepnow
elif command -v systemctl >/dev/null 2>&1; then
  echo 'Press Ctrl+C to cancel before sleep.'
  sleep 1
  systemctl suspend
else
  echo 'rest: no supported sleep command found' >&2
  exit 1
fi
