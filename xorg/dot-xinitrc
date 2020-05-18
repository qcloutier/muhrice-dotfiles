#!/bin/sh

# Various local settings
[ -f $HOME/.xprofile ] && . $HOME/.xprofile

# GTK and QT theming
export GTK2_RC_FILES=$HOME/.config/gtk-2.0/gtkrc-2.0
export QT_QPA_PLATFORMTHEME=qt5ct

# Keyboard and mouse tweaks
setxkbmap -option caps:swapescape
xsetroot -cursor_name left_ptr

# Desktop background
feh --bg-fill $HOME/.config/background/normal.png

# Notifications, compositing, statusline, hotkeys
dunst & picom & polybar top & sxhkd &

# Lock and sleep when inactive
xautolock -time 15 -locker 'sudo systemctl suspend' \
	-notify 300 -notifier 'lock' &

# Inhibit autolock when fullscreen
caffeine &

# Pair with other devices
/usr/lib/kdeconnectd &
kdeconnect-indicator &

# Window manager
exec bspwm
