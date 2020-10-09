#!/bin/sh

if ! command -v bspc xprop >/dev/null; then
	exit 0
fi

TITLE="$(xprop -id "$(bspc query -n focused -N)" 2> /dev/null)"
printf "$TITLE" | grep 'WM_CLASS' | awk -F \" '{print $4}'
