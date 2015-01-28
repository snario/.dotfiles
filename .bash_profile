# ~/.bash_pro

ORIG_PATH="$PATH"
SAVE_IFS=$IFS
IFS=":"
PATH_PARTS=(
    "/usr/local/Cellar/scipy/0.13.3_1/lib/python2.7/site-packages/scipy/"
    "/Users/lihorne/.rbenv/shims"
    "/Applications/Racket\ v6.0/bin/"
    "/usr/local/opt/ruby/bin"
    "/usr/local/bin:/bin"
    "/bin"
    "/sbin"
    "/usr/bin"
    "/usr/texbin"
    "$ORIG_PATH"
)
export PATH="${PATH_PARTS[*]}"
IFS=$SAVE_IFS

SHELL=/bin/bash
PROFILE=~/.bash_profile

# Always enable GREP colors
export GREP_OPTIONS='--color=auto'

# complete sudo and man-pages
complete -cf sudo man

# Separate aliases file
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Separate functions file
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

# Separate functions file
if [ -f ~/.bash_ps1 ]; then
    . ~/.bash_ps1
fi


export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8

master='piinpoint.com'
staging='54.68.139.242'
rmongo='54.69.39.13'
drive_na='54.68.175.15'
drive_world='54.200.166.86'

alias master='ssh ec2-user@$master'
alias staging='ssh ec2-user@$staging'
alias mongoserve='ssh ec2-user@$rmongo'
alias drivenaserver='ssh ubuntu@$drive_na'
alias driveworldserver='ssh ubuntu@$drive_world'

dev_ini='/Users/lihorne/Dropbox/Documents/Projects/piinpoint/piinpoint/development.ini'

# Run PiinPoint on Local
function piinpoint {
    cmd='sudo paster serve --reload $dev_ini'
    if [ "$1" == "local" ]; then
        cmd+=' local_mongo=True'
    fi
    eval $cmd
}

alias p='cd ~/Dropbox/Documents/Projects/piinpoint/piinpoint_tools'
alias ls='ls -G'
alias reload='. ~/.bash_profile'

alias ptest='cd /Users/lihorne/Dropbox/Documents/Projects/piinpoint/piinpoint_tools/ && sudo nosetests --pdb --with-pylons test.ini piinpoint_tools/tests/  && cd -'
alias opensb='open -a Sublime\ Text '


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"



