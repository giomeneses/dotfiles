#!/bin/bash

# Source Envionment Variables
source "zsh/.zshenv"

###########
## kitty ##
###########

# Deletes current config, BEWARE
rm -rf "$XDG_CONFIG_HOME/kitty"
ln -sf "$DOTFILES/kitty" "$XDG_CONFIG_HOME/kitty"

###########
## hyper ##
###########

# Deletes current config, BEWARE
rm -rf "$HOME/.hyper.js"
ln -sf "$DOTFILES/hyper/.hyper.js" "$HOME/.hyper.js"


##########
## nvim ##
##########

mkdir -p "$XDG_CONFIG_HOME/nvim"
mkdir -p "$XDG_CONFIG_HOME/nvim/undo"

ln -sf "$DOTFILES/nvim/init.vim" "$XDG_CONFIG_HOME/nvim"

##########
## lvim ##
##########

# Checking for lvim install to avoid config getting overwritten
if [ "$(which lvim)" ]; then
  ln -sf "$DOTFILES/nvim/config.lua" "$XDG_CONFIG_HOME/lvim/"
#  ln -sf "$DOTFILES/nvim/init.lua" "$XDG_CONFIG_HOME/local/share/lunarvim/lvim/init.vim"
else
  echo "Please install LunarVim, config not set"
fi

##########
## tmux ##
##########

mkdir -p "$XDG_CONFIG_HOME/tmux"
ln -sf "$DOTFILES/tmux/tmux.conf" "$XDG_CONFIG_HOME/tmux"

########
## i3 ##
########

# Deletes current config, BEWARE
rm -rf "$XDG_CONFIG_HOME/i3"
ln -s "$DOTFILES/i3" "$XDG_CONFIG_HOME/i3"

###########
## fonts ##
###########

# Copying fonts instead of linking, wont be updating often
mkdir -p "$XDG_DATA_HOME/fonts"
cp -rf "$DOTFILES/fonts" "$XDG_DATA_HOME"

#########
## git ##
#########

mkdir -p "$XDG_CONFIG_HOME/git"
ln -sf "$DOTFILES/git/.gitconfig" "$XDG_CONFIG_HOME/git/config"

#########
## ssh ##
#########

mkdir -p "$HOME/.ssh"
ln -sf "$DOTFILES/ssh/config" "/$HOME/.ssh"

##############
## starship ##
##############

mkdir -p "$XDG_CONFIG_HOME/starship"
ln -sf "$DOTFILES/starship/starship.toml" "$XDG_CONFIG_HOME/starship"

#########
## zsh ##
#########
# Manually specifying items to include so I dont leak secrets

mkdir -p "$XDG_CONFIG_HOME/zsh"

ln -sf "$DOTFILES/zsh/.zshenv" "$HOME"
ln -sf "$DOTFILES/zsh/.zshrc" "$XDG_CONFIG_HOME/zsh"
ln -sf "$DOTFILES/zsh/aliases" "$XDG_CONFIG_HOME/zsh"

rm -rf "$XDG_CONFIG_HOME/zsh/plugins"
ln -sf "$DOTFILES/zsh/plugins" "$XDG_CONFIG_HOME/zsh"
