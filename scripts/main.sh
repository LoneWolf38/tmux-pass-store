#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" ||
	exit 1

# ------------------------------------------------------------------------------

source "./utils/clipboard.sh"
source "./utils/cmd.sh"
source "./utils/tmux.sh"

source "./options.sh"

# ------------------------------------------------------------------------------

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

main() {

	BORDER_LABEL="tmux-password-manager"
	HEADER="Select Password"
	PROMPT="$(options::passprompt)"

	PASSWORD_FILE="$(options::passStorePath)"

	items="$(
		cat $PASSWORD_FILE | awk -F ';' '{ print $1, " " }'
	)"

	selected_item="$(echo "$items" | awk -F ' ' '{ print $1 }' | fzf-tmux \
		--header="${HEADER}" \
		--border-label="${BORDER_LABEL}" \
		--no-multi \
		--prompt="${PROMPT}" \
		--no-sort \
		-p 60%,50%)"

	selected_item_password="$(
		cat $PASSWORD_FILE | awk -v item=$selected_item -F ';' '{ if ($1 == item) { print $2 } }'
	)"

	if options::copy_to_clipboard; then

		# Copy password to clipboard
		clipboard::copy "$selected_item_password"

		# Clear clipboard
		clipboard::clear 30
	else

		# Use `send-keys`
		tmux send-keys "$selected_item_password" Enter
	fi

}

main
