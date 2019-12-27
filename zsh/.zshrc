#
# ~/.zshrc
#

# Ensure these are still set
setxkbmap -option caps:swapescape
export PATH="$PATH:$HOME/.local/bin/"

# Informative prompt
autoload -U colors && colors
PS1="%B[%{$fg[red]%}%t$reset_color%B|%{$fg[blue]%}%n@%m$reset_color%B|%{$fg[green]%}%d$reset_color%B]"$'\n'"%B>>>%{$reset_color%} "

# Line as cursor by default
echo -ne '\e[5 q'
preexec() { echo -ne '\e[5 q' ;}

# Vim keys with dynamic cursor
bindkey -v
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'

  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

# General stuff
setopt autocd
setopt notify
unsetopt beep nomatch

# Some aliases
alias g=git
alias m=make
alias n=ncmpcpp
alias r=ranger
alias t=htop
alias v=nvim
alias vim=nvim

# History settings
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Enable completions
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Fixes for mistakes
eval $(thefuck --alias)

# Suggestions while typing
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Syntax highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets cursor)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
