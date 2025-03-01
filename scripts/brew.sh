#!/bin/bash
# Overview: This script install Homebrew and Software Packages

if [ "$(uname -s)" != "Darwin" ]; then
  echo "Error: This script must be run on macOS."
  exit 1
fi

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Path Settings
echo >>"$HOME/.zprofile"
if [ "$(uname -m)" = "arm64" ]; then
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>"$HOME/.zprofile"
else
  echo 'eval "$(/usr/local/bin/brew shellenv)"' >>"$HOME/.zprofile"
fi

cat <<EOF
$(echo -e "\e[32m==>\e[0m") Process completed.
$(echo -e "\e[34m==>\e[0m") Next steps:
- Reload the current shell to apply the changes to your shell environment
- Run the following command to install packages from the Brewfile:
    brew bundle
EOF
