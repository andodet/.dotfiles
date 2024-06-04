#!/bin/sh

# terminal
dconf load /org/gnome/terminal/legacy/profiles:/ <./gnome-terminal/gnome-terminal-profiles.dconf
# zsh - you need to set up oh-my-zsh shell first
cp ./zsh/.zshrc ~/.zshrc
cp ./zsh/.zshenv ~/.zshenv
cp ./zsh/robbyrussell.zsh-theme ~/.oh-my-zsh/themes/robbyrussell.zsh-theme
cp ./zsh/anddt.zsh-theme ~/.oh-my-zsh/themes/anddt.zsh-theme
# gnome
dconf load /org/gnome/shell/keybindings/ <./gnome/bkp
dconf load /org/gnome/desktop/wm/keybindings/ <./gnome/desktop
dconf load /org/gnome/mutter/keybindings/ <./gnome/mutter_kbd
dconf load /org/gnome/mutter/wayland/keybindings/ <./gnome/mutter_way_kbd
dconf load /org/gnome/settings-daemon/plugins/media-keys/ <./gnome/media
# git
cp ./git/.gitconfig ~/.gitconfig
# tmux
cp ./tmux/.tmux.conf ~/.tmux.conf
# vim
cp ./vim/.vimrc ~/.vimrc
git clone -f https://github.com/morhetz/gruvbox.git
mkdir -p ~/.config/nvim/colors
cp ./gruvbox/colors/gruvbox.vim ~/.config/nvim/colors/
# nvim
mkdir -p ~/.config/nvim
cp -rf ./.config/nvim ~/.config
# Tiling-assistant shortcuts
dconf load /org/gnome/shell/extensions/tiling-assistant/ <./tiling-assistant/bindings
# kitty
cp -rf ./.config/kitty ~/.config
# tig
cp -f ./.config/.tigrc ~/
# dunst
cp -rf ./.config/dunst ~/.config
