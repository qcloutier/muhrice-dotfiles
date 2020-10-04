#!/bin/sh

BATS="$(echo /sys/class/power_supply/BAT*)"
test "$BATS" = '/sys/class/power_supply/BAT*' && exit

for BAT in $BATS; do
	if [ "$(cat $BAT/capacity)" -le 20 ]; then
		printf '❗'
	else
		case "$(cat $BAT/status)" in
			'Charging')    printf '🔌' ;;
			'Discharging') printf '🔋' ;;
			'Full')        printf '⚡' ;;
			*)             printf '❔' ;;
		esac
	fi
done
