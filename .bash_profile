#
# ~/.bash_profile
#

# Start programs if not already running
function run {
    if ! pgrep -f $1; then
        $@&
    fi >> /dev/null
}
run mpd
run syncthing -no-browser

# Run the contents of bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc
