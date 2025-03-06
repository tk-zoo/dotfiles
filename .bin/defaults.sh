#!/bin/bash

if [ "$(uname)" != "Darwin" ] ; then
	echo "Not macOS!"
	exit 1
fi


### Dock ###
# Wipe all app icons from the Dock （Dock に標準で入っている全てのアプリを消す、Finder とごみ箱は消えない）
defaults write com.apple.dock persistent-apps -array
# Set the icon size （アイコンサイズの設定）
defaults write com.apple.dock tilesize -int 36
# 最近使ったアプリを非表示
defaults write com.apple.dock show-recents -bool false


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
# Top right screen corner → Desktop （左下 → 無し）
defaults write com.apple.dock wvous-bl-corner -int 0
defaults write com.apple.dock wvous-bl-modifier -int 0
# Top right screen corner → Desktop （右下 → 無し）
defaults write com.apple.dock wvous-br-corner -int 0
defaults write com.apple.dock wvous-br-modifier -int 0
# 最新の使用状況に基づいて操作スペースを自動的に並べ替えるを無効
defaults write com.apple.dock mru-spaces -bool false


### Finder ###
# Set `${HOME}` as the default location for new Finder windows（新しいウィンドウでデフォルトでホームフォルダを開く）
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"
# Show status bar in Finder（ステータスバーを表示）
defaults write com.apple.finder ShowStatusBar -bool true
# Show hidden files in Finder（隠しファイルを表示する）
# defaults write com.apple.finder AppleShowAllFiles -bool true
# Avoid creating `.DS_Store` files on network volumes （ネットワークドライブで.DS_Storeを作らない）
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
# USBストレージに.DS_Storeファイルを作成しない
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
# Disable live conversion（ライブ変換を無効化する）
defaults write com.apple.inputmethod.Kotoeri JIMPrefLiveConversionKey -bool false
# Display date, day, and time in the menu bar（メニューの時計を24時間・時分秒・曜日表記にする）
# defaults write com.apple.menuextra.clock "DateFormat" -string "\"EEE d MMM HH:mm:ss\"" <ぐぐると出てくるけど、効かない
defaults write com.apple.menuextra.clock FlashDateSeparators  -bool true
defaults write com.apple.menuextra.clock Show24Hour  -bool true
defaults write com.apple.menuextra.clock ShowDayOfWeek  -bool true
defaults write com.apple.menuextra.clock ShowSeconds  -bool true

# Show files with all extensions （すべての拡張子を表示する）
defaults write -g AppleShowAllExtensions -bool true
# Show icons for hard drives, servers, and removable media on the desktop（ハードドライブ・サーバー・リムーバブルメディアを表示する）
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
# Automatically open a new Finder window when a volume is mounted　（マウントされたディスクがあったら、自動的に新しいウィンドウを開く）
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true
# Automatically quit the printer app once the print jobs are completed （印刷が終了したら、自動的にプリンターアプリを終了する）
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true
# Show the ~/Library directory（ライブラリディレクトリを表示、デフォルトは非表示）
chflags nohidden ~/Library
# Show the /Volumes folder
sudo chflags nohidden /Volumes


### Safari ###
# Show Safari's Status Bar （ステータスバーを表示）
# defaults write com.apple.Safari ShowStatusBar -bool true
# Don't remember passwords （パスワードを自動入力・記録しない）
# defaults write com.apple.Safari AutoFillPasswords -bool false
# 検索クエリをAppleへ送信しない
# defaults write com.apple.Safari UniversalSearchEnabled -bool false
# defaults write com.apple.Safari SuppressSearchSuggestions -bool true
# ファイルのダウンロード後に自動でファイルを開くのを無効化
# defaults write com.apple.Safari AutoOpenSafeDownloads -bool false


### Trackpad ###
# Enable `Tap to click` （タップでクリックを有効にする）
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
# SecondayClick `2finger ando tap`（副ボタンを2本指でクリックまたはタップ）
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 0
# Launchpadジェスチャを無効
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad showLaunchpadGestureEnabled -int 0 <ぐぐると出てくるけど、効かない
defaults write com.apple.dock showLaunchpadGestureEnabled -bool false


### アクセシビリティ ###
# キーボードショートカットを使って拡大縮小
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 15 "<dict><key>enabled</key><true/><key>value</key><dict><key>parameters</key><array><integer>65535</integer><integer>49</integer><integer>393216</integer></array><key>type</key><string>standard</string></dict></dict>"
# ズームイン
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 17 "<dict><key>enabled</key><true/><key>value</key><dict><key>parameters</key><array><integer>61</integer><integer>24</integer><integer>1572864</integer></array><key>type</key><string>standard</string></dict></dict>"
# ズームアウト
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 19 "<dict><key>enabled</key><true/><key>value</key><dict><key>parameters</key><array><integer>45</integer><integer>27</integer><integer>1572864</integer></array><key>type</key><string>standard</string></dict></dict>"


### キーボードショートカット ###
# 前の入力ソースを選択（コマンド+スペース）
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 60 "<dict><key>enabled</key><true/><key>value</key><dict><key>parameters</key><array><integer>32</integer><integer>49</integer><integer>1048576</integer></array><key>type</key><string>standard</string></dict></dict>"
# Spotlight検索を表示（コントロール+スペース）
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 64 "<dict><key>enabled</key><true/><key>value</key><dict><key>parameters</key><array><integer>65535</integer><integer>49</integer><integer>262144</integer></array><key>type</key><string>standard</string></dict></dict>"


### Others ###
# 自動大文字の無効化
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
# スクリーンショットをPNG形式で保存
defaults write com.apple.screencapture type -string "png"
# スクリーンショットのファイル名prefixを指定する
defaults write com.apple.screencapture name ss
# スクリーンショットの保存先を指定する
mkdir ~/Documents/ss
defaults write com.apple.screencapture location ~/Documents/ss
# ファイル共有を有効にする
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.smbd.plist
# スクリーンセーバーをFlurryにする
# defaults -currentHost write com.apple.screensaver moduleDict -dict moduleName "Flurry" path "/System/Library/Screen Savers/Flurry.saver" type 0
# スクリーンセーバーをメッセージにする
defaults -currentHost write com.apple.screensaver moduleDict -dict moduleName "Computer Name" path "/System/Library/Frameworks/ScreenSaver.framework/PlugIns/Computer Name.appex" type 0

### 設定適用のおまじない
/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
### Dock、Finder、SystemUIServerの再起動
for app in "Dock" \
	"Finder" \
	"SystemUIServer"; do
	killall "${app}" &> /dev/null
done