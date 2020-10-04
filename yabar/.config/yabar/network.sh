#!/bin/sh

wlan() {
	WLNS="$(echo /sys/class/net/w*)"
	test "$WLNS" = '/sys/class/net/w*' && return

	for WLN in $WLNS; do
		if grep -q 'up' "$(printf $WLN/operstate)"; then
			printf '📶   '
			return
		fi
	done

	printf '❎   '
}

ethernet() {
	ETHS="$(echo /sys/class/net/e*)"
	test "$ETHS" = '/sys/class/net/e*' && return

	for ETH in $ETHS; do
		if grep -q 'up' "$(printf $ETH/operstate)"; then
			printf '🌐'
			return
		fi
	done

	printf '❎'
}

wlan
ethernet
