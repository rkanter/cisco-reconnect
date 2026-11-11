#!/bin/bash

# Resume the auto-reconnect agent after pause.sh
launchctl load ~/Library/LaunchAgents/com.github.rkanter.cisco.reconnect.plist
echo "Resumed."
