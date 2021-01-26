#Bash custom configuration file
#Written at 25.01.2021

#Ansii color codes
STOP='\e[0m'
BLACK='\e[0;30m'
RED='\e[0;31m'
GREEN='\e[0;32m'
YELLOW='\e[0;33m'
BLUE='\e[0;34m'
PURPLE='\e[0;35m'
CYAN='\e[0;36m'
WHITE='\e[0;37m'
BLACKBOLD='\e[1;30m'
REDBOLD='\e[1;31m'
GREENBOLD='\e[1;32m'
YELLOWBOLD='\e[1;33m'
BLUEBOLD='\e[1;34m'
PURPLEBOLD='\e[1;35m'
CYANBOLD='\e[1;36m'
WHITEBOLD='\e[1;37m'
BLACKBG='\e[40m'
REDBG='\e[41m'
GREENBG='\e[42m'
YELLOWBG='\e[43m'
BLUEBG='\e[44m'
PURPLEBG='\e[45m'
CYANBG='\e[46m'
WHITEBG='\e[47m'

#Display prompt
#Looks like "|~(histnr)~(path)~> "
PS1="${GREENBOLD}|~(${CYANBOLD}\!${GREENBOLD})~(${BLUEBOLD}\w${GREENBOLD})~>${STOP} "
PS2="${REDBOLD}>${STOP} "

#History file configuration
#Located in ~/.bash_history
HISTSIZE=2000
HISTFILESIZE=2000
HISTCONTROL=ignoreboth
HISTFILE="~/.history"

#Aliases and functions
if [ -f ~/.aliases ]
then
	. /aliases
fi

alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias mkdir="mkdir -pv"
alias cp="cp -r"
alias svim="sudo vim"
alias la="ls -a"
alias ll="ls -al"
alias lr="ls -aR"
alias lss="la | less"
alias lg="la | grep"
alias lgg="lr | grep"
alias ps="ps ax"
alias g++="g++ -t -g -std=c++17 -Wall"
alias dus="du -sh"
alias hg="history | grep"
alias hh="history | head"
alias ht="history | tail"
alias poweroff="sudo poweroff"
alias reboot="sudo reboot"

#Variables
CDPATH="~:~/Projects"

#Options
shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist
shopt -s direxpand
shopt -s dirspell
shopt -s extglob
shopt -s globstar
shopt -s histappend
shopt -s interactive_comments
