## Define all paths here. This simplifies hunting for random path clobbering.
# vim:ft=zsh

DOT_BIN="$HOME/.dotfiles/bin"
USER_BIN="$HOME/bin"
SYSTEM="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"

# OS-dependent  paths.
if [[ $OSTYPE == 'linux-gnu' ]]; then
  TEX="/usr/texbin"
elif [[ $OSTYPE == darwin* ]]; then
  TEX="/usr/local/texlive/2014/bin/universal-darwin"
  VSCODE="/Applications/Visual Studio Code - Insiders.app/Contents/Resources/app/bin"
fi

# additional autocompletions
fpath=($HOME/.dotfiles/zsh/config/fpath $fpath)

# Brewfile path
export HOMEBREW_BREWFILE="$HOME/.config/brewfile/Brewfile"

# Go Definitions
export GOPATH=$HOME/go
GOLANG_BIN="/usr/local/go/bin:/usr/lib/go/bin"

# Check for symlinks to directories in bin and 
# append them to the path. This is useful when linking in
# a suite such as flutter or android SDK.
setopt NULL_GLOB
for elem in $USER_BIN/*; do
    if [[ -L "$elem" && -d "$elem" ]]
    then
        USER_BIN=$USER_BIN:$elem
    fi
done
unsetopt NULL_GLOB

RUBY="/opt/homebrew/opt/ruby@2.7/bin"
NPM="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin"

# export final result
export PATH="$HOME/.local/bin:$RUBY:$USER_BIN:$DOT_BIN:$TEX:$GOPATH/bin:$GOLANG_BIN:$FZF_PREFIX/fzf/bin:$SYSTEM:$VSCODE:$NPM"
