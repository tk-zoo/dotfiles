source ~/.zprofile

if [ "$(which code)" != "" ]; then
  if [ "$(code --list-extensions)" != "$(cat "${SCRIPT_DIR}/extensions")" ]; then
    cat < "${SCRIPT_DIR}/extensions" | while read -r line
    do
      code --install-extension "$line"
    done
  fi
else
  echo "Install the code command from the command palette to add your extensions."
fi
