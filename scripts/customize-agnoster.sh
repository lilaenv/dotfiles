#!/bin/bash
# Overview: This script customize the Agnoster Zsh theme to display a timestamp

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <zsh-theme file>"
  exit 1
fi

FILE="$1"

# Modify prompt_context to display a timestamp
sed -i.bak 's#"%(!\.%{%F{\$AGNOSTER_STATUS_ROOT_FG}%}\.)%n@%m"#"$(date '"'"'+%H:%M:%S'"'"')"#g' "$FILE"

cat <<EOF
$(echo -e "\e[32m==>\e[0m") Process completed.
A backup of the original file has been saved as agnoster-theme.bak.
$(echo -e "\e[34m==>\e[0m") Next steps:
- Run these commands to apply the changes to your shell environment:
    source ~/.oh-my-zsh/themes/agnoster.zsh-theme
    source ~/.zshrc
EOF
