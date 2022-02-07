# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob notify
unsetopt beep #nomatch
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/lneukom/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Complete relative paths
zstyle ':completion:*' special-dirs true

# Make my prompt pretty please
autoload -Uz promptinit
promptinit
PROMPT='%F{green}%n@%m%f %F{yellow}%~%f %F{cyan}>%f '

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

bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
