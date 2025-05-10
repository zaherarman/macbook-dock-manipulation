#!/bin/bash

# Check current Focus mode
FOCUS_MODE=$(defaults -currentHost read com.apple.controlcenter FocusStatus 2>/dev/null)

# Debug: print what was detected
echo "Detected Focus Mode: $FOCUS_MODE"

# Match and run appropriate script
if [[ "$FOCUS_MODE" == *Work* ]]; then
    echo "Running Work Dock Setup..."
    ~/Documents/set_work_dock.sh
elif [[ "$FOCUS_MODE" == *Personal* ]]; then
    echo "Restoring Personal Dock..."
    ~/Documents/restore_dock.sh
else
    echo "No recognized Focus Mode detected. No changes made."
fi

