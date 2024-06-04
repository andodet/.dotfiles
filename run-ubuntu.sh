#!/bin/sh

mkdir ~/code ~/fun
sudo apt update

# Remove snap store
sudo killall snap-store
sudo systemctl stop snapd && sudo systemctl disable snapd
sudo snap remove snap-store
sudo apt purge -y snapd
sudo apt install -y --no-install-recommends gnome-software
sudo systemctl stop var-snap-firefox-common-host\\x2dhunspell.mount
sudo systemctl disable var-snap-firefox-common-host\\x2dhunspell.mount

# A lot of dependencies
sudo apt-get install -y \
	make \
	build-essential \
	libssl-dev \
	zlib1g-dev \
	libbz2-dev \
	libreadline-dev \
	libsqlite3-dev \
	wget \
	curl \
	llvm \
	libncursesw5-dev \
	xz-utils \
	tk-dev \
	libxml2-dev \
	libxmlsec1-dev \
	libffi-dev \
	liblzma-dev \
	neovim \
	tig

curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

sudo apt-add-repository -y universe
sudo add-apt-repository -y ppa:longsleep/golang-backports

sudo apt update
sudo apt install -y \
	r-base \
	r-base-dev \
	fonts-go \
	tmux \
	zsh \
	spotify-client \
	s-tui \
	htop \
	gnome-tweaks \
	direnv \
	golang-go \
	ripgrep \
	fzf \
	zoxide

# python stuff
curl -sSL https://install.python-poetry.org | python3 -
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv

mkdir -p ~/code/go
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Docker
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
	"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
	$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

sudo apt-get update && sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Go mono font
sudo apt install -y fonts-firacode
