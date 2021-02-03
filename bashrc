#Bash custom configuration file
#Written at 25.01.2021
#Updated at 30.01.2021 (Fixed color codes)
#Updated at 31.01.2021 (Added chrootmgr)

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
PS1="${GREENBOLD}|-(${CYANBOLD}\u${GREENBOLD})-(${PURPLEBOLD}\j${GREENBOLD})-(${BLUEBOLD}\w${GREENBOLD})->${STOP} "
PS2="${REDBOLD}>${STOP} "

#History file configuration
HISTSIZE= 
HISTFILESIZE= 
HISTCONTROL=ignoreboth
HISTFILE="~/.history"

#Aliases and functions
alias vb="vim ~/.bashrc"
alias sb="source ~/.bashrc"
alias ls="ls -1 --color=auto"
alias grep="grep --color=auto"
alias mkdir="mkdir -pv"
alias cp="cp -r"
alias la="ls -a"
alias ll="ls -al"
alias lr="ls -aR"
alias lg="la | grep"
alias hg="history | grep"
alias hh="history | head"
alias ht="history | tail"
alias poweroff="sudo poweroff"
alias reboot="sudo reboot"
function lss() { ls "$1" | less; }
function mkbp() { cp "$1" "$1.bak"; }
function mkrs() { cp "$1.bak" "$1"; }
function mktempf() { file="$(mktemp)"; ln -sf "$file" "$1"; unset file; }
function mktempd() { file="$(mktemp -d)"; ln -sf "$file" "$1"; unset file; }
function mkjail() { if [ ! -z $1 ]; then chrootmgr $1 create; chrootmgr $1 install $(which sh) $(which useradd) $(which busybox); chrootmgr $1 secure; fi; }

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
