# Post install scripts and configs

This repo contains config files and a script to restore a clean Fedora/Ubuntu install.

## Usage

Dotfiles follow a stow-friendly folder structure to be restored on the host:

```sh
# stow all folders
make
# or stow an individual folder
stow nvim
```

Additional utilities are included in `scripts/` to set up a fresh Ubuntu installation.

```sh
sudo sh scripts/run-ubuntu.sh
```
