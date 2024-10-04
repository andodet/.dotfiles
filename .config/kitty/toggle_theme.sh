#!/usr/bin/bash

# Toggle the current window (all panes) between light and dark themes.
# set -e
kitty-reload() {
	kill -SIGUSR1 $KITTY_PID
}

# if condition to check if KITTY_LIGHT is true or false
if [ "$KITTY_LIGHT" = true ]; then
    cat ~/.config/kitty/themes/current-theme.conf > ~/.config/kitty/current-theme.conf
	#kitty + kitten themes --dump-theme anddt >~/.config/kitty/current-theme.conf
	export KITTY_LIGHT=false
	kitty-reload
elif [ -z "$KITTY_LIGHT" ] || [ "$KITTY_LIGHT" = false ]; then
    cat ~/.config/kitty/current-theme.conf > ~/.config/kitty/themes/current-theme.conf
	kitty + kitten themes --dump-theme Alabaster >~/.config/kitty/current-theme.conf
	# restart kitty without closing the window
	export KITTY_LIGHT=true
	kitty-reload
fi
