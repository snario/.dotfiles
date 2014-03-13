# ~/.bash_profile

PATH=/Users/lihorne/.rbenv/shims:/usr/local/opt/ruby/bin:/usr/local/bin:/bin:/usr/sbin:/sbin:/usr/bin:/usr/texbin
SHELL=/bin/bash
PROFILE=~/.bash_profile

source ~/.git-completion.bash
source ~/.git-prompt.sh

eval "$(rbenv init -)"

export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8

alias p='cd ~/Documents/Projects/piinpoint/piinpoint_tools'
alias la='ls -a'
alias ls='ls -G'
alias reload='. ~/.bash_profile'
alias uwlinux='ssh lihorne@linux.student.cs.uwaterloo.ca'
alias master='ssh -i ~/Documents/Projects/piinpoint/piinpointkey.pem ec2-user@54.200.4.80'
alias staging='ssh -i ~/Documents/Projects/piinpoint/piinpointkey.pem ec2-user@54.200.230.35'
alias aws2='ssh -i ~/Documents/Projects/piinpoint/piinpointkey.pem ec2-user@54.201.182.202'
alias serve='sudo paster serve ~/Documents/Projects/piinpoint/piinpoint_tools/development.ini'
alias servereload='sudo paster serve --reload  ~/Documents/Projects/piinpoint/piinpoint_tools/development.ini'
alias phab='ssh -i ~/Documents/Projects/piinpoint/piinpointkey.pem ubuntu@54.213.219.98'
alias ps1reload='PS1="\[\e[01;30m\]\t \[\e[0;30m\][\[${RED}\]\W\[${BLACK}\]]`[[ $(git status 2> /dev/null | head -n2 | tail -n1) != "# Changes to be committed:" ]] && echo "\[\e[91m\]" || echo "\[\e[32m\]"``[[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] || echo "\[\e[32m\]"`$(__git_ps1 " (%s)\[\e[00m\]") λ \[${BLACK}\]"'

function dbs() {
	rsync -rvaP --exclude='*.DS_Store' --delete ~/Documents/ ~/Dropbox/Documents/
	#cd ~/Documents/University/2A\ Fall\ 2013/
	#scp CS\ 246/Notes/cs246coursenotes.pdf MATH\ 237/Notes/math237coursenotes.pdf MATH\ 239/Notes/math239coursenotes.pdf CS\ 245/Notes/cs245coursenotes.pdf STAT\ 230/Notes/stat230coursenotes.pdf lihorne@csclub.uwaterloo.ca:www/
	#cd -
}

alias opensb='open -a Sublime\ Text '
alias uw='cd ~/Documents/University/2A\ Fall\ 2013/'

function scoreboard () {
  git log | grep Author | sort | uniq -ci | sort -r
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

[[ -s /Users/Liam/.nvm/nvm.sh ]] && . /Users/Liam/.nvm/nvm.sh


GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWCOLORHINT=1
GIT_PS1_DESCRIBE_STYLE="branch"

BLACK=$(tput setaf 0)
RED=$(tput setaf 1)
PS1="\[\e[01;30m\]\t \[\e[0;30m\][\[${RED}\]\W\[${BLACK}\]]`[[ $(git status 2> /dev/null | head -n2 | tail -n1) != "# Changes to be committed:" ]] && echo "\[\e[91m\]" || echo "\[\e[32m\]"``[[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] || echo "\[\e[32m\]"`$(__git_ps1 " (%s)\[\e[00m\]")\[\e[00m\] λ \[${BLACK}\]"
PROMPT_COMMAND=ps1reload
