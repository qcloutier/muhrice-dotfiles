#!/bin/sh

#
# ~/.xinitrc
#

# Run the local xprofile
[ -f ~/.xprofile ] && . ~/.xprofile

# Start our window manager
exec awesome
