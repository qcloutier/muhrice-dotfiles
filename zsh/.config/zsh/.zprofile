#
# ~/.config/zsh/.zprofile
#

# Start MPD
type mpd && ! pgrep -f mpd > /dev/null && mpd &> /dev/null
