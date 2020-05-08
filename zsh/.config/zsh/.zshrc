#
# ~/.config/zsh/.zshrc
#

# Simple prompt
autoload -U colors && colors
PS1="%B%{$bg[white]$fg[black]%} zsh %% %{$bg[black]$fg[white]%}%b "

# Vi keys with dynamic cursor
bindkey -v '^?' backward-delete-char
if [[ "$TERM" != 'linux' ]]; then
	echo -ne '\e[5 q'
	preexec() {
		echo -ne '\e[5 q'
	}
	function zle-keymap-select {
		if [[ ${KEYMAP} == vicmd ]] ||
			[[ $1 == 'block' ]]; then
			echo -ne '\e[1 q'
		elif [[ ${KEYMAP} == main ]] ||
			[[ ${KEYMAP} == viins ]] ||
			[[ ${KEYMAP} == '' ]] ||
			[[ $1 == 'beam' ]]; then
			echo -ne '\e[5 q'
		fi
	}
	zle -N zle-keymap-select
fi

# History
HISTFILE="$ZDOTDIR/histfile"
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt -o sharehistory

# Completions
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Aliases
[[ "$OSTYPE" == 'linux-gnu' ]] && alias ls='ls --color=auto' || alias ls='ls -G'
alias vim=nvim

# Colour the output from less
export LESS_TERMCAP_mb=$'\e[1;36m'
export LESS_TERMCAP_md=$'\e[1;36m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;35m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;37m'

# Miscellaneous
setopt autocd
setopt notify
unsetopt beep nomatch

# Install antigen if not present
[[ ! -d "$ADOTDIR" ]] && curl -fLo "$ADOTDIR/antigen.zsh" git.io/antigen --create-dirs 2>/dev/null

# Activate plugins
if [[ "$TERM" != 'linux' ]]; then
	source "$ADOTDIR/antigen.zsh"
	antigen bundle zsh-users/zsh-autosuggestions
	antigen bundle zsh-users/zsh-syntax-highlighting
	antigen apply
fi

# Start tmux
[[ "$TERM" != 'linux' ]] && [[ -z "$TMUX" ]] && exec tmux
