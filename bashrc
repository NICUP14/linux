#Bash custom configuration file
#Written at 25.01.2021
#Last updated at 17.02.2021 (Improved makefile and added format bash functions)

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
PSUSER=$CYANBOLD
PSJOB=$PURPLEBOLD
PSPWD=$BLUEBOLD
PSOTHER=$GREENBOLD
PS1="${PSOTHER}|-(${PSUSER}\u${PSOTHER})-(${PSJOB}\j${PSOTHER})-(${PSPWD}\w${PSOTHER})->${STOP} "
PS2="${REDBOLD}>${STOP} "

#History file configuration
HISTSIZE= 
HISTFILESIZE= 
HISTCONTROL=ignoreboth
HISTFILE="~/.history"

#Aliases and functions
alias vb="vim ~/.bashrc"
alias sb="source ~/.bashrc"
alias bt="bashtop"
alias ls="ls -1 --color=auto"
alias la="ls -a"
alias ll="ls -al"
alias lr="ls -aR"
alias grep="grep --color=auto"
alias mkdir="mkdir -pv"
alias mv="mv -v"
alias cp="cp -rv"
alias rm="rm -rv"
alias hg="history | grep"
alias hh="history | head"
alias ht="history | tail"
alias poweroff="sudo poweroff"
alias reboot="sudo reboot"
function format() { sed -z 's/\n/\\n/g; s/\t/\\t/g;'; }
function unformat() { tr -d '\n\t'; }
function main() { echo -ne '#include <iostream>\n\nint main()\n{\n\treturn 0;\n}'; }
function makefile() { echo -ne '#General makefile for C/C++ projects\n\n#C Compiler flags\nCFLAGS=-g -Wall -Wextra\n#C++ Compiler flags\nCXXFLAGS=$(CFLAGS)\n#Project name\nPROJECT=main\n#Project objects\nOBJECTS=main.o\n\n#Compiling rules\n\n#Linking rules\ndefault: clean $(PROJECT)\n\n$(PROJECT): $(OBJECTS)\n\t$(CXX) $(OBJECTS) -o $(PROJECT)\n\nclean:\n\t$(RM) $(OBJECTS) $(PROJECT)\n\ninfo:\n\t@echo Compiler flags: $(CXXFLAGS)\n\t@echo Project: $(PROJECT)\n\t@echo Objects: $(OBJECTS)'; }
function mkb() { cp "$1" "$1.bak"; }
function mkr() { cp "$1.bak" "$1"; }
function mkf() { file="$(mktemp)"; ln -sf "$file" "$1"; }
function mkd() { file="$(mktemp -d)"; ln -sf "$file" "$1"; }
function backup() { tar -cvzf ~/Backups/backup_$(date +%d-%m-%Y).tar.gz -C ~ $(echo $BKPATH | tr ':' ' '); }
function password() { echo "$1@$2" | sha256sum | cut -d ' ' -f 1; } #name@domain

#Variables
LANG="en_US.UTF-8"
PATH="$PATH:~/Bin"
CDPATH="~:~/Projects:~/Packages"
BKPATH="Documents:Projects:Pictures:Videos:Music:Packages/dwm/config.h:Packages/dmenu/config.h" #Must be absolute path if not in $HOME

#Options
shopt -s cdable_vars
shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist
shopt -s direxpand
shopt -s dirspell
shopt -s extglob
shopt -s globstar
shopt -s histappend
shopt -s interactive_comments
