.PHONY: box

box: common
	stow sway
	stow i3status

laptop: common
	stow sway_laptop
	stow i3status

common:
	stow dunst
	stow kitty
	stow nvim
	stow oh-my-zsh
	stow zsh
	stow rofi
	stow tmux
	stow vim
	stow tig
	stow fuzzel
	#stow -t ~/ergo/qmk_firmware/keyboards/ktec/ergodone/keymaps/anddt ergodox
