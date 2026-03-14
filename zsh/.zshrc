
# Sourcing all my mispellings, and shortcuts
source "$XDG_CONFIG_HOME/zsh/aliases"

############
## Eval
############

eval "$(/opt/homebrew/bin/brew shellenv)"
#eval "$(direnv hook zsh)"
#eval "$(pyenv init --path)"

################
## Parameters ##
################

export ENABLE_CORRECTION="true"
export COMPLETION_WAITING_DOTS="true"
export GAMCFGDIR="$HOME/GAMConfig/"

# Use plugins path to autoload functions
fpath=($ZDOTDIR/plugins $fpath)

# Ignore odd number quotes
export KEYBOARD_HACK="'"

#############
## Options ##
#############

# vim completion
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history

# zsh completion
autoload -U compinit; compinit

# Moving around in style w/ alias d:
# push the current directory visited on to the stack/ignore dupes
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
#do not print the directory stack after using pushd or popd
setopt PUSHD_SILENT

# vim keybindings
bindkey -v
export KEYTIMEOUT=1
autoload -Uz cursor_mode && cursor_mode

#############
## Plugins ##
#############

# check for fzf and source keybinds
# Ctrl + t - search for file in cwd and subdirs
# Ctrt + r - reverse search
# Alt + c - select subdir and switch to it

# auto complete hidden files
_comp_options+=(globdots)
source ~/dotfiles/zsh/plugins/completion.zsh
source ~/dotfiles/zsh/plugins/magic-enter.zsh
source ~/dotfiles/zsh/functions.zsh
source ~/dotfiles/zsh/plugins/zsh-z.plugin.zsh
source ~/dotfiles/zsh/plugins/colored-man-pages.plugin.zsh
source ~/dotfiles/zsh/plugins/fzf.zsh
source /opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Initializing starship
eval "$(starship init zsh)"
