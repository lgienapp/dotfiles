#!/usr/bin/env bash

# =============================================================================
# macOS Defaults Configuration (Tahoe / macOS 26+)
# =============================================================================
# Run: chmod +x defaults.sh && ./defaults.sh
# Note: Some changes require logout/restart to take effect
# =============================================================================

set -e

echo "Configuring macOS defaults..."
echo "Some settings require admin privileges."

# Close System Settings to prevent overriding changes
osascript -e 'tell application "System Settings" to quit' 2>/dev/null || true

# Ask for admin password upfront
sudo -v

# Keep sudo alive during script execution
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# =============================================================================
# SYSTEM UI & APPEARANCE
# =============================================================================

# Set language and text formats
defaults write NSGlobalDomain AppleLanguages -array "de" "en"
defaults write NSGlobalDomain AppleLocale -string "de_DE@currency=EUR"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleTemperatureUnit -string "Celsius"
defaults write NSGlobalDomain AppleMetricUnits -bool true

# Set sidebar icon size to small
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 1

# Scrollbar behaviour: always show
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

# Click in scroll bar to jump to clicked location
defaults write NSGlobalDomain AppleScrollerPagingBehavior -bool true

# Disable swipe navigation with scroll gestures
defaults write NSGlobalDomain AppleEnableSwipeNavigateWithScrolls -bool false

# Set highlight/accent color to Green
defaults write NSGlobalDomain AppleHighlightColor -string "0.752941 0.964706 0.678431 Green"

# Enable Dark mode
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"

# Enable automatic switching between Light and Dark mode
defaults write NSGlobalDomain AppleInterfaceStyleSwitchesAutomatically -bool true

# Enable dark mode on icons
defaults write NSGlobalDomain AppleIconAppearanceTheme -string "RegularDark"

# Always show menu bar in fullscreen mode
defaults write NSGlobalDomain AppleMenuBarVisibleInFullscreen -bool true

# Disable minimize window on double-click title bar
defaults write NSGlobalDomain AppleMiniaturizeOnDoubleClick -bool false

# Enable context menu gesture (two-finger tap/click)
defaults write NSGlobalDomain ContextMenuGesture -int 1

# Set default search engine to DuckDuckGo
defaults write NSGlobalDomain NSPreferredWebServices -dict-add NSWebServicesProviderWebSearch '{ NSDefaultDisplayName = DuckDuckGo; NSProviderIdentifier = "com.duckduckgo"; }'

# Set file view mode in Open/Save dialogs to Columns
defaults write NSGlobalDomain NavPanelFileListModeForOpenMode -int 3

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Save to disk (not iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Automatically quit printer app once print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable the "Are you sure you want to open this application?" dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable automatic capitalization
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable smart dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable automatic period substitution
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable smart quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Enable subpixel font rendering on non-Apple displays
defaults write NSGlobalDomain AppleFontSmoothing -int 1

# Show battery percentage in menu bar
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# Show proper resolution list in display settings
defaults write com.apple.Displays-Settings.extension showListByDefault -bool true

# Enable blurred menu bar appearance
defaults write NSGlobalDomain SLSMenuBarUseBlurredAppearance -bool true

# Enable tinted Liquid Glass
defaults write NSGlobalDomain NSGlassDiffusionSetting -bool true

# Tint folders based on tags
defaults delete NSGlobalDomain AppleDisableTagBasedIconTinting 2>/dev/null || true

# Always prefer tabs when opening documents
defaults write NSGlobalDomain AppleWindowTabbingMode -string "always"

# Don't restore windows when quitting apps
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

# Disable window animations
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

# =============================================================================
# CONTROL CENTER
# =============================================================================

# Auto-hide menu bar option (never hide)
defaults write com.apple.controlcenter AutoHideMenuBarOption -int 3

# Show AirDrop in control center
defaults write com.apple.controlcenter "NSStatusItem Visible AirDrop" -bool true

# Show Audio/Video module in control center
defaults write com.apple.controlcenter "NSStatusItem Visible AudioVideoModule" -bool true

# Show Battery in control center
defaults write com.apple.controlcenter "NSStatusItem Visible Battery" -bool true

# Show Control Center icon in control center
defaults write com.apple.controlcenter "NSStatusItem Visible BentoBox" -bool true

# Show Bluetooth in control center
defaults write com.apple.controlcenter "NSStatusItem Visible Bluetooth" -bool true

# Show Clock in control center
defaults write com.apple.controlcenter "NSStatusItem Visible Clock" -bool true

# Show Display brightness in control center
defaults write com.apple.controlcenter "NSStatusItem Visible Display" -bool true

# Show Do Not Disturb in control center
defaults write com.apple.controlcenter "NSStatusItem Visible DoNotDisturb" -bool true

# Hide FaceTime in control center
defaults write com.apple.controlcenter "NSStatusItem Visible FaceTime" -bool false

# Show Focus Modes in control center
defaults write com.apple.controlcenter "NSStatusItem Visible FocusModes" -bool true

# Show Screen Mirroring in control center
defaults write com.apple.controlcenter "NSStatusItem Visible ScreenMirroring" -bool true

# Show Sound/Volume in control center
defaults write com.apple.controlcenter "NSStatusItem Visible Sound" -bool true

# Hide Stage Manager in control center
defaults write com.apple.controlcenter "NSStatusItem Visible StageManager" -bool false

# Show WiFi in control center
defaults write com.apple.controlcenter "NSStatusItem Visible WiFi" -bool true

# Energy mode module (laptops)
defaults write com.apple.controlcenter EnergyModeModule -int 9

# Menu bar item visibility (hide from menu bar, show in control center)
defaults -currentHost write com.apple.controlcenter WiFi -int 8
defaults -currentHost write com.apple.controlcenter Bluetooth -int 8
defaults -currentHost write com.apple.controlcenter AirDrop -int 8
defaults -currentHost write com.apple.controlcenter FocusModes -int 8
defaults -currentHost write com.apple.controlcenter StageManager -int 8
defaults -currentHost write com.apple.controlcenter Display -int 8
defaults -currentHost write com.apple.controlcenter Sound -int 8
defaults -currentHost write com.apple.controlcenter NowPlaying -int 8
defaults -currentHost write com.apple.controlcenter KeyboardBrightness -int 8

# Show in menu bar when active
defaults -currentHost write com.apple.controlcenter AudioVideoModule -int 8
defaults -currentHost write com.apple.controlcenter ScreenMirroring -int 2
defaults -currentHost write com.apple.controlcenter AccessibilityShortcuts -int 9
defaults write com.apple.controlcenter MusicRecognition -int 12
defaults write com.apple.controlcenter Hearing -int 8
defaults write com.apple.controlcenter VoiceControl -int 8
defaults -currentHost write com.apple.controlcenter UserSwitcher -int 8
defaults -currentHost write com.apple.controlcenter Siri -int 8

# Battery always shown with percentage
defaults -currentHost write com.apple.controlcenter Battery -int 3
defaults -currentHost write com.apple.controlcenter BatteryShowPercentage -int 1

# Hide seconds in clock
defaults write com.apple.menuextra.clock ShowSeconds -bool false

# Disable Universal Control
defaults -currentHost write com.apple.universalcontrol Disable -bool true

# Disable AirPlay Receiver
defaults -currentHost write com.apple.controlcenter AirplayReceiverEnabled -bool false

# =============================================================================
# FINDER
# =============================================================================

# Show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Set column view as default (keeping your preference)
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# Show sidebar
defaults write com.apple.finder ShowSidebar -bool true

# Set sidebar width (Tahoe 26+)
defaults write com.apple.finder SidebarWidth -int 180
defaults write com.apple.finder SidebarWidth2 -int 180
defaults write com.apple.finder FK_SidebarWidth2 -int 180

# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Hide tab bar
defaults write com.apple.finder NSWindowTabbingShoudShowTabBarKey-com.apple.finder.TBrowserWindow -bool false

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Enable spring loading for directories
defaults write NSGlobalDomain com.apple.springing.enabled -bool true

# Reduce the spring loading delay
defaults write NSGlobalDomain com.apple.springing.delay -float 0.2

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Avoid creating .DS_Store files on USB volumes
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Show the ~/Library folder
chflags nohidden ~/Library

# Show the /Volumes folder
sudo chflags nohidden /Volumes

# Expand File Info panes
defaults write com.apple.finder FXInfoPanesExpanded -dict \
    General -bool true \
    Comments -bool false \
    MetaData -bool true \
    Name -bool true \
    OpenWith -bool true \
    Preview -bool false \
    Privileges -bool true

# Set default Finder location to Desktop
defaults write com.apple.finder NewWindowTarget -string "PfDe"

# Open new tabs in same window
defaults write com.apple.finder FinderSpawnTab -bool true

# Show servers in sidebar
defaults write com.apple.sidebarlists networkbrowser -dict-add ShowServers -bool true
defaults write com.apple.sidebarlists networkbrowser -dict-add ShowConnectedServers -bool true

# Keep the desktop clean
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false

# Hide recent tags
defaults write com.apple.finder ShowRecentTags -bool false

# Disable all Finder animations
defaults write com.apple.finder DisableAllAnimations -bool true

# Disable Quick Look animation
defaults write NSGlobalDomain QLPanelAnimationDuration -float 0.0

# Suppress iCloud Drive move warning (Sequoia+)
defaults write com.apple.bird com.apple.clouddocs.unshared.moveOut.suppress -int 1

# Finder toolbar configuration
defaults write com.apple.finder 'NSToolbar Configuration Browser' '{
    "TB Default Item Identifiers" =     (
        "com.apple.finder.BACK",
        "com.apple.finder.SWCH",
        NSToolbarSpaceItem,
        "com.apple.finder.ARNG",
        "com.apple.finder.SHAR",
        "com.apple.finder.LABL",
        "com.apple.finder.ACTN",
        NSToolbarSpaceItem,
        "com.apple.finder.SRCH"
    );
    "TB Display Mode" = 2;
    "TB Icon Size Mode" = 1;
    "TB Is Shown" = 1;
    "TB Item Identifiers" =     (
		"com.apple.finder.BACK",
        "com.apple.finder.AirD",
        "com.apple.finder.CNCT",
        "com.apple.finder.NFLD",
        "com.apple.finder.SHAR",
        "com.apple.finder.SWCH",
        NSToolbarSpaceItem,
        "com.apple.finder.ACTN",
        NSToolbarSpaceItem,
        "com.apple.finder.SRCH"
    );
    "TB Size Mode" = 1;
}'

# Icon view settings
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist 2>/dev/null || true
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist 2>/dev/null || true
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist 2>/dev/null || true

/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:labelOnBottom true" ~/Library/Preferences/com.apple.finder.plist 2>/dev/null || true
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:labelOnBottom true" ~/Library/Preferences/com.apple.finder.plist 2>/dev/null || true
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:labelOnBottom true" ~/Library/Preferences/com.apple.finder.plist 2>/dev/null || true

/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy name" ~/Library/Preferences/com.apple.finder.plist 2>/dev/null || true
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy name" ~/Library/Preferences/com.apple.finder.plist 2>/dev/null || true
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy name" ~/Library/Preferences/com.apple.finder.plist 2>/dev/null || true

/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:textSize 8" ~/Library/Preferences/com.apple.finder.plist 2>/dev/null || true
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:textSize 8" ~/Library/Preferences/com.apple.finder.plist 2>/dev/null || true
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:textSize 8" ~/Library/Preferences/com.apple.finder.plist 2>/dev/null || true

/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 48" ~/Library/Preferences/com.apple.finder.plist 2>/dev/null || true
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:iconSize 48" ~/Library/Preferences/com.apple.finder.plist 2>/dev/null || true
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 48" ~/Library/Preferences/com.apple.finder.plist 2>/dev/null || true

/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 56" ~/Library/Preferences/com.apple.finder.plist 2>/dev/null || true
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:gridSpacing 48" ~/Library/Preferences/com.apple.finder.plist 2>/dev/null || true
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing 56" ~/Library/Preferences/com.apple.finder.plist 2>/dev/null || true

# =============================================================================
# WINDOW TILING (Tahoe)
# =============================================================================

defaults write com.apple.WindowManager EnableTilingByEdgeDrag -bool true
defaults write com.apple.WindowManager EnableTopTilingByEdgeDrag -bool true
defaults write com.apple.WindowManager EnableTilingOptionAccelerator -bool true
defaults write com.apple.WindowManager EnableTiledWindowMargins -bool false
defaults write com.apple.WindowManager EnableStandardClickToShowDesktop -bool false

# =============================================================================
# DOCK & MISSION CONTROL
# =============================================================================

# Set Dock icon size to 48 pixels
defaults write com.apple.dock tilesize -int 48

# Enable Dock magnification
defaults write com.apple.dock magnification -bool true

# Set magnification size
defaults write com.apple.dock largesize -int 56

# Minimize windows into their application's icon
defaults write com.apple.dock minimize-to-application -bool true

# Enable spring loading for all Dock items
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

# Show indicator lights for open applications
defaults write com.apple.dock show-process-indicators -bool true

# Don't animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool false

# Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.1

# Don't group windows by application in Mission Control
defaults write com.apple.dock expose-group-by-app -bool false

# Don't automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Speed up the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0.1

# Speed up the animation when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 0.7

# Auto-hide the Dock
defaults write com.apple.dock autohide -bool true

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true

# Don't show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# Position Dock on bottom
defaults write com.apple.dock orientation -string "bottom"

# =============================================================================
# HOT CORNERS (all disabled)
# =============================================================================

defaults write com.apple.dock wvous-tl-corner -int 0
defaults write com.apple.dock wvous-tl-modifier -int 0
defaults write com.apple.dock wvous-tr-corner -int 0
defaults write com.apple.dock wvous-tr-modifier -int 0
defaults write com.apple.dock wvous-bl-corner -int 0
defaults write com.apple.dock wvous-bl-modifier -int 0
defaults write com.apple.dock wvous-br-corner -int 0
defaults write com.apple.dock wvous-br-modifier -int 0

# =============================================================================
# KEYBOARD & INPUT
# =============================================================================

# Enable full keyboard access for all controls
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Set a fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2

# Set a short delay until key repeat
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# =============================================================================
# TRACKPAD & MOUSE
# =============================================================================

# Enable tap to click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Disable drag lock
defaults write com.apple.AppleMultitouchTrackpad DragLock -bool false

# Disable legacy dragging
defaults write com.apple.AppleMultitouchTrackpad Dragging -bool false

# Disable corner secondary click
defaults write com.apple.AppleMultitouchTrackpad TrackpadCornerSecondaryClick -int 0

# Enable four-finger pinch gesture
defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerPinchGesture -int 2

# Enable palm detection
defaults write com.apple.AppleMultitouchTrackpad TrackpadHandResting -bool true

# Enable horizontal scrolling
defaults write com.apple.AppleMultitouchTrackpad TrackpadHorizScroll -bool true

# Enable momentum scrolling
defaults write com.apple.AppleMultitouchTrackpad TrackpadMomentumScroll -bool true

# Enable pinch to zoom
defaults write com.apple.AppleMultitouchTrackpad TrackpadPinch -bool true

# Enable two-finger right-click
defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -bool true

# Enable two-finger rotation gesture
defaults write com.apple.AppleMultitouchTrackpad TrackpadRotate -bool true

# Enable two-finger scrolling
defaults write com.apple.AppleMultitouchTrackpad TrackpadScroll -bool true

# Disable three-finger drag
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool false

# Enable three-finger horizontal swipe
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -int 2

# Disable three-finger tap
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerTapGesture -int 0

# Enable three-finger vertical swipe
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerVertSwipeGesture -int 2

# Enable two-finger double-tap (Smart zoom)
defaults write com.apple.AppleMultitouchTrackpad TrackpadTwoFingerDoubleTapGesture -int 1

# Enable two-finger swipe from right edge
defaults write com.apple.AppleMultitouchTrackpad TrackpadTwoFingerFromRightEdgeSwipeGesture -int 3

# Set trackpad tracking speed
defaults write NSGlobalDomain com.apple.trackpad.scaling -float 1.2

# Enable natural scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true

# =============================================================================
# SCREENSHOTS
# =============================================================================

# Save screenshots to desktop
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

# Save screenshots in PNG format
defaults write com.apple.screencapture type -string "png"

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# Don't include date in screenshot filename
defaults write com.apple.screencapture include-date -bool false

# Don't show thumbnail after capture
defaults write com.apple.screencapture show-thumbnail -bool false

# Show clicks in screen recordings
defaults write com.apple.screencapture showsClicks -bool true

# =============================================================================
# SPOTLIGHT
# =============================================================================

# Enable Spotlight Clipboard Manager
defaults write com.apple.Spotlight PasteboardHistoryEnabled -bool true

# Increase Clipboard history to 7 days
defaults write com.apple.Spotlight PasteboardHistoryTimeout -int 604800

# Change Spotlight indexing order
defaults write com.apple.spotlight orderedItems -array \
    '{"enabled" = 1;"name" = "APPLICATIONS";}' \
    '{"enabled" = 1;"name" = "SYSTEM_PREFS";}' \
    '{"enabled" = 1;"name" = "DIRECTORIES";}' \
    '{"enabled" = 1;"name" = "PDF";}' \
    '{"enabled" = 1;"name" = "DOCUMENTS";}' \
    '{"enabled" = 1;"name" = "CONTACT";}' \
    '{"enabled" = 1;"name" = "MENU_CONVERSION";}' \
    '{"enabled" = 1;"name" = "MENU_EXPRESSION";}' \
    '{"enabled" = 1;"name" = "MENU_OTHER";}' \
    '{"enabled" = 1;"name" = "PRESENTATIONS";}' \
    '{"enabled" = 1;"name" = "SPREADSHEETS";}' \
    '{"enabled" = 0;"name" = "FONTS";}' \
    '{"enabled" = 0;"name" = "MESSAGES";}' \
    '{"enabled" = 0;"name" = "EVENT_TODO";}' \
    '{"enabled" = 0;"name" = "IMAGES";}' \
    '{"enabled" = 0;"name" = "BOOKMARKS";}' \
    '{"enabled" = 0;"name" = "MUSIC";}' \
    '{"enabled" = 0;"name" = "MOVIES";}' \
    '{"enabled" = 1;"name" = "SOURCE";}' \
    '{"enabled" = 0;"name" = "MENU_DEFINITION";}' \
    '{"enabled" = 0;"name" = "MENU_WEBSEARCH";}' \
    '{"enabled" = 0;"name" = "MENU_SPOTLIGHT_SUGGESTIONS";}'

# =============================================================================
# TERMINAL
# =============================================================================

# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

# Enable Secure Keyboard Entry
defaults write com.apple.terminal SecureKeyboardEntry -bool true

# Disable line marks
defaults write com.apple.Terminal ShowLineMarks -int 0

# Show tab bar
defaults write com.apple.Terminal NSWindowTabbingShoudShowTabBarKey-TTWindow-TTWindowController-TTWindowController-VT-FS -bool true

# Use bright colors for bold text
defaults write com.apple.Terminal UseBrightBold -bool true

# =============================================================================
# ACTIVITY MONITOR
# =============================================================================

# Show the main window when launching
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# Visualize CPU usage in Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# Show all processes
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Sort by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

# Update frequency: often
defaults write com.apple.ActivityMonitor UpdatePeriod -int 2

# =============================================================================
# TEXTEDIT
# =============================================================================

# Use plain text mode for new documents
defaults write com.apple.TextEdit RichText -bool false

# Open and save files as UTF-8
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

# Set default tab width to 4 spaces
defaults write com.apple.TextEdit TabWidth -int 4

# Set fixed pitch font size
defaults write com.apple.TextEdit NSFixedPitchFontSize -int 14

# Show tab bar
defaults write com.apple.TextEdit NSWindowTabbingShoudShowTabBarKey-NSWindow-DocumentWindowController-DocumentWindowController-VT-FS -bool true

# Don't show app-centric open panel
defaults write com.apple.TextEdit NSShowAppCentricOpenPanelInsteadOfUntitledFile -bool false

# Expand save panel
defaults write com.apple.TextEdit NSNavPanelExpandedStateForSaveMode -bool true
defaults write com.apple.TextEdit NSNavPanelExpandedStateForSaveMode2 -bool true
defaults write com.apple.TextEdit NSNavPanelFileListModeForSaveMode2 -int 2
defaults write com.apple.TextEdit NSNavPanelFileLastListModeForSaveModeKey -int 2

# =============================================================================
# DISK UTILITY
# =============================================================================

# Enable debug menu
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true

# Show all devices in sidebar
defaults write com.apple.DiskUtility SidebarShowAllDevices -bool true

# Show APFS Snapshots
defaults write com.apple.DiskUtility WorkspaceShowAPFSSnapshots -bool true

# =============================================================================
# MAC APP STORE & UPDATES
# =============================================================================

# Enable automatic update check
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

# Check for software updates daily
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Download updates in background
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

# Install security updates automatically
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1

# Turn on app auto-update
defaults write com.apple.commerce AutoUpdate -bool true

# =============================================================================
# SAFARI
# =============================================================================

# Disable automatic opening of downloaded files
sudo defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari AutoOpenSafeDownloads -bool false
sudo defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari AutoOpenSafeDownloads -bool false

# Show the full URL in the address bar
sudo defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari ShowFullURLInSmartSearchField -bool true
sudo defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari ShowFullURLInSmartSearchField -bool true

# Enable the Develop menu and Web Inspector
sudo defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari IncludeDevelopMenu -bool true
sudo defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
sudo defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
sudo defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari.SandboxBroker ShowDevelopMenu -bool true
sudo defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Show color in Safari's tab bar
sudo defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari NeverUseBackgroundColorInToolbar -bool false

# Tab bar settings
sudo defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari AlwaysShowTabBar -int 1
sudo defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari EnableNarrowTabs -bool false
sudo defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari ShowStandaloneTabBar -bool true
sudo defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari CloseTabsAutomatically -bool false
sudo defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari CommandClickMakesTabs -bool true
sudo defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari OpenNewTabsInFront -bool false

# Show overlay status bar
sudo defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari ShowOverlayStatusBar -bool true

# Show favorites bar
sudo defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari ShowFavoritesBar-v2 -bool true

# Always restore session at launch
sudo defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari AlwaysRestoreSessionAtLaunch -bool true

# New window/tab behavior
sudo defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari NewWindowBehavior -int 1
sudo defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari NewTabBehavior -int 1

# AutoFill settings
sudo defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari AutoFillFromAddressBook -bool true
sudo defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari AutoFillPasswords -bool true
sudo defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari AutoFillCreditCardData -bool true
sudo defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari AutoFillMiscellaneousForms -bool true

# Search settings - DuckDuckGo
sudo defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari SearchProviderShortName -string "DuckDuckGo"
sudo defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari PrivateSearchEngineUsesNormalSearchEngineToggle -bool true
sudo defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari SuppressSearchSuggestions -bool false
sudo defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari WebsiteSpecificSearchEnabled -bool false
sudo defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari PreloadTopHit -bool false
sudo defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari ShowFavoritesUnderSmartSearchField -bool false

# Security settings
sudo defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari.SafeBrowsing SafeBrowsingEnabled -bool true
sudo defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari WarnAboutFraudulentWebsites -bool true
sudo defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari UseHTTPSOnly -bool true
sudo defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari PrivateBrowsingRequiresAuthentication -bool true
sudo defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari CanPromptForPushNotifications -bool false

# Privacy settings
sudo defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari EnableEnhancedPrivacyInRegularBrowsing -bool true
sudo defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari WebKitPreferences.privateClickMeasurementEnabled -bool false
sudo defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari SendDoNotTrackHTTPHeader -bool true

# =============================================================================
# PASSWORDS
# =============================================================================

# Show password widget in menu bar
defaults write com.apple.Passwords EnableMenuBarExtra -bool true
defaults write com.apple.Passwords.MenuBarExtra "NSStatusItem Visible Item-0" -bool true

# Disable network telemetry for password icons
defaults write com.apple.Passwords WBSPasswordsAppBackgroundNetworkingEnabled -bool false

# =============================================================================
# MAIL
# =============================================================================

# Copy email addresses as 'foo@bar.com' instead of 'Foo Bar <foo@bar.com>'
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# Disable inline attachments (show as icons)
defaults write com.apple.mail DisableInlineAttachmentViewing -bool true

# Disable animations
defaults write com.apple.mail DisableReplyAnimations -bool true
defaults write com.apple.mail DisableSendAnimations -bool true

# =============================================================================
# MESSAGES
# =============================================================================

# Screen unknown senders
defaults write com.apple.MobileSMS FilterMessageRequests -bool true

# Disable Shared With You
defaults write com.apple.SocialLayer SharedWithYouEnabled -bool false

# Disable read receipts
defaults write com.apple.imagent Setting.EnableReadReceipts -bool false
defaults write com.apple.imagent Setting.GlobalReadReceiptsVersionID -int 2

# =============================================================================
# PHONE / FACETIME
# =============================================================================

# Filter unknown callers
defaults write com.apple.TelephonyUtilities filterUnknownCallersAsNewCallers -bool true

# =============================================================================
# PREVIEW
# =============================================================================

# Show Markup toolbar for PDFs by default
defaults write com.apple.Preview PVMarkupToolbarVisibleForPDFs -bool true

# Show Markup toolbar for images by default
defaults write com.apple.Preview PVMarkupToolbarVisibleForImages -bool true

# Show tab bar
defaults write com.apple.Preview NSWindowTabbingShoudShowTabBarKey-PVWindow-PVWindowController-PVWindowController-VT-FS -bool true

# =============================================================================
# QUICKTIME
# =============================================================================

# Play movie on open
defaults write com.apple.QuickTimePlayerX MGPlayMovieOnOpen -bool true

# =============================================================================
# CALENDAR
# =============================================================================

# Enable TimeZone Support
defaults write com.apple.iCal "TimeZone support enabled" -bool true

# =============================================================================
# MUSIC
# =============================================================================

# Disable Sound Check/Normalization
defaults write com.apple.Music optimizeSongVolume -bool false

# =============================================================================
# ARCHIVE UTILITY
# =============================================================================

# Move archives to trash after extraction/compression
defaults write com.apple.archiveutility dearchive-move-after "~/.Trash"
defaults write com.apple.archiveutility archive-move-after "~/.Trash"

# Don't reveal after dearchiving
defaults write com.apple.archiveutility dearchive-reveal-after -bool false

# =============================================================================
# IMAGE CAPTURE
# =============================================================================

# Disable hot plug for devices
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# =============================================================================
# ACCESSIBILITY / ZOOM
# =============================================================================

# Enable zoom hotkeys
defaults write com.apple.universalaccess closeViewHotkeysEnabled -bool true

# Zoom follows focus
defaults write com.apple.universalaccess closeViewZoomFocusFollowModeKey -bool true
defaults write com.apple.universalaccess closeViewZoomFocusMovement -bool false

# Disable panning mode
defaults write com.apple.universalaccess closeViewPanningMode -bool false

# Enable screen share zoom
defaults write com.apple.universalaccess closeViewZoomScreenShareEnabledKey -bool true

# Zoom individual displays
defaults write com.apple.universalaccess closeViewZoomIndividualDisplays -bool true

# =============================================================================
# ASSISTANT / SIRI
# =============================================================================

# Disable search query data sharing
defaults write com.apple.assistant.support "Search Queries Data Sharing Status" -int 2

# =============================================================================
# TEXT INPUT / KEYBOARD MENU
# =============================================================================

# Show text input menu in menu bar
defaults write com.apple.TextInputMenu visible -bool true

# =============================================================================
# NETWORK
# =============================================================================

# Browse all network interfaces
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

# =============================================================================
# MENU BAR EXTRAS
# =============================================================================

# Show Time Machine in menu bar
defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.TimeMachine" -bool true
/usr/libexec/PlistBuddy -c "Add :menuExtras: string '/System/Library/CoreServices/Menu Extras/TimeMachine.menu'" ~/Library/Preferences/com.apple.systemuiserver.plist 2>/dev/null || true

# Show Remote Management menu extra
sudo defaults write /Library/Preferences/com.apple.RemoteManagement.plist LoadRemoteManagementMenuExtra -bool true

# =============================================================================
# TIME MACHINE
# =============================================================================

# Prevent Time Machine from prompting to use new drives
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# =============================================================================
# ENERGY & POWER
# =============================================================================

# Enable lid wakeup
sudo pmset -a lidwake 1

# Sleep the display after 5 minutes on battery
sudo pmset -b displaysleep 5

# Sleep the display after 15 minutes when plugged in
sudo pmset -c displaysleep 15

# Set machine sleep to 15 minutes on battery
sudo pmset -b sleep 15

# Disable machine sleep while charging
sudo pmset -c sleep 0

# Set standby delay to 24 hours
sudo pmset -a standbydelay 86400

# =============================================================================
# SECURITY & PRIVACY
# =============================================================================

# Require password immediately after sleep
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Enable firewall
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on

# Enable firewall stealth mode
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on

# Disable wake-on LAN
sudo systemsetup -setwakeonnetworkaccess off 2>/dev/null || true

# =============================================================================
# RESTART AFFECTED APPLICATIONS
# =============================================================================

echo ""
echo "Restarting affected applications..."

for app in "Activity Monitor" \
    "cfprefsd" \
    "Dock" \
    "Finder" \
    "Mail" \
    "Safari" \
    "SystemUIServer" \
    "Terminal"; do
    killall "${app}" &> /dev/null || true
done

echo ""
echo "Configuration complete!"
echo "Some changes require logout/restart to take effect."
