#
# ~/.zprofile
#

# Local scripts
export PATH="$PATH:$HOME/.local/bin/"

# Default programs
export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="firefox"

# Config files
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"

# Swap capslock with esc
setxkbmap -option caps:swapescape

# Start MPD
if ! pgrep -f mpd; then mpd &; fi
