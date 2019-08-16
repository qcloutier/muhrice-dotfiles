#!/bin/bash

function run {
    if ! pgrep -f $1; then
        $@&
    fi >> /dev/null
}

# asthetics
run xcompmgr
run xrdb ~/.Xresources

# keymaps
run sxhkd

# password manager
run keepassxc
