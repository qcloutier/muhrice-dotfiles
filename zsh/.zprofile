#
# ~/.zprofile
#

# Start MPD
if ! pgrep -f mpd; then mpd &; fi
