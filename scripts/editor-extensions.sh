#!/bin/bash
# Overview: This script installs the extensions listed in extensions.txt to the editor.

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
EDITOR_DIR="${SCRIPT_DIR}/../.config/editor"
VSCODE_SETTING_PATH="${HOME}/Library/Application Support/Code/User/settings.json"
CURSOR_SETTING_PATH="${HOME}/Library/Application Support/Cursor/User/settings.json"

# Function to setup an editor
setup_editor() {
  local editor_name=$1
  local setting_path=$2
  local command=$3

  echo "Setting up ${editor_name}..."

  # Link settings.json
  if ! [ -L "${setting_path}" ]; then
    echo "Creating symbolic link for ${editor_name} settings.json..."
    ln -fsvn "${EDITOR_DIR}/settings.json" "${setting_path}"
  else
    echo "${editor_name} settings.json file not found."
  fi

  # Install extensions
  if [ "$(which "${command}")" != "" ]; then
    echo "Installing extensions to ${editor_name}..."
    while read -r line; do
      ${command} --install-extension "$line"
    done <"${EDITOR_DIR}/extensions.txt"
  else
    echo "The '${command}' command was not found. Please check if ${editor_name} is installed."
  fi
}

# Ask user to choose between VSCode, Cursor, or both
read -r -p "Which editor are you using? Enter 'v' for VSCode, 'c' for Cursor, or 'b' for both: " EDITOR_CHOICE

# Convert to lowercase
EDITOR_CHOICE=$(echo "$EDITOR_CHOICE" | tr '[:upper:]' '[:lower:]')

# Process based on choice
case "$EDITOR_CHOICE" in
v)
  read -r -p "You selected VSCode. Is this correct? (y/N): " CONFIRM
  if [ "$CONFIRM" = "y" ] || [ "$CONFIRM" = "Y" ]; then
    setup_editor "VSCode" "${VSCODE_SETTING_PATH}" "code"
  else
    echo "Setup cancelled."
    exit 0
  fi
  ;;
c)
  read -r -p "You selected Cursor. Is this correct? (y/N): " CONFIRM
  if [ "$CONFIRM" = "y" ] || [ "$CONFIRM" = "Y" ]; then
    setup_editor "Cursor" "${CURSOR_SETTING_PATH}" "cursor"
  else
    echo "Setup cancelled."
    exit 0
  fi
  ;;
b)
  read -r -p "You selected both VSCode and Cursor. Is this correct? (y/N): " CONFIRM
  if [ "$CONFIRM" = "y" ] || [ "$CONFIRM" = "Y" ]; then
    setup_editor "VSCode" "${VSCODE_SETTING_PATH}" "code"
    setup_editor "Cursor" "${CURSOR_SETTING_PATH}" "cursor"
  else
    echo "Setup cancelled."
    exit 0
  fi
  ;;
*)
  echo "Invalid selection. Please run the script again."
  exit 1
  ;;
esac

echo "Setup completed successfully."
