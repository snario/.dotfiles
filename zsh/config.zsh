#!/bin/zsh

ZSH=$HOME/.oh-my-zsh

DEFAULT_USER="lihorne"
ZSH_THEME="agnoster"
DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"
SHELL=/bin/zsh
PROFILE=~/.zshrc

plugins=(git npm osx sublime atom docker)

source $ZSH/oh-my-zsh.sh

setopt NO_BG_NICE # don't nice background tasks
setopt NO_HUP
setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps
setopt HIST_VERIFY
setopt SHARE_HISTORY # share history between sessions ???
setopt EXTENDED_HISTORY # add timestamps to history
setopt PROMPT_SUBST
setopt CORRECT
setopt COMPLETE_IN_WORD
setopt IGNORE_EOF

setopt APPEND_HISTORY # adds history
setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS

SAVEHIST=100000
HISTFILE=~/.zsh_history

bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word
bindkey '^[[5D' beginning-of-line
bindkey '^[[5C' end-of-line
bindkey '^[[3~' delete-char
bindkey '^[^N' newtab
bindkey '^?' backward-delete-char

export CLICOLOR=true
export GREP_OPTIONS='--color=auto'
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8

