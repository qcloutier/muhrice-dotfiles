#
# ~/.config/zsh/.zprofile
#

# Silently start some programs in the background
(! pgrep -f mpd && mpd) &> /dev/null
(! pgrep -f ssh-agent && eval $(ssh-agent)) &> /dev/null
(! pgrep -f syncthing && syncthing --no-browser &) &> /dev/null
