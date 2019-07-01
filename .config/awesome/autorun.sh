#!/bin/bash

function run {
    if ! pgrep -f $1; then
        $@&
    fi
}

# asthetics
run xcompmgr
run xwallpaper --maximize /home/quinton/Pictures/laptop.jpeg

# keymaps
run sxhkd

# system tray
run cbatticon
run nm-applet

# password manager
run keepassxc
