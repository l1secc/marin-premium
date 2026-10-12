#!/usr/bin/env bash
# ============================================================================
#  Marin Premium · bootstrap
#
#  Omarchy deliberately never runs code from an installed theme:
#  `omarchy theme install <url>` clones the repo, keeps every colour/config
#  file, drops the handful of files that would run code, and applies the theme.
#  So this script is the one-time, idempotent setup that puts the photo
#  switcher (`marin-next`) on your PATH and keeps it there.
#
#  Usage:
#    install.sh              install the switcher + theme-set hook
#    install.sh --no-hook    install only the switcher
#    install.sh --uninstall  remove the switcher and hook
# ============================================================================
set -euo pipefail

THEME_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
THEME_NAME="$(basename -- "$THEME_DIR")"
BIN_DIR="${XDG_BIN_HOME:-$HOME/.local/bin}"
HOOK_DIR="$HOME/.config/omarchy/hooks/theme-set.d"
HOOK_FILE="$HOOK_DIR/marin-premium.hook"

WITH_HOOK=1
UNINSTALL=0
for arg in "$@"; do
  case "$arg" in
    --no-hook)   WITH_HOOK=0 ;;
    --uninstall) UNINSTALL=1 ;;
    -h | --help) sed -n '3,15p' "${BASH_SOURCE[0]}" | sed 's/^# \{0,1\}//'; exit 0 ;;
    *) echo "Unknown option: $arg" >&2; exit 2 ;;
  esac
done

if (( UNINSTALL )); then
  rm -f "$BIN_DIR/marin-next" "$HOOK_FILE"
  echo "Removed $BIN_DIR/marin-next and $HOOK_FILE"
  exit 0
fi

# 1. Put the photo switcher on PATH.
mkdir -p "$BIN_DIR"
install -m755 "$THEME_DIR/tools/marin-next" "$BIN_DIR/marin-next"
echo "✓ installed $BIN_DIR/marin-next"

# 2. A theme-set hook keeps the switcher fresh whenever the theme is re-applied
#    (this is the user-owned hook mechanism Omarchy provides; a theme repo is
#    not allowed to install it by itself).
if (( WITH_HOOK )); then
  mkdir -p "$HOOK_DIR"
  cat >"$HOOK_FILE" <<'HOOK'
#!/usr/bin/env bash
# Keep the Marin Premium photo switcher installed after the theme is (re)applied.
[[ ${1:-} == marin-premium ]] || exit 0
theme_dir="$HOME/.config/omarchy/themes/marin-premium"
[[ -x $theme_dir/tools/marin-next ]] || exit 0
install -m755 "$theme_dir/tools/marin-next" "${XDG_BIN_HOME:-$HOME/.local/bin}/marin-next"
HOOK
  chmod 755 "$HOOK_FILE"
  echo "✓ installed hook $HOOK_FILE"
fi

# 3. PATH check.
case ":$PATH:" in
  *":$BIN_DIR:"*) ;;
  *) echo "! note: $BIN_DIR is not on your PATH — add it to call 'marin-next' directly." >&2 ;;
esac

count=$(find "$THEME_DIR/palettes" -mindepth 1 -maxdepth 1 -type d 2>/dev/null | wc -l)
echo "Marin Premium: $count photos under one theme."
echo "Try:  marin-next  |  marin-next prev  |  marin-next sync  |  marin-next 20"
