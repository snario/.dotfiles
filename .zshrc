# ~/.bash_pro
DEFAULT_USER="lihorne"
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"
plugins=(git osx sublime tmux tmuxinator virtualenv)
source $ZSH/oh-my-zsh.sh
source $ZSH/zsh-syntax-highlighting-filetypes.zsh
ORIG_PATH="$PATH"
SAVE_IFS=$IFS
IFS=":"
export GOPATH="/Users/lihorne/Go"
PATH_PARTS=(
    "/Users/lihorne/.rvm/gems/ruby-2.0.0-p353/bin"
    "/Users/lihorne/.rbenv/versions/1.9.3-p194/bin/"
    "/usr/local/opt/go/libexec/bin"
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

SHELL=/bin/zsh
PROFILE=~/.zshrc




# Always enable GREP colors
export GREP_OPTIONS='--color=auto'

# Separate aliases file
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Separate functions file
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi


export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8

master='piinpoint.com'
staging='staging.piinpoint.com'
rmongo='54.69.39.13'
drive_na='54.68.175.15'
drive_world='54.200.166.86'



alias master='ssh ubuntu@$master'
alias staging='ssh ubuntu@$staging'
alias mongoserve='ssh ec2-user@$rmongo'
alias drivenaserver='ssh ubuntu@$drive_na'
alias driveworldserver='ssh ubuntu@$drive_world'

alias p='cd ~/piinpoint && source ~/.virtualenv/piinpoint/bin/activate'
alias src='source ~/.virtualenv/piinpoint/bin/activate'
alias ls='ls -G'
alias opensb='open -a Sublime\ Text\ 3'


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"



