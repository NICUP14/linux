#Bash custom configuration file
#Written at 25.01.2021
#Updated at 30.01.2021

#Ansii color codes
STOP='\[\e[0m\]'
BLACK='\[\e[0;30m\]'
RED='\[\e[0;31m\]'
GREEN='\[\e[0;32m\]'
YELLOW='\[\e[0;33m\]'
BLUE='\[\e[0;34m\]'
PURPLE='\[\e[0;35m\]'
CYAN='\[\e[0;36m\]'
WHITE='\[\e[0;37m\]'
BLACKBOLD='\[\e[1;30m\]'
REDBOLD='\[\e[1;31m\]'
GREENBOLD='\[\e[1;32m\]'
YELLOWBOLD='\[\e[1;33m\]'
BLUEBOLD='\[\e[1;34m\]'
PURPLEBOLD='\[\e[1;35m\]'
CYANBOLD='\[\e[1;36m\]'
WHITEBOLD='\[\e[1;37m\]'
BLACKBG='\[\e[40m\]'
REDBG='\[\e[41m\]'
GREENBG='\[\e[42m\]'
YELLOWBG='\[\e[43m\]'
BLUEBG='\[\e[44m\]'
PURPLEBG='\[\e[45m\]'
CYANBG='\[\e[46m\]'
WHITEBG='\[\e[47m\]'

#Display prompt
#Looks like "|-(user)-(jobs)-(path)-> "
PS1="${GREENBOLD}|-(${BLUEBOLD}\u${GREENBOLD})-(${CYANBOLD}\j${GREENBOLD})-(${PURPLEBOLD}\w${GREENBOLD})->${STOP} "
PS2="${REDBOLD}>${STOP} "

#History file configuration
HISTSIZE= 
HISTFILESIZE= 
HISTCONTROL=ignoreboth
HISTFILE="~/.history"

#Aliases and functions
alias vb="vim ~/.bashrc"
alias sb="source ~/.bashrc"
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias mkdir="mkdir -pv"
alias cp="cp -r"
alias la="ls -a"
alias ll="ls -al"
alias lr="ls -aR"
alias lss="la | less"
alias lg="la | grep"
alias ps="ps ax"
alias hg="history | grep"
alias hh="history | head"
alias ht="history | tail"
alias poweroff="sudo poweroff"
alias reboot="sudo reboot"
function mkbp() { cp "$@" "$@.bak"; }
function mkrs() { cp "$@.bak" "$@"; }
function mktmp() { file="/tmp/mktmp-$@-$(date +%s).txt"; touch "$file"; ln -s "$file" "$@"; unset file; }

#Variables
LANG="en_US.UTF-8"
PATH="$PATH:~/.bin"
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
