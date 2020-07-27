#!/bin/sh

if ! command -v bspc tabbed xprop xwininfo >/dev/null; then
	exit 1
fi

case $1 in
	create)
		CHILD_ID="$(bspc query -N -n focused)"
		PARENT_ID="$(tabbed -cd 2>/dev/null)"
		;;
	insert)
		CHILD_ID="$(bspc query -N -n focused)"
		PARENT_ID="$(bspc query -N -n $2)"

		if [ "$(xprop -id $PARENT_ID 2>/dev/null | grep 'WM_CLASS' | awk -F \" '{print $4}')" != "tabbed" ]; then
			exit 1
		fi
		;;
	remove)
		CHILD_ID="$(xwininfo -id $(bspc query -N -n focused) -children \
			| sed -n '/[0-9]\+ \(child\|children\):/,$s/ \+\(0x[0-9a-z]\+\).*/\1/p' \
			| head -n 1)"

		PARENT_ID="$(xwininfo -root | awk '/Window id:/{print $4}')"
		;;
esac

xdotool windowreparent "$CHILD_ID" "$PARENT_ID"
