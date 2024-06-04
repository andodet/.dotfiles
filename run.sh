#!/bin/sh

# Create same old directories
mkdir ~/code ~/fun

# enable rpm-fusion
# free
sudo dnf -y install \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
# non-free
sudo dnf -y install \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# R
sudo dnf -y install R R-devel rstudio-desktop
pip install -U radian

# Python
sudo dnf -y install poetry
# pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

# golang
sudo dnf -y install golang
mkdir -p code/go

# Misc
sudo dnf -y install \
    zsh \
    spotify \
    s-tui \
    htop \
    tilix \
    tmux \
    code \
    parcellite \
    hexchat \
    gnome-tweaks

# go-mono font
sudo dnf -y install google-go-mono-fonts

# Docker
sudo dnf -y install dnf-plugins-core
sudo dnf -y config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf -y install docker-ce docker-ce-cli containerd.io

# Oh-my-zsh shell
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install gnome-extensions,
git clone https://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator.git .local/share/gnome-shell/extensions/clipboard-indicator@tudmotu.com
git clone https://github.com/micheleg/dash-to-dock.git .local/share/gnome-shell/extensions/dash-to-dock@micxgx.gmail.com
git clone https://github.com/gTile/gTile.git .local/share/gnome-shell/extensions/gTile@vibou
git clone https://github.com/kgshank/gse-sound-output-device-chooser.git .local/share/gnome-shell/extensions/sound-output-device-chooser@kgshank.net

##############################################
# Restore config files and keybindings
##############################################

# Tilix 
mkdir -p ~/.config/tilix/schemes
cp ./tilix/schemes/* ~/.config/tilix/schemes/
dconf load /com/gexperts/Tilix/ < ./tilix/config
# tmux
cp ./tmux/.tmux.conf ~/.tmux.conf
# git
cp ./git/.gitconfig ~/.gitconfig
# vim
cp ./vim/.vimrc ~/.vimrc
git clone git@github.com:morhetz/gruvbox.git
sudo cp ./gruvbox/colors/gruvbox.vim /usr/share/vim/vimfiles/colors/gruvbox.vim
rm -rf ./gruvbox
# gnome
cp ./gnome/extensions/* ~/.local/share/gnome-shell/extensions/
dconf load /org/gnome/shell/keybindings/ < ./gnome/bkp
dconf load /org/gnome/desktop/wm/keybindings/ < ./gnome/desktop
dconf load /org/gnome/mutter/keybindings/ < ./gnome/mutter_kbd
dconf load /org/gnome/mutter/wayland/keybindings/ < ./gnome/mutter_way_kbd
dconf load /org/gnome/settings-daemon/plugins/media-keys/ < ./gnome/media
# zsh
cp ./zsh/.zshrc ~/.zshrc
cp ./zsh/dpoggi-short.zsh-theme ~/.oh-my-zsh/themes
