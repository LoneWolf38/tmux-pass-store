#!/usr/bin/env bash

# ------------------------------------------------------------------------------

declare -r OPT_KEYBINDING="$(tmux::get_option "@t-pass-key" "G")"
declare -r OPT_COPY_TO_CLIPBOARD="$(tmux::get_option "@t-copy-to-clipboard" "off")"

declare -r OPT_PASS_STORE_PATH="$(tmux::get_option "@t-pass-store" "./pass-store-default")"
declare -r OPT_PROMPT="$(tmux::get_option "@t-pass-prompt" "  ")"

# ------------------------------------------------------------------------------

options::keybinding() {
	echo "$OPT_KEYBINDING"
}

options::passStorePath() {
	echo "$OPT_PASS_STORE_PATH"
}

options::passprompt() {
	echo "$OPT_PROMPT"
}

options::copy_to_clipboard() {
	[[ "$OPT_COPY_TO_CLIPBOARD" == "on" ]]
	return $?
}
