#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

DEFAULT_THUMBS_KEY=space

THUMBS_KEY="$(tmux show-option -gqv @thumbs-key)"
THUMBS_KEY=${THUMBS_KEY:-$DEFAULT_THUMBS_KEY}

if ! tmux show-options -s |grep -Eq "command-alias.+thumbs-pick="; then
	tmux set-option -ag command-alias "thumbs-pick=run-shell -b ${CURRENT_DIR}/tmux-thumbs.sh"
fi

tmux bind-key "${THUMBS_KEY}" thumbs-pick
