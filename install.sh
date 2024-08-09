#!/bin/bash

# Unload the existing plist in case it already exists, ignoring any errors because we don't care
launchctl unload ~/Library/LaunchAgents/com.github.rkanter.cisco.reconnect.plist > /dev/null 2>&1

# Copy the plist to the LaunchAgents dir
cp launch-agent-template.plist ~/Library/LaunchAgents/com.github.rkanter.cisco.reconnect.plist

# The plists cannot expand variables, so we'll use the scripts below to do it for us, and update the plist with the right directories

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd ) # Determine where the script lives
defaults write ~/Library/LaunchAgents/com.github.rkanter.cisco.reconnect.plist \
ProgramArguments -array "$SCRIPT_DIR/com.github.rkanter.cisco.reconnect.sh"

defaults write ~/Library/LaunchAgents/com.github.rkanter.cisco.reconnect.plist \
StandardOutPath "$HOME/Library/Logs/cisco-reconnect/stdout.log"

defaults write ~/Library/LaunchAgents/com.github.rkanter.cisco.reconnect.plist \
StandardErrorPath "$HOME/Library/Logs/cisco-reconnect/stderr.log"

# The defaults commands above will convert the file to a binary format, which makes things more difficult if you want to look at it or edit it manually, so let's convert it back to plain XML
plutil -convert xml1 ~/Library/LaunchAgents/com.github.rkanter.cisco.reconnect.plist

# Load the plist
launchctl load ~/Library/LaunchAgents/com.github.rkanter.cisco.reconnect.plist

echo "Done!"
