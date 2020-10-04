#!/bin/sh

WLNS="$(echo /sys/class/net/w*)"
test "$WLNS" = '/sys/class/net/w*' && exit

for WLN in $WLNS; do
	if grep -q 'up' "$(printf $WLN/operstate)"; then
		printf '📶'
		exit
	fi
done

printf '❎'
