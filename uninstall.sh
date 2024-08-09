#!/bin/bash

# Unload the existing plist in case it already exists, ignoring any errors because we don't care
launchctl unload ~/Library/LaunchAgents/com.github.rkanter.cisco.reconnect.plist > /dev/null 2>&1

# Delete the plist, ignoring any errors because we don't care
rm ~/Library/LaunchAgents/com.github.rkanter.cisco.reconnect.plist > /dev/null 2>&1

echo "Done!"
