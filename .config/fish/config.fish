#remove welcome message
# set -U fish_greeting

# set fish_color_cwd dd9922
# set fish_color dd9922
set fish_color_autosuggestion 5E5959
set fish_color_param dd9922

#set full pathe in prompt
set fish_prompt_pwd_dir_length 0

#for neovim.appimage
#set CUSTOM_NVIM_PATH /usr/local/bin/nvim.appimage
#for neovim build from source
# set CUSTOM_NVIM_PATH /usr/local/bin/nvim
# set CUSTOM_NVIM_PATH /usr/local/bin/nvim
# contains $HOME/sources/neovim/bin $fish_user_paths; or set -Ua fish_user_paths $HOME/neovim/bin

#FZF
#set -U FZF_DEFAULT_OPTS "--height 50% --layout=reverse --border"
# --multi
# --preview-window=:hidden
# --preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
# --bind '?:toggle-preview'
# --bind 'ctrl-a:select-all'"
# set -U FZF_PREVIEW_FILE_CMD "bat --style=numbers --color=always"
# set -U FZF_LEGACY_KEYBINDINGS 0
# set -U FZF_COMPLETE 1
# set -U FZF_ENABLE_OPEN_PREVIEW 1

#Tide prompt
set --global tide_git_bg_color 6D9A40
set --global tide_os_bg_color 7C947F
set --global tide_pwd_bg_color 5E5959

abbr -a -U ll ls -alhF
abbr -a -U nnn nnn -dH

alias vi='nvim'
alias vit='nvim --cmd "cd ~/telescope/telescope-frontend/frontend-suite/frontend-client" +pwd'
alias vitc='nvim --cmd "cd ~/telescope/telescope-frontend-core" +pwd'
alias dtf='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'


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

