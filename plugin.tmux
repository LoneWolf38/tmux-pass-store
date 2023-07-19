#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" ||
	exit 1

# ------------------------------------------------------------------------------

source "./scripts/utils/cmd.sh"
source "./scripts/utils/tmux.sh"

source "./scripts/options.sh"

# ------------------------------------------------------------------------------

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

declare -a REQUIRED_COMMANDS=(
	'fzf'
	'tmux'
	'fzf-tmux'
)

# ------------------------------------------------------------------------------

for cmd in "${REQUIRED_COMMANDS[@]}"; do
	if ! cmd::exists "$cmd"; then
		tmux::display_message "command '$cmd' not found"
		return 1
	fi
done

tmux bind-key "$(tmux::get_option "@t-pass-key" "G")" run-shell "$CURRENT_DIR/scripts/main.sh"
