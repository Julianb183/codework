#!/usr/bin/env bash
set -euo pipefail
all=0
mode=sleep
for arg in "$@"; do
  case "$arg" in
    -a|--all) all=1;;
    -z|--shutdown) mode=shutdown;;
    -d|--restart) mode=restart;;
    '-?'|--help|-h)
      printf '%s\n' 'Usage: rest [-a] [-z|-d] [-?]'
      printf '%s\n' '  rest       Sleep'
      printf '%s\n' '  rest -z    Shut down completely (no confirmation prompt)'
      printf '%s\n' '  rest -d    Restart (no confirmation prompt)'
      printf '%s\n' '  rest -a    Use the all-screens animation when available'
      exit 0;;
    *) printf 'rest: unknown option: %s\n' "$arg" >&2; exit 2;;
  esac
done
case "$(uname -s)" in
  Darwin)
    case "$mode" in
      shutdown) exec /sbin/shutdown -h now;;
      restart) exec /sbin/shutdown -r now;;
    esac
    if [[ -x "$HOME/bin/rest-screen" ]]; then
      if ((all)); then exec "$HOME/bin/rest-screen" --all; else exec "$HOME/bin/rest-screen"; fi
    fi
    exec /usr/bin/pmset sleepnow;;
  Linux)
    case "$mode" in
      shutdown) exec systemctl poweroff;;
      restart) exec systemctl reboot;;
    esac
    printf '%s\n' 'Press Ctrl+C within one second to cancel.'
    sleep 1
    exec systemctl suspend;;
  *) printf 'rest: unsupported platform\n' >&2; exit 1;;
esac
