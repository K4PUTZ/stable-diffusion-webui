#!/bin/bash
# Quick launcher for Stable Diffusion WebUI (AUTOMATIC1111)
# Usage: ./run_sd.sh  (from any directory if you symlink it)

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR" || { echo "Failed to cd to webui directory"; exit 1; }

# Recommended Apple Silicon args (CPU for interrogate only)
ARGS="--skip-torch-cuda-test --upcast-sampling --no-half-vae --use-cpu interrogate --disable-nan-check"

# Allow passing extra flags
if [ $# -gt 0 ]; then
  ARGS="$ARGS $*"
fi

# Ensure Python 3.10 is used
export PATH="/opt/homebrew/bin:$PATH"
PY="/opt/homebrew/bin/python3.10"

# Launch
echo "Launching Stable Diffusion WebUI with: $ARGS"
./webui.sh $ARGS
