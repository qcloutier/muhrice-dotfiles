#!/bin/sh

BATS="$(echo /sys/class/power_supply/BAT*)"
test "$BATS" = '/sys/class/power_supply/BAT*' && exit

for BAT in $BATS; do
	CAP="$(cat $BAT/capacity)"
	if [ "$CAP" -le 20 ]; then
		printf "❗ $CAP%%"
	else
		case "$(cat $BAT/status)" in
			'Charging')    printf "🔌 $CAP%%" ;;
			'Discharging') printf "🔋 $CAP%%" ;;
			'Full')        printf "⚡ $CAP%%" ;;
			*)             printf "❔ $CAP%%" ;;
		esac
	fi
done
