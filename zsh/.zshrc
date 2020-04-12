#
# ~/.zshrc
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
setopt -o sharehistory

# Enable completions
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Local programs and scripts
export PATH="$PATH:$HOME/.local/bin/"

# Aliases
alias ls='ls --color=auto'
alias vim=nvim

# Default programs
export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="firefox"

# Colour the output from less
export LESS_TERMCAP_mb=$'\e[1;36m'
export LESS_TERMCAP_md=$'\e[1;36m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;35m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;37m'

# Install antigen if not present
antigenscript="$HOME/.antigen/antigen.zsh"
if ! test -f $antigenscript; then
  curl -fLo $antigenscript git.io/antigen --create-dirs 2>/dev/null
fi

# Activate plugins
if test "$TERM" != "linux"; then
  source $antigenscript
  antigen bundle zsh-users/zsh-autosuggestions
  ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets cursor)
  antigen bundle zsh-users/zsh-syntax-highlighting
  antigen apply
fi
