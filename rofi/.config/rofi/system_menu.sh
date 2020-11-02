#!/bin/sh

LCK="🔒 Lock screen"
EXT="👋 Exit X session"
UPDT="📦 Update"
CLN="🛀 Clean"
BCKP="🔙 Backup"
SSPND="😴 Suspend"
RBT="↪️ Reboot"
PWRFF="⬇️ Power off"

OPTS="$LCK\n$EXT\n$UPDT\n$CLN\n$BCKP\n$SSPND\n$RBT\n$PWRFF"

SEL="$(printf "$OPTS" | rofi -dmenu -p "system" -m primary \
	-location 3 -xoffset 2 -yoffset 22 \
	-theme $HOME/.config/rofi/system_menu.rasi)"

CTL="$(command -v systemctl > /dev/null && echo systemctl || echo loginctl)"

case $SEL in
	$LCK)   loginctl lock-session ;;
	$EXT)   i3-msg exit ;;
	$UPDT)  $TERMINAL -e sudo qupdate ;;
	$CLN)   $TERMINAL -e sudo qclean ;;
	$BCKP)  $TERMINAL -e sudo qbackup ;;
	$SSPND) sudo $CTL suspend ;;
	$RBT)   sudo $CTL reboot ;;
	$PWRFF) sudo $CTL poweroff ;;
esac
