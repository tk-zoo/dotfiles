#!/bin/bash

if [ "$(uname)" != "Darwin" ] ; then
	echo "Not macOS!"
	exit 1
fi


### Dock ###
## Automatically hide or show the Dock
#defaults write com.apple.dock autohide -bool true

### Misson Control ###
### Possible values:
###  0: no-op
###  2: Mission Control
###  3: Show application windows
###  4: Desktop
###  5: Start screen saver
###  6: Disable screen saver
###  7: Dashboard
### 10: Put display to sleep
### 11: Launchpad
### 12: Notification Center
# Top left screen corner → Put display to sleep （左上 → ディスプレイをスリープ）
defaults write com.apple.dock wvous-tl-corner -int 5
defaults write com.apple.dock wvous-tl-modifier -int 0
# Top right screen corner → Desktop （右上 → スクリーンセーバーを無効）
defaults write com.apple.dock wvous-tr-corner -int 6
defaults write com.apple.dock wvous-tr-modifier -int 0


### Finder ###
# Set `${HOME}` as the default location for new Finder windows
# 新しいウィンドウでデフォルトでホームフォルダを開く
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"
# Show status bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true
# Show path bar in Finder
#defaults write com.apple.finder ShowPathbar -bool true
# Show Tab bar in Finder
#defaults write com.apple.finder ShowTabView -bool true
# Show hidden files in Finder
defaults write com.apple.finder AppleShowAllFiles -bool true
# Show hidden files in Finder
#defaults write com.apple.finder AppleShowAllFiles -bool true
# Show the full POSIX path as Finder window title
#defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
# Show the ~/Library directory （ライブラリディレクトリを表示、デフォルトは非表示）
chflags nohidden ~/Library


### Safari ###
# Show Safari's Status Bar （ステータスバーを表示）
defaults write com.apple.Safari ShowStatusBar -bool true
# Don't remember passwords （パスワードを自動入力・記録しない）
defaults write com.apple.Safari AutoFillPasswords -bool false

### Trackpad ###
# Enable `Tap to click` （タップでクリックを有効にする）
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# SecondayClick `2finger ando tap`
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -bool false
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1






# Show bluetooth in the menu bar
defaults write com.apple.controlcenter "NSStatusItem Visible Bluetooth" -bool true


# Avoid creating `.DS_Store` files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true






# Disable the "Are you sure you want to open this application?" dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable live conversion
defaults write com.apple.inputmethod.Kotoeri JIMPrefLiveConversionKey -bool false

# Display battery level in the menu bar
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# Display date, day, and time in the menu bar
defaults write com.apple.menuextra.clock DateFormat -string 'EEE d MMM HH:mm'


# Increase keyboard initial delay
defaults write -g InitialKeyRepeat -int 10

# Increase keyboard repeat rate
defaults write -g KeyRepeat -int 1

# Increase mouse speed
defaults write -g com.apple.mouse.scaling 1.5

# Use the Fn key as a standard function key
defaults write -g com.apple.keyboard.fnState -bool true

# Increase trackpad speed
defaults write -g com.apple.trackpad.scaling 3

# Show files with all extensions
defaults write -g AppleShowAllExtensions -bool true



for app in "Dock" \
	"Finder" \
	"SystemUIServer"; do
	killall "${app}" &> /dev/null
done