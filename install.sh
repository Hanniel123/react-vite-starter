#!/usr/bin/env bash

# ================================
# Safe bash mode
# ================================
set -euo pipefail

# ================================
# Colors
# ================================
GREEN="\033[0;32m"
BLUE="\033[0;34m"
YELLOW="\033[1;33m"
RED="\033[0;31m"
NC="\033[0m"

log() {
  echo -e "${BLUE}[INFO]${NC} $1"
}

success() {
  echo -e "${GREEN}[SUCCESS]${NC} $1"
}

warn() {
  echo -e "${YELLOW}[WARNING]${NC} $1"
}

error() {
  echo -e "${RED}[ERROR]${NC} $1"
  exit 1
}

# ================================
# Constants
# ================================
BIN_DIR="$(cd "$(dirname "$0")" && pwd)/bin"
INSTALL_DIR="/usr/local/bin"

SCRIPTS=(
  react-starter
  react-feature
)

# ================================
# Checks
# ================================
log "Checking bin directory..."
[ -d "$BIN_DIR" ] || error "bin/ directory not found."

log "Checking install directory..."
[ -w "$INSTALL_DIR" ] || warn "You may need sudo privileges to write to $INSTALL_DIR"

# ================================
# Install scripts
# ================================
log "Installing scripts to $INSTALL_DIR"

for script in "${SCRIPTS[@]}"; do
  SRC="$BIN_DIR/$script"
  DEST="$INSTALL_DIR/$script"

  [ -f "$SRC" ] || error "Script '$script' not found in bin/"

  log "Installing $script..."

  chmod +x "$SRC"
  sudo cp "$SRC" "$DEST"
  sudo chmod +x "$DEST"

  success "$script installed"
done

# ================================
# Verification
# ================================
echo
log "Verifying installation..."

for script in "${SCRIPTS[@]}"; do
  if command -v "$script" >/dev/null 2>&1; then
    success "$script is available globally"
  else
    error "$script is NOT available in PATH"
  fi
done

echo
success "All scripts installed successfully 🎉"
echo
echo "You can now use:"
echo "  react-starter"
echo "  react-feature <feature-name>"
