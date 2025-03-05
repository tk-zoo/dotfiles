#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
VSCODE_SETTING_PATH="${HOME}/Library/Application Support/Code/User/settings.json"

if [[ ! -L "${VSCODE_SETTING_PATH}" ]]; then
  echo "Linking settings.json to vscode..."
  ln -fsvn "${SCRIPT_DIR}/settings.json" "${VSCODE_SETTING_PATH}" || {
    echo "Error creating symbolic link." >&2
    exit 1
  }
  echo "Symbolic link created: ${VSCODE_SETTING_PATH} -> ${SCRIPT_DIR}/settings.json"
else
  echo "VSCode settings.json link already exists."
fi

# Install extensions to vscode
if [ "$(which "code")" != "" ]; then
  echo "Installing extensions to vscode..."
  cat < "${SCRIPT_DIR}/extensions" | while read -r line
  do
    code --install-extension "$line"
  done
else
  echo "Code command not found."
fi