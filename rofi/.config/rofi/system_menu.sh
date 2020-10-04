#!/bin/sh

LCK="🔒 Lock screen"
EXT="👋 Exit X session"
UPDT="📦 Update"
BCKP="🔙 Backup"
SSPND="😴 Suspend"
RBT="↪️ Reboot"
PWRFF="⬇️ Power off"

OPTS="$LCK\n$EXT\n$UPDT\n$BCKP\n$SSPND\n$RBT\n$PWRFF"

SEL="$(echo "$OPTS" | rofi -dmenu -p "System" -location 3 -yoffset 30 -theme $HOME/.config/rofi/system_menu.rasi)"

CTL="$(command -v systemctl > /dev/null && echo systemctl || echo loginctl)"

case $SEL in
	$LCK)   loginctl lock-session ;;
	$EXT)   bspc quit ;;
	$UPDT)  $TERMINAL qupdate ;;
	$BCKP)  $TERMINAL qbackup ;;
	$SSPND) sudo $CTL suspend ;;
	$RBT)   sudo $CTL reboot ;;
	$PWRFF) sudo $CTL poweroff ;;
esac
