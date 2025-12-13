#!/bin/zsh
# Stable Diffusion WebUI launcher + auto browser opener for macOS Automator Quick Action
# Place in stable-diffusion-webui directory. Make executable: chmod +x run_sd_and_open.sh
# Usage (Automator Shell Script): /path/to/run_sd_and_open.sh

set -euo pipefail

WEBUI_DIR="/Volumes/Expansion/----- PESSOAL -----/PYTHON/stable-diffusion-webui"
PORT=7860
PY_BIN="/opt/homebrew/bin/python3.10"
ARGS="--skip-torch-cuda-test --upcast-sampling --no-half-vae --use-cpu interrogate --disable-nan-check"

cd "$WEBUI_DIR" || { echo "[ERROR] Cannot cd to $WEBUI_DIR"; exit 1; }

# If already running, just open browser
if lsof -iTCP:${PORT} -sTCP:LISTEN >/dev/null 2>&1 ; then
  echo "[INFO] Stable Diffusion already running on port ${PORT}. Opening browser..."
  open "http://127.0.0.1:${PORT}/"
  exit 0
fi

echo "[INFO] Launching Stable Diffusion WebUI on port ${PORT}..."

# Start in background redirecting output to log
LOG_FILE="$WEBUI_DIR/webui_$(date +%Y%m%d_%H%M%S).log"
(
  export PATH="/opt/homebrew/bin:$PATH"
  exec ./webui.sh $ARGS >> "$LOG_FILE" 2>&1
) &
LAUNCH_PID=$!
echo "[INFO] PID: $LAUNCH_PID | Log: $LOG_FILE"

echo "[INFO] Waiting for server to become responsive..."
ATTEMPTS=0
MAX_ATTEMPTS=120  # ~120 * 1s = 2 minutes; initial model load may take longer

while ! curl -s "http://127.0.0.1:${PORT}/" | grep -q "Stable Diffusion"; do
  if ! kill -0 $LAUNCH_PID 2>/dev/null; then
    echo "[ERROR] Process exited early. Check log: $LOG_FILE"
    exit 1
  fi
  ATTEMPTS=$((ATTEMPTS+1))
  if [ $ATTEMPTS -ge $MAX_ATTEMPTS ]; then
    echo "[WARN] Timeout waiting for server. Opening anyway; it may still finish loading."
    break
  fi
  sleep 1
done

echo "[INFO] Opening browser at http://127.0.0.1:${PORT}/"
open "http://127.0.0.1:${PORT}/"

echo "[INFO] Done. To stop server: pkill -f webui.sh or Ctrl+C in its terminal (if foreground)."