#
# ~/.bash_profile
#

# Start programs that are not already running
function run {
    if ! pgrep -f $1; then
        $@&
    fi
}

run syncthing -no-browser >> /dev/null

# Run the contents of bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc
