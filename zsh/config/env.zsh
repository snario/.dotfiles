# vim:ft=zsh

# fixing curses apps
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export TERM=xterm-256color

# Core config
export EDITOR=vim

# Customize github.com/djui/alias-tips
export ZSH_PLUGINS_ALIAS_TIPS_REVEAL=1
export ZSH_PLUGINS_ALIAS_TIPS_REVEAL_EXCLUDES="(_ ll vi)"

# Customize macprefs
export MACPREFS_BACKUP_DIR="$HOME/Library/Mobile Documents/com~apple~CloudDocs"

# Docker
export COMPOSE_DOCKER_CLI_BUILD=1;
export DOCKER_BUILDKIT=1