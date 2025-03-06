#!/bin/zsh

source ~/.zprofile

# Check operating system
if [ "$(uname)" != "Darwin" ] ; then
	echo "Not macOS!"
	exit 1
fi

function open_app_store {
  echo "Please login with your Apple ID & iCloud"
  sleep 1; echo "Open the App Store."
  sleep 1; open -a App\ Store
  sleep 1; open -b com.apple.systempreferences
}

function login_check {
  while true; do
    echo -n "$* [Y/n]: (default: n) "
    read ANS
    case $ANS in
      [Yy]*)
        return 0
        ;;
      *)
        open_app_store
        ;;
    esac
  done
}

open_app_store
if login_check "Did you login?"; then
  brew bundle --global ##--verbose
  # シェルの再読み込み
  source ~/.zprofile
fi

