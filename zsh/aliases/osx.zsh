# vim:ft=zsh
# vim: set tabstop=4:softtabstop=4:shiftwidth=4:expandtab

if [[ $OSTYPE == darwin* ]]; then

alias fixbrew='sudo chown -R $(whoami):admin $(brew --prefix)/*'

# OSX install wrapper
function osx_ins() {
    if brew cask ls --versions $1 >/dev/null 2>/dev/null; then
        echo "Running: brew cask install $1"
        brew cask install $1
        return
    fi
    if brew ls --versions $1 >/dev/null 2>/dev/null; then
        echo "Running: brew install $1"
        brew install $1
        return
    fi
    echo "Package $1 not found in brew or cask."
}

alias dfh='df -H -l | awk -F" " '"'"'{ $6="";  $7=""; $8=""; $10=""; print}'"'"' | column -t'

# upgrade casks
alias upgrade_casks='brew cask outdated | xargs brew cask reinstall'

# updatedb
alias updatedb='sudo /usr/libexec/locate.updatedb'

# python
alias python='python3'

fi