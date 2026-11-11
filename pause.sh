#!/bin/bash

# Pause the auto-reconnect agent; run resume.sh to turn it back on
launchctl unload ~/Library/LaunchAgents/com.github.rkanter.cisco.reconnect.plist
echo "Paused. Run resume.sh to re-enable auto-reconnect."
