#!/bin/sh

sudo apt-get update
sudo apt-get install -y \
	sway \
	swaylock \
	pavucontrol \
	kanshi \
	rofi \
	dunst \
	grimshot

echo "copying config files"
cp -rf .config/sway ~/.config
rm -rf ~/.config/sway/i3status
sudo cp -rf .config/sway/i3exit /opt/
rm ~/.config/sway/i3exit
cp -rf .config/sway/i3status ~/.config
cp -rf .config/rofi ~/.config
cp -rf .config/kanshi ~/.config
cp -rf .config/dunst ~/.config

# Apparently xdg-desktop-portal leads to slow startup for gtk apps
sudo apt remove -y xdg-desktop-portal
