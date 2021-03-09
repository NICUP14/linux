#Shortcuts
alias backup="tar -cvzf ~/Backups/backup_(date +%d-%m-%Y).tar.gz -C ~ (echo $BKPATH | tr ':' ' ')"

#Variables
set -x fish_prompt_pwd_dir_length 0
set -x fish_greeting (set_color green)(fish -v)
set -x BKPATH "Documents:Projects:Pictures:Videos:Music:Packages/dwm/config.h:Packages/dmenu/config.h"

#Bindings for sourcing and editing fish
abbr -U -a vf "vim ~/.config/fish/config.fish"
abbr -U -a sf "source ~/.config/fish/config.fish"

#Bindings for key bindings (vi mode)
abbr -U -a fvi "fish_vi_key_bindings"
abbr -U -a fdef "fish_default_key_bindings"
fish_vi_key_bindings
