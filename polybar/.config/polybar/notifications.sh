#!/bin/sh

command -v dunstctl > /dev/null || return

if [ "$(dunstctl is-paused)" = "false" ]; then
	printf '🔔'
else
	printf '🔕'
fi
