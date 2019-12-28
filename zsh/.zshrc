#
# ~/.zshrc
#

#
# GENERAL
#

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

# Ease of use
setopt autocd
setopt notify
unsetopt beep nomatch

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

# Some aliases
alias g=git
alias m=make
alias n=ncmpcpp
alias r=ranger
alias t=htop
alias v=nvim
alias vim=nvim

# Some defaults
export PATH="$PATH:$HOME/.local/bin/"
export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="firefox"

# Fixes for mistakes
command -v thefuck >> /dev/null && eval $(thefuck --alias)

# Swap caps and escape in Xorg
command -v setxkbmap >> /dev/null && setxkbmap -option caps:swapescape

#
# PLUGINS
#

# Install antigen if not present
antigenscript="$HOME/.antigen/antigen.zsh"
test -f $antigenscript || curl -fLo $antigenscript git.io/antigen --create-dirs 2>/dev/null
source $antigenscript

# Suggestions while typing
antigen bundle zsh-users/zsh-autosuggestions

# Syntax highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets cursor)
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the plugins
antigen apply
