#!/bin/bash
shopt -s extglob

# tmux
echo "syncing tmux"
cp ~/.tmux.conf ./tmux/.tmux.conf
cp /opt/tmux-sessionizer ./tmux
# git
echo "syncing git"
cp ~/.gitconfig ./git/.gitconfig
# vim
echo "syncing vim"
cp ~/.vimrc ./vim/.vimrc
cp -var ~/.config/nvim/!(plugin) .config/nvim
# gnome extensions and keybindings
echo "syncing gnome"
dconf dump /org/gnome/shell/keybindings/ >./gnome/bkp
dconf dump /org/gnome/desktop/wm/keybindings/ >./gnome/desktop
dconf dump /org/gnome/mutter/keybindings/ >./gnome/mutter_kbd
dconf dump /org/gnome/mutter/wayland/keybindings/ >./gnome/mutter_way_kbd
dconf dump /org/gnome/settings-daemon/plugins/media-keys/ >./gnome/media
# zsh
echo "syncing zsh"
cp ~/.zshrc ./zsh/.zshrc
cp ~/.zshenv ./zsh/.zshenv
cp ~/.oh-my-zsh/themes/anddt.zsh-theme ./zsh/anddt.zsh-theme
# tiling-assistant
echo "syncing tiling-assistant"
dconf dump /org/gnome/shell/extensions/tiling-assistant/ >./tiling-assistant/bindings
# kitty terminal
cp -r ~/.config/kitty ./.config
# i3 configs
cp -r ~/.config/i3 ./.config/
cp -r ~/.config/i3status ./.config
cp ~/.Xresources ./
cp /opt/i3exit ./.config/i3/
# rofi
cp -r ~/.config/rofi ./.config
# dunst
cp -r ~/.config/dunst ./.config
# tig
cp -f ~/.tigrc ./.config/
