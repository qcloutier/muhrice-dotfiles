#
# ~/.zshrc
#

#
# GENERAL
#

# Informative prompt
autoload -U colors && colors
PS1="%B[%{$fg[red]%}%t$reset_color%B|%{$fg[blue]%}%n@%m$reset_color%B|%{$fg[green]%}%d$reset_color%B]"$'\n'"%B>>>%{$reset_color%} "

# Dynamic cursor
if [[ "$TERM" != "linux" ]]; then
  echo -ne '\e[5 q'
  preexec() { echo -ne '\e[5 q' ;}

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
fi

# Ease of use
bindkey -v '^?' backward-delete-char
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
alias ls='ls --color=auto'

# Some defaults
export PATH="$PATH:$HOME/.local/bin/"
export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="firefox"

# Fixes for mistakes
if command -v thefuck >> /dev/null; then
  eval $(thefuck --alias)
fi

#
# PLUGINS
#

# Install antigen if not present
antigenscript="$HOME/.antigen/antigen.zsh"
if ! test -f $antigenscript; then
  curl -fLo $antigenscript git.io/antigen --create-dirs 2>/dev/null
fi

# Load the plugin manager
source $antigenscript

# zsh-autosuggestions for completions while typing
antigen bundle zsh-users/zsh-autosuggestions

# zsh-syntax-highlighting for syntax highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets cursor)
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the plugins
if test "$TERM" != "linux"; then
  antigen apply
fi
