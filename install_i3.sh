#!/bin/sh
#
#
sudo apt-get install \
	i3 \
	i3lock \
	rofi \
	nitrogen \
	rofi \
	dunst \
	gsimplecal \
	lm-sensors \
	maim

cp -rf .config/i3 ~/.config
cp -rf .config/i3status ~/.config
cp -rf .config/rofi ~/.config
cp -rf .config/dunst ~/.config
cp -rf .config/.Xresources ~/
sudo cp -rf ./.config/i3/i3exit /opt/
