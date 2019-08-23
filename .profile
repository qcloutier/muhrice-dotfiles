#!/bin/bash

# Start some programs if they are not already running
function run {
    if ! pgrep -f $1; then
        $@&
    fi >> /dev/null
}
run mpd
run syncthing -no-browser

# Run the local bashrc
[ -f ~/.bashrc ] && . ~/.bashrc
