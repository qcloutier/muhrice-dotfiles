#
# ~/.zprofile
#

# Local scripts
export PATH="$PATH:$HOME/.local/bin/"

# Default programs
export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="firefox"

# Start MPD
if ! pgrep -f mpd; then mpd &; fi
