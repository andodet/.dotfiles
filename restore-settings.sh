#!/bin/sh

# zsh - you need to set up oh-my-zsh shell first
cp ./zsh/.zshrc ~/.zshrc
cp ./zsh/.zshenv ~/.zshenv
cp ./zsh/robbyrussell.zsh-theme ~/.oh-my-zsh/themes/robbyrussell.zsh-theme
cp ./zsh/anddt.zsh-theme ~/.oh-my-zsh/themes/anddt.zsh-theme
# git
cp ./git/.gitconfig ~/.gitconfig
# tmux
cp ./tmux/.tmux.conf ~/.tmux.conf
sudo cp -f ~/tmux/tmux-sessionizer /opt
# vim
cp ./vim/.vimrc ~/.vimrc
# nvim
mkdir -p ~/.config/nvim
cp -rf ./.config/nvim ~/.config
# kitty
cp -rf ./.config/kitty ~/.config
# tig
cp -f ./.config/.tigrc ~/
# dunst
cp -rf ./.config/dunst ~/.config
