#!/bin/zsh

### xxx Setup
# 実際のセットアップコマンドを書く

# Google日本語入力の設定（辞書等）にシンボリックを張る（iCloudから）
mv ~/Library/Application\ Support/Google/JapaneseInput ~/Library/Application\ Support/Google/JapaneseInput_org
ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs/JapaneseInput ~/Library/Application\ Support/Google

# sudoでTouchIDを使えるようにする
sed -e 's/^#auth/auth/' /etc/pam.d/sudo_local.template | sudo tee /etc/pam.d/sudo_local

#Dockのアプリアイコンを追加する
#	- Finder,Slack,Chrome,Safari,Firefox,VScode,SystemPref,Terminal
#	- Application,Downlord,SS
dockutil --add "/Applications/Slack.app"
dockutil --add "/Applications/Google Chrome.app"
dockutil --add "/Applications/Safari.app"
dockutil --add "/Applications/Firefox.app"
dockutil --add "/Applications/Visual Studio Code.app"
dockutil --add "/System/Applications/System\ Settings.app"
dockutil --add "/System/Applications/Utilities/Terminal.app"
dockutil --add "/Applications/" --view grid --display folder
dockutil --add "~/Downloads/" --view fan --display folder
dockutil --add "~/Documents/ss/" --view fan --display folder