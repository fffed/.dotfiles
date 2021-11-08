#!/bin/zsh

fpath=($ZDOTDIR/plugins $fpath)

HISTFILE=$ZDOTDIR/.zhistory        # History filepath
HISTSIZE=10000                     # Maximum events for internal history
SAVEHIST=10000                     # Maximum events in history file

gitplugins=~/sources/zsh

bindkey -e

# #turn on VIM mode
# bindkey -v
# export KEYTIMEOUT=1                #makes the switch between modes quicker
# # Change cursor
# autoload -Uz cursor_mode; cursor_mode #We load here the Zsh module complist. Modules have functionalities which are not part of the Zsh’s core, but they can be loaded on demand
# #Vim Mapping For Completion
# zmodload zsh/complist              #load the Zsh module complist (Modules have functionalities which are not part of the Zsh’s core, but they can be loaded on demand)
# bindkey -M menuselect 'h' vi-backward-char
# bindkey -M menuselect 'k' vi-up-line-or-history
# bindkey -M menuselect 'l' vi-forward-char
# bindkey -M menuselect 'j' vi-down-line-or-history
#
# #Editing Command Lines In Vim
# autoload -Uz edit-command-line
# zle -N edit-command-line
# bindkey -M vicmd v edit-command-line

#Fix Home & End keyboard buttons behavior
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

source $ZDOTDIR/.completion

setopt autocd                      # Go to folder path without using cd

setopt HIST_SAVE_NO_DUPS           # Do not write a duplicate event to the history file
setopt HIST_IGNORE_ALL_DUPS        # Do not put duplicated command into history list
setopt SHARE_HISTORY               # Share history between all sessions
setopt HIST_EXPIRE_DUPS_FIRST      # Expire a duplicate event first when trimming history
setopt HIST_REDUCE_BLANKS          # Remove unnecessary blanks

setopt AUTO_PUSHD                  # Push the old directory onto the stack on cd
setopt PUSHD_IGNORE_DUPS           # Do not store duplicates in the stack
setopt PUSHD_SILENT                # Do not print the directory stack after pushd or popd

#Prompt setup
fpath=($ZDOTDIR/prompt $fpath)  # add the folder containing the prompt to $fpath
autoload -Uz prompt_purification_setup; prompt_purification_setup   #autoload the prompt itself


source $ZDOTDIR/aliases
source $ZDOTDIR/abbreviations

source $gitplugins/bd/bd.zsh
# source $gitplugins/zsh-abbrev-alias/abbrev-alias.plugin.zsh
source $gitplugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $gitplugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $gitplugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# keys for fish-like history search
#bindkey '^[[A' history-substring-search-up
#bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

bindkey -M viins '^F' autosuggest-accept
bindkey -M viins '^[f' forward-word #ALT-f to partial autosuggests
