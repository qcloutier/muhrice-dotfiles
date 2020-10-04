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

SEL="$(printf "$OPTS" | rofi -dmenu -p "System" -m primary -location 3 -yoffset 30 -theme $HOME/.config/rofi/system_menu.rasi)"

CTL="$(command -v systemctl > /dev/null && echo systemctl || echo loginctl)"

case $SEL in
	$LCK)   loginctl lock-session ;;
	$EXT)   bspc quit ;;
	$UPDT)  $TERMINAL sudo qupdate ;;
	$CLN)   $TERMINAL sudo qclean ;;
	$BCKP)  $TERMINAL sudo qbackup ;;
	$SSPND) sudo $CTL suspend ;;
	$RBT)   sudo $CTL reboot ;;
	$PWRFF) sudo $CTL poweroff ;;
esac
