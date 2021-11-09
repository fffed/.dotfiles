#remove welcome message
# set -U fish_greeting

# set fish_color_cwd dd9922
# set fish_color dd9922
#set fish_color_autosuggestion 5E5959
#set fish_color_param B8A956
# set fish_color_command 46BBF5
#set fish_color_command 6DAC68 --bold
#set fish_color_error ff4444

#set full pathe in prompt
set fish_prompt_pwd_dir_length 0


#kitty theme HARDCORE
set fish_color_param fd971f
set fish_color_command a6e22e --bold
set fish_color_error f92672

#kitty theme SYMFONIC
set fish_color_command 56db3a --bold


#Tide prompt
# set --global tide_git_bg_color 6D9A40
# set --global tide_os_bg_color 7C947F
set --global tide_os_bg_color 878787
set --global tide_git_bg_color 5f875f
set --global tide_pwd_bg_color 5E5959
# set --global tide_git_color_branch 4E9A06


#hydro promt
#set --global hydro_color_git beed5f

#abbr -a -U ll ls -AlhF
#abbr -a -U nnn nnn -dH
abbr -a -U cpu 'ps -eo pid,ppid,%cpu,%mem,cmd --sort=-%cpu | head -6'
abbr -a -U mem 'ps -eo pid,ppid,%mem,%cpu,cmd --sort=-%mem | head -6'


#EXA
alias ls='exa'
abbr -a -U ls ls --icons
abbr -a -U ll ls -alFs type --icons

#Configs
abbr -a -U conf-vi nvim ~/.config/nvim/init.vim
abbr -a -U conf-vi-plug nvim ~/.config/nvim/lua/plugins.lua
abbr -a -U conf-fish nvim ~/.config/fish/config.fish
abbr -a -U conf-kitty nvim ~/.config/kitty/kitty.conf

alias vi='nvim'
alias vit='nvim --cmd "cd ~/telescope/telescope-frontend/frontend-suite/frontend-client" +pwd'
alias vitc='nvim --cmd "cd ~/telescope/telescope-frontend-core" +pwd'

alias dtf='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias sscreen='~/scripts/screensharing.sh'


function print_fish_colors --description 'Shows the various fish colors being used'
    set -l clr_list (set -n | grep fish | grep color | grep -v __)
    if test -n "$clr_list"
        set -l bclr (set_color normal)
        set -l bold (set_color --bold)
        printf "\n| %-38s | %-38s |\n" Variable Definition
        echo '|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|'
        for var in $clr_list
            set -l def $$var
            set -l clr (set_color $def ^/dev/null)
            or begin
                printf "| %-38s | %s%-38s$bclr |\n" "$var" (set_color --bold white --background=red) "$def"
                continue
            end
            printf "| $clr%-38s$bclr | $bold%-38s$bclr |\n" "$var" "$def"
        end
        echo '|________________________________________|________________________________________|'\n
    end
end

