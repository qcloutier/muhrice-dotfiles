#!/bin/sh

command -v xbacklight > /dev/null || exit

if [ "$(echo "$(xbacklight -get)/1" | bc)" -le "50" ]; then
	printf '🔅'
else
	printf '🔆'
fi
