#!/usr/bin/osascript

tell application "System Events"
	if exists process "Cisco Secure Client" then
		tell process "Cisco Secure Client"
			-- These calls are useful for figuring out the names/ids of UI elements
			-- get UI elements of window "Cisco Secure Client"
			-- get entire contents of window "Cisco Secure Client"
			
			-- This refers to the Cisco status menu, which is actually simpler than using the main window
			-- If it's already connected, then it won't exist (it'll be "Disconnect" instead)
			-- And if it's disabled, then it's "Connecting"
			tell menu item "Connect" of menu "Cisco Secure Client" of menu bar item 1 of menu bar 2
				if (exists) and enabled then
					click
				end if
			end tell
			
			-- In case it's in our way, let's hide it because there's no need to look at it
			set visible to false
		end tell
	end if
end tell
