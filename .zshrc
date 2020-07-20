# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob notify
unsetopt beep #nomatch
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/luca/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Complete relative paths
zstyle ':completion:*' special-dirs true

# Make my prompt pretty please
autoload -Uz promptinit
promptinit
PROMPT='%F{green}%n@%m%f %F{yellow}%~%f %F{blue}>%f '

# Make my terminal titles actually mean something (last command with first two parameters)
preexec() {
    echo -n '\e]0;'
    echo -nE "$1" | cut -d ' ' -f 1-3
    echo -n '\a'
}

# More pretty colors
alias ls='ls --color'

# Nano sucks
export VISUAL=vim
export EDITOR="$VISUAL"

# Shortcuts
bindkey "^R" history-incremental-pattern-search-backward
