#!/bin/zsh

### xxx Setup
# 実際のセットアップコマンドを書く

# Google日本語入力の設定（辞書等）にシンボリックを張る（iCloudから）(フリーズしまくるので一旦コメントアウト)
# mv ~/Library/Application\ Support/Google/JapaneseInput ~/Library/Application\ Support/Google/JapaneseInput_org
# mkdir ~/Library/Application\ Support/Google/
# ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs/JapaneseInput ~/Library/Application\ Support/Google

## visual studio codeのコマンド用にPathを通す
# 追加するパス
VSCODE_PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
# ~/.zprofile にすでにパスが含まれているかチェック
if ! grep -q "$VSCODE_PATH" ~/.zprofile; then
    echo "Adding Visual Studio Code to PATH..."
    cat <<EOF >> ~/.zprofile
# Add Visual Studio Code (code) to PATH
export PATH="\$PATH:$VSCODE_PATH"
EOF
else
    echo "Visual Studio Code path is already set."
fi
# 設定を即時反映
source ~/.zprofile


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
dockutil --add "/System/Applications/System Settings.app"
dockutil --add "/System/Applications/Utilities/Terminal.app"
dockutil --add "/Applications" --view grid --display folder
dockutil --add "~/Downloads" --view fan --display folder
dockutil --add "~/Documents/ss" --view fan --display folder

