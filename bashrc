# bash interactive configuration

# prompt
export PS1="\[$(tput setaf 10)\]\w\[$(tput sgr0)\] "

# shortcuts
alias vb="vim ~/.bashrc"
alias sb=". ~/.bashrc"
alias xci="xclip -selection clipboard -i"
alias xco="xclip -selection clipboard -o"

# wrappers
alias ls="ls --color=auto"
alias grep="grep --color=auto"

# shortcuts
alias vm="vim main.c*"
alias vmk="vim [mM]akefile"
backup() {
	# backup files specified by BKPATH variable
	tar -cvzf ~/backups/backup_$(date +%d-%m-%Y).tar.gz -C ~ $(echo $BACKUPPATH | tr ':' ' ')
}
mkcpp() {
	# create a standard cpp project
	for project in $@
	do
		mkdir $project
		echo -ne '//General main file for C++ projects\n#include <iostream>\n\nint main()\n{\n\treturn 0;\n}' > $project/main.cpp
		echo -ne '#General makefile for C/C++ projects\n\n#C Compiler flags\nCFLAGS=-g -Wall -Wextra\n#C++ Compiler flags\nCXXFLAGS=$(CFLAGS)\n#Project name\nPROJECT=main\n#Project objects\nOBJECTS=main.o\n\n#Compiling rules\n\n#Linking rules\ndefault: clean $(PROJECT)\n\n$(PROJECT): $(OBJECTS)\n\t$(CXX) $(OBJECTS) -o $(PROJECT)\n\nclean:\n\t$(RM) $(OBJECTS) $(PROJECT)\n\ninfo:\n\t@echo Compiler flags: $(CXXFLAGS)\n\t@echo Project: $(PROJECT)\n\t@echo Objects: $(OBJECTS)\n' > $project/makefile

	done
	unset project
}
clean() {
	# clean projects that have makefiles
	find $@ -type d -exec make -C '{}' clean \;
}

#Variables
export BACKUPPATH="documents:projects:pictures:videos:music:packages/dwm/config.h:packages/dmenu/config.h:packages/slstatus/config.h" #Must be absolute path if not in $HOME
export HISTSIZE= 
export HISTFILESIZE= 
export HISTFILE="~/history"
export HISTCONTROL=ignoredups:erasedups

# bindings
set -o vi
bind '\C-l:clear-screen'

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
