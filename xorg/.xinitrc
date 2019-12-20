#!/bin/sh

# Run local xprofile
[ -f ~/.xprofile ] && . ~/.xprofile

# Start openbox
exec openbox-session
