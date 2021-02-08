#Bash custom configuration file
#Written at 25.01.2021
#Last updated at 8.02.2021

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
alias mv="mv -v"
alias cp="cp -rv"
alias rm="rm -rv"
alias la="ls -a"
alias ll="ls -al"
alias lr="ls -aR"
alias lg="la | grep"
alias hg="history | grep"
alias hh="history | head"
alias ht="history | tail"
alias poweroff="sudo poweroff"
alias reboot="sudo reboot" 
function main() { echo -e '#include <iostream>\n\nint main()\n{\n\treturn 0;\n}'; }
function makefile() { echo -e 'SHELL = /bin/sh\nCXXFLAGS = -g -Wall\n\n.cpp:\n\techo Compiling $@...\n\t${CXX} -c ${CXXFLAGS} $@.cpp -o $@.o\n\n.o:\n\techo Linking $@...\n\t${CXX} $@.o -o $@\n\nclean:\n\techo Cleaning...\n\trm *.o'; } 
function lss() { ls "$1" | less; }
function mkbk() { cp "$1" "$1.bak"; }
function mkrs() { cp "$1.bak" "$1"; }
function mktf() { file="$(mktemp)"; ln -sf "$file" "$1"; }
function mktd() { file="$(mktemp -d)"; ln -sf "$file" "$1"; }
function mkjail() { if [ -n $1 ]; then chrootmgr $1 create; chrootmgr $1 install $(which sh) $(which useradd); sudo busybox --install $1/bin; chrootmgr $1 secure; fi; }
function backup() { tar -cvzf ~/Backups/backup_$(date +%d-%m-%Y).tar.gz -C ~ $(echo $BKPATH | tr ':' ' '); }

#Variables
LANG="en_US.UTF-8"
PATH="$PATH:~/.bin"
CDPATH="~:~/Projects"
BKPATH="Desktop:Documents:Projects:Pictures:Videos:Music" #Must be absolute path if not in $HOME

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
