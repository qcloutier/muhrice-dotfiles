#!/bin/sh

ETHS="$(echo /sys/class/net/e*)"
test "$ETHS" = '/sys/class/net/e*' && exit

for ETH in $ETHS; do
	if grep -q 'up' "$(printf $ETH/operstate)"; then
		printf '🌐'
		exit
	fi
done

printf '❎'
