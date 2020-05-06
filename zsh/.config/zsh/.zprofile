#
# ~/.config/zsh/.zprofile
#

# Start some programs
type mpd > /dev/null && ! pgrep -f mpd > /dev/null && mpd &> /dev/null
type ssh-agent > /dev/null && ! pgrep -f ssh-agent > /dev/null && eval $(ssh-agent) &> /dev/null
