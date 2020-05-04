#
# ~/.config/zsh/.zprofile
#

# Start MPD
type mpd > /dev/null && ! pgrep -f mpd > /dev/null && mpd &> /dev/null
