#!/bin/sh

tmux show-options -g | grep 'status on' >/dev/null \
	&& tmux set -g status off\; set -g pane-border-status off \
	|| tmux set -g status on\; set -g pane-border-status top
