#!/bin/bash

# Location to save backup
BACKUP=~/Desktop/com.apple.dock.backup.plist

# Clear Dock pinned apps
echo "Clearing Dock..."
defaults write com.apple.dock persistent-apps -array

# Add work apps
apps=(
  "/Applications/Bitwarden.app"
  "/System/Applications/Messages.app"
  "/System/Applications/FaceTime.app"
  "/System/Applications/Mail.app"
  "/System/Applications/Notes.app"
  "/Applications/Safari.app"
)

for app in "${apps[@]}"; do
  defaults write com.apple.dock persistent-apps -array-add "<dict>
    <key>tile-data</key>
    <dict>
      <key>file-data</key>
      <dict>
        <key>_CFURLString</key>
        <string>$app</string>
        <key>_CFURLStringType</key>
        <integer>0</integer>
      </dict>
    </dict>
    <key>tile-type</key>
    <string>file-tile</string>
  </dict>"
done

# Restart Dock
echo "Restarting Dock..."
killall Dock

echo "Personal Dock setup applied!"
