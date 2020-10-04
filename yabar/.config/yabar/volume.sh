#!/bin/sh

command -v pulsemixer > /dev/null || exit

if test "$(pulsemixer --get-mute)" -eq 1; then
	printf '🔇'
	exit
fi

VOL="$(pulsemixer --get-volume | awk '{print int(($1+$2)/2)}')"

if   [ "$VOL" -le "30"  ]; then
	printf '🔈'
elif [ "$VOL" -le "70"  ]; then
	printf '🔉'
elif [ "$VOL" -le "100" ]; then
	printf '🔊'
else
	printf '📢'
fi
